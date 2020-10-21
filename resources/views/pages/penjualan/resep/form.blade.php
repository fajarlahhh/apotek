@extends('pages.penjualan.main')

@section('title', ' | Tambah Penjualan Resep')

@push('css')
<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item">Penjualan Resep</li>
	<li class="breadcrumb-item active">Tambah Data</li>
@endsection

@section('header')
    <h1 class="page-header">Penjualan Resep<small>Tambah Data</small></h1>
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
    <form action="{{ route('penjualanresep.simpan') }}" method="post" data-parsley-validate="true">
        @csrf
        <div class="panel-body">
            <div class="form-group">
                <label class="control-label">Keterangan</label>
                <textarea class="form-control" rows="3" name="penjualan_keterangan">{{ old('penjualan_keterangan') }}</textarea>
            </div>
            <div class="form-group">
                <label class="control-label">Dokter</label>
                <select class="form-control selectpicker" name="dokter_id" id="dokter_id" data-live-search="true" data-style="btn-warning" data-width="100%" >
                    @foreach($dokter as $row)
                    @php
                        $selected = '';
                        if($aksi == 'Edit'){
                            if ($data->dokter_id == $row->dokter_id) {
                                $selected =  'selected';
                            }
                        }else{
                            if(old('dokter_id') == $row->dokter_id){
                                $selected =  'selected';
                            }
                        }
                    @endphp
                    <option value="{{ $row->dokter_id }}" {{ $selected }}>{{ $row->dokter_nama }} - {{ $row->dokter_bidang }}</option>
                    @endforeach
                </select>
            </div>
            <div id="resep">
            </div>
            <div class="text-center">
                <a class="btn btn-grey btn-sm" onclick="tambah_resep()">Tambah Resep</a>
                <a class="btn btn-red btn-sm" onclick="hapus_resep()">Hapus Resep</a>
            </div>
            @if (Session::has('stok_kurang'))
            <br>
            <div class="alert alert-danger">
                @foreach (Session::get('stok_kurang') as $item)
                {!! $item !!}
                @endforeach
            </div>
            @endif
            <hr>
            <div class="row width-full">
                <div class="col-md-6">
                    <div class="note bg-primary-transparent-5">
                        <div class="note-content table-responsive">
                            <table class="table">
                                <tr>
                                    <td>Sub Total Harga Barang</td>
                                    <td class="with-btn">
                                        <input type="text" class="form-control text-right currency" id="sub-total" name="penjualan_tagihan" value="0" autocomplete="off" readonly/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Biaya Racikan</td>
                                    <td class="with-btn">
                                        <input class="form-control text-right currency" type="text" id="racikan" name="racikan" value="{{ old('racikan', 0) }}" autocomplete="off" required readonly/>
                                        <input type="hidden" id="dokter" name="dokter" value="{{ old('dokter', $persen) }}" autocomplete="off" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Biaya Admin</td>
                                    <td class="with-btn">
                                        <input class="form-control text-right currency" type="text" id="admin" name="admin" value="{{ old('admin', $admin) }}" autocomplete="off" required readonly/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Biaya Dokter</td>
                                    <td>
                                        <input class="form-control text-right currency" type="text" id="penjualan_biaya_dokter" name="penjualan_biaya_dokter" value="{{ old('penjualan_biaya_dokter', 0) }}" autocomplete="off" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>Total Tagihan</th>
                                    <td>
                                        <input class="form-control text-right currency" type="text" id="tagihan" name="tagihan" value="{{ old('tagihan', 2000) }}" autocomplete="off" required readonly/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="control-label">Bayar</label>
                        <input class="form-control text-right currency" type="text" id="bayar" name="penjualan_bayar" value="{{ old('penjualan_bayar') }}" autocomplete="off" required/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Sisa</label>
                        <input class="form-control text-right currency bg-danger text-white" type="text" id="sisa" name="penjualan_sisa" value="{{ old('penjualan_sisa', 0) }}" autocomplete="off" required readonly/>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel-footer">
            @role('user|super-admin|supervisor')
            <input type="submit" value="Simpan" class="btn btn-sm btn-success m-r-3"  />
            @endrole
            <a href="/penjualanresep/data" class="btn btn-sm btn-primary">Data Penjualan</a>
            <div class="pull-right">
                This page took {{ (microtime(true) - LARAVEL_START) }} seconds to render {{ Session::get('kwitansi') }}
            </div>
        </div>
    </form>
</div>
@include('includes.component.error')
@endsection

@push('scripts')
<script src="/assets/plugins/autonumeric/autoNumeric.js"></script>
<script src="/assets/plugins/parsleyjs/dist/parsley.js"></script>
<script src="/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
@if (Session::has('kwitansi'))
<script>
    window.open("{{ Session::get('kwitansi') }}", '_blank');
</script>
@endif
<script>
    var r = 0;

    AutoNumeric.multiple('.currency', {
                    modifyValueOnWheel : false,
                    minimumValue: "0"
                });

    var resep = @php
            echo json_encode(old('resep')? array_values(old('resep')): [], JSON_NUMERIC_CHECK)
            @endphp;

    var barang = @php
            echo json_encode(old('barang')? array_values(old('barang')): [], JSON_NUMERIC_CHECK)
            @endphp;

    resep.forEach(rsp => {
        tambah_resep(barang[rsp]);
    });

    $("#bayar").on('keyup change', function () {
        bayar();
    });

    function bayar() {
        var bayar = parseFloat($("#bayar").val().split(',').join('') || 0);
        var tagihan = parseFloat($("#tagihan").val().split(',').join('') || 0);
        AutoNumeric.getAutoNumericElement('#sisa').set(bayar - tagihan > 0 ? bayar - tagihan: 0);
    };

    $("#penjualan_biaya_dokter").on("keyup change", function($q){
        sub_total();
    });

    function sub_total(){
        var sub_total = 0;
        var racikan = 0;
        var jml_barang = 0;
        $('.total-harga-barang').each(function(i, obj) {
            if(this.value){
                var total_barang = parseFloat(this.value.split(',').join('') || 0);
                sub_total += total_barang;
                if (jml_barang < 10 && total_barang > 0) {
                    racikan += parseFloat({{ $racikan }} || 0);
                }
                jml_barang++;
            }
        });
        AutoNumeric.getAutoNumericElement('#sub-total').set(sub_total);
        AutoNumeric.getAutoNumericElement('#racikan').set(racikan);


        var admin = parseFloat($("#admin").val().split(',').join('') || 0);
        var dokter = parseFloat($("#penjualan_biaya_dokter").val().split(',').join('') || 0);
        AutoNumeric.getAutoNumericElement('#tagihan').set(sub_total + racikan + admin + dokter);
        bayar();
    }

    function tambah_resep(barang = null){
        $.ajax({
            url : "/penjualanresep/tambahresep/" + r,
            type : "GET",
            async : false,
            data : { "barang" : barang },
            success: function(data){
                $("#resep").append(data);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                Swal.fire({
                    icon: 'error',
                    title: 'Tambah Barang',
                    text: xhr.responseJSON.message
                })
            }
        });
        sub_total();
        r++;
    }

    function hapus_resep(){
        $("#resep" + (r-1)).remove();
        r--;
        sub_total();
    }
</script>
@endpush
