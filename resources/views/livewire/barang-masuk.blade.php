<form action="{{ route('barangmasuk.simpan') }}" method="post" data-parsley-validate="true" data-parsley-errors-messages-disabled="">
    @csrf
    <div class="panel-body">
        <div class="form-group">
            <label class="control-label">Tanggal Masuk</label>
            <input type="text" readonly class="form-control" id="barang_masuk_tanggal" name="barang_masuk_tanggal" value="{{ date('d F Y') }}" required/>
        </div>
        <div class="form-group">
            <label class="control-label">No. Faktur</label>
            <input class="form-control" type="text" name="barang_masuk_faktur" value="" autocomplete="off" required/>
        </div>
        <div class="form-group">
            <label class="control-label">PBF</label>
            <select class="form-control selectpicker" name="pbf_id" id="pbf_id" data-live-search="true" data-style="btn-warning" data-width="100%" >
                @foreach($pbf as $row)
                @php
                    $selected = '';
                    if(old('pbf_id') == $row->pbf_id){
                        $selected =  'selected';
                    }
                @endphp
                <option value="{{ $row->pbf_id }}" {{ $selected }}>{{ $row->pbf_nama }} - {{ $row->pbf_alamat }}</option>
                @endforeach
                @php
                    $selected = '';
                    if(old('pbf_id') == ''){
                        $selected =  'selected';
                    }
                @endphp
                <option value="" {{ $selected }}>Tidak Ada</option>
            </select>
        </div>
        <div class="form-group">
            <label class="control-label">Tanggal Jatuh Tempo</label>
            <input type="text" readonly class="form-control" id="barang_masuk_jatuh_tempo" name="barang_masuk_jatuh_tempo" value="{{ date('d F Y') }}" required/>
        </div>
        <div class="form-group">
            <label class="control-label">Nama Sales</label>
            <input class="form-control" type="text" name="barang_masuk_sales" value="" autocomplete="off" required/>
        </div>
        <div class="form-group">
            <label class="control-label">Keterangan</label>
            <textarea class="form-control" rows="3" required name="barang_masuk_keterangan"></textarea>
        </div>
        <div class="note note-secondary">
            <div class="note-content table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nama Barang</th>
                            <th>Qty</th>
                            <th>Harga</th>
                            <th>No. Batch</th>
                            <th>Tanggal Kadaluarsa</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($barang_masuk as $index => $bm)
                        <tr>
                            <td class="with-btn">
                                <select class="form-control selectpicker" name="barang[{{ $index }}][barang_id]" data-live-search="true" data-style="btn-warning" data-width="100%" >
                                    <option value="">-- Pilih Barang --</option>
                                    @foreach($barang as $index => $row)
                                    <option value="{{ $row->barang_id }}">{{ $row->barang_nama }}</option>
                                    @endforeach
                                </select>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5" class="text-center">
                                <a href="#" class="btn btn-sm btn-default">Tambah Barang Masuk</a>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
    <div class="panel-footer">
        @role('user|super-admin|supervisor')
        <input type="submit" value="Simpan" class="btn btn-sm btn-success m-r-3"  />
        @endrole
        <a href="{{ $back }}" class="btn btn-sm btn-danger">Batal</a>
        <div class="pull-right">
            This page took {{ (microtime(true) - LARAVEL_START) }} seconds to render
        </div>
    </div>
</form>
