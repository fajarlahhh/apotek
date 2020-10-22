<tr id="{{ $id }}">
    <td class="with-btn" >
        <select class="form-control selectpicker" name="barang_masuk[{{ $id }}][barang_id]" id="barang{{ $id }}" title="Nama Barang" onchange="satuan({{ $id }})" data-live-search="true" data-style="btn-aqua" data-size="3" data-width="100%">
            @foreach($barang as $row)
            <option value="{{ $row->barang_id }}" data-satuan="{{ $row->satuan_utama? $row->satuan_utama->satuan_nama: '' }}" {{ $data && $data['barang_id'] == $row->barang_id? 'selected': '' }}>{{ $row->barang_nama }}</option>
            @endforeach
        </select>
    </td>
    <td class="with-btn width-100">
        <input class="form-control" id="satuan{{ $id }}" type="text" name="barang_masuk[{{ $id }}][barang_masuk_satuan]" value="{{ $data? $data['barang_masuk_satuan']: '' }}" autocomplete="off" required readonly/>
    </td>
    <td class="with-btn width-150">
        <input class="form-control" type="text" name="barang_masuk[{{ $id }}][barang_masuk_nomor_batch]" value="{{ $data? $data['barang_masuk_nomor_batch']: '' }}" autocomplete="off" />
    </td>
    <td class="with-btn width-150">
        <input class="form-control text-right" id="harga{{ $id }}" type="text" name="barang_masuk[{{ $id }}][barang_masuk_harga_barang]" onchange="pajak({{ $id }})" onkeyup="pajak({{ $id }})" value="{{ $data? $data['barang_masuk_harga_barang']: 0 }}" autocomplete="off" required/>
    </td>
    <td class="with-btn width-150">
        <input class="form-control text-right ppn" id="ppn{{ $id }}" type="text" name="barang_masuk[{{ $id }}][barang_masuk_harga_ppn]" value="{{ $data? $data['barang_masuk_harga_ppn']: 0 }}" autocomplete="off" required readonly/>
    </td>
    <td class="with-btn width-100">
        <input class="form-control" type="number" id="qty{{ $id }}" step="any" name="barang_masuk[{{ $id }}][barang_masuk_qty]" value="{{ $data? $data['barang_masuk_qty']: 0 }}" onchange="total_harga_barang({{ $id }})" onkeyup="total_harga_barang({{ $id }})" autocomplete="off" min="1" required/>
    </td>
    <td class="with-btn width-100">
        <input class="form-control" type="number" id="diskon{{ $id }}" step="any" name="barang_masuk[{{ $id }}][barang_masuk_diskon]" value="{{ $data? $data['barang_masuk_diskon']: 0 }}" onchange="total_harga_barang({{ $id }})" onkeyup="total_harga_barang({{ $id }})" autocomplete="off" min="0" required/>
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control text-right total-harga-barang" name="barang[{{ $id }}][barang_masuk_harga_total]" id="total{{ $id }}" value="{{ $data? str_replace(',', '', $data['penjualan_detail_total']): 0 }}" readonly/>
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control date" name="barang_masuk[{{ $id }}][barang_masuk_kadaluarsa]" value="{{ date("d F Y", strtotime($data? $data['barang_masuk_kadaluarsa']: now())) }}" readonly/>
    </td>
    <td class="with-btn align-middle">
        <button class="btn btn-xs btn-red " onclick="hapus_barang({{ $id }})"><i class="fa fa-times fa-xs"></i></button>
    </td>
</tr>
