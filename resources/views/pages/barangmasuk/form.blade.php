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
    <form action="{{ route('barangmasuk.simpan') }}" method="post" data-parsley-validate="true" >
        @csrf
        <div class="panel-body">
            <div class="form-group">
                <label class="control-label">Tanggal Masuk</label>
                <input type="text" readonly class="form-control date" id="barang_masuk_tanggal" name="barang_masuk_tanggal" value="{{ date('d F Y', strtotime(old('barang_masuk_tanggal', now()))) }}" required/>
            </div>
            <div class="form-group">
                <label class="control-label">No. Faktur</label>
                <input class="form-control" type="text" name="barang_masuk_faktur" value="{{ old('barang_masuk_faktur') }}" autocomplete="off" required/>
            </div>
            <div class="form-group">
                <label class="control-label">PBF</label>
                <select class="form-control selectpicker" name="pbf_id" id="pbf_id" data-live-search="true" data-style="btn-warning" data-width="100%" >
                    <option value="" {{ old('pbf_id') == ''? 'selected': '' }}>-- Pilih PBF --</option>
                    @foreach($pbf as $row)
                    <option value="{{ $row->pbf_id }}" {{ old('pbf_id') == $row->pbf_id? 'selected': '' }}>{{ $row->pbf_nama }} - {{ $row->pbf_alamat }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label class="control-label">Tanggal Jatuh Tempo</label>
                <input type="text" readonly class="form-control date" id="barang_masuk_jatuh_tempo" name="barang_masuk_jatuh_tempo" value="{{ date('d F Y', strtotime(old('barang_masuk_jatuh_tempo', now()))) }}" required/>
            </div>
            <div class="form-group">
                <label class="control-label">Nama Sales</label>
                <input class="form-control" type="text" name="barang_masuk_sales" value="{{ old('barang_masuk_sales') }}" autocomplete="off"/>
            </div>
            <div class="form-group">
                <label class="control-label">Keterangan</label>
                <textarea class="form-control" rows="3" name="barang_masuk_keterangan">{{ old('barang_masuk_keterangan') }}</textarea>
            </div>
            <div class="note bg-grey-transparent-5">
                <div class="note-content table-responsive p-l-5 p-r-5">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nama Barang</th>
                                <th>Qty</th>
                                <th>Harga</th>
                                <th>No. Batch</th>
                                <th>Tanggal Kadaluarsa</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody  id="barang">
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="6" class="text-center">
                                    <button class="btn btn-sm btn-primary" onclick="event.preventDefault(); tambah_barang()" id="tambah-barang">Tambah Barang</button>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="form-inline">
                <div class="switcher form-group">
                    <input type="checkbox" id="switcher_checkbox_1" {{ $banyak == 'banyak' || old('banyak') == 1? 'checked': '' }} value="1" name="banyak">
                    <label for="switcher_checkbox_1" class="control-label"></label>
                    &nbsp; &nbsp;Input Banyak
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
@foreach (old('barang_masuk', $barang_masuk) as $index => $item)
    <div class="barang" data-barang="{{ $item['barang_id'] }}" data-qty="{{ $item['barang_masuk_qty'] }}" data-harga="{{ $item['barang_masuk_harga_barang'] }}" data-batch="{{ $item['barang_masuk_nomor_batch'] }}" data-kadaluarsa="{{ $item['barang_masuk_kadaluarsa'] }}"></div>
@endforeach
@include('includes.component.error')
@endsection

@push('scripts')
<script src="/assets/plugins/autonumeric/autoNumeric.js"></script>
<script src="/assets/plugins/parsleyjs/dist/parsley.js"></script>
<script src="/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script>
    var i = 0;

    $('.date').datepicker({
        todayHighlight: true,
        format: 'dd MM yyyy',
        autoclose: true
    });

    $(".barang").each(function(button){
        tambah_barang($(this).data());
    });

    function tambah_barang(barang = null){
        $.ajax({
            url : "/barangmasuk/tambahbarang/" + i,
            type : "GET",
            data : { "barang" : barang },
            async : false,
            success: function(data){
                $("#barang").append(data);

                $('.selectpicker').selectpicker('refresh');

                new AutoNumeric('#harga' + i++, {
                    modifyValueOnWheel : false,
                    minimumValue: "0"
                });

                $('.date').datepicker({
                    todayHighlight: true,
                    format: 'dd MM yyyy',
                    autoclose: true
                });
            },
            error: function (xhr, ajaxOptions, thrownError) {
                Swal.fire({
                    icon: 'error',
                    title: 'Tambah Barang',
                    text: xhr.responseJSON.message
                })
            }
        });
    }

    function hapus_barang(id) {
        $("#" + id).remove();
    }
</script>
@endpush
