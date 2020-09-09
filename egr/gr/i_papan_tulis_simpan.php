<?php
session_start();


//ambil nilai
require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");
require("../../inc/cek/janissari.php");
require("../../inc/cek/e_gr.php");


$baseFromJavascript = balikin($_POST['base64']); 
$gmkd = balikin($_GET['gmkd']);



// We need to remove the "data:image/png;base64,"
$base_to_php = explode(',', $baseFromJavascript);

// the 2nd item in the base_to_php array contains the content of the image
$data = base64_decode($base_to_php[1]);


//777
$folderku = "../../filebox/materi/$gmkd"; 
chmod($folderku,0777);


// here you can detect if type is png or jpg if you want
$filepath = "../../filebox/materi/$gmkd/papantulis$gmkd.png"; // or image.jpg

// Save the image in a defined path
file_put_contents($filepath,$data);


//755
chmod($folderku,0755);
chmod($filepath,0755);



exit();
?>