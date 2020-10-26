<?php

namespace App\Http\Controllers;

use App\Models\BarangMasuk;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    //

    public function index(Request $req)
    {
        return view('pages.dashboard.index');
    }
}
