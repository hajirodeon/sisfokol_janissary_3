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
require("../../inc/class/paging.php");
require("../../inc/cek/janissari.php");
require("../../inc/cek/e_sw.php");
$tpl = LoadTpl("../../template/esw.html");

nocache;

//nilai
$s = nosql($_REQUEST['s']);
$a = nosql($_REQUEST['a']);
$gmkd = nosql($_REQUEST['gmkd']);
$bk = nosql($_REQUEST['bk']);
$artkd = nosql($_REQUEST['artkd']);
$msgkd = nosql($_REQUEST['msgkd']);
$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}





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

//js
require("../../inc/js/swap.js");



//view : siswa //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
		$filenya = "artikel.php?gmkd=$gmkd";
		$juduli = $judul;

		//judul
		echo "<h3>$judul</h3>";

		//menu elearning
		require("i_menu.php");


		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-success">
	        <div class="box-header">
	
	          <h3 class="box-title">ARTIKEL</h3>
	        </div>
	        
	        
	        <div class="box-body">';

			//jika lihat ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
			if ($s == "detail")
				{
				//nilai
				//query
				$qdt = mysqli_query($koneksi, "SELECT guru_mapel_artikel.*, guru_mapel_artikel.kd AS nkd ".
										"FROM guru_mapel_artikel ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND kd = '$artkd'");
				$rdt = mysqli_fetch_assoc($qdt);
				$dt_judul = balikin($rdt['judul']);
				$dt_rangkuman = balikin($rdt['rangkuman']);
				$dt_isi = balikin($rdt['isi']);
				$dt_katkd = balikin($rdt['kategori']);
	
	
				//daftar kategori
				$qkat = mysqli_query($koneksi, "SELECT * FROM user_blog_kategori ".
										"WHERE kd_user = '$kd1_session' ".
										"ORDER BY kategori ASC");
				$rkat = mysqli_fetch_assoc($qkat);
	
				//kat terpilih
				$katx_kat = $dt_katkd;
	
				//view
				echo '<p>
				<big>
				<strong>'.$dt_judul.'</strong>
				</big>
				</p>
	
				<p>
				'.$dt_isi.'
				</p>
	
				<br><br>
				<p>
				<hr size="1">';
	
	
	
				//daftar komentar ////////////////////////////////////////////////////////
				$qdko = mysqli_query($koneksi, "SELECT * FROM guru_mapel_artikel_msg ".
										"WHERE kd_guru_mapel_artikel = '$artkd' ".
										"ORDER BY postdate ASC");
				$rdko = mysqli_fetch_assoc($qdko);
				$tdko = mysqli_num_rows($qdko);
	
				if ($tdko != 0)
					{
					do
						{
						//nilai
						$dko_kd = nosql($rdko['kd']);
						$dko_msg = balikin($rdko['msg']);
						$dko_dari = nosql($rdko['dari']);
						$dko_postdate = $rdko['postdate'];
	
						//user-nya
						$qtuse = mysqli_query($koneksi, "SELECT * FROM m_user ".
												"WHERE kd = '$dko_dari'");
						$rtuse = mysqli_fetch_assoc($qtuse);
						$tuse_kd = nosql($rtuse['kd']);
						$tuse_no = nosql($rtuse['nomor']);
						$tuse_nm = balikin($rtuse['nama']);
						$tuse_tipe = nosql($rtuse['tipe']);
						$tuse_foto_path = "$sumber/filebox/profil/$tuse_kd/thumb-$tuse_kd.jpg";
	
						//nek null foto
						if (empty($tuse_foto_path))
							{
							$nilz_foto = "$sumber/img/foto_blank.jpg";
							}
						else
							{
							//gawe mini thumnail
							$nilz_foto = "$sumber/filebox/profil/$tuse_kd/thumb-$tuse_kd.jpg";
							}

						//jika bukan diri sendiri
						if ($dko_dari != $kd1_session)
							{
							$nilku = "<strong>($tuse_tipe). $tuse_no. $tuse_nm</strong><br>";		
							}
						else
							{
							$nilku = "";		
							}
	
						echo '<table width="100%" border="0" cellspacing="3" cellpadding="0">
						<tr valign="top">
						<td width="50" valign="top">
						<img src="'.$nilz_foto.'" align="left" alt="'.$tuse_nm.'" width="50" height="50" class="img-thumbnail" border="1">
						</a>
						</td>
						<td valign="top">
						<em>'.$dko_msg.'. <br>
						'.$nilku.'
						['.$dko_postdate.'].</em>
						</td>
						</tr>
						</table>
						<hr>';
						}
					while ($rdko = mysqli_fetch_assoc($qdko));
					}
	
	
				//simpan komentar ////////////////////////////////////////////////////////////////////
				if ($_POST['btnSMPy'])
					{
					//nilai
					$artkd = nosql($_POST['artkd']);
					$e = nosql($_POST['e']);
					$bk_artikel = cegah($_POST['bk_artikel']);
					$page = nosql($_POST['page']);
	
					//insert
					mysqli_query($koneksi, "INSERT INTO guru_mapel_artikel_msg(kd, kd_guru_mapel_artikel, dari, msg, postdate) VALUES ".
									"('$x', '$artkd', '$kd1_session', '$bk_artikel', '$today')");
	
					//re-direct
					$ke = "$filenya&s=detail&artkd=$artkd&page=$page";
					xloc($ke);
					exit();
					}
				////////////////////////////////////////////////////////////////////////////////////////
	
				echo '</p>
				<br>
				<br>
	
				<p>
				Beri Komentar :
				<br>
				<textarea name="bk_artikel" rows="5" wrap="virtual" class="btn-block"></textarea>
				<br>
				<input name="artkd" type="hidden" value="'.$artkd.'">
				<input name="s" type="hidden" value="'.$s.'">
				<input name="page" type="hidden" value="'.$page.'">
				<input name="btnSMPy" type="submit" value="SIMPAN" class="btn btn-danger">
				<input name="btnBTL" type="reset" value="BATAL" class="btn btn-primary">
				</p>
	
				<br>
				<br>
				<br>
				<hr size="1">
				<big><strong>ARTIKEL Lainnya...</strong></big>
				<br>';
	
				//query
				$a_p = new Pager();
				$a_limit = 10;
				$a_start = $a_p->findStart($a_limit);
	
				$a_sqlcount = "SELECT * FROM guru_mapel_artikel ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"AND kd <> '$artkd' ".
									"ORDER BY postdate DESC";
				$a_sqlresult = $a_sqlcount;
	
				$a_count = mysqli_num_rows(mysqli_query($koneksi, $a_sqlcount));
				$a_pages = $a_p->findPages($a_count, $a_limit);
				$a_result = mysqli_query($koneksi, "$a_sqlresult LIMIT ".$a_start.", ".$a_limit);
				$a_target = "$filenya&s=detail&artkd=$artkd";
				$a_pagelist = $a_p->pageList($_GET['page'], $a_pages, $a_target);
				$a_data = mysqli_fetch_array($a_result);
	
				//jika ada
				if ($a_count != 0)
					{
					echo '<table width="100%" border="0" cellpadding="3" cellspacing="0">';
	
					do
				  		{
						$dt_kd = nosql($a_data['kd']);
						$dt_katkd = balikin($a_data['kategori']);
						$dt_judul = balikin($a_data['judul']);
						$dt_postdate = $a_data['postdate'];
	
						//kategori
						$kat_kategori = $dt_katkd;
	
						//jml komentar
						$qjko = mysqli_query($koneksi, "SELECT * FROM guru_mapel_artikel_msg ".
												"WHERE kd_guru_mapel_artikel = '$dt_kd'");
						$rjko = mysqli_fetch_assoc($qjko);
						$tjko = mysqli_num_rows($qjko);
	
						echo "<tr valign=\"top\" bgcolor=\"$tk_warna\" onmouseover=\"this.bgColor='$tk_warnaover';\" onmouseout=\"this.bgColor='$tk_warna';\">";
						echo '<td valign="top">
						<strong>'.$dt_judul.'</strong>
						<br>
						[<em>Kategori : <strong>'.$kat_kategori.'</strong></em>].
						<br>
						[<em>'.$dt_postdate.'</em>].
						<br>
						[(<strong>'.$tjko.'</strong>) Komentar].
						<br>
						<a href="'.$filenya.'&s=detail&artkd='.$dt_kd.'&page='.$page.'" title="'.$dt_judul.'" class="btn btn-danger">SELENGKAPNYA >></a>
						</td>
						</tr>';
				  		}
					while ($a_data = mysqli_fetch_assoc($a_result));
	
					echo '</table>
					'.$a_pagelist.'';
					}
				else
					{
					echo '<p>
					<font color="blue"><strong>BELUM ADA ARTIKEL LAINNYA.</strong></font>
					</p>';
					}
	
				echo '<br>
				<br>
				<br>';
				}
	
	
	
	
			//jika lihat daftar ////////////////////////////////////////////////////////////////////////////////////////////////////////
			else
				{
				//query
				$p = new Pager();
				$start = $p->findStart($limit);
	
				$sqlcount = "SELECT guru_mapel_artikel.*, guru_mapel_artikel.kd AS nkd ".
								"FROM guru_mapel_artikel ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"ORDER BY postdate DESC";
				$sqlresult = $sqlcount;
	
				$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
				$pages = $p->findPages($count, $limit);
				$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
				$target = $filenya;
				$pagelist = $p->pageList($_GET['page'], $pages, $target);
				$data = mysqli_fetch_array($result);
	
				//nek ada
				if ($count != 0)
					{
					echo '<table width="100%" border="0" cellpadding="3" cellspacing="0">';
	
					do
				  		{
						$nomer = $nomer + 1;
	
						$dt_kd = nosql($data['kd']);
						$dt_katkd = balikin($data['kategori']);
						$dt_judul = balikin($data['judul']);
						$dt_rangkuman = balikin($data['rangkuman']);
						$dt_postdate = $data['postdate'];
	
						//kategori
						$kat_kategori = $dt_katkd;
	
						//jumlah komentar
						$qitusx = mysqli_query($koneksi, "SELECT * FROM guru_mapel_artikel_msg ".
													"WHERE kd_guru_mapel_artikel = '$dt_kd' ".
													"ORDER BY postdate ASC");
						$ritusx = mysqli_fetch_assoc($qitusx);
						$titusx = mysqli_num_rows($qitusx);
	
						echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$e_warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
						echo '<td valign="top">
						<br>
						<a name="'.$dt_kd.'"></a>
						<big><strong>'.$dt_judul.'</strong></big>
						<br>
						<em>'.$dt_rangkuman.'</em>
						<br>
						<br>
						
						<a href="'.$filenya.'&s=detail&artkd='.$dt_kd.'" title="Selengkapnya..." class="btn btn-danger">SELENGKAPNYA >></a>
						<br>
						
						[<em>Kategori : <strong>'.$kat_kategori.'</strong></em>].
						[<em>'.$dt_postdate.'</em>].
						<br>
						
						[<a href="'.$filenya.'&page='.$page.'&s=view&artkd='.$dt_kd.'#'.$dt_kd.'" title="('.$titusx.') Komentar">(<strong>'.$titusx.'</strong>) Komentar</a>].
						[<a href="'.$filenya.'&page='.$page.'&bk=artikel&artkd='.$dt_kd.'#'.$dt_kd.'" title="Beri Komentar">Beri Komentar</a>].';
	
						//jika view
						if (($s == "view") AND ($artkd == $dt_kd))
							{
							//jika ada
							if ($titusx != 0)
								{
								echo '<table width="100%" border="0" cellspacing="3" cellpadding="0">
								<tr valign="top">
								<td width="50">&nbsp;</td>
								<td>';
	
								do
									{
									$itusx_kd = nosql($ritusx['kd']);
									$itusx_msg = balikin2($ritusx['msg']);
									$itusx_dari = nosql($ritusx['dari']);
									$itusx_postdate = $ritusx['postdate'];
	
	
									//user-nya
									$qtuse = mysqli_query($koneksi, "SELECT * FROM m_user ".
															"WHERE kd = '$itusx_dari'");
									$rtuse = mysqli_fetch_assoc($qtuse);
									$tuse_kd = nosql($rtuse['kd']);
									$tuse_no = nosql($rtuse['nomor']);
									$tuse_nm = balikin($rtuse['nama']);
									$tuse_tipe = nosql($rtuse['tipe']);
									$tuse_foto_path = "$sumber/filebox/profil/$tuse_kd/thumb-$tuse_kd.jpg";
	
									//nek null foto
									if (empty($tuse_foto_path))
										{
										$nilz_foto = "$sumber/img/foto_blank.jpg";
										}
									else
										{
										//gawe mini thumnail
										$nilz_foto = "$sumber/filebox/profil/$tuse_kd/thumb-$tuse_kd.jpg";
										}
	
									//jika bukan diri sendiri
									if ($itusx_dari != $kd1_session)
										{
										$nilku = "<strong>($tuse_tipe). $tuse_no. $tuse_nm</strong><br>";		
										}
									else
										{
										$nilku = "";		
										}
				
									echo '<table bgcolor="#EFF4FA" width="100%" border="0" cellspacing="3" cellpadding="0">
									<tr valign="top">
									<td width="50" valign="top">
									<img src="'.$nilz_foto.'" align="left" alt="'.$tuse_nm.'" width="50" height="50" class="img-thumbnail" border="1">
									</td>
									<td valign="top">
									<em>'.$itusx_msg.'. <br>
									'.$nilku.'
									['.$itusx_postdate.'].</em>
									</td>
									</tr>
									</table>
									<hr>';
									}
								while ($ritusx = mysqli_fetch_assoc($qitusx));
	
								echo '</td>
								</tr>
								</table>';
								}
	
							//jika tidak ada msg
							else
								{
								echo '<p>
								<font color="blue"><strong>TIDAK ADA KOMENTAR</strong></font>
								</p>';
								}
							}
	
						//jika beri komentar
						else if (($bk == "artikel") AND ($artkd == $dt_kd))
							{
							//jika batal
							if ($_POST['btnBTL'])
								{
								//nilai
								$artkd = nosql($_POST['artkd']);
								$page = nosql($_POST['page']);
	
								//re-direct
								$ke = "$filenya&page=$page&s=view&artkd=$artkd#$artkd";
								xloc($ke);
								exit();
								}
	
	
							//jika simpan
							if ($_POST['btnSMPx'])
								{
								//nilai
								$bk_artikel = cegah($_POST['bk_artikel']);
								$artkd = nosql($_POST['artkd']);
								$page = nosql($_POST['page']);
	
								//query
								mysqli_query($koneksi, "INSERT INTO guru_mapel_artikel_msg(kd, kd_guru_mapel_artikel, dari, msg, postdate) VALUES ".
												"('$x', '$artkd', '$kd1_session', '$bk_artikel', '$today')");
	
								//re-direct
								$ke = "$filenya&page=$page&s=view&artkd=$artkd#$artkd";
								xloc($ke);
								exit();
								}
	
	
							//view
							echo '<br>
							<textarea name="bk_artikel" rows="5" wrap="virtual" class="btn-block"></textarea>
							<br>
							<input name="artkd" type="hidden" value="'.$artkd.'">
							<input name="bk" type="hidden" value="'.$bk.'">
							<input name="page" type="hidden" value="'.$page.'">
							<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">
							<input name="btnSMPx" type="submit" value="KIRIM >>" class="btn btn-danger">';
							}
	
						echo '<hr>
						</td>
						</tr>';
				  		}
					while ($data = mysqli_fetch_assoc($result));
	
					echo '</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="3">
				    	<tr>
					<td align="right">
					<hr>
					<font color="#FF0000"><strong>'.$count.'</strong></font> Data '.$pagelist.'
					<hr>
					</td>
				    	</tr>
					</table>';
					}
				else
					{
					echo '<div class="alert alert-danger alert-dismissible">
	                <h4><i class="icon fa fa-ban"></i> ERROR...!!</h4>
	                TIDAK ADA ARTIKEL.
	                </div>';
					}
	
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
$ketnya = "Menu Artikel";
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
							


//insert
$xyz = md5("$kd1_session$today");
mysqli_query($koneksi, "INSERT INTO user_blog_status(kd, kd_user, user_tipe, ".
				"user_kode, user_nama, status, ".
				"onlineya, ipnya, postdate) VALUES ".
				"('$xyz', '$kd1_session', '$tipe_session', ".
				"'$no1_session', '$nm1_session', '$judul', ".
				"'YA', '$ipnya', '$today');");
//online terakhir ////////////////////////////////////////////////////////////////////////////////
		

		
		
		
		

//online terakhir ////////////////////////////////////////////////////////////////////////////////
$ipnya = get_client_ip_env();
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm. [GURU : $pel_guru]. [ARTIKEL].";
							


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