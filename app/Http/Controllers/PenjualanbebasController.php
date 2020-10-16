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

class PenjualanbebasController extends Controller
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
        return view('pages.penjualan.bebas.index', [
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
        return view('pages.penjualan.bebas.form', [
            'pbf' => Pbf::all(),
            'barang' => [],
            'banyak' => $req->jumlah,
            'back' => Str::contains(url()->previous(), ['penjualanbebas/tambah', 'penjualanbebas/edit'])? '/penjualanbebas': url()->previous()
        ]);
    }

	public function tambah_barang(Request $req, $id)
	{
        return view('pages.penjualan.bebas.barang',[
            'barang' => Barang::with('satuan_semua')->get(),
            'data' => $req->barang,
            'id' => $id
        ]);
    }

    public function cek_stok(Request $req)
    {
        $pesan = null;
        foreach ($req->penjualan as $index => $row) {
            $data = explode(";", $row);
            if(sizeof($data) == 4){

            }else{
                $pesan .= "Barang ".($index+1)." belum dipilih<br>";
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
            alert()->error('Simpan Data Gagal', "Sub Total Harga Barang Tidak Boleh Lebih Kecil Atau Sama Dengan 0");
            return redirect()->back()->withInput();
        }
        if (!$req->barang) {
            alert()->error('Simpan Data Gagal', "Barang Belum Diinputkan");
            return redirect()->back()->withInput();
        }
        try{
            DB::transaction(function () use ($req) {
                $data = new Penjualan();
                $data->penjualan_id = Carbon::now()->format('Ymdhmsu');
                $data->penjualan_tanggal = Carbon::now()->format('Y-m-d');
                $data->penjualan_jenis = "Bebas";
                $data->penjualan_keterangan = $req->get('penjualan_keterangan');
                $data->penjualan_tagihan = str_replace(',', '', $req->get('penjualan_tagihan'));
                $data->penjualan_bayar = str_replace(',', '', $req->get('penjualan_bayar'));
                $data->penjualan_sisa = str_replace(',', '', $req->get('penjualan_sisa'));
                $data->save();
                foreach ($req->barang as $index => $barang) {
                    $detail = new PenjualanDetail();
                    $detail->penjualan_id = $data->penjualan_id;
                    $detail->barang_id = $barang['barang_id'];
                    $detail->satuan_nama = $barang['satuan_nama'];
                    $detail->satuan_rasio_dari_utama = $barang['satuan_rasio_dari_utama'];
                    $detail->satuan_harga = str_replace(',', '', $barang['satuan_harga']);
                    $detail->penjualan_detail_qty = $barang['penjualan_detail_qty'];
                    $detail->penjualan_detail_diskon = $barang['penjualan_detail_diskon'];
                    $detail->save();
                }
            });

            toast('Berhasil menyimpan data', 'success')->autoClose(2000);
            return redirect($req->get('redirect')? $req->get('redirect'): 'penjualanbebas');
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
