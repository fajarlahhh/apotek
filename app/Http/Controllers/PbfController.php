<?php

namespace App\Http\Controllers;

use App\Models\Pbf;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class PbfController extends Controller
{
    //
    public function index(Request $req)
	{
        $tipe = $req->tipe? $req->tipe: 0;

        $data = Pbf::with('pengguna')->where(function($q) use ($req){
            $q->where('pbf_nama', 'like', '%'.$req->cari.'%')->orWhere('pbf_alamat', 'like', '%'.$req->cari.'%');
        });

        switch ($tipe) {
            case '1':
                $data = $data->onlyTrashed();
                break;
            case '2':
                $data = $data->withTrashed();
                break;
        }

        $data = $data->paginate(10);
        $data->appends([$req->cari, $req->tipe, $req->konsinyasi]);
        return view('pages.datamaster.pbf.index', [
            'data' => $data,
            'i' => ($req->input('page', 1) - 1) * 10,
            'konsinyasi' => $konsinyasi,
            'tipe' => $tipe,
            'cari' => $req->cari,
        ]);
    }

	public function tambah(Request $req)
	{
        return view('pages.datamaster.pbf.form', [
            'back' => Str::contains(url()->previous(), ['pbf/tambah', 'pbf/edit'])? '/pbf': url()->previous(),
            'aksi' => 'Tambah'
        ]);
    }

	public function simpan(Request $req)
	{
        $req->validate([
            'pbf_nama' => 'required',
            'pbf_alamat' => 'required',
            'pbf_kontak' => 'required'
        ]);

        try{
            if ($req->get('id')) {
                $data = Pbf::findOrFail($req->get('id'));
                $data->pbf_nama = $req->get('pbf_nama');
                $data->pbf_alamat = $req->get('pbf_alamat');
                $data->pbf_kontak = $req->get('pbf_kontak');
                $data->save();
                toast('Berhasil mengedit data', 'success')->autoClose(2000);
            }else{
                $data = new Pbf();
                $data->pbf_nama = $req->get('pbf_nama');
                $data->pbf_alamat = $req->get('pbf_alamat');
                $data->pbf_kontak = $req->get('pbf_kontak');
                $data->save();

                toast('Berhasil menambah data', 'success')->autoClose(2000);
            }
            return redirect($req->get('redirect')? $req->get('redirect'): 'pbf');
		}catch(\Exception $e){
            alert()->error('Tambah Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

	public function edit(Request $req)
	{
        return view('pages.datamaster.pbf.form', [
            'data' => Pbf::findOrFail($req->get('id')),
            'back' => Str::contains(url()->previous(), ['pbf/tambah', 'pbf/edit'])? '/pbf': url()->previous(),
            'aksi' => 'Edit'
        ]);
    }

	public function hapus(Request $req)
	{
		try{
            Pbf::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Hapus Data Gagal', $e->getMessage());
		}
	}

	public function restore(Request $req)
	{
		try{
            Pbf::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Restore Data Gagal', $e->getMessage());
		}
	}
}
