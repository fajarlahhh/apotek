<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Barang;
use App\Models\StokAwal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PostingstokController extends Controller
{
    //
    public function index(Request $req)
	{
		return view('pages.postingstok.form',[
			'tahun' => date("Y", strtotime("-1 months")),
			'bulan' => date("m", strtotime("-1 months"))
		]);
    }

	public function simpan(Request $req)
	{
        $req->validate([
            'bulan' => 'required',
            'tahun' => 'required'
        ]);

        try{
            $bulan = $req->get('bulan');
            $tahun = $req->get('tahun');
            $periode = Carbon::create($tahun, $bulan, 1, 0)->addMonths(1)->format('Y-m-01');
            StokAwal::where('stok_awal_tanggal', $periode)->delete();
            $barang = Barang::with(['stok_awal' => function($q) use ($bulan, $tahun){
                $q->select('barang_id', 'barang_qty')->whereRaw(DB::raw("year(stok_awal_tanggal)=$tahun"))->whereRaw(DB::raw("month(stok_awal_tanggal)=$bulan"));
            }])->with(['barang_masuk' => function($q) use ($bulan, $tahun){
                $q->select('barang_id', DB::raw("sum(barang_masuk_qty) masuk"))->whereRaw(DB::raw("year(barang_masuk_tanggal)=$tahun"))->whereRaw(DB::raw("month(barang_masuk_tanggal)=$bulan"))->groupBy('barang_id');
            }])->with(['penjualan' => function($q) use ($bulan, $tahun){
                $q->select('barang_id', DB::raw("sum(penjualan_detail_qty/satuan_rasio_dari_utama) keluar"))->whereHas('penjualan', function($r) use ($bulan, $tahun){
                    $r->whereRaw(DB::raw("year(penjualan_tanggal)=$tahun"))->whereRaw(DB::raw("month(penjualan_tanggal)=$bulan"));
                })->groupBy('barang_id');
            }])->whereNull('pbf_id')->get();

            $data = [];
            foreach ($barang as $index => $row) {
                $stok = 0;
                $masuk = 0;
                $keluar = 0;

                if ($row->stok_awal->count() > 0) {
                    $stok = $row->stok_awal->first()->barang_qty;
                }
                if ($row->barang_masuk->count() > 0) {
                    $masuk = $row->barang_masuk->first()->masuk;
                }
                if ($row->penjualan->count() > 0) {
                    $keluar = $row->penjualan->first()->keluar;
                }

                $sisa = $stok + $masuk - $keluar;
                array_push($data, [
                    'stok_awal_tanggal' => $periode,
                    'barang_id' => $row->barang_id,
                    'barang_qty' => $sisa
                ]);
            }
            StokAwal::insert($data);

			return 1;
		}catch(\Exception $e){
			return 0;
        }
    }
}
