<tr id="{{ $id }}">
    <td class="with-btn" >
        <select class="form-control selectpicker" name="barang_masuk[{{ $id }}][barang_id]" data-live-search="true" data-style="btn-aqua" data-size="3" data-width="100%">
            <option value="">-- Pilih Barang --</option>
            @foreach($barang as $row)
            <option value="{{ $row->barang_id }}" {{ $data && $data['barang'] == $row->barang_id? 'selected': '' }}>{{ $row->barang_nama }}</option>
            @endforeach
        </select>
    </td>
    <td class="with-btn width-100">
        <input class="form-control" type="number" name="barang_masuk[{{ $id }}][barang_masuk_qty]" value="{{ $data? $data['qty']: 0 }}" autocomplete="off" min="1" required/>
    </td>
    <td class="with-btn width-200">
        <input class="form-control text-right currency" id="harga{{ $id }}" type="text" name="barang_masuk[{{ $id }}][barang_masuk_harga_barang]" value="{{ $data? $data['harga']: 0 }}" autocomplete="off" required/>
    </td>
    <td class="with-btn width-200">
        <input class="form-control" type="text" name="barang_masuk[{{ $id }}][barang_masuk_nomor_batch]" value="{{ $data? $data['batch']: '' }}" autocomplete="off" />
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control date" name="barang_masuk[{{ $id }}][barang_masuk_kadaluarsa]" value="{{ date("d F Y", strtotime($data? $data['kadaluarsa']: now())) }}" readonly/>
    </td>
    <td class="with-btn align-middle">
        <button class="btn btn-xs btn-red " onclick="hapus_barang({{ $id }})"><i class="fa fa-times fa-xs"></i></button>
    </td>
</tr>
