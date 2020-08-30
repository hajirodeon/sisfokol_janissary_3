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
require("../../inc/cek/e_gr.php");
require("../../inc/class/paging.php");
require("../../inc/class/pagingx.php");
$tpl = LoadTpl("../../template/egr.html");

nocache;

//nilai
$s = nosql($_REQUEST['s']);
$a = nosql($_REQUEST['a']);
$stkd = nosql($_REQUEST['stkd']);
$bk = nosql($_REQUEST['bk']);
$msgkd = nosql($_REQUEST['msgkd']);
$gmkd = nosql($_REQUEST['gmkd']);
$filenya = "forum.php?gmkd=$gmkd";
$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}

//focus...
if (empty($bk))
	{
	$diload = "document.formx.topik.focus();";
	}

//beri komentar...
else if ($bk == "topik")
	{
	$diload = "document.formx.bk_topik.focus();";
	}


//nek enter, ke simpan
$x_enter = 'onKeyDown="var keyCode = event.keyCode;
if (keyCode == 13)
	{
	document.formx.btnSMP.focus();
	}"';





//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika hapus
if (($s == "hapus") AND (!empty($stkd)))
	{
	//hapus topik
	mysqli_query($koneksi, "DELETE FROM guru_mapel_forum ".
					"WHERE kd_guru_mapel = '$gmkd' ".
					"AND kd = '$stkd'");

	//hapus msg
	mysqli_query($koneksi, "DELETE FROM guru_mapel_forum_msg ".
					"WHERE kd_guru_mapel_forum = '$stkd'");

	//re-direct
	xloc($filenya);
	exit();
	}





//nek batal
if ($_POST['btnBTL'])
	{
	//re-direct
	xloc($filenya);
	exit();
	}





