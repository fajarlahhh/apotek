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
		'icon' => 'fa fa-file',
		'title' => 'Cetak',
		'url' => 'javascript:;',
		'caret' => true,
		'id' => 'cetak',
		'sub_menu' => [
        ]
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
			'url' => '/jenisbarang',
			'id' => 'jenisbarang',
			'title' => 'Jenis Barang'
        ],[
            'url' => '/pbf',
            'id' => 'pbf',
            'title' => 'PBF'
        ],]
	],[
		'icon' => 'fa fa-chart-line',
		'title' => 'Investasi',
		'url' => '/investasi',
		'id' => 'investasi'
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
