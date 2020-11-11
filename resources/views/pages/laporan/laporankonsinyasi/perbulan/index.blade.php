
@extends($cetak != 'cetak'? 'pages.laporan.main': 'pages.laporan.cetak')

@section('title', ' | Konsinyasi Per Bulan')

@push('css')
<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
	<li class="breadcrumb-item active">Per Bulan</li>
@endsection

@section('header')
    <h1 class="page-header">Penerimaan Per Bulan</h1>
@endsection

@section('subcontent')
@if ($cetak != 'cetak')
<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
    <!-- begin panel-heading -->
    <div class="panel-heading">
        <div class="row width-full">
            <div class="col-xl-3 col-sm-3">
                <div class="form-inline">
                    <a href="/laporankonsinyasibulanan/cetak?bulan={{ $bulan }}&tahun={{ $tahun }}" target="_blank" class="btn btn-warning"> Cetak</a>
                </div>
            </div>
            <div class="col-xl-9 col-sm-9">
                <form id="frm-cari" action="/laporankonsinyasibulanan" method="GET">
                    <div class="form-inline pull-right">
                        <div class="form-group">
                            <select class="form-control selectpicker cari" name="pbf" data-live-search="true" data-style="btn-success" data-width="100%">
                                <option value="semua">Semua Konsinyasi</option>
                                @foreach($konsi as $row)
                                <option value="{{ $row->pbf_id }}" {{ $pbf == $row->pbf_id? 'selected': '' }}>{{ $row->pbf_nama }}</option>
                                @endforeach
                            </select>
                        </div>&nbsp;
                        <div class="form-group">
                            <select class="form-control selectpicker cari" name="bulan" data-live-search="true" data-style="btn-info" data-width="100%">
                                @for($i=1; $i <= 12; $i++)
                                <option value="{{ $i }}" {{ $bulan == $i? 'selected': '' }}>{{ (DateTime::createFromFormat('!m', $i))->format('F') }}</option>
                                @endfor
                            </select>
                        </div>&nbsp;
                        <div class="form-group">
                            <select class="form-control selectpicker cari" name="tahun" data-live-search="true" data-style="btn-info" data-width="100%">
                                @for($i=2016; $i <= date('Y'); $i++)
                                <option value="{{ $i }}" {{ $tahun == $i? 'selected': ''}}>{{ $i }}</option>
                                @endfor
                            </select>
                        </div>&nbsp;
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="panel-body table-responsive">
@else
    <div class="text-center">
        <h3>APOTEK SEJAHTERA <br>
        <small>LAPORAN KONSINYASI BULAN {{ strtoupper(date('M Y', strtotime($tahun."-".$bulan))) }}</small></h3>
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
        @foreach ($data as $row)
        @foreach ($row['barang'] as $barang)
        <tr>
            <td>{{ ++$no }}</td>
            <td class="text-nowrap">{{ $row['tanggal'] }}</td>
            <td class="text-nowrap">{{ $barang['pbf'] }}</td>
            <td class="text-nowrap">{{ $barang['nama'] }}</td>
            <td class="text-nowrap text-right">{{ number_format($barang['harga'],2) }}</td>
            <td class="text-nowrap text-right">{{ number_format($barang['qty']) }}</td>
            <td class="text-nowrap text-right">{{ number_format($barang['total'],2) }}</td>
        </tr>
        @php
            $total += $barang['total'];
        @endphp
        @endforeach
        @endforeach
        <tr>
            <th colspan="6" class="text-nowrap text-center">TOTAL</th>
            <th class="text-nowrap text-right">{{ number_format($total, 2) }}</th>
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
