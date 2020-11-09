<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\JatuhTempo;
use App\Models\BarangMasuk;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    //

    public function index(Request $req)
    {
        $jatuh_tempo = JatuhTempo::orderBy('barang_masuk_jatuh_tempo')->get();
        $barang_masuk = BarangMasuk::where('barang_masuk_kadaluarsa', '<=', date('Y-m-d'))->where('check', 0)->orderBy('barang_masuk_kadaluarsa')->get();

        return view('pages.dashboard.index',[
            'jatuh_tempo' => $jatuh_tempo,
            'barang_masuk' => $barang_masuk
        ]);
    }

    public function faktur(Request $req)
    {
        if (BarangMasuk::where('barang_masuk_faktur', $req->faktur)->where('barang_masuk_jatuh_tempo', $req->tanggal)->count() == 0) {
            JatuhTempo::where('barang_masuk_faktur', $req->faktur)->where('barang_masuk_jatuh_tempo', $req->tanggal)->with('barang')->delete();
            return null;
        }else{
            $data =  BarangMasuk::where('barang_masuk_faktur', $req->faktur)->where('barang_masuk_jatuh_tempo', $req->tanggal)->with('barang')->get();
        }
        return view('pages.dashboard.jatuhtempo', [
            'data' => $data
        ]);
    }

    public function lunas(Request $req)
    {
        JatuhTempo::where('barang_masuk_faktur', $req->faktur)->where('barang_masuk_jatuh_tempo', $req->tanggal)->with('barang')->delete();
        return redirect()->back();
    }

    public function kadaluarsa(Request $req)
    {
        BarangMasuk::where('barang_masuk_id', $req->id)->where('barang_id', $req->barang)->update([
            'check' => 1
            ]);
        return redirect()->back();
    }
}
