
@extends($cetak != 'cetak'? 'pages.laporan.main': 'pages.laporan.cetak')

@section('title', ' | Penerimaan Dokter Per Hari')

@push('css')
<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
@endpush

@section('page')
<li class="breadcrumb-item">Penerimaan Dokter</li>
<li class="breadcrumb-item active">Per Hari</li>
@endsection

@section('header')
    <h1 class="page-header">Penerimaan Dokter Per Hari</h1>
@endsection

@section('subcontent')
@if ($cetak != 'cetak')
<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
    <!-- begin panel-heading -->
    <div class="panel-heading">
        <div class="row width-full">
            <div class="col-xl-3 col-sm-3">
                <div class="form-inline">
                    <a href="/laporanpenerimaandokterperhari/cetak?tanggal={{ $tanggal }}" target="_blank" class="btn btn-warning"> Cetak</a>
                </div>
            </div>
            <div class="col-xl-9 col-sm-9">
                <form id="frm-cari" action="/laporanpenerimaandokterperhari" method="GET">
                    <div class="form-inline pull-right">
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
    <small>LAPORAN PENERIMAAN DOKTER TANGGAL {{ strtoupper(date('d M Y', strtotime($tanggal))) }}</small></h3>
</div>
<br>
@endif
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th class="width-70">No.</th>
                    <th class="text-nowrap">Tanggal</th>
                    @foreach ($dokter as $row)
                    <th class="text-nowrap" @if ($row->biaya == 1)
                        colspan="2"
                    @else

                    @endif>{{ $row->dokter_nama }}</th>
                    @endforeach
                </tr>
            </thead>
            <tbody>
                @foreach ($data as $index => $row)
                @php
                    $harga_belum_ppn += $row['harga_belum_ppn'];
                    $servis += $row['servis']? $row['servis']: 0;
                    $listrik += $row['listrik']? $row['listrik']: 0;
                    $konsinyasi +=  $row['konsinyasi'];
                    foreach ($dokter as $dok) {
                        $persen[] = [
                            'dokter' => $dok->dokter_id,
                            'persen' => $row['dokter'] == $dok->dokter_id? ($row['persen']? $row['persen'] : 0): 0,
                            'biaya' => $row['dokter'] == $dok->dokter_id? ($row['persen']? $row['biaya_dokter']: 0): 0
                        ];
                    }
                @endphp
                @if ($row['biaya_dokter'] > 0)
                <tr>
                    <td class="text-nowrap">..{{ substr($row['id'], 8) }}</td>
                    <td class="text-nowrap">{{ $row['tanggal'] }}</td>
                    @foreach ($dokter as $dok)
                    <td class="text-nowrap text-right">{{ number_format($row['dokter'] == $dok->dokter_id? ($row['persen']? $row['biaya_dokter']: 0): 0, 2) }}</td>
                    @endforeach
                </tr>
                @endif
                @endforeach
                <tr>
                    <th class="text-right" colspan="2">TOTAL</th>
                    @foreach ($dokter as $dok)
                    <th class="text-nowrap text-right">{{ number_format(collect($persen)->where('dokter', $dok->dokter_id)->sum('biaya'), 2) }}</th>
                    @endforeach
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
