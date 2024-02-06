<?php

return [

    /*
    |--------------------------------------------------------------------------
    | View Storage Paths
    |--------------------------------------------------------------------------
    |
    | Most templating systems load templates from disk. Here you may specify
    | an array of paths that should be checked for your views. Of course
    | the usual Laravel view path has already been registered for you.
    |
    */

    'menu' => [[
        'icon' => 'fa fa-th-large',
        'title' => 'Dashboard',
        'url' => '/dashboard',
        'id' => 'dashboard'
    ], [
        'icon' => 'fa fa-inbox',
        'title' => 'Barang Masuk',
        'url' => '/barangmasuk',
        'id' => 'barangmasuk'
    ], [
        'icon' => 'fa fa-database',
        'title' => 'Data Master',
        'url' => 'javascript:;',
        'caret' => true,
        'id' => 'datamaster',
        'sub_menu' => [[
            'url' => '/barang',
            'id' => 'barang',
            'title' => 'Barang'
        ], [
            'url' => '/dokter',
            'id' => 'dokter',
            'title' => 'Dokter'
        ], [
            'url' => '/jenisbarang',
            'id' => 'jenisbarang',
            'title' => 'Jenis Barang'
        ], [
            'url' => '/pbf',
            'id' => 'pbf',
            'title' => 'PBF'
        ],]
    ], [
        'icon' => 'fa fa-file',
        'title' => 'Laporan',
        'url' => 'javascript:;',
        'caret' => true,
        'id' => 'laporan',
        'sub_menu' => [[
            'title' => 'Barang Keluar',
            'url' => 'javascript:;',
            'caret' => true,
            'id' => 'laporanbarangkeluar',
            'sub_menu' => [[
                'url' => '/laporanbarangkeluarperhari',
                'id' => 'laporanbarangkeluarperhari',
                'title' => 'Perhari'
            ], [
                'url' => '/laporanbarangkeluarbulanan',
                'id' => 'laporanbarangkeluarbulanan',
                'title' => 'Perbulan'
            ]]
        ], [
            'title' => 'Barang Masuk',
            'url' => 'javascript:;',
            'caret' => true,
            'id' => 'laporanbarangmasuk',
            'sub_menu' => [[
                'url' => '/laporanbarangmasukperhari',
                'id' => 'laporanbarangmasukperhari',
                'title' => 'Perhari'
            ], [
                'url' => '/laporanbarangmasukbulanan',
                'id' => 'laporanbarangmasukbulanan',
                'title' => 'Perbulan'
            ]]
        ], [
            'title' => 'Konsinyasi',
            'url' => 'javascript:;',
            'caret' => true,
            'id' => 'konsinyasi',
            'sub_menu' => [[
                'url' => '/laporankonsinyasiperhari',
                'id' => 'laporankonsinyasiperhari',
                'title' => 'Perhari'
            ], [
                'url' => '/laporankonsinyasibulanan',
                'id' => 'laporankonsinyasibulanan',
                'title' => 'Perbulan'
            ]]
        ], [
            'title' => 'Penerimaan',
            'url' => 'javascript:;',
            'caret' => true,
            'id' => 'penerimaan',
            'sub_menu' => [[
                'url' => '/laporanpenerimaanperhari',
                'id' => 'laporanpenerimaanperhari',
                'title' => 'Perhari'
            ], [
                'url' => '/laporanpenerimaanbulanan',
                'id' => 'laporanpenerimaanbulanan',
                'title' => 'Perbulan'
            ]]
        ], [
            'title' => 'Penerimaan Dokter',
            'url' => 'javascript:;',
            'caret' => true,
            'id' => 'penerimaandokter',
            'sub_menu' => [[
                'url' => '/laporanpenerimaandokterperhari',
                'id' => 'laporanpenerimaandokterperhari',
                'title' => 'Perhari'
            ], [
                'url' => '/laporanpenerimaandokterbulanan',
                'id' => 'laporanpenerimaandokterbulanan',
                'title' => 'Perbulan'
            ]]
        ], [
            'url' => '/laporanstokbarang',
            'id' => 'laporanstokbarang',
            'title' => 'Stok Barang'
        ]]
    ], [
        'icon' => 'fa fa-calculator',
        'title' => 'Penjualan',
        'url' => 'javascript:;',
        'caret' => true,
        'id' => 'penjualan',
        'sub_menu' => [[
            'url' => '/penjualanbebas',
            'id' => 'penjualanbebas',
            'title' => 'Bebas'
        ], [
            'url' => '/penjualanresep',
            'id' => 'penjualanresep',
            'title' => 'Resep'
        ]]
    ], [
        'icon' => 'fa fa-gavel',
        'title' => 'Posting Stok Akhir',
        'url' => '/postingstok',
        'id' => 'postingstok'
    ], [
        'icon' => 'fa fa-cog',
        'title' => 'Setup',
        'url' => 'javascript:;',
        'caret' => true,
        'id' => 'setup',
        'sub_menu' => [[
            'url' => '/biaya',
            'id' => 'biaya',
            'title' => 'Biaya'
        ], [
            'url' => '/pengguna',
            'id' => 'pengguna',
            'title' => 'Pengguna'
        ]]
    ]]
];
