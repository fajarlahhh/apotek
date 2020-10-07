<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\JenisBarang;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class BarangController extends Controller
{
    //
    public function index(Request $req)
	{
        $tipe = $req->tipe? $req->tipe: 0;
        $barang = $req->barang? $req->barang: 0;
        $jenis = $req->jenis? $req->jenis: 0;

        $data = Barang::with('jenis_barang')->with('pengguna')->where('barang_nama', 'like', '%'.$req->cari.'%');

        if($barang != 'semua'){
            $data = $data->where('barang_tipe', $barang);
        }

        if($jenis != 'semua'){
            $data = $data->where('jenis_barang_id', $jenis);
        }

        switch ($tipe) {
            case '1':
                $data = $data->onlyTrashed();
                break;
            case '2':
                $data = $data->withTrashed();
                break;
        }

        $data = $data->orderBy('barang_nama')->paginate(10);
        $data->appends([$req->cari, $req->tipe, $req->barang_harga_jual]);
        return view('pages.datamaster.barang.index', [
            'data' => $data,
            'i' => ($req->input('page', 1) - 1) * 10,
            'jenis' => $jenis,
            'tipe' => $tipe,
            'cari' => $req->cari,
            'jenis_barang' => JenisBarang::all(),
        ]);
    }

	public function tambah(Request $req)
	{
        return view('pages.datamaster.barang.form', [
            'back' => Str::contains(url()->previous(), ['barang/tambah', 'barang/edit'])? '/barang': url()->previous(),
            'jenis_barang' => JenisBarang::all(),
            'aksi' => 'Tambah'
        ]);
    }

	public function do_tambah(Request $req)
	{
        $req->validate([
            'barang_nama' => 'required',
            'barang_satuan' => 'required',
            'barang_stok_min' => 'required',
            'barang_harga_jual' => 'required'
        ]);

        try{
            $data = new Barang();
            $data->barang_nama = $req->get('barang_nama');
            $data->barang_satuan = $req->get('barang_satuan');
            $data->barang_stok_min = $req->get('barang_stok_min');
            $data->barang_harga_jual = str_replace(',', '', $req->get('barang_harga_jual'));
            $data->barang_keterangan = $req->get('barang_keterangan');
            $data->jenis_barang_id = $req->get('jenis_barang_id');
            $data->save();

            toast('Berhasil menambah data', 'success')->autoClose(2000);
            return redirect($req->get('redirect')? $req->get('redirect'): 'barang');
		}catch(\Exception $e){
            alert()->error('Tambah Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

	public function edit(Request $req)
	{
        return view('pages.datamaster.barang.form', [
            'data' => Barang::findOrFail($req->get('id')),
            'jenis_barang' => JenisBarang::all(),
            'back' => Str::contains(url()->previous(), ['barang/tambah', 'barang/edit'])? '/barang': url()->previous(),
            'aksi' => 'Edit'
        ]);
    }

	public function do_edit(Request $req)
	{
        $req->validate([
            'id' => 'required',
            'barang_nama' => 'required',
            'barang_satuan' => 'required',
            'barang_stok_min' => 'required',
            'barang_harga_jual' => 'required'
        ]);

		try{
            $data = Barang::findOrFail($req->get('id'));
            $data->barang_nama = $req->get('barang_nama');
            $data->barang_satuan = $req->get('barang_satuan');
            $data->barang_stok_min = $req->get('barang_stok_min');
            $data->barang_harga_jual = str_replace(',', '', $req->get('barang_harga_jual'));
            $data->barang_keterangan = $req->get('barang_keterangan');
            $data->jenis_barang_id = $req->get('jenis_barang_id');
            $data->save();
            toast('Berhasil mengedit data', 'success')->autoClose(2000);
            return redirect($req->get('redirect')? $req->get('redirect'): 'barang');
		}catch(\Exception $e){
            alert()->error('Edit Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

	public function hapus(Request $req)
	{
		try{
            Barang::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Hapus Data Gagal', $e->getMessage());
		}
	}

	public function restore(Request $req)
	{
		try{
            Barang::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Restore Data Gagal', $e->getMessage());
		}
	}
}
