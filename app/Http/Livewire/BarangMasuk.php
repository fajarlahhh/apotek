<?php

namespace App\Http\Livewire;

use App\Models\Pbf;
use App\Models\Barang;
use Livewire\Component;
use Illuminate\Support\Str;

class BarangMasuk extends Component
{
    public $barang = [];
    public $pbf = [];
    public $back = '';
    public $barang_masuk = [];

    public function mount()
    {
        $this->barang = Barang::all();
        $this->pbf = Pbf::all();
        $this->back = Str::contains(url()->previous(), ['barangmasuk/tambah', 'barangmasuk/edit'])? '/barangmasuk': url()->previous();
        $this->barang_masuk = [
            []
        ];
    }

    public function render()
    {
        return view('livewire.barang-masuk');
    }
}
