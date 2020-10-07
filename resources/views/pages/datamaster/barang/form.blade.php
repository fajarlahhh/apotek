@extends('pages.datamaster.main')

@section('title', ' | '.$aksi.' Barang')

@push('css')
	<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item">Barang</li>
	<li class="breadcrumb-item active">{{ $aksi }} Data</li>
@endsection

@section('header')
    <h1 class="page-header">Barang <small>{{ $aksi }} Data</small></h1>
@endsection

@section('subcontent')
<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
    <!-- begin panel-heading -->
    <div class="panel-heading ui-sortable-handle">
        <h4 class="panel-title">Form</h4>
        <div class="panel-heading-btn">
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
        </div>
    </div>
    <form action="{{ route('barang.'.strtolower($aksi)) }}" method="post" data-parsley-validate="true" data-parsley-errors-messages-disabled="">
        @if ($aksi == 'Edit')
        <input type="hidden" name="id" value="{{ $data->barang_id }}">
        @method('PUT')
        @endif
        @csrf
        <div class="panel-body">
            <div class="form-group">
                <label class="control-label">Nama</label>
                <input class="form-control" type="text" name="barang_nama" value="{{ old('barang_nama')? old('barang_nama'): ($aksi == 'Edit'? $data->barang_nama: '') }}" autocomplete="off" required/>
            </div>
            <div class="form-group">
                <label class="control-label">Satuan</label>
                <input class="form-control" type="text" name="barang_satuan" value="{{ old('barang_satuan')? old('barang_satuan'): ($aksi == 'Edit'? $data->barang_satuan: '') }}" autocomplete="off" required/>
            </div>
            <div class="form-group">
                <label class="control-label">Stok Minimal</label>
                <input class="form-control" type="number" name="barang_stok_min" value="{{ old('barang_stok_min')? old('barang_stok_min'): ($aksi == 'Edit'? $data->barang_stok_min: '') }}" autocomplete="off" required/>
            </div>
            <div class="form-group">
                <label class="control-label">Harga Jual</label>
                <input class="form-control decimal text-right" type="text" name="barang_harga_jual" value="{{ old('barang_harga_jual')? old('barang_harga_jual'): ($aksi == 'Edit'? $data->barang_harga_jual: '') }}" required autocomplete="off"/>
            </div>
            <div class="form-group">
                <label class="control-label">Keterangan</label>
                <input class="form-control" type="text" name="barang_keterangan" value="{{ old('barang_keterangan')? old('barang_keterangan'): ($aksi == 'Edit'? $data->barang_keterangan: '') }}" autocomplete="off" required/>
            </div>
            <div class="form-group">
                <label class="control-label">Jenis Barang</label>
                <select class="form-control selectpicker" name="jenis_barang_id" id="jenis_barang_id" data-live-search="true" data-style="btn-primary" data-width="100%" >
                    @foreach($jenis_barang as $row)
                    @php
                        $selected = '';
                        if($aksi == 'Edit'){
                            if ($data->jenis_barang_id == $row->jenis_barang_id) {
                                $selected =  'selected';
                            }
                        }else{
                            if(old('jenis_barang_id') == $row->jenis_barang_id){
                                $selected =  'selected';
                            }
                        }
                    @endphp
                    <option value="{{ $row->jenis_barang_id }}" {{ $selected }}>{{ $row->jenis_barang_uraian }}</option>
                    @endforeach
                    {{-- @php
                        $selected = '';
                        if($aksi == 'Edit'){
                            if ($data->jenis_barang_id == '') {
                                $selected =  'selected';
                            }
                        }else{
                            if(old('jenis_barang_id') == ''){
                                $selected =  'selected';
                            }
                        }
                    @endphp
                    <option value="" {{ $selected }}></option> --}}
                </select>
            </div>
        </div>
        <div class="panel-footer">
            @role('user|super-admin|supervisor')
            <input type="submit" value="Simpan" class="btn btn-sm btn-success m-r-3"  />
            @endrole
            <a href="{{ $back }}" class="btn btn-sm btn-danger">Batal</a>
            <div class="pull-right">
                This page took {{ (microtime(true) - LARAVEL_START) }} seconds to render
            </div>
        </div>
    </form>
</div>
@include('includes.component.error')
@endsection

@push('scripts')
<script src="/assets/plugins/parsleyjs/dist/parsley.js"></script>
<script src="/assets/plugins/autonumeric/autoNumeric.js"></script>
<script>
    AutoNumeric.multiple('.decimal', {
        modifyValueOnWheel : false,
        minimumValue: "0"
    });
</script>
@endpush
