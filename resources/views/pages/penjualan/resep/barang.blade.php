<tr id="baris-{{ $resepid }}">
    <td></td>
    <td class="with-btn">
        <select class="form-control selectpicker barang_id" title="Nama Barang" id="barang-{{ $resepid }}"
            onchange="satuan('-{{ $resepid }}')" name="barang[{{ $resep }}][{{ $id }}][barang_id]"
            data-live-search="true" data-style="btn-aqua" data-size="3" data-width="100%">
            @foreach ($barang as $row)
                <option value="{{ $row->barang_id . ';' . $row->pbf_id }}" data-satuan="{{ $row->satuan_semua }}"
                    {{ $data && $data['barang_id'] == $row->barang_id ? 'selected' : '' }}>
                    {{ $row->barang_nama }}{{ $row->jenis_barang ? ' - ' . $row->jenis_barang->jenis_barang_uraian : '' }}
                </option>
            @endforeach
        </select>
    </td>
    <td class="with-btn width-20">
        <select class="form-control selectpicker satuan"
            name="barang[{{ $resep }}][{{ $id }}][satuan_nama]"
            onchange="harga('-{{ $resepid }}')" id="satuan-{{ $resepid }}" data-live-search="true"
            data-style="btn-aqua" data-size="3" data-width="100%">
        </select>
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control text-right" onchange="total_harga_barang('-{{ $resepid }}')"
            onkeyup="total_harga_barang('-{{ $resepid }}')" id="harga-{{ $resepid }}"
            name="barang[{{ $resep }}][{{ $id }}][satuan_harga]"
            value="{{ $data ? $data['satuan_harga'] : 0 }}" autocomplete="off" required readonly />
    </td>
    <td class="with-btn width-100">
        <input class="form-control qty" onchange="total_harga_barang('-{{ $resepid }}')"
            onkeyup="total_harga_barang('-{{ $resepid }}')" type="number" id="qty-{{ $resepid }}"
            name="barang[{{ $resep }}][{{ $id }}][penjualan_detail_qty]"
            value="{{ $data ? $data['penjualan_detail_qty'] : 1 }}" autocomplete="off" min="1" required />
    </td>
    <td class="with-btn width-100">
        <input class="form-control" onchange="total_harga_barang('-{{ $resepid }}')"
            onkeyup="total_harga_barang('-{{ $resepid }}')" type="number" id="diskon-{{ $resepid }}"
            name="barang[{{ $resep }}][{{ $id }}][penjualan_detail_diskon]" max="100"
            value="{{ $data ? $data['penjualan_detail_diskon'] : 0 }}" autocomplete="off" min="0"
            @role('guest|user')
                readonly
                @endrole />
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control text-right total-harga-barang"
            name="barang[{{ $resep }}][{{ $id }}][penjualan_detail_total]"
            id="total-{{ $resepid }}"
            value="{{ $data ? str_replace(',', '', $data['penjualan_detail_total']) : 0 }}" readonly />
    </td>
    <td class="with-btn align-middle">
        <a href="#" class="btn btn-xs btn-red "
            onclick="event.preventDefault(); hapus_barang('-{{ $resepid }}')"><i
                class="fa fa-times fa-xs"></i></a>
    </td>
</tr>
