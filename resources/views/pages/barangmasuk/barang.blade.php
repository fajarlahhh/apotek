<tr id="{{ $id }}">
    <td class="with-btn" >
        <select class="form-control " name="barang_masuk[{{ $id }}][barang_id]" id="barang{{ $id }}" data-live-search="true" data-style="btn-aqua" data-size="3" data-width="100%">
            <option value="">-- Pilih Barang --</option>
            @foreach($barang as $row)
            <option value="{{ $row->barang_id }}">{{ $row->barang_nama }}</option>
            @endforeach
        </select>
    </td>
    <td class="with-btn width-100">
        <input class="form-control" type="number" name="barang_masuk[{{ $id }}][barang_masuk_qty]" wire:model="barang_masuk..barang_masuk_qty" value="1" autocomplete="off" required/>
    </td>
    <td class="with-btn width-200">
        <input class="form-control text-right" id="harga{{ $id }}" type="text" name="barang_masuk[{{ $id }}][barang_masuk_harga_barang]" value="0" autocomplete="off" />
    </td>
    <td class="with-btn width-200">
        <input class="form-control" type="text" name="barang_masuk[{{ $id }}][barang_masuk_nomor_batch]" autocomplete="off" />
    </td>
    <td class="with-btn width-150" wire:bind>
        <input type="text" class="form-control" id="kadaluarsa{{ $id }}" name="barang_masuk[{{ $id }}][barang_masuk_kadaluarsa]" value="{{ date("d F Y") }}" readonly/>
    </td>
    <td class="with-btn align-middle">
        <button class="btn btn-xs btn-red " onclick="hapus({{ $id }})"><i class="fa fa-times fa-xs"></i></button>
    </td>
</tr>

<script>
    $("#barang{{ $id }}").selectpicker();

    new AutoNumeric('#harga{{ $id }}', {
        modifyValueOnWheel : false,
        minimumValue: "0"
    });

    $('#kadaluarsa{{ $id }}').datepicker({
        todayHighlight: true,
        format: 'dd MM yyyy',
        autoclose: true
    });
</script>
