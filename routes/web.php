<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PbfController;
use App\Http\Controllers\BiayaController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\DokterController;
use App\Http\Controllers\CekstokController;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\PenggunaController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\BarangmasukController;
use App\Http\Controllers\JenisbarangController;
use App\Http\Controllers\PostingstokController;
use App\Http\Controllers\PenjualanbebasController;
use App\Http\Controllers\PenjualanresepController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::post('login', [LoginController::class, 'authenticate']);
Route::group(['middleware' => ['auth']], function () {
    Route::get('/', [DashboardController::class,'index']);
    Route::get('/dashboard', [DashboardController::class,'index']);
    Route::get('/gantisandi', [PenggunaController::class, 'ganti_sandi'])->name('gantisandi');
    Route::patch('/gantisandi', [PenggunaController::class, 'do_ganti_sandi'])->name('gantisandi.simpan');
    Route::get('/barang/cari', [BarangController::class, 'cari']);

    Route::group(['middleware' => ['role_or_permission:super-admin|cekstok']], function () {
        Route::prefix('cekstok')->group(function () {
            Route::get('/', [CekstokController::class, 'index'])->name('cekstok');
            Route::get('/tambahbarang/{id}', [CekstokController::class, 'tambah_barang']);
            Route::get('/cek', [CekstokController::class, 'cek'])->middleware(['role:super-admin|user|supervisor'])->name('cekstok.cek');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|biaya']], function () {
        Route::prefix('biaya')->group(function () {
            Route::get('/', [BiayaController::class, 'index'])->name('biaya');
            Route::post('/simpan', [BiayaController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('biaya.simpan');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|postingstok']], function () {
        Route::prefix('postingstok')->group(function () {
            Route::get('/', [PostingstokController::class, 'index'])->name('postingstok');
            Route::post('/', [PostingstokController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('postingstok.posting');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|barang']], function () {
        Route::prefix('barang')->group(function () {
            Route::get('/tambahsatuan/{id}', [BarangController::class, 'tambah_satuan']);
            Route::get('/', [BarangController::class, 'index'])->name('barang');
            Route::get('/tambah', [BarangController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('barang.tambah');
            Route::get('/edit', [BarangController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('barang.edit');
            Route::post('/simpan', [BarangController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('barang.simpan');
            Route::delete('/hapus', [BarangController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [BarangController::class, 'restore'])->middleware(['role:super-admin|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|jenisbarang']], function () {
        Route::prefix('jenisbarang')->group(function () {
            Route::get('/', [JenisbarangController::class, 'index'])->name('jenisbarang');
            Route::get('/tambah', [JenisbarangController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('jenisbarang.tambah');
            Route::get('/edit', [JenisbarangController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('jenisbarang.edit');
            Route::post('/simpan', [JenisbarangController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('jenisbarang.simpan');
            Route::delete('/hapus', [JenisbarangController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [JenisbarangController::class, 'restore'])->middleware(['role:super-admin|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|pbf']], function () {
        Route::prefix('pbf')->group(function () {
            Route::get('/', [PbfController::class, 'index'])->name('pbf');
            Route::get('/tambah', [PbfController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('pbf.tambah');
            Route::get('/edit', [PbfController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('pbf.edit');
            Route::post('/simpan', [PbfController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('pbf.simpan');
            Route::delete('/hapus', [PbfController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [PbfController::class, 'restore'])->middleware(['role:super-admin|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|dokter']], function () {
        Route::prefix('dokter')->group(function () {
            Route::get('/', [DokterController::class, 'index'])->name('dokter');
            Route::get('/tambah', [DokterController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('dokter.tambah');
            Route::get('/edit', [DokterController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('dokter.edit');
            Route::post('/simpan', [DokterController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('dokter.simpan');
            Route::delete('/hapus', [DokterController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [DokterController::class, 'restore'])->middleware(['role:super-admin|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|pengguna']], function () {
        Route::prefix('pengguna')->group(function () {
            Route::get('/', [PenggunaController::class, 'index'])->name('pengguna');
            Route::get('/tambah', [PenggunaController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('pengguna.tambah');
            Route::get('/edit', [PenggunaController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('pengguna.edit');
            Route::post('/simpan', [PenggunaController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('pengguna.simpan');
            Route::delete('/hapus', [PenggunaController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::delete('/restore', [PenggunaController::class, 'restore'])->middleware(['role:super-admin|user|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|barangmasuk']], function () {
        Route::prefix('barangmasuk')->group(function () {
            Route::get('/tambahbarang/{id}', [BarangmasukController::class, 'tambah_barang']);
            Route::get('/', [BarangmasukController::class, 'index'])->name('barangmasuk');
            Route::get('/tambah', [BarangmasukController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('barangmasuk.tambah');
            Route::post('/simpan', [BarangmasukController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('barangmasuk.simpan');
            Route::delete('/hapus', [BarangmasukController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [BarangmasukController::class, 'restore'])->middleware(['role:super-admin|user|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|penjualanbebas']], function () {
        Route::prefix('penjualanbebas')->group(function () {
            Route::get('/kwitansi/{cetak}/{id}', [PenjualanbebasController::class, 'nota']);
            Route::get('/tambahbarang/{id}', [PenjualanbebasController::class, 'tambah_barang']);
            Route::get('/data', [PenjualanbebasController::class, 'index'])->name('penjualanbebas');
            Route::get('/penjualanbebas/kwitansi/{id}', [PenjualanbebasController::class, 'index']);
            Route::get('/', [PenjualanbebasController::class, 'tambah']);
            Route::get('/tambah', [PenjualanbebasController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('penjualanbebas.tambah');
            Route::post('/simpan', [PenjualanbebasController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('penjualanbebas.simpan');
            Route::delete('/hapus', [PenjualanbebasController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [PenjualanbebasController::class, 'restore'])->middleware(['role:super-admin|user|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|penjualanresep']], function () {
        Route::prefix('penjualanresep')->group(function () {
            Route::get('/kwitansi/{cetak}/{id}', [PenjualanresepController::class, 'nota']);
            Route::get('/tambahbarang/{resep}/{id}', [PenjualanresepController::class, 'tambah_barang']);
            Route::get('/tambahresep/{id}', [PenjualanresepController::class, 'tambah_resep']);
            Route::get('/data', [PenjualanresepController::class, 'index'])->name('penjualanresep');
            Route::get('/penjualanresep/kwitansi/{id}', [PenjualanresepController::class, 'index']);
            Route::get('/', [PenjualanresepController::class, 'tambah']);
            Route::get('/tambah', [PenjualanresepController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('penjualanresep.tambah');
            Route::post('/simpan', [PenjualanresepController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('penjualanresep.simpan');
            Route::delete('/hapus', [PenjualanresepController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [PenjualanresepController::class, 'restore'])->middleware(['role:super-admin|user|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|laporanstokbarang']], function () {
        Route::prefix('laporanstokbarang')->group(function () {
            Route::get('/', [LaporanController::class, 'laporanstokbarang'])->name('laporanstokbarang');
            Route::get('/{cetak}', [LaporanController::class, 'laporanstokbarang'])->name('laporanstokbarang.cetak');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|laporanpenerimaanperhari']], function () {
        Route::prefix('laporanpenerimaanperhari')->group(function () {
            Route::get('/', [LaporanController::class, 'laporanpenerimaanperhari'])->name('laporanpenerimaanperhari');
            Route::get('/{cetak}', [LaporanController::class, 'laporanpenerimaanperhari'])->name('laporanpenerimaanperhari.cetak');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|laporanpenerimaanbulanan']], function () {
        Route::prefix('laporanpenerimaanbulanan')->group(function () {
            Route::get('/', [LaporanController::class, 'laporanpenerimaanbulanan'])->name('laporanpenerimaanbulanan');
            Route::get('/{cetak}', [LaporanController::class, 'laporanpenerimaanbulanan'])->name('laporanpenerimaanbulanan.cetak');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|laporankonsinyasiperhari']], function () {
        Route::prefix('laporankonsinyasiperhari')->group(function () {
            Route::get('/', [LaporanController::class, 'laporankonsinyasiperhari'])->name('laporankonsinyasiperhari');
            Route::get('/{cetak}', [LaporanController::class, 'laporankonsinyasiperhari'])->name('laporankonsinyasiperhari.cetak');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|laporankonsinyasibulanan']], function () {
        Route::prefix('laporankonsinyasibulanan')->group(function () {
            Route::get('/', [LaporanController::class, 'laporankonsinyasibulanan'])->name('laporankonsinyasibulanan');
            Route::get('/{cetak}', [LaporanController::class, 'laporankonsinyasibulanan'])->name('laporankonsinyasibulanan.cetak');
        });
    });
});


