<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PbfController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\PenggunaController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\JenisbarangController;

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
Route::get('logout', [LoginController::class, 'logout'])->name('logout');

Route::group(['middleware' => ['auth']], function () {
    Route::get('/', [DashboardController::class,'index']);
    Route::get('/dashboard', [DashboardController::class,'index']);
    Route::get('/gantisandi', [PenggunaController::class, 'ganti_sandi'])->name('gantisandi');
    Route::patch('/gantisandi', [PenggunaController::class, 'do_ganti_sandi'])->name('gantisandi');

    Route::group(['middleware' => ['role_or_permission:super-admin|barang']], function () {
        Route::prefix('barang')->group(function () {
            Route::get('/', [BarangController::class, 'index'])->name('barang');
            Route::get('/edit', [BarangController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('barang.edit');
            Route::put('/edit', [BarangController::class, 'do_edit'])->middleware(['role:super-admin|user|supervisor'])->name('barang.edit');
            Route::get('/tambah', [BarangController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('barang.tambah');
            Route::post('/tambah', [BarangController::class, 'do_tambah'])->middleware(['role:super-admin|user|supervisor'])->name('barang.tambah');
            Route::delete('/hapus', [BarangController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [BarangController::class, 'restore'])->middleware(['role:super-admin|supervisor']);
            Route::get('/detail', [BarangController::class, 'detail'])->name('barang.detail');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|jenisbarang']], function () {
        Route::prefix('jenisbarang')->group(function () {
            Route::get('/', [JenisbarangController::class, 'index'])->name('jenisbarang');
            Route::get('/edit', [JenisbarangController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('jenisbarang.edit');
            Route::put('/edit', [JenisbarangController::class, 'do_edit'])->middleware(['role:super-admin|user|supervisor'])->name('jenisbarang.edit');
            Route::get('/tambah', [JenisbarangController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('jenisbarang.tambah');
            Route::post('/tambah', [JenisbarangController::class, 'do_tambah'])->middleware(['role:super-admin|user|supervisor'])->name('jenisbarang.tambah');
            Route::delete('/hapus', [JenisbarangController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [JenisbarangController::class, 'restore'])->middleware(['role:super-admin|supervisor']);
            Route::get('/detail', [JenisbarangController::class, 'detail'])->name('jenisbarang.detail');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|pbf']], function () {
        Route::prefix('pbf')->group(function () {
            Route::get('/', [PbfController::class, 'index'])->name('pbf');
            Route::get('/edit', [PbfController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('pbf.edit');
            Route::put('/edit', [PbfController::class, 'do_edit'])->middleware(['role:super-admin|user|supervisor'])->name('pbf.edit');
            Route::get('/tambah', [PbfController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('pbf.tambah');
            Route::post('/tambah', [PbfController::class, 'do_tambah'])->middleware(['role:super-admin|user|supervisor'])->name('pbf.tambah');
            Route::delete('/hapus', [PbfController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [PbfController::class, 'restore'])->middleware(['role:super-admin|supervisor']);
            Route::get('/detail', [PbfController::class, 'detail'])->name('pbf.detail');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|pengguna']], function () {
        Route::prefix('pengguna')->group(function () {
            Route::get('/', [PenggunaController::class, 'index'])->name('pengguna');
            Route::get('/edit', [PenggunaController::class, 'edit'])->middleware(['role:super-admin|user|supervisor']);
            Route::put('/edit', [PenggunaController::class, 'do_edit'])->middleware(['role:super-admin|user|supervisor'])->name('pengguna.edit');
            Route::get('/tambah', [PenggunaController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('pengguna.tambah');
            Route::post('/tambah', [PenggunaController::class, 'do_tambah'])->middleware(['role:super-admin|user|supervisor']);
            Route::delete('/hapus', [PenggunaController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::delete('/restore', [PenggunaController::class, 'restore'])->middleware(['role:super-admin|user|supervisor']);
        });
    });
});


