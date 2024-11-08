<?php
include 'config/koneksi.php';
// Cek kondisi, jika parameter id ada, maka tampilkan
$id = isset($_GET['id']) ? $_GET['id'] : '';
// mengambil data detail penjual dan penjualan
    $queryDetail = mysqli_query($koneksi, "SELECT penjualan.id, barang.nama_barang, detail_penjualan.* FROM detail_penjualan LEFT JOIN penjualan ON penjualan.id = detail_penjualan.id_penjualan LEFT JOIN barang ON barang.id = detail_penjualan.id_barang WHERE detail_penjualan.id_penjualan='$id'");
    $row = [];
    while ($dataDetail = mysqli_fetch_assoc($queryDetail)) {
        $row[] = $dataDetail;
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style-struk.css">
    <title>Cetak Transaksi : </title>
</head>
<body>

<div class="struk">
    <div class="struk-header">
        <h1>Toko Mang Ujang</h1>
        <p>Jl. Johar Baru 4 Jakarta Pusat</p>
        <p>082122411023</p>
        <p>Tanggal : <?php echo date('d/m/Y');?></p>
        <p>Jam : <?php echo date('H:i:s');?></p>
    </div>
    <div class="struk-body">
        <table>
            <thead>
                <tr>
                    <th>Nama Barang</th>
                    <th>Qty</th>
                    <th>Harga</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <!-- data transaksi ditampilkan disini -->
                 <?php foreach ($row as $key => $rowDetail) :?>
                 <tr>
                    <td><?php echo $rowDetail['nama_barang'] ?></td>
                    <td><?php echo $rowDetail['jumlah'] ?></td>
                    <td><?php echo "Rp. " . number_format($rowDetail['harga']) ?></td>
                    <td><?php echo "Rp. " . number_format($rowDetail['sub_total']) ?></td>
                 </tr>
                 <?php endforeach;?>

            </tbody>
        </table>
        <div class="total">
            <span>Total :</span>
            <span><?php echo "Rp. " . number_format($row[0]['total_harga']) ?></span>
        </div>
        <div class="payment">
            <span>Bayar :</span>
            <span><?php echo "Rp. " . number_format($row[0]['nominal_bayar']) ?></span>
        </div>
        <div class="change">
            <span>Kembalian :</span>
            <span><?php echo "Rp. " . number_format($row[0]['kembalian']) ?></span>
        </div>
    </div>
    <div class="struk-footer">
        <p>Terima Kasih Telah Belanja Di Toko Kami</p>
    </div>
</div>
<!-- SCRIPT UNTUK CETAK TRANSAKSI -->
    <script>
        window.onload = function() {
            window.print(); }
    </script>
</body>
</html>