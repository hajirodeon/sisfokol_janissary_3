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
$filenya = "soal_rekap.php?gmkd=$gmkd&jkd=$jkd";
$sesiku = $kd1_session;






//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika ke daftar bab
if ($_POST['btnDF'])
	{
	//nilai
	$gmkd = nosql($_REQUEST['gmkd']);

	//re-direct
	$ke = "soal.php?gmkd=$gmkd";
	xloc($ke);
	exit();
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////













//isi *START
ob_start();



//ketahui jumlah inbox, belum dibaca
$qku = mysqli_query($koneksi, "SELECT * FROM user_blog_msg ".
						"WHERE untuk = '$kd1_session' ".
						"AND dibaca = 'false'");
$tku = mysqli_num_rows($qku);

echo $tku;





//isi
$isiprofil = ob_get_contents();
ob_end_clean();












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
		$filenya = "soal_kerjakan.php?gmkd=$gmkd&jkd=$jkd";
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
	
	          <h3 class="box-title">KERJAKAN SOAL</h3>
	        </div>
	        
	        
	        <div class="box-body">';


				echo '<form action="'.$filenya.'" method="post" name="formxx"><p>
				<input name="jkd" type="hidden" value="'.$jkd.'">
				<input name="btnDF" type="submit" value="<< DAFTAR JUDUL/NAMA/BAB" class="btn btn-danger">
				</p>
				<br>
				
				</form>';
				
				$limit = 100;
				
				
				
				//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				//detail jkd jadwal
				$qku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_jadwal ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND kd = '$jkd'");
				$rku = mysqli_fetch_assoc($qku);
				$u_nama = balikin($rku['nama']);
				$u_durasi = balikin($rku['durasi']);
				



				

				//jumlah soal
				$qjml = mysqli_query($koneksi, "SELECT * FROM guru_mapel_soal ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND jadwal_kd = '$jkd' ".
										"ORDER BY round(no) ASC");
				$tjml = mysqli_num_rows($qjml);	
					
					
					
				
				//yg dikerjakan...
				$qyuk = mysqli_query($koneksi, "SELECT * FROM siswa_soal ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND siswa_kd = '$kd1_session' ".
										"AND jadwal_kd = '$jkd' ".
										"AND jawab <> ''");
				$ryuk = mysqli_fetch_assoc($qyuk);
				$yuk_dikerjakan = mysqli_num_rows($qyuk);
				
				
				//jika lebih, itu tjml
				if ($yuk_dikerjakan > $tjml)
					{
					$yuk_dikerjakan = $tjml;
					}
				
				?>
				


				
				      <div class="row">
				
				        <!-- /.col -->
				        <div class="col-md-12 col-sm-12 col-xs-12">
				          <div class="info-box">
				            <span class="info-box-icon bg-blue"><i class="glyphicon glyphicon-edit"></i></span>
				
				            <div class="info-box-content">
				              <span class="info-box-text">JUDUL/NAMA/BAB</span>
				              <span class="info-box-number">
				              
								<?php
								echo '<p>
								<b>'.$u_nama.'</b>
								</p>';
								?>
				
				              </span>
				            </div>
				            <!-- /.info-box-content -->
				          </div>
				          <!-- /.info-box -->
				        </div>
				        <!-- /.col -->
				

				        <!-- /.col -->
				        <div class="col-md-6 col-sm-6 col-xs-12">
				          <div class="info-box">
				            <span class="info-box-icon bg-green"><i class="glyphicon glyphicon-edit"></i></span>
				
				            <div class="info-box-content">
				              <span class="info-box-text"><?php echo $tjml;?> Soal</span>
				              <span class="info-box-number">
				              
								<?php
								echo '<p>
								<b>'.$u_durasi.' Menit</b>
								</p>';
								?>
				
				              </span>
				            </div>
				            <!-- /.info-box-content -->
				          </div>
				          <!-- /.info-box -->
				        </div>
				        <!-- /.col -->


				
				
				        <!-- /.col -->
				        <div class="col-md-3 col-sm-6 col-xs-12">
				          <div class="info-box">
				            <span class="info-box-icon bg-blue"><i class="glyphicon glyphicon-education"></i></span>
				
				            <div class="info-box-content">
				              <span class="info-box-text">Telah Dikerjakan</span>
				              <span class="info-box-number">
				              <div id="udahjawab">
				              	<b><?php echo $yuk_dikerjakan;?></b>
								</div>
				
				              </span>
				            </div>
				            <!-- /.info-box-content -->
				          </div>
				          <!-- /.info-box -->
				        </div>
				        <!-- /.col -->
				

				        
				        
				
				
				
				
				       </div>
				      <!-- /.row -->
				
				
				              
								
				<?php
				
				
				
				echo '</form>
				<hr>';
				
				
				
				
					
				//jml soal yg ada
				$qyuk7 = mysqli_query($koneksi, "SELECT * FROM guru_mapel_soal ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND jadwal_kd = '$jkd'");
				$ryuk7 = mysqli_fetch_assoc($qyuk7);
				$tyuk7 = mysqli_num_rows($qyuk7);
				
				
				
				
				//yg dijawab
				$qyuk8 = mysqli_query($koneksi, "SELECT * FROM siswa_soal ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND siswa_kd = '$kd1_session' ".
										"AND jadwal_kd = '$jkd' ".
										"AND jawab <> ''");
				$ryuk8 = mysqli_fetch_assoc($qyuk8);
				$tyuk8 = mysqli_num_rows($qyuk8);
				



				//jika selesai
				$qyuk71 = mysqli_query($koneksi, "SELECT * FROM siswa_soal_nilai ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND siswa_kd = '$kd1_session' ".
										"AND jadwal_kd = '$jkd' ".
										"AND selesai = 'true'");
				$ryuk71 = mysqli_fetch_assoc($qyuk71);
				$tyuk71 = mysqli_num_rows($qyuk71);
				$waktu_mulai = balikin($ryuk71['waktu_mulai']);
				$waktu_selesai = balikin($ryuk71['waktu_selesai']);


				
				
				
				
				
				
				
				
				//yg dijawab
				$xyzz = md5("$jkd$sesiku");
				

									
				
				//jika udah semua... ///////////////////////////////////////////////////////////////////////////////////
				if (!empty($tyuk71))
					{
					//hitung yg benar
					$qyuk2 = mysqli_query($koneksi, "SELECT * FROM siswa_soal ".
											"WHERE kd_guru_mapel = '$gmkd' ".
											"AND siswa_kd = '$kd1_session' ".
											"AND jadwal_kd = '$jkd' ".
											"AND benar = 'true'");
					$ryuk2 = mysqli_fetch_assoc($qyuk2);
					$jml_benar = mysqli_num_rows($qyuk2);
					$jml_salah = $tyuk7 - $jml_benar; 
				
					?>
				
				
				
				        <!-- /.col -->
				        <div class="col-md-12 col-sm-6 col-xs-12">
				          <div class="info-box">
				            <span class="info-box-icon bg-red"><i class="glyphicon glyphicon-duplicate"></i></span>
				
				            <div class="info-box-content">
				              <span class="info-box-text">Rekap Jawaban</span>
				              <span class="info-box-number">
				              [Benar : <font color="green"><?php echo $jml_benar;?></font>].
				              [Salah : <font color="red"><?php echo $jml_salah;?></font>]. 
				
				              </span>
				            </div>
				            <!-- /.info-box-content -->
				          </div>
				          <!-- /.info-box -->
				        </div>
				        <!-- /.col -->
				        
				        
				        
				        
				        
				
				        <!-- /.col -->
				        <div class="col-md-12 col-sm-6 col-xs-12">
				          <div class="info-box">
				            <span class="info-box-icon bg-red"><i class="glyphicon glyphicon-hourglass"></i></span>
				
				            <div class="info-box-content">
				              <span class="info-box-text">Waktu</span>
				              <span class="info-box-number">
				              Mulai : <font color="green"><?php echo $waktu_mulai;?></font>
				              Selesai : <font color="red"><?php echo $waktu_selesai;?></font> 
				
				              </span>
				            </div>
				            <!-- /.info-box-content -->
				          </div>
				          <!-- /.info-box -->
				        </div>
				        <!-- /.col -->
				        
				        
				        
				        
				        
				        
				        
				    <?php    
				    //query
					$p = new Pager();
					$start = $p->findStart($limit);
					
					$sqlcount = "SELECT * FROM guru_mapel_soal ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"AND jadwal_kd = '$jkd' ".
									"ORDER BY round(no) ASC";
					
					$sqlresult = $sqlcount;
					
					$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
					$pages = $p->findPages($count, $limit);
					$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
					$target = $filenya;
					$pagelist = $p->pageList($_GET['page'], $pages, $target);
					$data = mysqli_fetch_array($result);
					
					
					echo "&nbsp;";

					echo '<div class="table-responsive">          
					<table class="table" border="1">
					<thead>
					<tr valign="top" bgcolor="'.$e_warnaheader.'">
					<td width="50"><strong><font color="'.$e_warnatext.'">NO</font></strong></td>
					<td><strong><font color="'.$e_warnatext.'">DIJAWAB</font></strong></td>
					</tr>
					</thead>
					<tbody>';
							
					
					do 
						{
						if ($warna_set ==0)
							{
							$warna = $warna01;
							$warna_set = 1;
							}
						else
							{
							$warna = $warna02;
							$warna_set = 0;
							}
				
						$nomer = $nomer + 1;
						$i_kd = nosql($data['kd']);
						$i_no = balikin($data['no']);
						$i_kunci = balikin($data['kunci']);
						$i_isi = balikin($data['isi']);
						$i_postdate = balikin($data['postdate']);
				
						
						//yg dijawab
						$qyuk = mysqli_query($koneksi, "SELECT * FROM siswa_soal ".
												"WHERE kd_guru_mapel = '$gmkd' ".
												"AND siswa_kd = '$sesiku' ".
												"AND jadwal_kd = '$jkd' ".
												"AND soal_kd = '$i_kd'");
						$ryuk = mysqli_fetch_assoc($qyuk);
						mysqli_free_result($qyuk);
						$yuk_kdku = nosql($ryuk['kd']);
						$yuk_jawabku = balikin($ryuk['jawab']);
						$yuk_benarnya = balikin($ryuk['benar']);
						
						
						
						//jika gak null
						if (!empty($yuk_jawabku))
							{
							//jika benar
							if ($yuk_benarnya == "true")
								{
								$yuk_ket = "[<b><font color=green>BENAR</font></b>].";
								}
							else 
								{
								$yuk_ket = "[<font color=red>Salah</font>].";
								}
							}
						
						else
							{
							$yuk_ket = "";
							}
						

						echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$e_warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
						echo '<td align="center">'.$i_no.'.</td>
						<td>
						'.$yuk_jawabku.' 
						
						'.$yuk_ket.'
						</td>
				        </tr>';
						}
					while ($data = mysqli_fetch_assoc($result));


					echo '</tbody>
				  	</table>
				  	</div>';
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
$ketnya = "Menu Kerjakan Soal";
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