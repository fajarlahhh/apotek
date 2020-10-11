@extends('pages.datamaster.main')

@section('title', ' | Tambah Barang Masuk')

@push('css')
	<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
	<link href="/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
	<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item">Barang Masuk</li>
	<li class="breadcrumb-item active">Tambah Data</li>
@endsection

@section('header')
    <h1 class="page-header">Barang Masuk<small>Tambah Data</small></h1>
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
    @livewire('barang-masuk')

</div>
@include('includes.component.error')
@endsection

@push('scripts')
	<script src="/assets/plugins/parsleyjs/dist/parsley.js"></script>
    <script src="/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
    <script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script>
		$('#barang_masuk_tanggal').datepicker({
			todayHighlight: true,
			format: 'dd MM yyyy',
			orientation: "bottom",
			autoclose: true
        });

		$('#barang_masuk_jatuh_tempo').datepicker({
			todayHighlight: true,
			format: 'dd MM yyyy',
			orientation: "bottom",
			autoclose: true
		});
    </script>
@endpush
