<?php
//error reporting //////////////////////////////////////////////////////////////////////////////
//matikan
error_reporting(0);

//tampilkan
//error_reporting(E_ALL & ~E_NOTICE);
//error reporting //////////////////////////////////////////////////////////////////////////////





//Detail Sekolah ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$sek_nama = "Sekolah BIASAWAE...";
$sek_alamat = "Jl. Raya Biasawae... No...";
$sek_kontak = "Telp. . . . Fax. . . .";
$sek_kota = "Kota. . . . ";
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//ALAMAT SITUS //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$sumber = "http://localhost/sisfokol_janissary3_github";
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//KONEKSI DATABASE //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$xhostname = "localhost";
$xdatabase = "sisfokol_janissary3";
$xusername = "biasawae";
$xpassword = "biasawae";
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//JUMLAH DATA per HALAMAN ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
$limit = "25";  //jumlah data dalam satu halaman
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//TAHUN KELAHIRAN ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$lahir01 = $tahun - 100;
$lahir02 = $tahun;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//JENJANG TAHUN /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$tpel01 = $tahun - 10;
$tpel02 = $tahun + 2;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//CHMOD utk. Upload Image ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
$chmod = 0755;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//Jumlah baris dalam List Daftar Chat ///////////////////////////////////////////////////////////////////////////////////////////////////
$chatdatalist = "100";
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
?>
