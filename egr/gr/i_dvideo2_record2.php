<?php
session_start();

//ambil nilai
require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");





//nilai
$kd = nosql($_REQUEST['kd']);

$foldernya = "../../filebox/video/$kd/";
chmod($foldernya,0777);
			
			
//buat folder...
if (!file_exists('../../filebox/video/'.$kd.'')) {
    mkdir('../../filebox/video/'.$kd.'', 0777, true);
	}










//upload //////////////////////////////////////////////////////////////////////////////////////////////
$new_image_name = "$tahun$bulan$tanggal$jam$menit$detik.mp4";


echo "$tahun$bulan$tanggal$jam$menit$detik";	



//masukin ke database
mysqli_query($koneksi, "INSERT INTO guru_mapel_video2(kd, kd_guru_mapel, filex, postdate) VALUES ".
							"('$x', '$kd', '$new_image_name', '$today')");	
	
	

// baseFromJavascript will be the javascript base64 string retrieved of some way (async or post submited)
$baseFromJavascript = balikin($_POST['base64']);//"data:image/png;base64,BBBFBfj42Pj4"; // $_POST['base64']; //your data in base64 'data:image/png....';


// We need to remove the "data:image/png;base64,"
$base_to_php = explode(',', $baseFromJavascript);
// the 2nd item in the base_to_php array contains the content of the image
$data = base64_decode($base_to_php[1]);



// here you can detect if type is png or jpg if you want
$filepath = "../../filebox/video/$kd/$new_image_name"; // .mp4

// Save the image in a defined path
file_put_contents($filepath,$data);










exit();
?>