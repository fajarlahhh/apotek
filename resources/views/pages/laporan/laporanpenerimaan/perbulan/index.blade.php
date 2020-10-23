
@extends($cetak != 'cetak'? 'pages.laporan.main': 'pages.laporan.cetak')

@section('title', ' | Per Hari')

@push('css')
<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
	<li class="breadcrumb-item active">Per Hari</li>
@endsection

@section('header')
    <h1 class="page-header">Per Hari</h1>
@endsection

@section('subcontent')
@if ($cetak != 'cetak')
<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
    <!-- begin panel-heading -->
    <div class="panel-heading">
        <div class="row width-full">
            <div class="col-xl-3 col-sm-3">
                <div class="form-inline">
                    <a href="/laporanpenerimaanbulanan/cetak?bulan={{ $bulan }}&tahun={{ $tahun }}" target="_blank" class="btn btn-warning"> Cetak</a>
                </div>
            </div>
            <div class="col-xl-9 col-sm-9">
                <form id="frm-cari" action="/laporanpenerimaanbulanan" method="GET">
                    <div class="form-inline pull-right">
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
@endif
        <table class="table table-hover">
            <thead>
                <tr>
                    <th class="width-70">No.</th>
                    <th class="text-nowrap">Tanggal</th>
                    <th class="text-nowrap">Penj. Bebas</th>
                    <th class="text-nowrap">Harga Resep Sebelum 10%</th>
                    <th class="text-nowrap">Servis</th>
                    @foreach ($dokter as $row)
                    <th class="text-nowrap">{{ $row->dokter_nama }}</th>
                    @endforeach
                    <th>Listrik</th>
                    <th>Konsinyasi</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data as $index => $row)
                @php
                    $harga_belum_ppn += ($row['harga_belum_ppn']? $row['harga_belum_ppn']: 0) - ($row['konsinyasi']? $row['konsinyasi']: 0);
                    $servis += $row['servis']? $row['servis']: 0;
                    $listrik += $row['listrik']? $row['listrik']: 0;
                    $konsinyasi += $row['konsinyasi']? $row['konsinyasi']: 0;
                    // foreach ($dokter as $dok) {
                    //     $persen[] = [
                    //         'dokter' => $dok->dokter_id,
                    //         'persen' => $row['dokter'] == $dok->dokter_id? ($row['persen']? $row['persen']: 0): 0
                    //     ];
                    // }
                @endphp
                <tr>
                    <td>{{ ++$index }}</td>
                    <td class="text-nowrap">{{ $row['tanggal'] }}</td>
                    <td class="text-nowrap text-center">{{ $row['bebas'] }}</td>
                    <td class="text-nowrap text-right">{{ number_format(($row['harga_belum_ppn']? $row['harga_belum_ppn']: 0) - ($row['konsinyasi']? $row['konsinyasi']: 0), 2) }}</td>
                    <td class="text-nowrap text-right">{{ number_format($row['servis']? $row['servis']: 0, 2) }}</td>
                    @foreach ($dokter as $dok)
                    <td class="text-nowrap text-right">
                        {{-- {{ number_format($row['dokter'] == $dok->dokter_id? ($row['persen']? $row['persen']: 0): 0, 2) }} --}}
                    </td>
                    @endforeach
                    <td class="text-nowrap text-right">{{ number_format($row['listrik']? $row['listrik']: 0, 2)  }}</td>
                    <td class="text-nowrap text-right">{{ number_format($row['konsinyasi']? $row['konsinyasi']: 0, 2)  }}</td>
                    <td class="text-nowrap text-right">{{ number_format(
                        (($row['harga_belum_ppn']? $row['harga_belum_ppn']: 0) - ($row['konsinyasi']? $row['konsinyasi']: 0)) +
                        ($row['servis']? $row['servis']: 0) +
                        ($row['listrik']? $row['listrik']: 0) +
                        ($row['konsinyasi']? $row['konsinyasi']: 0), 2)
                        }}</td>
                </tr>
                @endforeach
                <tr>
                    <th class="text-right" colspan="3">TOTAL</th>
                    <th class="text-nowrap text-right">{{ number_format($harga_belum_ppn, 2) }}</th>
                    <th class="text-nowrap text-right">{{ number_format($servis, 2) }}</th>
                    @foreach ($dokter as $dok)
                    <th class="text-nowrap text-right">
                        {{-- {{ number_format(collect($persen)->where('dokter', $dok->dokter_id)->sum('persen'), 2) }} --}}
                    </th>
                    @endforeach
                    <th class="text-nowrap text-right">{{ number_format($listrik, 2) }}</th>
                    <th class="text-nowrap text-right">{{ number_format($konsinyasi, 2) }}</th>
                    <th class="text-nowrap text-right">{{ number_format($harga_belum_ppn + $servis + $listrik + $konsinyasi, 2) }}</th>
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