//nek simpan
if ($_POST['btnSMP'])
	{
	//nilai
	$topik = cegah2($_POST['topik']);

	//cek
	if (empty($topik))
		{
		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		pekem($pesan,$filenya);
		exit();
		}
	else
		{
		//query
		mysqli_query($koneksi, "INSERT INTO guru_mapel_forum(kd, kd_guru_mapel, topik, postdate) VALUES ".
						"('$x', '$gmkd', '$topik', '$today')");

		//re-direct
		xloc($filenya);
		exit();
		}
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

require("../../inc/js/jumpmenu.js");
require("../../inc/js/swap.js");


//view : guru ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika belum pilih mapel
if (empty($gmkd))
	{
	//re-direct
	$ke = "../index.php";
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
	
	
	//jika iya
	if ($tpel != 0)
		{
		//nilai
		$judul = " [$pel_tapel. $pel_kelas]. $pel_nm";
		$judulku = "[$tipe_session : $no1_session.$nm1_session] ==> $judul";
		$filenya = "forum.php?gmkd=$gmkd";
		$juduli = $judul;


		//judul
		echo '<h3>'.$judul.'</h3>';


		//menu elearning
		require("i_menu.php");



		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">FORUM</h3>
	        </div>
	        
	        
	        <div class="box-body">

			
			<div class="row">
				    <div class="col-lg-6">

						<p>
						Topik :
						<br>
						<input name="topik" type="text" value="" class="btn-block">
						</p>
						<br>
						
						<p>
						<input name="gmkd" type="hidden" value="'.$gmkd.'">
						<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">
						<input name="btnSMP" type="submit" value="SIMPAN >>" class="btn btn-danger">
						</p>
					</div>
				</div>
				
				<br>';
			
				//query
				$p = new Pager();
				$start = $p->findStart($limit);
			
				$sqlcount = "SELECT guru_mapel_forum.*, guru_mapel_forum.kd AS fkd ".
								"FROM guru_mapel_forum ".
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
			
						$i_fkd = nosql($data['fkd']);
						$i_topik = balikin($data['topik']);
						$i_postdate = $data['postdate'];
			
						//jumlah komentar
						$qitusx = mysqli_query($koneksi, "SELECT * FROM guru_mapel_forum_msg ".
													"WHERE kd_guru_mapel_forum = '$i_fkd' ".
													"ORDER BY postdate ASC");
						$ritusx = mysqli_fetch_assoc($qitusx);
						$titusx = mysqli_num_rows($qitusx);
			
						echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
						echo '<td valign="top">
						<br>
						<a name="'.$i_fkd.'"></a>
						<big><strong>'.$i_topik.'</strong></big>
						<br>
						[<em>'.$i_postdate.'</em>].
						<br>
						[<a href="'.$filenya.'&page='.$page.'&s=view&stkd='.$i_fkd.'#'.$i_fkd.'" title="('.$titusx.') Komentar">(<strong>'.$titusx.'</strong>) Komentar</a>].
						[<a href="'.$filenya.'&page='.$page.'&bk=topik&stkd='.$i_fkd.'#'.$i_fkd.'" title="Beri Komentar">Beri Komentar</a>].
						<br>
						
						<a href="'.$filenya.'&page='.$page.'&s=hapus&stkd='.$i_fkd.'" title="HAPUS" class="btn btn-danger">HAPUS >></a>
						<br>
						<br>';
			
						//jika view
						if (($s == "view") AND ($stkd == $i_fkd))
							{
							//jika hapus
							if ($a == "hapus")
								{
								//hapus
								mysqli_query($koneksi, "DELETE FROM guru_mapel_forum_msg ".
												"WHERE kd_guru_mapel_forum = '$stkd' ".
												"AND kd = '$msgkd'");
			
								//re-direct
								$ke = "$filenya&page=$page&s=view&stkd=$i_fkd#$i_fkd";
								xloc($ke);
								exit();
								}
			
			
			
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
										$nilz_foto = "$sumber/filebox/profil/$tuse_kd/thumb-$tuse_kd.jpg";
										}
			
			
									//jika bukan diri sendiri...
									if ($tuse_kd != $kd1_session)
										{
										$nilku = "<strong>($tuse_tipe). $tuse_no. $tuse_nm</strong><br>";
										}
									else
										{
										$nilku = "";
										}
										
			
									echo '<table bgcolor="'.$e_warna02.'" width="100%" border="0" cellspacing="3" cellpadding="0">
									<tr valign="top">
									<td width="50" valign="top">
									<img src="'.$nilz_foto.'" align="left" alt="'.$tuse_nm.'" width="50" height="50" class="img-thumbnail" border="1">
									</td>
									<td valign="top">
									<em>'.$itusx_msg.'. 
									<br>
									'.$nilku.'
									['.$itusx_postdate.'].</em>
									[<a href="'.$filenya.'&page='.$page.'&s=view&stkd='.$i_fkd.'&a=hapus&msgkd='.$itusx_kd.'"><img src="'.$sumber.'/img/delete.gif" width="16" height="16" border="0"></a>].
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
								echo '<br>
								<font color="blue"><strong>TIDAK ADA KOMENTAR</strong></font>';
								}
							}
			
			
						//jika beri komentar
						else if (($bk == "topik") AND ($stkd == $i_fkd))
							{
							//jika batal
							if ($_POST['btnBTL'])
								{
								//nilai
								$stkd = nosql($_POST['stkd']);
								$page = nosql($_POST['page']);
								$gmkd = nosql($_POST['gmkd']);
			
			
								//re-direct
								$ke = "$filenya&page=$page&s=view&stkd=$stkd#$stkd";
								xloc($ke);
								exit();
								}
			
			
							//jika simpan
							if ($_POST['btnSMP1'])
								{
								//nilai
								$bk_topik = cegah($_POST['bk_topik']);
								$stkd = nosql($_POST['stkd']);
								$page = nosql($_POST['page']);
								$gmkd = nosql($_POST['gmkd']);
			
								//query
								mysqli_query($koneksi, "INSERT INTO guru_mapel_forum_msg(kd, kd_guru_mapel_forum, dari, msg, postdate) VALUES ".
													"('$x', '$stkd', '$kd1_session', '$bk_topik', '$today')");
			
								//re-direct
								$ke = "$filenya&page=$page&s=view&stkd=$stkd#$stkd";
								xloc($ke);
								exit();
								}
			
			
							//view
							echo '<br>
							<textarea name="bk_topik" rows="5" wrap="virtual" class="btn-block"></textarea>
							<br>
							<input name="stkd" type="hidden" value="'.$stkd.'">
							<input name="bk" type="hidden" value="'.$bk.'">
							<input name="page" type="hidden" value="'.$page.'">
							<input name="gmkd" type="hidden" value="'.$gmkd.'">
							<input name="btnSMP1" type="submit" value="SIMPAN" class="btn btn-danger">
							<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">';
							}
			
						echo '<hr></td>
						</tr>';
				  		}
					while ($data = mysqli_fetch_assoc($result));
			
					echo '</table>
					  
					<table width="100%" border="0" cellspacing="0" cellpadding="3">
				    <tr>
					<td align="right">
					<hr>
					<font color="blue"><strong>'.$count.'</strong></font> Data '.$pagelist.'
					</td>
				    </tr>
					</table>';
					}
				else
					{
					echo '<p>
					<font color="blue"><strong>Belum Ada Topik Forum. Silahkan Entry Dahulu...!!</strong></font>
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
		$ke = "../index.php";
		pekem($pesan,$ke);
		exit();
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////






//masukin ke log mapel guru ////////////////////////////////////////////////////////////////////////////////
$ketnya = "Menu Forum";
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [FORUM].";
							


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