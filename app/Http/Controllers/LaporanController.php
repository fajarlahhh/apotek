<?php

namespace App\Http\Controllers;

use App\Models\Pbf;
use App\Models\Barang;
use App\Models\Dokter;
use App\Models\Penjualan;
use App\Models\BarangMasuk;
use Illuminate\Http\Request;
use App\Models\PenjualanDetail;
use Illuminate\Support\Facades\DB;

class LaporanController extends Controller
{
    //
    public function laporanstokbarang(Request $req, $cetak = null)
    {
        $bulan = $req->bulan ?: date('m');
        $tahun = $req->tahun ?: date('Y');

        $data = Barang::with('satuan_utama')->with('jenis_barang')->with(['stok_awal' => function ($q) use ($bulan, $tahun) {
            $q->select('barang_id', 'barang_qty')->whereRaw(DB::raw("year(stok_awal_tanggal)=$tahun"))->whereRaw(DB::raw("month(stok_awal_tanggal)=$bulan"));
        }])->with(['barang_masuk' => function ($q) use ($bulan, $tahun) {
            $q->select('barang_id', DB::raw("sum(barang_masuk_qty) masuk"))->whereRaw(DB::raw("year(barang_masuk_tanggal)=$tahun"))->whereRaw(DB::raw("month(barang_masuk_tanggal)=$bulan"))->groupBy('barang_id');
        }])->with(['penjualan' => function ($q) use ($bulan, $tahun) {
            $q->select('barang_id', 'penjualan_id', DB::raw("sum(penjualan_detail_qty/satuan_rasio_dari_utama) keluar"))->whereHas('penjualan', function ($r) use ($bulan, $tahun) {
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
        $tanggal = $req->tanggal ? date('Y-m-d', strtotime($req->tanggal)) : date('Y-m-d');

        $data = Penjualan::with('detail.barang')->where('penjualan_tanggal', $tanggal)->get()->map(function ($q) {
            return [
                'id' => $q->penjualan_id,
                'jenis' => $q->penjualan_jenis,
                'dokter' => $q->dokter_id,
                'tanggal' => $q->penjualan_tanggal,
                'harga_belum_ppn' => $q->detail->filter(function ($r) {
                    return $r->pbf_id == null;
                })->sum(function ($r) {
                    return ($r->satuan_harga - ($r->satuan_harga * $r->penjualan_detail_diskon / 100)) * $r->penjualan_detail_qty;
                }),
                'servis' => $q->penjualan_racikan,
                'biaya_dokter' => $q->penjualan_biaya_dokter,
                'persen' => $q->detail->sum(function ($r) {
                    return $r->penjualan_detail_tambahan * $r->penjualan_detail_qty;
                }),
                'listrik' => $q->penjualan_admin,
                'konsinyasi' => $q->detail->filter(function ($r) {
                    return $r->pbf_id != null;
                })->sum(function ($r) {
                    return ($r->satuan_harga - ($r->satuan_harga * $r->penjualan_detail_diskon / 100)) * $r->penjualan_detail_qty;
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
        $bulan = $req->bulan ?: date('m');
        $tahun = $req->tahun ?: date('Y');

        $data = Penjualan::with('detail.barang')->orderBy('penjualan_tanggal')->whereRaw('month(penjualan_tanggal)=' . $bulan)->whereRaw('year(penjualan_tanggal)=' . $tahun)->get()->map(function ($q) {
            return [
                'jenis' => $q->penjualan_jenis,
                'dokter' => $q->dokter_id,
                'tanggal' => $q->penjualan_tanggal,
                'harga_belum_ppn' => $q->detail->sum(function ($r) {
                    return ($r->satuan_harga - ($r->satuan_harga * $r->penjualan_detail_diskon / 100)) * $r->penjualan_detail_qty;
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
                'konsinyasi' => $q->detail->filter(function ($r) {
                    return $r->pbf_id != null;
                })->sum(function ($r) {
                    return ($r->satuan_harga - ($r->satuan_harga * $r->penjualan_detail_diskon / 100)) * $r->penjualan_detail_qty;
                }),
            ];
        })->groupBy('tanggal')->map(function ($q) {
            return [
                'tanggal' => $q->first()['tanggal'],
                'bebas' => sizeof($q->where('jenis', 'Bebas')->all()),
                'resep' => sizeof($q->where('jenis', 'Resep')->all()),
                'harga_belum_ppn_resep' => $q->where('jenis', 'Resep')->sum('harga_belum_ppn'),
                'harga_belum_ppn_bebas' => $q->where('jenis', 'Bebas')->sum('harga_belum_ppn'),
                'servis' => $q->sum('servis'),
                'listrik' => $q->sum('listrik'),
                'konsinyasi' => $q->sum('konsinyasi'),
                'persen' => array_values(collect($q)->map(function ($r) {
                    return $r['persen'];
                })->groupBy('dokter')->map(function ($r) {
                    return [
                        'dokter' => $r->first()['dokter'],
                        'biaya_dokter' => $r->sum('biaya_dokter'),
                        'nilai' => $r->sum('nilai')
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
            'harga_belum_ppn_resep' => 0,
            'harga_belum_ppn_bebas' => 0,
            'servis' => 0,
            'persen' => [],
            'listrik' => 0,
            'konsinyasi' => 0
        ]);
    }

    public function laporanpenerimaandokterperhari(Request $req, $cetak = null)
    {
        $tanggal = $req->tanggal ? date('Y-m-d', strtotime($req->tanggal)) : date('Y-m-d');

        $data = Penjualan::with('detail.barang')->where('penjualan_tanggal', $tanggal)->get()->map(function ($q) {
            return [
                'id' => $q->penjualan_id,
                'jenis' => $q->penjualan_jenis,
                'dokter' => $q->dokter_id,
                'tanggal' => $q->penjualan_tanggal,
                'harga_belum_ppn' => $q->detail->filter(function ($r) {
                    return $r->pbf_id == null;
                })->sum(function ($r) {
                    return ($r->satuan_harga - ($r->satuan_harga * $r->penjualan_detail_diskon / 100)) * $r->penjualan_detail_qty;
                }),
                'servis' => $q->penjualan_racikan,
                'biaya_dokter' => $q->penjualan_biaya_dokter,
                'persen' => $q->detail->sum(function ($r) {
                    return $r->penjualan_detail_tambahan * $r->penjualan_detail_qty;
                }),
                'listrik' => $q->penjualan_admin,
                'konsinyasi' => $q->detail->filter(function ($r) {
                    return $r->pbf_id != null;
                })->sum(function ($r) {
                    return ($r->satuan_harga - ($r->satuan_harga * $r->penjualan_detail_diskon / 100)) * $r->penjualan_detail_qty;
                }),
            ];
        });
        return view('pages.laporan.laporanpenerimaandokter.perhari.index', [
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

    public function laporanpenerimaandokterbulanan(Request $req, $cetak = null)
    {
        $bulan = $req->bulan ?: date('m');
        $tahun = $req->tahun ?: date('Y');

        $data = Penjualan::with('detail.barang')->orderBy('penjualan_tanggal')->whereRaw('month(penjualan_tanggal)=' . $bulan)->whereRaw('year(penjualan_tanggal)=' . $tahun)->get()->map(function ($q) {
            return [
                'jenis' => $q->penjualan_jenis,
                'dokter' => $q->dokter_id,
                'tanggal' => $q->penjualan_tanggal,
                'harga_belum_ppn' => $q->detail->sum(function ($r) {
                    return ($r->satuan_harga - ($r->satuan_harga * $r->penjualan_detail_diskon / 100)) * $r->penjualan_detail_qty;
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
                'konsinyasi' => $q->detail->filter(function ($r) {
                    return $r->pbf_id != null;
                })->sum(function ($r) {
                    return ($r->satuan_harga - ($r->satuan_harga * $r->penjualan_detail_diskon / 100)) * $r->penjualan_detail_qty;
                }),
            ];
        })->groupBy('tanggal')->map(function ($q) {
            return [
                'tanggal' => $q->first()['tanggal'],
                'bebas' => sizeof($q->where('jenis', 'Bebas')->all()),
                'resep' => sizeof($q->where('jenis', 'Resep')->all()),
                'harga_belum_ppn' => $q->sum('harga_belum_ppn'),
                'servis' => $q->sum('servis'),
                'listrik' => $q->sum('listrik'),
                'konsinyasi' => $q->sum('konsinyasi'),
                'persen' => array_values(collect($q)->map(function ($r) {
                    return $r['persen'];
                })->groupBy('dokter')->map(function ($r) {
                    return [
                        'dokter' => $r->first()['dokter'],
                        'biaya_dokter' => $r->sum('biaya_dokter'),
                        'nilai' => $r->sum('nilai')
                    ];
                })->toArray())
            ];
        })->toArray();
        return view('pages.laporan.laporanpenerimaandokter.perbulan.index', [
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

    public function laporankonsinyasiperhari(Request $req, $cetak = null)
    {
        $tanggal = $req->tanggal ? date('Y-m-d', strtotime($req->tanggal)) : date('Y-m-d');
        $dokter = $req->dokter ? $req->dokter : 'semua';

        $data = PenjualanDetail::select('penjualan_id', 'barang_id', 'pbf_id', DB::raw('sum(penjualan_detail_qty) qty'), DB::raw('sum(satuan_harga - (satuan_harga * penjualan_detail_diskon/100)) harga'), DB::raw('sum((satuan_harga - (satuan_harga * penjualan_detail_diskon/100)) * penjualan_detail_qty) total'))->with('pbf')->with('barang')->with('penjualan')->whereHas('penjualan', function ($q) use ($tanggal) {
            return $q->where('penjualan_tanggal', $tanggal);
        })->whereNotNull('pbf_id')->groupBy(['penjualan_id', 'barang_id', 'pbf_id']);
        if ($dokter != 'semua') {
            $data = $data->whereHas('penjualan', fn ($q) => $q->where('dokter_id', $dokter));
        }
        $data = $data->get();
        return view('pages.laporan.laporankonsinyasi.perhari.index', [
            'data' => $data,
            'cetak' => $cetak,
            'tanggal' => $tanggal,
            'dokter' => $dokter,
            'konsi' => Dokter::all()
        ]);
    }

    public function laporankonsinyasibulanan(Request $req, $cetak = null)
    {
        $bulan = $req->bulan ?: date('m');
        $tahun = $req->tahun ?: date('Y');
        $dokter = $req->dokter ? $req->dokter : 'semua';

        $data = PenjualanDetail::select('penjualan_id', 'barang_id', 'pbf_id', DB::raw('sum(penjualan_detail_qty) qty'), DB::raw('sum(satuan_harga - (satuan_harga * penjualan_detail_diskon/100)) harga'), DB::raw('sum((satuan_harga - (satuan_harga * penjualan_detail_diskon/100)) * penjualan_detail_qty) total'))->with('pbf')->with('barang')->with('penjualan')->whereHas('penjualan', function ($q) use ($bulan, $tahun) {
            return $q->whereRaw('month(penjualan_tanggal)=' . $bulan)->whereRaw('year(penjualan_tanggal)=' . $tahun);
        })->whereNotNull('pbf_id')->groupBy(['penjualan_id', 'barang_id', 'pbf_id']);
        if ($dokter != 'semua') {
            $data = $data->whereHas('penjualan', fn ($q) => $q->where('dokter_id', $dokter));
        }
        $data = $data->get()->groupBy(function ($q) {
            return [$q->penjualan->penjualan_tanggal];
        })->map(function ($q) {
            return [
                'tanggal' => $q->first()->penjualan->penjualan_tanggal,
                'barang' => array_values($q->groupBy('barang_id')->map(function ($r) {
                    return [
                        'nama' => $r->first()->barang->barang_nama,
                        'pbf' => $r->first()->pbf->pbf_nama,
                        'harga' => $r->first()->harga,
                        'qty' => $r->sum('qty'),
                        'total' => $r->sum('total'),
                    ];
                })->toArray())
            ];
        })->sortBy('tanggal')->toArray();
        return view('pages.laporan.laporankonsinyasi.perbulan.index', [
            'data' => collect(array_values($data)),
            'cetak' => $cetak,
            'bulan' => $bulan,
            'tahun' => $tahun,
            'total' => 0,
            'dokter' => $dokter,
            'no' => 0,
            'konsi' => Dokter::all()
        ]);
    }

    public function laporanbarangkeluarbulanan(Request $req, $cetak = null)
    {
        $bulan = $req->bulan ?: date('m');
        $tahun = $req->tahun ?: date('Y');
        $cari = $req->cari ?: '';

        $data = PenjualanDetail::select('penjualan_tanggal', 'barang_nama', 'satuan_nama', DB::raw('(satuan_harga + ifnull(penjualan_detail_tambahan,0)) harga'), 'penjualan_detail_tambahan', DB::raw('sum(penjualan_detail_qty) qty'), DB::raw('sum(penjualan_detail_total) jumlah_harga'))->leftJoin('penjualan', 'penjualan.penjualan_id', '=', 'penjualan_detail.penjualan_id')->leftJoin('barang', 'barang.barang_id', '=', 'penjualan_detail.barang_id')->groupBy(['penjualan_tanggal', 'barang_nama', 'satuan_nama', 'satuan_harga', 'penjualan_detail_tambahan'])->orderBy('penjualan_tanggal')->orderBy('barang_nama')->whereRaw(DB::raw("year(penjualan_tanggal)=$tahun"))->whereRaw(DB::raw("month(penjualan_tanggal)=$bulan"))->where('barang_nama', 'like', '%' . $cari . '%')->get();
        return view('pages.laporan.laporanbarangkeluar.perbulan.index', [
            'data' => $data,
            'cari' => $cari,
            'cetak' => $cetak,
            'bulan' => $bulan,
            'tahun' => $tahun
        ]);
    }

    public function laporanbarangkeluarperhari(Request $req, $cetak = null)
    {
        $tanggal = $req->tanggal ? date('Y-m-d', strtotime($req->tanggal)) : date('Y-m-d');
        $cari = $req->cari ?: '';

        $data = PenjualanDetail::select('penjualan_tanggal', 'barang_nama', 'satuan_nama', DB::raw('(satuan_harga + ifnull(penjualan_detail_tambahan,0)) harga'), 'penjualan_detail_tambahan', DB::raw('sum(penjualan_detail_qty) qty'), DB::raw('sum(penjualan_detail_total) jumlah_harga'))->leftJoin('penjualan', 'penjualan.penjualan_id', '=', 'penjualan_detail.penjualan_id')->leftJoin('barang', 'barang.barang_id', '=', 'penjualan_detail.barang_id')->groupBy(['penjualan_tanggal', 'barang_nama', 'satuan_nama', 'satuan_harga', 'penjualan_detail_tambahan'])->orderBy('penjualan_tanggal')->orderBy('barang_nama')->where('penjualan_tanggal', $tanggal)->where('barang_nama', 'like', '%' . $cari . '%')->get();
        return view('pages.laporan.laporanbarangkeluar.perhari.index', [
            'data' => $data,
            'cetak' => $cetak,
            'tanggal' => $tanggal,
            'cari' => $cari
        ]);
    }

    public function laporanbarangmasukbulanan(Request $req, $cetak = null)
    {
        $bulan = $req->bulan ?: date('m');
        $tahun = $req->tahun ?: date('Y');
        $cari = $req->cari ?: '';

        $data = BarangMasuk::with('barang')->select(DB::raw('barang_masuk.barang_id barang_id'), 'barang_masuk_faktur', 'barang_masuk_tanggal', 'barang_nama', 'barang_masuk_harga_ppn', 'barang_masuk_diskon', DB::raw('(barang_masuk_harga_barang) harga'), DB::raw('sum(barang_masuk_qty) qty'), DB::raw('sum(barang_masuk_sub_total_ppn) jumla_ppn'), DB::raw('sum(barang_masuk_sub_total) jumlah_harga'))
            ->leftJoin('barang', 'barang.barang_id', '=', 'barang_masuk.barang_id')
            ->groupBy(['barang_masuk_tanggal', 'barang_masuk_diskon', 'barang_masuk_faktur', 'barang_masuk.barang_id', 'barang_nama', 'barang_masuk_harga_ppn', 'barang_masuk_harga_barang'])
            ->orderBy('barang_masuk_tanggal')->orderBy('barang_masuk_faktur')->whereRaw(DB::raw("year(barang_masuk_tanggal)=$tahun"))->whereRaw(DB::raw("month(barang_masuk_tanggal)=$bulan"))->where(fn($q) => $q->where('barang_nama', 'like', '%' . $cari . '%')->orWhere('barang_masuk_faktur', 'like', '%' . $cari . '%'))->get();
        return view('pages.laporan.laporanbarangmasuk.perbulan.index', [
            'data' => $data,
            'cari' => $cari,
            'cetak' => $cetak,
            'bulan' => $bulan,
            'tahun' => $tahun
        ]);
    }

    public function laporanbarangmasukperhari(Request $req, $cetak = null)
    {
        $tanggal = $req->tanggal ? date('Y-m-d', strtotime($req->tanggal)) : date('Y-m-d');
        $cari = $req->cari ?: '';

        $data = BarangMasuk::with('barang')->select(DB::raw('barang_masuk.barang_id barang_id'), 'barang_masuk_faktur', 'barang_masuk_tanggal', 'barang_nama', 'barang_masuk_harga_ppn', 'barang_masuk_diskon', DB::raw('(barang_masuk_harga_barang) harga'), DB::raw('sum(barang_masuk_qty) qty'), DB::raw('sum(barang_masuk_sub_total_ppn) jumla_ppn'), DB::raw('sum(barang_masuk_sub_total) jumlah_harga'))
            ->leftJoin('barang', 'barang.barang_id', '=', 'barang_masuk.barang_id')
            ->groupBy(['barang_masuk_tanggal', 'barang_masuk_diskon', 'barang_masuk_faktur', 'barang_masuk.barang_id', 'barang_nama', 'barang_masuk_harga_ppn', 'barang_masuk_harga_barang'])
            ->orderBy('barang_masuk_tanggal')->orderBy('barang_masuk_faktur')->where('barang_masuk_tanggal', $tanggal)->where(fn($q) => $q->where('barang_nama', 'like', '%' . $cari . '%')->orWhere('barang_masuk_faktur', 'like', '%' . $cari . '%'))->get();
        return view('pages.laporan.laporanbarangmasuk.perhari.index', [
            'data' => $data,
            'cetak' => $cetak,
            'tanggal' => $tanggal,
            'cari' => $cari
        ]);
    }
}
