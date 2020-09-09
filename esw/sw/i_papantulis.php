<?php
session_start();

//ambil nilai
require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");


//jika gambarnya
if ((isset($_GET['aksi']) && $_GET['aksi'] == 'gambarnya'))
	{
	//nilai
	$gmkd = nosql($_GET['gmkd']);
	
	//papan tulis.......
	$pathku = "../../filebox/materi/$gmkd/papantulis$gmkd.png";
	
	
	echo '<img src="'.$pathku.'" width="100%">';
	}






exit();
?>
