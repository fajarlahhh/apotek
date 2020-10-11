<?php

namespace App\Http\Controllers;

use App\Models\Pbf;
use App\Models\BarangMasuk;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class BarangmasukController extends Controller
{
    //
    public function index(Request $req)
	{
        $tipe = $req->tipe? $req->tipe: 0;
		$tanggal = explode(' - ', $req->get('tanggal'));
		$tgl1 = $req->get('tanggal')? date('Y-m-d', strtotime($tanggal[0])): date('Y-m-1');
		$tgl2 = $req->get('tanggal')? date('Y-m-d', strtotime($tanggal[1])): date('Y-m-d');

        $data = BarangMasuk::with('pengguna')->where(function($q) use ($req){
            $q->where('barang_masuk_keterangan', 'like', '%'.$req->cari.'%')->orWhere('barang_masuk_sales', 'like', '%'.$req->cari.'%')->orWhere('barang_masuk_keterangan', 'like', '%'.$req->cari.'%');
        })->orWhereHas('barang', function($q) use ($req){
            $q->where('barang_nama', 'like', '%'.$req->cari.'%');
        })->orWhereHas('pbf', function($q) use ($req){
            $q->where('pbf_nama', 'like', '%'.$req->cari.'%');
        })->whereBetween('barang_masuk_jatuh_tempo', [$tgl1, $tgl2]);

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
        return view('pages.barangmasuk.index', [
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
        return view('pages.barangmasuk.form');
    }

	public function simpan(Request $req)
	{
        $req->validate([
            'barang_masuk_uraian' => 'required'
        ]);

        try{
            $data = new BarangMasuk();
            $data->barang_masuk_uraian = $req->get('barang_masuk_uraian');
            $data->save();

            toast('Berhasil menambah data', 'success')->autoClose(2000);
            return redirect($req->get('redirect')? $req->get('redirect'): 'jenisbarang');
		}catch(\Exception $e){
            alert()->error('Tambah Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

	public function hapus(Request $req)
	{
		try{
            BarangMasuk::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Hapus Data Gagal', $e->getMessage());
		}
	}
}
