<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PenjualanDetail extends Model
{
    use HasFactory;
    protected $table = 'penjualan_detail';
    protected $primaryKey = null;
    public $incrementing = false;
    public $timestamps = false;

    public function barang()
    {
        return $this->belongsTo('App\Models\Barang', 'barang_id', 'barang_id')->withTrashed();
    }

    public function pbf()
    {
        return $this->belongsTo('App\Models\Pbf', 'pbf_id', 'pbf_id')->withTrashed();
    }

    public function penjualan()
    {
        return $this->belongsTo('App\Models\Penjualan', 'penjualan_id', 'penjualan_id');
    }
}
