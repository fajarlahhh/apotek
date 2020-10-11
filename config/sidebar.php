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
	],[
		'icon' => 'fa fa-gavel',
		'title' => 'Administrator',
		'url' => 'javascript:;',
		'caret' => true,
		'id' => 'administrator',
		'sub_menu' => [[
			'url' => '/postingsstok',
			'id' => 'postingsstok',
			'title' => 'Posting Stok'
		]]
	],[
		'icon' => 'fa fa-inbox',
		'title' => 'Barang Masuk',
		'url' => '/barangmasuk',
		'id' => 'barangmasuk'
	],[
		'icon' => 'fa fa-file',
		'title' => 'Cetak',
		'url' => 'javascript:;',
		'caret' => true,
		'id' => 'cetak',
		'sub_menu' => [[
			'url' => '/laporanbarangmasuk',
			'id' => 'laporanbarangmasuk',
			'title' => 'Laporan Barang Masuk'
        ],[
            'title' => 'Penjualan',
            'url' => 'javascript:;',
            'caret' => true,
            'id' => 'laporanpenjualan',
            'sub_menu' => [[
                'url' => '/laporanpenjualanbebas',
                'id' => 'laporanpenjualanbebas',
                'title' => 'Laporan Penjualan Bebas'
            ],[
                'url' => '/laporanpenjualanresep',
                'id' => 'laporanpenjualanresep',
                'title' => 'Laporan Penjualan Resep'
            ]]
        ],[
			'url' => '/laporanstokbarang',
			'id' => 'laporanstokbarang',
			'title' => 'Laporan Stok Barang'
        ]]
	],[
		'icon' => 'fa fa-database',
		'title' => 'Data Master',
		'url' => 'javascript:;',
		'caret' => true,
		'id' => 'datamaster',
		'sub_menu' => [[
			'url' => '/barang',
			'id' => 'barang',
			'title' => 'Barang'
        ],[
			'url' => '/dokter',
			'id' => 'dokter',
			'title' => 'Dokter'
        ],[
			'url' => '/jenisbarang',
			'id' => 'jenisbarang',
			'title' => 'Jenis Barang'
        ],[
            'url' => '/pbf',
            'id' => 'pbf',
            'title' => 'PBF'
        ],]
	],[
		'icon' => 'fa fa-calculator',
		'title' => 'Penjualan',
		'url' => 'javascript:;',
		'caret' => true,
		'id' => 'penjualan',
		'sub_menu' => [[
			'url' => '/bebas',
			'id' => 'bebas',
			'title' => 'Bebas'
        ],[
			'url' => '/resep',
			'id' => 'resep',
			'title' => 'Resep'
        ]]
	],[
		'icon' => 'fa fa-cog',
		'title' => 'Setup',
		'url' => 'javascript:;',
		'caret' => true,
		'id' => 'setup',
		'sub_menu' => [[
			'url' => '/biaya',
			'id' => 'biaya',
			'title' => 'Biaya'
        ],[
			'url' => '/pengguna',
			'id' => 'pengguna',
			'title' => 'Pengguna'
        ]]
	]]
];
