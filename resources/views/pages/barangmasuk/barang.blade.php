<tr>
    <td class="with-btn" >
        <select class="form-control selectpicker  barang" name="barang_masuk[{{ $id }}][barang_id]" onchange="satuan({{ $id }})" id="barang{{ $id }}" title="Nama Barang" data-live-search="true" data-style="btn-aqua" data-size="3" data-width="100%">
            @foreach($barang as $row)
            <option value="{{ $row->barang_id }}" data-satuan="{{ $row->satuan_utama? $row->satuan_utama->satuan_nama: '' }}" {{ $data && $data['barang_id'] == $row->barang_id? 'selected': '' }}>{{ $row->barang_nama }}</option>
            @endforeach
        </select>
    </td>
    <td class="with-btn width-100">
        <input class="form-control satuan" type="text" name="barang_masuk[{{ $id }}][barang_masuk_satuan]" value="{{ $data? $data['barang_masuk_satuan']: '' }}" autocomplete="off" required readonly/>
    </td>
    <td class="with-btn width-150">
        <input class="form-control" type="text" name="barang_masuk[{{ $id }}][barang_masuk_nomor_batch]" value="{{ $data? $data['barang_masuk_nomor_batch']: '' }}" autocomplete="off" />
    </td>
    <td class="with-btn width-150">
        <input class="form-control text-right currency{{ $id }} harga hitungan" id="{{ $id }}" type="text" name="barang_masuk[{{ $id }}][barang_masuk_harga_barang]" value="{{ $data? $data['barang_masuk_harga_barang']: 0 }}" autocomplete="off" required/>
    </td>
    <td class="with-btn width-100">
        <input class="form-control diskon hitungan" type="number" step="any" name="barang_masuk[{{ $id }}][barang_masuk_diskon]" value="{{ $data? $data['barang_masuk_diskon']: 0 }}" autocomplete="off" min="0" required/>
    </td>
    <td class="with-btn width-100">
        <input class="form-control ppn hitungan" type="number" name="barang_masuk[{{ $id }}][barang_masuk_harga_ppn]" value="{{ $data? $data['barang_masuk_harga_ppn']: 10 }}" autocomplete="off" required/>
    </td>
    <td class="with-btn width-100">
        <input class="form-control qty hitungan" type="number" step="any" name="barang_masuk[{{ $id }}][barang_masuk_qty]" value="{{ $data? $data['barang_masuk_qty']: 0 }}" autocomplete="off" min="1" required/>
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control text-right total-harga" name="barang_masuk[{{ $id }}][barang_masuk_harga_total]" value="{{ $data? str_replace(',', '', $data['barang_masuk_harga_total']): '0.00' }}" readonly/>
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control date" name="barang_masuk[{{ $id }}][barang_masuk_kadaluarsa]" value="{{ date("d M Y", strtotime($data? $data['barang_masuk_kadaluarsa']: now())) }}" readonly/>
    </td>
    <td class="with-btn align-middle">
        <a href="javascript:;" class="btn btn-xs btn-red hapus-barang"><i class="fa fa-times fa-xs"></i></a>
    </td>
</tr>
