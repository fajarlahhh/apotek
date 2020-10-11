@extends('pages.datamaster.main')

@section('title', ' | '.$aksi.' Barang')

@push('css')
	<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
	<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
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
    <form action="{{ route('barang.simpan') }}" method="post" data-parsley-validate="true" data-parsley-errors-messages-disabled="">
        @if ($aksi == 'Edit')
        <input type="hidden" name="id" value="{{ $data->barang_id }}">
        @endif
        @csrf
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="control-label">Nama Barang</label>
                        <input class="form-control" type="text" name="barang_nama" value="{{ old('barang_nama')? old('barang_nama'): ($aksi == 'Edit'? $data->barang_nama: '') }}" autocomplete="off" required/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Stok Minimal</label>
                        <input class="form-control" type="number" name="barang_stok_min" value="{{ old('barang_stok_min')? old('barang_stok_min'): ($aksi == 'Edit'? $data->barang_stok_min: '') }}" autocomplete="off" required/>
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
                            @php
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
                            <option value="" {{ $selected }}>Tidak Ada</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Konsinyasi</label>
                        <select class="form-control selectpicker" name="pbf_id" id="pbf_id" data-live-search="true" data-style="btn-warning" data-width="100%" >
                            @foreach($pbf as $row)
                            @php
                                $selected = '';
                                if($aksi == 'Edit'){
                                    if ($data->pbf_id == $row->pbf_id) {
                                        $selected =  'selected';
                                    }
                                }else{
                                    if(old('pbf_id') == $row->pbf_id){
                                        $selected =  'selected';
                                    }
                                }
                            @endphp
                            <option value="{{ $row->pbf_id }}" {{ $selected }}>{{ $row->pbf_nama }} - {{ $row->pbf_alamat }}</option>
                            @endforeach
                            @php
                                $selected = '';
                                if($aksi == 'Edit'){
                                    if ($data->pbf_id == '') {
                                        $selected =  'selected';
                                    }
                                }else{
                                    if(old('pbf_id') == ''){
                                        $selected =  'selected';
                                    }
                                }
                            @endphp
                            <option value="" {{ $selected }}>Tidak Ada</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Keterangan</label>
                        <input class="form-control" type="text" name="barang_keterangan" value="{{ old('barang_keterangan')? old('barang_keterangan'): ($aksi == 'Edit'? $data->barang_keterangan: '') }}" autocomplete="off" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="alert alert-aqua">
                        <div class="form-group">
                            <label class="control-label">Satuan</label>
                            <input class="form-control" type="text" name="barang_satuan_1" id="barang_satuan_1" value="{{ old('barang_satuan_1')? old('barang_satuan_1'): ($aksi == 'Edit'? $data->barang_satuan_1: '') }}" autocomplete="off" required/>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Harga Jual</label>
                            <input class="form-control decimal text-right" type="text" name="barang_harga_jual_1" value="{{ old('barang_harga_jual_1')? old('barang_harga_jual_1'): ($aksi == 'Edit'? $data->barang_harga_jual_1: '') }}" required autocomplete="off"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label" id="isi">{{ $aksi == 'Edit'? "Isi Per ".$data->barang_satuan_1: "Isi" }}</label>
                            <input class="form-control" type="number" name="barang_isi_persatuan" value="{{ old('barang_isi_persatuan')? old('barang_isi_persatuan'): ($aksi == 'Edit'? $data->barang_isi_persatuan: '') }}" autocomplete="off" />
                        </div>
                    </div>
                    <div class="alert alert-indigo">
                        <div class="form-group">
                            <label class="control-label">Satuan Racikan</label>
                            <input class="form-control" type="text" name="barang_satuan_2" value="{{ old('barang_satuan_2')? old('barang_satuan_2'): ($aksi == 'Edit'? $data->barang_satuan_2: '') }}" autocomplete="off" />
                        </div>
                        <div class="form-group">
                            <label class="control-label">Harga Racikan</label>
                            <input class="form-control decimal text-right" type="text" name="barang_harga_jual_2" value="{{ old('barang_harga_jual_2')? old('barang_harga_jual_2'): ($aksi == 'Edit'? $data->barang_harga_jual_2: '') }}"  autocomplete="off"/>
                        </div>
                    </div>
                </div>
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
<script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="/assets/plugins/autonumeric/autoNumeric.js"></script>
<script>
    $('#barang_satuan_1').on('keyup change', function(){
        $('#isi').html("Isi Per " + $(this).val());
    });

    AutoNumeric.multiple('.decimal', {
        modifyValueOnWheel : false,
        minimumValue: "0"
    });
</script>
@endpush
