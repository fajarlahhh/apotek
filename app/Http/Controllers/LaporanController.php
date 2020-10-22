<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LaporanController extends Controller
{
    //
    public function laporanstokbarang(Request $req)
    {
        return view('pages.laporan.laporanstokbarang');
    }
}
