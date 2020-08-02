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
$jkd = nosql($_REQUEST['jkd']);
$filenya = "tugas_kerjakan.php?gmkd=$gmkd&jkd=$jkd";
$sesiku = $kd1_session;






//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika ke daftar bab
if ($_POST['btnDF'])
	{
	//nilai
	$gmkd = nosql($_REQUEST['gmkd']);

	//re-direct
	$ke = "tugas.php?gmkd=$gmkd";
	xloc($ke);
	exit();
	}
	
	
	
//upload image
if ($_POST['btnUPL'])
	{
	//ambil nilai
	$gmkd = cegah($_POST['gmkd']);
	$jkd = cegah($_POST['jkd']);
	$kdku = cegah($_POST['kdku']);
	$filex_namex = strtolower($_FILES['filex']['name']);
	$filex_namex2 = strip($filex_namex);
	$filesize = 1;



	//deteksi .zip
	$ext_filex = substr($filex_namex, -4);

	if ($ext_filex == ".zip")
		{
		//nek null
		if (empty($filex_namex))
			{
			//null-kan
			xclose($koneksi);
	
			//re-direct
			$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
			pekem($pesan,$filenya);
			exit();
			}
		else
			{
			//nilai folder //////////////////////////////////////////////////////////////
			$path1 = "../../filebox/tugas/$gmkd";
			$path2x = "../../filebox/tugas";
			chmod("$path2x",0777);
	
			//cek, sudah ada belum folder-nya...
			if (!file_exists($path1))
				{
				mkdir("$path1", 0777, true);
				}
	
	
			//nilai folder //////////////////////////////////////////////////////////////
			$path2 = "../../filebox/tugas/$gmkd/$kdku";
			chmod("$path2x",0777);
	
			//cek, sudah ada belum folder-nya...
			if (!file_exists($path2))
				{
				mkdir("$path2", 0777, true);
				}
	
	
	


	
			//nilai file-nya...
			$filex1 = "../../filebox/tugas/$gmkd/$kdku/$filex_namex2";
			chmod("$filex1",0777);
	
			//cek, sudah ada belum
			if (!file_exists($filex1))
				{
				//mengkopi file
	//			move_uploaded_file($_FILES['filex']['tmp_name'],"../../../filebox/e/materi/$gmkd/$kdku/$filex_namex");
				copy($_FILES['filex']['tmp_name'],"../../filebox/tugas/$gmkd/$kdku/$filex_namex2");
	
				//query
				mysqli_query($koneksi, "INSERT INTO siswa_tugas(kd, kd_guru_mapel, tugas_kd, ".
								"siswa_kd, filex, postdate) VALUES ".
								"('$kdku', '$gmkd', '$jkd', ".
								"'$kd1_session', '$filex_namex2', '$today')");
	
	
	
				//nilai file-nya...
				$filex1 = "../../filebox/tugas/$gmkd/$kdku/$filex_namex2";
				chmod("$filex1",0755);
		
	
				//null-kan
				xclose($koneksi);
	
				//re-direct
				$pesan = "Tugas Berhasil Dikirimkan...";
				$ke = "tugas.php?gmkd=$gmkd";
				pekem($pesan,$ke);
				exit();
				}
			else
				{
				//null-kan
				xclose($koneksi);
	
				//re-direct
				$pesan = "Sudah Ada. Ganti Yang Lain...!!";
				pekem($pesan,$filenya);
				exit();
				}
			}
		
		}
	else
		{
		//salah
		$pesan = "Bukan File Compess .zip . Harap Diperhatikan...!!";
		pekem($pesan,$filenya);
		exit();
		}
	
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////














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
		$filenya = "tugas_kerjakan.php?gmkd=$gmkd&jkd=$jkd";
		$juduli = $judul;


		//judul
		echo "<h3>$judul</h3>";

		//menu elearning
		require("i_menu.php");




		
	

		
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


		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-success">
	        <div class="box-header">
	
	          <h3 class="box-title">KUMPULKAN TUGAS</h3>
	        </div>
	        
	        
	        <div class="box-body">';
			
              	//detail tugas
				$qku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_tugas ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND kd = '$jkd'");
				$rku = mysqli_fetch_assoc($qku);
				$tku = mysqli_num_rows($qku);
				$u_nama = balikin($rku['topik']);
				$u_postdate = balikin($rku['postdate']);
		     
				//ciptakan kdku
				$kdku = "$gmkd$jkd$kd1_session";

				echo '<p>	        
				<input name="gmkd" type="hidden" value="'.$gmkd.'">
				<input name="jkd" type="hidden" value="'.$jkd.'">
				<input name="btnDF" type="submit" value="<< DAFTAR TUGAS LAINNYA" class="btn btn-danger">
				</p>
				<hr>
				
				
				
				
				<p>
				Nama/Judul/Tugas :
				<br>
				<b>'.$u_nama.'</b>
				</p>
				<br>';
				
				//cek
				$qmboh = mysqli_query($koneksi, "SELECT * FROM siswa_tugas ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND tugas_kd = '$jkd' ".
										"AND siswa_kd = '$kd1_session'");
				$tmboh = mysqli_num_rows($qmboh);
				
				//jika belum kirimkan tugas
				if (empty($tmboh))
					{
					echo '<p>
					File Compress  .zip : 
					<br>
					<input name="filex" type="file" size="30">
					</p>
					<b>
					
					<p>
					<input name="kdku" type="hidden" value="'.$x.'">
					<input name="btnUPL" type="submit" value="SIMPAN & UPLOAD">
					</p>';
					}
				else
					{
					echo '<p>
					<b>
					<font color="green">
					Tugas Sudah Dikirimkan.
					</font>
					</b>
					</p>';
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
$ketnya = "Menu Kumpulkan Tugas";
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

	

	

	
	
//isi
$isi = ob_get_contents();
ob_end_clean();

require("../../inc/niltpl.php");



//diskonek
xfree($qbw);
xclose($koneksi);
exit();
?>