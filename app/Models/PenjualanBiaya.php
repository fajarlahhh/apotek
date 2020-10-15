<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PenjualanBiaya extends Model
{
    use HasFactory;
    //
    protected $table = 'penjualan_biaya';
    protected $primaryKey = null;
    public $incrementing = false;
    public $timestamps = false;
}
