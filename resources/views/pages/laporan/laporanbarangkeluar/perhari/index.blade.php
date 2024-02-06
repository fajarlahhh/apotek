@extends($cetak != 'cetak' ? 'pages.laporan.main' : 'pages.laporan.cetak')

@section('title', ' | Barang Keluar Per Hari')

@push('css')
    <link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
    <link href="/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item">Barang Keluar</li>
    <li class="breadcrumb-item active">Per Hari</li>
@endsection

@section('header')
    <h1 class="page-header">Barang Keluar Per Hari</h1>
@endsection

@section('subcontent')
    @if ($cetak != 'cetak')
        <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="row width-full">
                    <div class="col-xl-3 col-sm-3">
                        <div class="form-inline">
                            <a href="/laporanbarangkeluarperhari/cetak?tanggal={{ $tanggal }}" target="_blank"
                                class="btn btn-warning"> Cetak</a>
                        </div>
                    </div>
                    <div class="col-xl-9 col-sm-9">
                        <form id="frm-cari" action="/laporanbarangkeluarperhari" method="GET">
                            <div class="form-inline pull-right">
                                <div class="form-group">
                                    <input type="text" readonly class="form-control date cari" id="tanggal"
                                        name="tanggal" value="{{ date('d M Y', strtotime(old('tanggal', $tanggal))) }}"
                                        required />
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
                        <small>LAPORAN Barang Keluar TANGGAL {{ strtoupper(date('d M Y', strtotime($tanggal))) }}</small>
                    </h3>
                </div>
                <br>
    @endif
    <table class="table table-bordered">
        <thead>
            <tr>
                <th class="width-70">No.</th>
                <th>Nama Barang</th>
                <th>Satuan</th>
                <th>Harga Satuan</th>
                <th>Qty</th>
                <th>Jumlah</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data as $index => $row)
                <tr>
                    <td>{{ ++$index }}</td>
                    <td class="text-nowrap">{{ $row->barang_nama }}</td>
                    <td class="text-nowrap">{{ $row->satuan_nama }}</td>
                    <td class="text-nowrap text-right">
                        {{ number_format($row->harga, 2) }}</td>
                    <td class="text-nowrap text-right">{{ $row->qty }}</td>
                    <td class="text-nowrap text-right">{{ number_format($row->jumlah_harga, 2) }}</td>
                </tr>
            @endforeach
            <tr>
                <td colspan="4">TOTAL</td>
                <td class="text-nowrap text-right">{{ number_format($data->sum('qty'), 2) }}</td>
                <td class="text-nowrap text-right">{{ number_format($data->sum('jumlah_harga'), 2) }}</td>
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
