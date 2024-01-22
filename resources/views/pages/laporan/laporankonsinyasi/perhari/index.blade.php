
@extends($cetak != 'cetak'? 'pages.laporan.main': 'pages.laporan.cetak')

@section('title', ' | Konsinyasi Per Hari')

@push('css')
<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
<li class="breadcrumb-item">Konsinyasi</li>
<li class="breadcrumb-item active">Per Hari</li>
@endsection

@section('header')
    <h1 class="page-header">Konsinyasi Per Hari</h1>
@endsection

@section('subcontent')
@if ($cetak != 'cetak')
<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
    <!-- begin panel-heading -->
    <div class="panel-heading">
        <div class="row width-full">
            <div class="col-xl-3 col-sm-3">
                <div class="form-inline">
                    <a href="/laporankonsinyasiperhari/cetak?tanggal={{ $tanggal }}" target="_blank" class="btn btn-warning"> Cetak</a>
                </div>
            </div>
            <div class="col-xl-9 col-sm-9">
                <form id="frm-cari" action="/laporankonsinyasiperhari" method="GET">
                    <div class="form-inline pull-right">
                        <div class="form-group">
                            <select class="form-control selectpicker cari" name="dokter" data-live-search="true" data-style="btn-success" data-width="100%">
                                <option value="semua">Semua Dokter</option>
                                @foreach($konsi as $row)
                                <option value="{{ $row->dokter_id }}" {{ $dokter == $row->dokter_id? 'selected': '' }}>{{ $row->dokter_nama }}</option>
                                @endforeach
                            </select>
                        </div>&nbsp;
                        <div class="form-group">
                            <input type="text" readonly class="form-control date cari" id="tanggal" name="tanggal" value="{{ date('d M Y', strtotime(old('tanggal', $tanggal))) }}" required/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="panel-body table-responsive">
@else
    <div class="text-center">
        <h3>APOTEK SEJAHTERA <br>
        <small>LAPORAN KONSINYASI TANGGAL {{ strtoupper(date('d M Y', strtotime($tanggal))) }}</small></h3>
    </div>
    <br>
@endif
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th class="width-70">No.</th>
                    <th class="text-nowrap">Tanggal</th>
                    <th class="text-nowrap">Konsinyasi</th>
                    <th class="text-nowrap">Nama Barang</th>
                    <th class="text-nowrap">Harga</th>
                    <th class="text-nowrap">Qty</th>
                    <th class="text-nowrap">Total</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data as $i => $row)
                <tr>
                    <td>{{ ++$i }}</td>
                    <td class="text-nowrap">{{ $row->penjualan->penjualan_tanggal }}</td>
                    <td class="text-nowrap">{{ $row->pbf->pbf_nama }}</td>
                    <td class="text-nowrap">{{ $row->barang->barang_nama }}</td>
                    <td class="text-nowrap text-right">{{ number_format($row->harga, 2) }}</td>
                    <td class="text-nowrap text-right">{{ number_format($row->qty) }}</td>
                    <td class="text-nowrap text-right">{{ number_format($row->total, 2) }}</td>
                </tr>
                @endforeach
                <tr>
                    <th colspan="6" class="text-nowrap text-center">TOTAL</th>
                    <th class="text-nowrap text-right">{{ number_format($data->sum('total'), 2) }}</th>
                </tr>
            </tbody>
        </table>
@if ($cetak != 'cetak')
    </div>
</div>
@endif
@endsection

@push('scripts')
@if ($cetak == 'cetak')
    <script>

        window.print();
    </script>
@else
<script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script>
    $(".cari").change(function() {
         $("#frm-cari").submit();
    });

    $('.date').datepicker({
        todayHighlight: true,
        format: 'dd M yyyy',
        autoclose: true
    });
</script>
@endif
@endpush
