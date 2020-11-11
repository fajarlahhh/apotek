<div class="note bg-grey-transparent-5" id="resep{{ $id }}">
    <div class="note-content table-responsive p-l-5 p-r-5 ">
        <table class="table">
            <thead>
                <tr>
                    <th rowspan="2" class="align-middle width-10">
                        R{{ $id+1 }}
                        <input type="hidden" name="resep[{{ $id }}]" value="{{ $id }}" readonly>
                    </th>
                    <th colspan="8" class="with-btn">

                        <input type="text" class="form-control" id="resep{{ $id }}" name="penjualan_detail_resep_nama[{{ $id }}]" value="{{ $data? $data['penjualan_detail_resep_nama']: '' }}" autocomplete="off" placeholder="Nama Resep"/>
                    </th>
                </tr>
                <tr>
                    <th>Nama Barang</th>
                    <th>Satuan</th>
                    <th>Harga</th>
                    <th>Qty</th>
                    <th>Diskon</th>
                    <th>Total</th>
                    <th class="width-10"></th>
                </tr>
            </thead>
            <tbody  id="barang-resep{{ $id }}">
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="7" class="text-center">
                        <a href="#" class="btn btn-sm btn-warning" onclick="event.preventDefault(); tambah_barang({{ $id }})" id="tambah-barang">Tambah Barang</a>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
<script>
    var i = 0;

    var resep_barang = @php
            echo json_encode($barang? array_values($barang): [], JSON_NUMERIC_CHECK)
            @endphp;

    if (resep_barang.length > 0) {
        resep_barang.forEach(brg => {
            tambah_barang({{ $id }}, brg);
        });
    }

    function total_harga_barang(id) {
        var qty = $("#qty" + id).val() || 0;
        var harga = parseFloat($("#harga" + id).val().split(',').join('') || 0);
        var diskon = parseFloat($("#diskon" + id).val().split(',').join('') || 0);
        AutoNumeric.getAutoNumericElement('#total' + id).set((harga - (harga * diskon/100)) * (qty? qty: 0));
        sub_total();
    }

    function harga(id) {
        var harga = parseFloat($("#satuan" + id + " option:selected").data('harga') || 0);
        var dokter = parseFloat($("#dokter").val().split(',').join('')  || 0);
        AutoNumeric.getAutoNumericElement('#harga' + id).set((harga * dokter/100) + harga);
        total_harga_barang(id);
    }

    function satuan(id, slct = null) {
        var satuan = $("#barang" + id + " option:selected").data('satuan') || [];
        $("#satuan" + id + " option").remove();
        satuan.forEach(row => {
            var select = slct == row['satuan_nama']? "selected": "";
            $("#satuan" + id).append('<option value="'+row['satuan_harga']+';'+row['satuan_nama']+';'+row['satuan_rasio_dari_utama']+'" data-harga="'+row['satuan_harga']+'" data-rasio="'+row['satuan_rasio_dari_utama']+'" '+select+'>'+row['satuan_nama']+'</option>');
        });
        $("#satuan" + id).selectpicker('refresh');
        harga(id);
    }

    function tambah_barang(res, barang = null){
        var id = '-' + res + i;
        $.ajax({
            url : "/penjualanresep/tambahbarang/" + res + "/" + i,
            type : "GET",
            data : { "barang" : barang },
            async : false,
            success: function(data){
                $("#barang-resep" + res).append(data);
                $('#barang' + id).selectpicker({
                    noneSelectedText : 'Nama Barang'
                });

                $('#satuan' + id).selectpicker({
                    noneSelectedText : 'Tidak Ada'
                });

                new AutoNumeric('#harga' + id, {
                    modifyValueOnWheel : false,
                    minimumValue: "0"
                });

                new AutoNumeric('#total' + id, {
                    modifyValueOnWheel : false,
                    minimumValue: "0"
                });
            },
            error: function (xhr, ajaxOptions, thrownError) {
                Swal.fire({
                    icon: 'error',
                    title: 'Tambah Barang',
                    text: xhr.responseJSON.message
                })
            }
        });
        satuan(id, (barang? barang['satuan_nama']: null));
        sub_total();
        i++;
    }

    function hapus_barang(n) {
        var id = resep + '' + n;
        $("#baris" + id).remove();
        sub_total();
    }
</script>
