<?php
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
/////// SISFOKOL JANISSARI                          ///////
///////////////////////////////////////////////////////////
/////// Dibuat oleh :                               ///////
/////// Agus Muhajir, S.Kom                         ///////
/////// URL     :                                   ///////
///////     *http://sisfokol.wordpress.com          ///////
//////      *http://hajirodeon.wordpress.com        ///////
/////// E-Mail  :                                   ///////
///////     * hajirodeon@yahoo.com                  ///////
///////     * hajirodeon@gmail.com                  ///////
/////// HP/SMS  : 081-829-88-54                     ///////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////



session_start();

//ambil nilai
require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");
require("../../inc/cek/janissari.php");
require("../../inc/cek/e_sw.php");
require("../../inc/class/paging.php");
$tpl = LoadTpl("../../template/esw.html");

nocache;



//nilai
$s = nosql($_REQUEST['s']);
$gmkd = nosql($_REQUEST['gmkd']);
$filenya = "soal.php?gmkd=$gmkd";






//isi *START
ob_start();

require("../../inc/js/swap.js");



//view : guru ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika belum pilih mapel
if (empty($gmkd))
	{
	//re-direct
	$ke = "mapel.php";
	xloc($ke);
	exit();
	}

//nek mapel telah dipilih
else
	{
	//mapel-nya...
	$qpel = mysqli_query($koneksi, "SELECT * FROM guru_mapel ".
							"WHERE kd = '$gmkd'");
	$rpel = mysqli_fetch_assoc($qpel);
	$tpel = mysqli_num_rows($qpel);
	$pel_nm = balikin($rpel['mapel_nama']);
	$pel_tapel = balikin($rpel['tapel']);
	$pel_tapel2 = cegah($rpel['tapel']);
	$pel_kelas = balikin($rpel['kelas']);
	$pel_kelas2 = cegah($rpel['kelas']);
	$pel_guru = balikin($rpel['user_nama']);


	//jika iya
	if ($tpel != 0)
		{
		//nilai
		$judul = "[$pel_tapel. $pel_kelas]. <br>$pel_nm. <br>[GURU : $pel_guru].";
		$judulku = "[$tipe_session : $no1_session.$nm1_session] ==> $pel_nm. [GURU : $pel_guru].";
		$filenya = "soal.php?gmkd=$gmkd";
		$juduli = $judul;


		//judul
		echo "<h3>$judul</h3>";

		//menu elearning
		require("i_menu.php");



		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-success">
	        <div class="box-header">
	
	          <h3 class="box-title">SOAL</h3>
	        </div>
	        
	        
	        <div class="box-body">';

              	//detail soal
				$qku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_jadwal ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND aktif = 'true' ".
										"ORDER BY postdate DESC");
				$rku = mysqli_fetch_assoc($qku);
				$tku = mysqli_num_rows($qku);
				
              	//jika ada
              	if (!empty($tku))
              		{
              		do
              			{
	              		//nilai
						$u_jkd = nosql($rku['kd']);
						$u_nama = balikin($rku['nama']);
						$u_durasi = balikin($rku['durasi']);
						$u_soal_jml = balikin($rku['soal_jml']);
						$u_postdate = balikin($rku['postdate']);
		              	
	
	
						//detail pengerjaan
						$qyuk = mysqli_query($koneksi, "SELECT * FROM siswa_soal_nilai ".
												"WHERE kd_guru_mapel = '$gmkd' ".
												"AND siswa_kd = '$kd1_session' ".
												"AND jadwal_kd = '$u_jkd' ".
												"AND selesai = 'true'");
						$ryuk = mysqli_fetch_assoc($qyuk);
						$tyuk = mysqli_num_rows($qyuk);
						$yuk_jml_benar = balikin($ryuk['jml_benar']);
						$yuk_jml_salah = balikin($ryuk['jml_salah']);
						$yuk_waktu_mulai = balikin($ryuk['waktu_mulai']);
						$yuk_waktu_selesai = balikin($ryuk['waktu_selesai']);
	
	
		              	echo '<p>
		              	Judul/Nama/Bab :
						<br>
						<b>'.$u_nama.'</b>.
						</p>
						<br>
						
						<p> 
						<b>'.$u_soal_jml.' Soal, '.$u_durasi.' Menit</b>.
						</p>
						<br>';
						
						//jika belum selesai
						if (empty($tyuk))
							{
							echo '<p>						
							<a href="soal_kerjakan.php?gmkd='.$gmkd.'&jkd='.$u_jkd.'" class="btn btn-block btn-danger">KERJAKAN ></a>
							</p>';
							}
						else
							{
							echo '<p>
							Mulai : <b>'.$yuk_waktu_mulai.'</b>, 
							
							Selesai : <b>'.$yuk_waktu_selesai.'</b>
							</p>
							<br>
							
							<p>
							Jumlah Benar : <b>'.$yuk_jml_benar.'</b>, 
							
							Jumlah Salah : <b>'.$yuk_jml_salah.'</b>
							</p>
							
							<p>						
							<a href="soal_kerjakan.php?gmkd='.$gmkd.'&jkd='.$u_jkd.'" class="btn btn-block btn-success">LIHAT REKAP ></a>
							</p>
							
							<br>';
							}
							
							
						echo '<hr>';
						}
					while ($rku = mysqli_fetch_assoc($qku));
					}
				
				else
					{
					echo '<h3>
					<font color="red">BELUM ADA SOAL YANG BISA DIKERJAKAN..</font>
					</h3>';
					}





			echo '</div>
			
		</div>
		
		</div>
		
		</div>';
		}

	//jika tidak
	else
		{
		//re-direct
		$pesan = "Silahkan Lihat Daftar Mata Pelajaran.";
		$ke = "mapel.php";
		pekem($pesan,$ke);
		exit();
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//masukin ke log mapel guru ////////////////////////////////////////////////////////////////////////////////
$ketnya = "Menu Soal";
$tapelnya = cegah($rpel['tapel']);
$kelasnya = cegah($rpel['kelas']);
$mapel_kode = cegah($rpel['mapel_kode']);
$mapel_nama = cegah($rpel['mapel_nama']);



mysqli_query($koneksi, "INSERT INTO guru_mapel_log(kd, kd_guru_mapel, ket, postdate, ".
				"mapel_kode, mapel_nama, tapel, ".
				"kelas, user_tipe, user_kd, user_kode, user_nama) VALUES ".
				"('$x', '$gmkd', '$ketnya', '$today', ".
				"'$mapel_kode', '$mapel_nama', '$tapelnya', ".
				"'$kelasnya', '$tipe_session', '$kd1_session', '$no1_session', '$nm1_session');");
//masukin ke log mapel guru ////////////////////////////////////////////////////////////////////////////////

		

	

	

//online terakhir ////////////////////////////////////////////////////////////////////////////////
$ipnya = get_client_ip_env();
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm. [GURU : $pel_guru]. [FILE MATERI].";
							


//insert
$xyz = md5("$kd1_session$today");
mysqli_query($koneksi, "INSERT INTO user_blog_status(kd, kd_user, user_tipe, ".
				"user_kode, user_nama, status, ".
				"onlineya, ipnya, postdate) VALUES ".
				"('$xyz', '$kd1_session', '$tipe_session', ".
				"'$no1_session', '$nm1_session', '$judulx', ".
				"'YA', '$ipnya', '$today');");
//online terakhir ////////////////////////////////////////////////////////////////////////////////
		
	



?>

<!-- jQuery 3 -->
<script src="../../template/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../template/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../../template/adminlte/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../template/adminlte/dist/js/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="../../template/adminlte/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="../../template/adminlte/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../../template/adminlte/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll -->
<script src="../../template/adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS -->
<script src="../../template/adminlte/bower_components/chart.js/Chart.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../../template/adminlte/dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../template/adminlte/dist/js/demo.js"></script>



<?php

	

	

	
	
//isi
$isi = ob_get_contents();
ob_end_clean();

require("../../inc/niltpl.php");



//diskonek
xfree($qbw);
xclose($koneksi);
exit();
?>