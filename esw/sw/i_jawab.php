<?php
session_start();

require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");
	




$filenyax = "$sumber/esw/sw/i_jawab.php";




//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika simpan
if ((isset($_GET['aksi']) && $_GET['aksi'] == 'simpan'))
	{
	//ambil nilai
	$gmkd = trim(cegah($_GET['gmkd']));
	$skd = trim(cegah($_GET['skd']));
	$jkd = trim(cegah($_GET['jkd']));
	$nilku = trim(cegah($_GET['nilku']));
	$soalkd = trim(cegah($_GET['soalkd']));





	//detail kunci
	$qyuk = mysqli_query($koneksi, "SELECT * FROM guru_mapel_soal ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND jadwal_kd = '$jkd' ".
							"AND kd = '$soalkd'");
	$ryuk = mysqli_fetch_assoc($qyuk);
	$i_kunci = balikin($ryuk['kunci']);
	
	

	
	//jika benar, sesuai kunci
	if ($i_kunci == $nilku)
		{
		$i_jawabku = "true";
		}
		
	else
		{
		$i_jawabku = "false";
		}
	


	
	

	//hapus dulu
	mysqli_query($koneksi, "DELETE FROM siswa_soal ".
					"WHERE kd_guru_mapel = '$gmkd' ".
					"AND jadwal_kd = '$jkd' ".
					"AND siswa_kd = '$skd' ".
					"AND soal_kd = '$soalkd'");
	
	
	
	
	//nilai
	$xyz = md5("$skd$jkd$soalkd");



	
	//insert
	mysqli_query($koneksi, "INSERT INTO siswa_soal(kd, kd_guru_mapel, jadwal_kd, ".
					"siswa_kd, soal_kd, jawab, ".
					"kunci, benar, postdate) VALUES ".
					"('$xyz', '$gmkd', '$jkd', ".
					"'$skd', '$soalkd', '$nilku', ".
					"'$i_kunci', '$i_jawabku', '$today')");
	
	

	//null-kan
	mysqli_free_result();
	xclose($koneksi);
	exit();
	}
	









//jika selesai
if ((isset($_GET['aksi']) && $_GET['aksi'] == 'selesai'))
	{
	//ambil nilai
	$gmkd = trim(cegah($_GET['gmkd']));
	$skd = trim(cegah($_GET['skd']));
	$jkd = trim(cegah($_GET['jkd']));

	
	
	//semua
	$qyuk1 = mysqli_query($koneksi, "SELECT * FROM siswa_soal ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND jadwal_kd = '$jkd' ".
							"AND siswa_kd = '$skd'");
	$ryuk1 = mysqli_fetch_assoc($qyuk1);
	$jml_semua = mysqli_num_rows($qyuk1);
	
	
	
	
	//hitung benar
	$qyuk1 = mysqli_query($koneksi, "SELECT * FROM siswa_soal ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND jadwal_kd = '$jkd' ".
							"AND siswa_kd = '$skd' ".
							"AND benar = 'true'");
	$ryuk1 = mysqli_fetch_assoc($qyuk1);
	$jml_benar = mysqli_num_rows($qyuk1);
	$jml_salah = $jml_semua - $jml_benar;
	



	//jika ada yg belum dikerjakan
	$qcc = mysqli_query($koneksi, "SELECT * FROM siswa_soal ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND jadwal_kd = '$jkd' ".
							"AND siswa_kd = '$skd' ".
							"AND jawab = ''");
	$tcc = mysqli_num_rows($qcc);
	

	//jika iya
	if (!empty($tcc))
		{
		//re-direct
		echo "<h3><font color=red>
		Masih Ada Soal Yang Belum Dikerjakan. Silahkan Dicek Lagi...!!
		</font>
		</h3>";
		
		//null-kan
		xclose($koneksi);		
		exit();
		}
		
	else
		{
		//hitung jumlah yg dikerjakan
		$qyuk = mysqli_query($koneksi, "SELECT * FROM siswa_soal ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"AND jadwal_kd = '$jkd' ".
								"AND siswa_kd = '$skd' ".
								"AND jawab <> ''");
		$ryuk = mysqli_fetch_assoc($qyuk);
		$tyuk = mysqli_num_rows($qyuk);
		
		
	
	
		//update nilai
		mysqli_query($koneksi, "UPDATE siswa_soal_nilai SET waktu_selesai = '$today', ".
						"jml_soal_dikerjakan = '$tyuk', ".
						"selesai = 'true', ".
						"jml_benar = '$jml_benar', ".
						"jml_salah = '$jml_salah' ".
						"WHERE kd_guru_mapel = '$gmkd' ".
						"AND jadwal_kd = '$jkd' ".
						"AND siswa_kd = '$skd'");

					
				
	
		
		//re-direct
		$ke = "soal_kerjakan.php?gmkd=$gmkd&jkd=$jkd";
		xloc($ke);
		exit();
		}


	//null-kan
	mysqli_free_result();
	xclose($koneksi);
	exit();
	}
	






//jika hitung
if ((isset($_GET['aksi']) && $_GET['aksi'] == 'hitung'))
	{
	//ambil nilai
	$gmkd = trim(cegah($_GET['gmkd']));
	$skd = trim(cegah($_GET['skd']));
	$jkd = trim(cegah($_GET['jkd']));
	$nilku = trim(cegah($_GET['nilku']));
	$soalkd = trim(cegah($_GET['soalkd']));
	
	
	
	//jml soal yg ada
	$qyuk7 = mysqli_query($koneksi, "SELECT * FROM guru_mapel_soal ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND jadwal_kd = '$jkd'");
	$ryuk7 = mysqli_fetch_assoc($qyuk7);
	$tyuk7 = mysqli_num_rows($qyuk7);
	
	
	
	
	//yg dijawab
	$qyuk = mysqli_query($koneksi, "SELECT * FROM siswa_soal ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND jadwal_kd = '$jkd' ".
							"AND siswa_kd = '$skd' ".
							"AND jawab <> ''");
	$ryuk = mysqli_fetch_assoc($qyuk);
	$tyuk = mysqli_num_rows($qyuk);
	
		

	echo '<font color="green">
		<b>'.$tyuk.'</b> 
	
	</font>';









	//jika udah semua...
	if ($tyuk7 == $tyuk)
		{
		//hitung yg benar
		$qyuk2 = mysqli_query($koneksi, "SELECT * FROM siswa_soal ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"AND jadwal_kd = '$jkd' ".
								"AND siswa_kd = '$skd' ".
								"AND benar = 'true'");
		$ryuk2 = mysqli_fetch_assoc($qyuk2);
		$jml_benar = mysqli_num_rows($qyuk2);
		$jml_salah = $tyuk7 - $jml_benar; 
		$xyzz = md5("$jkd$skd");
	
		
		
		//update
		mysqli_query($koneksi, "UPDATE siswa_soal_nilai SET jml_benar = '$jml_benar', ".
						"jml_salah = '$jml_salah', ".
						"postdate = '$today' ".
						"WHERE kd_guru_mapel = '$gmkd' ".
						"AND siswa_kd = '$skd' ".
						"AND jadwal_kd = '$jkd'");


		//null-kan
		mysqli_free_result();
		xclose($koneksi);
		exit();
		}
		





	
	//null-kan
	mysqli_free_result();
	xclose($koneksi);
	exit();
	}
	
	
	

//null-kan
mysqli_free_result();
xclose($koneksi);
exit();
?>