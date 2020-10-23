<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\Dokter;
use App\Models\Penjualan;
use Illuminate\Http\Request;
use App\Models\PenjualanDetail;
use Illuminate\Support\Facades\DB;

class LaporanController extends Controller
{
    //
    public function laporanstokbarang(Request $req, $cetak = null)
    {
        $bulan = $req->bulan?:date('m');
        $tahun = $req->tahun?:date('Y');

        $data = Barang::with('satuan_utama')->with('jenis_barang')->with(['stok_awal' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', 'barang_qty')->whereRaw(DB::raw("year(stok_awal_tanggal)=$tahun"))->whereRaw(DB::raw("month(stok_awal_tanggal)=$bulan"));
        }])->with(['barang_masuk' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', DB::raw("sum(barang_masuk_qty) masuk"))->whereRaw(DB::raw("year(barang_masuk_tanggal)=$tahun"))->whereRaw(DB::raw("month(barang_masuk_tanggal)=$bulan"))->groupBy('barang_id');
        }])->with(['penjualan' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', 'penjualan_id', DB::raw("sum(penjualan_detail_qty/satuan_rasio_dari_utama) keluar"))->whereHas('penjualan', function($r) use ($bulan, $tahun){
                $r->whereRaw(DB::raw("year(penjualan_tanggal)=$tahun"))->whereRaw(DB::raw("month(penjualan_tanggal)=$bulan"));
            })->groupBy('barang_id', 'penjualan_id');
        }])->whereNull('pbf_id')->orderBy('barang_nama')->get();
        return view('pages.laporan.laporanstokbarang.index', [
            'data' => $data,
            'cetak' => $cetak,
            'bulan' => $bulan,
            'tahun' => $tahun
        ]);
    }

    public function laporanpenerimaanperhari(Request $req, $cetak = null)
    {
        $tanggal = $req->tanggal? date('Y-m-d', strtotime($req->tanggal)):date('Y-m-d');

        $data = Penjualan::with('detail.barang')->where('penjualan_tanggal', $tanggal)->get()->map(function($q){
            return [
                'jenis' => $q->penjualan_jenis,
                'dokter' => $q->dokter_id,
                'tanggal' => $q->penjualan_tanggal,
                'harga_belum_ppn' => $q->detail->sum(function ($r) {
                    return $r->satuan_harga * $r->penjualan_detail_qty;
                }),
                'servis' => $q->penjualan_racikan,
                'biaya_dokter' => $q->penjualan_biaya_dokter,
                'persen' => $q->detail->sum(function ($r) {
                    return $r->penjualan_detail_tambahan * $r->penjualan_detail_qty;
                }),
                'listrik' => $q->penjualan_admin,
                'konsinyasi' => $q->detail->filter(function($r){
                    return $r->pbf_id != null;
                })->sum(function ($r) {
                    return $r->satuan_harga * $r->penjualan_detail_qty;
                }),
            ];
        });
        return view('pages.laporan.laporanpenerimaan.perhari.index', [
            'data' => $data,
            'cetak' => $cetak,
            'dokter' => Dokter::all(),
            'tanggal' => $tanggal,
            'harga_belum_ppn' => 0,
            'servis' => 0,
            'persen' => [],
            'listrik' => 0,
            'konsinyasi' => 0
        ]);
    }

    public function laporanpenerimaanbulanan(Request $req, $cetak = null)
    {
        $bulan = $req->bulan?:date('m');
        $tahun = $req->tahun?:date('Y');

        $data = Penjualan::with('detail.barang')->orderBy('penjualan_tanggal')->whereRaw('month(penjualan_tanggal)='.$bulan)->whereRaw('year(penjualan_tanggal)='.$tahun)->get()->map(function($q){
            return [
                'jenis' => $q->penjualan_jenis,
                'dokter' => $q->dokter_id,
                'tanggal' => $q->penjualan_tanggal,
                'harga_belum_ppn' => $q->detail->sum(function ($r) {
                    return $r->satuan_harga * $r->penjualan_detail_qty;
                }),
                'servis' => $q->penjualan_racikan,
                'persen' => [
                    'biaya_dokter' => $q->penjualan_biaya_dokter,
                    'dokter' => $q->dokter_id,
                    'nilai' => $q->detail->sum(function ($r) {
                        return $r->penjualan_detail_tambahan * $r->penjualan_detail_qty;
                    })
                ],
                'listrik' => $q->penjualan_admin,
                'konsinyasi' => $q->detail->filter(function($r){
                    return $r->pbf_id != null;
                })->sum(function ($r) {
                    return $r->satuan_harga * $r->penjualan_detail_qty;
                }),
            ];
        })->groupBy('tanggal')->map(function($q){
            return [
                'tanggal' => $q->first()['tanggal'],
                'bebas' => sizeof($q->where('jenis', 'Bebas')->all()),
                'resep' => sizeof($q->where('jenis', 'Resep')->all()),
                'harga_belum_ppn' => $q->sum('harga_belum_ppn'),
                'servis' => $q->sum('servis'),
                'listrik' => $q->sum('listrik'),
                'konsinyasi' => $q->sum('konsinyasi'),
                'persen' => array_values(collect($q)->map(function($r){
                    return $r['persen'];
                })->groupBy('dokter')->map(function($r){
                    return [
                        'dokter' => $r->first()['dokter'],
                        'biaya_dokter' => $r->first()['biaya_dokter'],
                        'nilai' => $r->first()['nilai']
                    ];
                })->toArray())
            ];
        })->toArray();
        return view('pages.laporan.laporanpenerimaan.perbulan.index', [
            'data' => array_values($data),
            'cetak' => $cetak,
            'dokter' => Dokter::all(),
            'bulan' => $bulan,
            'tahun' => $tahun,
            'harga_belum_ppn' => 0,
            'servis' => 0,
            'persen' => [],
            'listrik' => 0,
            'konsinyasi' => 0
        ]);
    }
}
