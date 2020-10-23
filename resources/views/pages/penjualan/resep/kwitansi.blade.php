@if ($cetak == 1)
<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
	@include('includes.head')
</head>
@php
	$bodyClass = (!empty($boxedLayout)) ? 'boxed-layout ' : '';
	$bodyClass .= (!empty($bodyExtraClass)) ? $bodyExtraClass . ' ' : '';
@endphp
<body>
@endif
<div class="modal-body">
    <div class="table-responsive">
        <table class="table">
            <tr>
                <th>No.</th>
                <th>Barang</th>
                <th>Qty</th>
                <th>Harga</th>
            </tr>
            @foreach ($data->detail as $index => $row)
            <tr>
                <td>
                    {{ ++$index }}
                </td>
                <td>
                    {{ $row->barang->barang_nama }}
                </td>
                <td>
                    {{ number_format($row->penjualan_detail_qty) }}
                </td>
                <td class="text-right">
                    {{ number_format($row->penjualan_detail_total, 2) }}
                </td>
            </tr>
            @endforeach
            <tr>
                <th colspan="3" class="text-right">Biaya Admin :</th>
                <td class="text-right">
                    {{ number_format($data->penjualan_admin, 2) }}
                </td>
            </tr>
            <tr>
                <th colspan="3" class="text-right">Biaya Servis :</th>
                <td class="text-right">
                    {{ number_format($data->penjualan_racikan, 2) }}
                </td>
            </tr>
            <tr>
                <th colspan="3" class="text-right">Biaya Dokter :</th>
                <td class="text-right">
                    {{ number_format($data->penjualan_biaya_dokter, 2) }}
                </td>
            </tr>
            <tr>
                <th colspan="3" class="text-right">Total :</th>
                <td class="text-right">
                    {{ number_format($data->penjualan_admin + $data->penjualan_racikan + $data->detail->sum('penjualan_detail_total'), 2) }}
                </th>
            </tr>
        </table>
    </div>
</div>
@if ($cetak == 1)
        <script>
            window.print();
        </script>
    </body>
</html>
@endif
@if ($cetak == 0)
<div class="modal-footer">
    <a href="javascript:;" class="btn btn-white" data-dismiss="modal">Tutup</a>
    <a href="/penjualanresep/kwitansi/1/{{ $data->penjualan_id }}" class="btn btn-success" target="_blank"><i class="fas fa-print"></i> Cetak</a>
</div>
@endif
