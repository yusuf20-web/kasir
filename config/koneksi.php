<?php
$host = "localhost";
$user = "root";
$password = "";
$db = "kasir_yusuf";

$koneksi = mysqli_connect($host, $user, $password, $db);

if (empty($koneksi)) {
    echo "KONEKSI GAGAL";
}
