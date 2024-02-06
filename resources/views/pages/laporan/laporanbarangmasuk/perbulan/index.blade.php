@extends($cetak != 'cetak' ? 'pages.laporan.main' : 'pages.laporan.cetak')

@section('title', ' | Barang Masuk Per Bulan')

@push('css')
    <link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
    <link href="/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item">Barang Masuk</li>
    <li class="breadcrumb-item active">Per Bulan</li>
@endsection

@section('header')
    <h1 class="page-header">Barang Masuk Per Bulan</h1>
@endsection

@section('subcontent')
    @if ($cetak != 'cetak')
        <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="row width-full">
                    <div class="col-xl-3 col-sm-3">
                        <div class="form-inline">
                            <a href="/laporanbarangmasukbulanan/cetak?bulan={{ $bulan }}&tahun={{ $tahun }}&cari={{ $cari }}"
                                target="_blank" class="btn btn-warning"> Cetak</a>
                        </div>
                    </div>
                    <div class="col-xl-9 col-sm-9">
                        <form id="frm-cari" action="/laporanbarangmasukbulanan" method="GET">
                            <div class="form-inline pull-right">
                                <div class="form-group">
                                    <select class="form-control selectpicker cari" name="bulan" data-live-search="true"
                                        data-style="btn-info" data-width="100%">
                                        @for ($i = 1; $i <= 12; $i++)
                                            <option value="{{ $i }}" {{ $bulan == $i ? 'selected' : '' }}>
                                                {{ DateTime::createFromFormat('!m', $i)->format('F') }}</option>
                                        @endfor
                                    </select>
                                </div>&nbsp;
                                <div class="form-group">
                                    <select class="form-control selectpicker cari" name="tahun" data-live-search="true"
                                        data-style="btn-info" data-width="100%">
                                        @for ($i = 2016; $i <= date('Y'); $i++)
                                            <option value="{{ $i }}" {{ $tahun == $i ? 'selected' : '' }}>
                                                {{ $i }}</option>
                                        @endfor
                                    </select>
                                </div>&nbsp;
                                <div class="input-group">
                                    <input type="text" class="form-control cari" name="cari" placeholder="Cari"
                                        aria-label="Sizing example input" autocomplete="off" aria-describedby="basic-addon2"
                                        value="{{ $cari }}">
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="basic-addon2"><i class="fa fa-search"></i></span>
                                    </div>
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
                        <small>LAPORAN STOK PER {{ strtoupper(date('d M Y h:m:s')) }}</small>
                    </h3>
                </div>
                <br>
    @endif
    <table class="table table-hover">
        <thead>
            <tr>
                <th class="width-70">No.</th>
                <th>Tanggal</th>
                <th>No. Faktur</th>
                <th>Nama Barang</th>
                <th>Satuan</th>
                <th>Harga Satuan</th>
                <th>Diskon</th>
                <th>PPN (%)</th>
                <th>Qty</th>
                <th>Jumlah</th>
            </tr>
        </thead>
        <tbody>
            @php
                $total = 0;
            @endphp
            @foreach ($data as $index => $row)
                <tr>
                    @php
                        $harga_diskon = ($row->harga * $row->barang_masuk_diskon) / 100;
                        $harga_ppn = (($row->harga - $harga_diskon) * $row->barang_masuk_harga_ppn) / 100;
                        $total += ($row->harga - $harga_diskon + $harga_ppn) * $row->qty;
                    @endphp
                    <td>{{ ++$index }}</td>
                    <td class="text-nowrap">{{ $row->barang_masuk_tanggal }}</td>
                    <td class="text-nowrap">{{ $row->barang_masuk_faktur }}</td>
                    <td class="text-nowrap">{{ $row->barang_nama }}</td>
                    <td class="text-nowrap">{{ $row->barang->satuan_utama->satuan_nama }}</td>
                    <td class="text-nowrap text-right">
                        {{ number_format($row->harga, 2) }}</td>
                    <td class="text-nowrap text-right">
                        {{ number_format($harga_diskon, 2) }}
                    </td>
                    <td class="text-nowrap text-right">
                        {{ number_format($harga_ppn, 2) }}
                    </td>
                    <td class="text-nowrap text-right">{{ $row->qty }}</td>
                    <td class="text-nowrap text-right">
                        {{ number_format(($row->harga - $harga_diskon + $harga_ppn) * $row->qty, 2) }}
                    </td>
                </tr>
            @endforeach
            <tr>
                <td colspan="8">TOTAL</td>
                <td class="text-nowrap text-right">{{ number_format($data->sum('qty')) }}</td>
                <td class="text-nowrap text-right">{{ number_format($total, 2) }}</td>
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
        </script>
    @endif
@endpush
