<?php

namespace App\Models;

use Carbon\Carbon;
use App\Traits\Pengguna;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Penjualan extends Model
{
    use HasFactory;
    use SoftDeletes;
    use Pengguna;
    //
    protected $table = 'penjualan';
    protected $primaryKey = 'penjualan_id';
    public $incrementing = false;
    protected $keyType = 'string';

    public function dokter()
    {
        return $this->belongsTo('App\Models\Dokter', 'dokter_id', 'dokter_id');
    }

    public function detail()
    {
        return $this->hasMany('App\Models\PenjualanDetail', 'penjualan_id', 'penjualan_id');
    }

    public function pengguna()
    {
        return $this->belongsTo('App\Models\Pengguna', 'pengguna_id', 'pengguna_id');
    }

    public function getPenjualanTanggalAttribute($value)
    {
         return Carbon::parse($value)->isoFormat('LL');
    }

    public function getCreatedAtAttribute($value)
    {
         return Carbon::parse($value)->isoFormat('LLLL');
    }

    public function getUpdatedAtAttribute($value)
    {
         return Carbon::parse($value)->isoFormat('LLLL');
    }
}
