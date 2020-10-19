<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Pbf;
use App\Models\Barang;
use App\Models\Penjualan;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\PenjualanDetail;
use Illuminate\Support\Facades\DB;

class PenjualanresepController extends Controller
{
    //
    public function index(Request $req)
	{
        $tipe = $req->tipe? $req->tipe: 0;
		$tanggal = explode(' - ', $req->get('tanggal'));
		$tgl1 = $req->get('tanggal')? date('Y-m-d', strtotime($tanggal[0])): date('Y-m-01');
		$tgl2 = $req->get('tanggal')? date('Y-m-d', strtotime($tanggal[1])): date('Y-m-d');

        $data = Penjualan::with('pengguna')->with('detail')->where('penjualan_keterangan', 'like', '%'.$req->cari.'%')->whereBetween('penjualan_tanggal', [$tgl1, $tgl2])->orderBy('created_at', 'desc');

        switch ($tipe) {
            case '1':
                $data = $data->onlyTrashed();
                break;
            case '2':
                $data = $data->withTrashed();
                break;
        }

        $data = $data->paginate(10);
        $data->appends([$req->cari, $req->tipe]);
        return view('pages.penjualan.resep.index', [
            'data' => $data,
            'tgl' => date('d F Y', strtotime($tgl1)).' - '.date('d F Y', strtotime($tgl2)),
    		'tgl1' => $tgl1,
            'tgl2' => $tgl2,
            'i' => ($req->input('page', 1) - 1) * 10,
            'tipe' => $tipe,
            'cari' => $req->cari,
        ]);
    }

	public function tambah(Request $req)
	{
        return view('pages.penjualan.resep.form', [
            'pbf' => Pbf::all(),
            'barang' => [],
            'banyak' => $req->jumlah,
            'back' => Str::contains(url()->previous(), ['penjualanresep/tambah', 'penjualanresep/edit'])? '/penjualanresep': url()->previous()
        ]);
    }

	public function tambah_barang(Request $req, $id)
	{
        return view('pages.penjualan.resep.barang',[
            'barang' => Barang::with('satuan_semua')->with('jenis_barang')->orderBy('barang_nama')->get(),
            'data' => $req->barang,
            'id' => $id
        ]);
    }

    public function cek_stok($barang)
    {
        $pesan = [];
        $bulan = date('m');
        $tahun = date('Y');
        $transaksi = Barang::whereIn('barang_id', collect($barang)->pluck('barang_id'))->with(['stok_awal' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', 'barang_qty')->whereRaw(DB::raw("year(stok_awal_tanggal)=$tahun"))->whereRaw(DB::raw("month(stok_awal_tanggal)=$bulan"));
        }])->with(['barang_masuk' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', DB::raw("sum(barang_masuk_qty) masuk"))->whereRaw(DB::raw("year(barang_masuk_tanggal)=$tahun"))->whereRaw(DB::raw("month(barang_masuk_tanggal)=$bulan"))->groupBy('barang_id');
        }])->with(['penjualan' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', DB::raw("sum(penjualan_detail_qty/satuan_rasio_dari_utama) keluar"))->whereHas('penjualan', function($r) use ($bulan, $tahun){
                $r->whereRaw(DB::raw("year(penjualan_tanggal)=$tahun"))->whereRaw(DB::raw("month(penjualan_tanggal)=$bulan"));
            })->groupBy('barang_id');
        }])->get();

        foreach ($barang as $index => $row) {
            $stok = 0;
            $masuk = 0;
            $keluar = 0;
            $stok_barang = $transaksi->filter(function ($q) use ($row){
                return $q->barang_id == $row['barang_id'];
            })->first();

            if ($stok_barang->stok_awal->count() > 0) {
                $stok = $stok_barang->stok_awal->first()->barang_qty;
            }
            if ($stok_barang->barang_masuk->count() > 0) {
                $masuk = $stok_barang->barang_masuk->first()->masuk;
            }
            if ($stok_barang->penjualan->count() > 0) {
                $keluar = $stok_barang->penjualan->first()->keluar;
            }

            $sisa = $stok + $masuk - $keluar;

            $satuan = explode(";", $row["satuan_nama"]);
            $jual = $row['penjualan_detail_qty']/$satuan[1];

            if($sisa < $jual){
                if (!in_array("Stok ".$stok_barang['barang_nama']." tersisa ".$sisa."<br>", $pesan)) {
                    array_push($pesan, "Stok ".$stok_barang['barang_nama']." tersisa ".$sisa."<br>");
                }
            }
        }
        return $pesan;
    }

	public function simpan(Request $req)
	{
        if (str_replace(',', '', $req->get('penjualan_bayar')) < str_replace(',', '', $req->get('penjualan_tagihan'))) {
            alert()->error('Simpan Data Gagal', "Jumlah Pembayaran Kurang");
            return redirect()->back()->withInput();
        }
        if (str_replace(',', '', $req->get('penjualan_tagihan')) <= 0) {
            alert()->error('Simpan Data Gagal', "Subtotal tidak ada");
            return redirect()->back()->withInput();
        }
        if (!$req->barang) {
            alert()->error('Simpan Data Gagal', "Barang Belum Diinputkan");
            return redirect()->back()->withInput();
        }

        $stok = $this->cek_stok($req->barang);
        if ($stok){
            alert()->error('Simpan Data Gagal', "Stok Beberapa Barang Tidak Tersedia");
            return redirect()->back()->withInput()->with(['stok_kurang' => $stok]);
        }
        try{
            $id = Carbon::now()->format('Ymdhmsu');
            DB::transaction(function () use ($req, $id) {
                $data = new Penjualan();
                $data->penjualan_id = $id;
                $data->penjualan_tanggal = Carbon::now()->format('Y-m-d');
                $data->penjualan_jenis = "Bebas";
                $data->penjualan_keterangan = $req->get('penjualan_keterangan');
                $data->penjualan_tagihan = str_replace(',', '', $req->get('penjualan_tagihan'));
                $data->penjualan_bayar = str_replace(',', '', $req->get('penjualan_bayar'));
                $data->penjualan_sisa = str_replace(',', '', $req->get('penjualan_sisa'));
                $data->save();
                foreach ($req->barang as $index => $barang) {
                    $satuan = explode(";", $barang["satuan_nama"]);
                    $detail = new PenjualanDetail();
                    $detail->penjualan_id = $id;
                    $detail->barang_id = $barang['barang_id'];
                    $detail->satuan_nama = $satuan[0];
                    $detail->satuan_rasio_dari_utama = $satuan[1];
                    $detail->satuan_harga = str_replace(',', '', $barang['satuan_harga']);
                    $detail->penjualan_detail_qty = $barang['penjualan_detail_qty'];
                    $detail->penjualan_detail_diskon = $barang['penjualan_detail_diskon'];
                    $detail->save();
                }
            });

            toast('Berhasil menyimpan data', 'success')->autoClose(2000);
            return redirect('penjualanresep')->with(['kwitansi' => '/penjualanresep/kwitansi/'.$id]);
        }catch(\Exception $e){
            alert()->error('Simpan Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

	public function hapus(Request $req)
	{
		try{
            Penjualan::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Hapus Data Gagal', $e->getMessage());
		}
	}

	public function restore(Request $req)
	{
		try{
            Penjualan::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Restore Data Gagal', $e->getMessage());
		}
	}
}
