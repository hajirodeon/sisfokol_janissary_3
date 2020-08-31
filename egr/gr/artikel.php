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
$tpl = LoadTpl("../../template/egr.html");

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






//nilai
$path1 = "../../filebox/artikel/$gmkd";

//cek, sudah ada belum
if (!file_exists($path1))
	{
	mkdir("$path1", 0777);
	}

$firma_slug = "/$gmkd"; 
$nilku = $_SERVER['REQUEST_URI'];

//pecah
$nilku2 = explode("/", $nilku);
$nilku21 = $nilku2[1];


$_SESSION["myRoxySession"] = "/$nilku21/filebox/artikel".$firma_slug;













//focus
if (($s == "baru") OR ($s == "edit"))
	{
	$diload = "document.formx.kategorix.focus();";
	}

else if ($bk == "artikel")
	{
	$diload = "document.formx.bk_artikel.focus();";
	}



//proses : GURU /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//bikin folder
//jika baru
if ($s == "baru")
	{
	//nilai
	$path1 = "../../filebox/artikel/$artkd";

	//cek, sudah ada belum
	if (!file_exists($path1))
		{
		mkdir("$path1", 0777);
		}
	}



//jika hapus
if (($s == "hapus") AND (!empty($artkd)))	
	{
	//nilai
	$page = nosql($_REQUEST['page']);

	//del data
	mysqli_query($koneksi, "DELETE FROM guru_mapel_artikel ".
					"WHERE kd = '$artkd'");


	//query
	$qcc = mysqli_query($koneksi, "SELECT * FROM guru_mapel_artikel_filebox ".
							"WHERE kd_guru_mapel_artikel = '$artkd'");
	$rcc = mysqli_fetch_assoc($qcc);

	do
		{
		//hapus file
		$cc_filex = $rcc['filex'];
		$path1 = "../../filebox/artikel/$artkd/$cc_filex";
		unlink ($path1);
		}
	while ($rcc = mysqli_fetch_assoc($qcc));

	//hapus query
	mysqli_query($koneksi, "DELETE FROM guru_mapel_artikel_filebox ".
					"WHERE kd_guru_mapel_artikel = '$artkd'");

	//nek $artkd gak null
	if (!empty($artkd))
		{
		//hapus folder
		$path2 = "../../filebox/artikel/$artkd";
		delete ($path2);
		}

	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//auto-kembali
	$filenya = "artikel.php?gmkd=$gmkd";
	xloc($filenya);
	exit();
	}



//batal
if ($_POST['btnBTLx'])
	{
	//re-direct
	$filenya = "artikel.php?gmkd=$gmkd";
	xloc($filenya);
	exit();
	}



//nek simpan
if ($_POST['btnSMPx'])
	{
	//nilai
	$filenya = "artikel.php?gmkd=$gmkd";
	$s = nosql($_POST['s']);
	$artkd = nosql($_POST['artkd']);
	$kategorix = nosql($_POST['kategorix']);
	$judulx = cegah($_POST['judulx']);
	$rangkumanx = cegah2($_POST['rangkumanx']);
	$isix = cegah2($_POST['editor']);

	//cek null
	if ((empty($kategorix)) OR (empty($judulx)) OR (empty($rangkumanx)) OR (empty($isix)))
		{
		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diperhatikan...!!";
		$ke = "$filenya&s=baru&artkd=$artkd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//nek baru
		if ($s == "baru")
			{
			//cek
			$qcc = mysqli_query($koneksi, "SELECT guru_mapel_artikel.*, guru_mapel_artikel.kd AS nkd ".
									"FROM guru_mapel_artikel ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"AND kategori = '$kategorix' ".
									"AND judul = '$judulx'");
			$rcc = mysqli_fetch_assoc($qcc);
			$tcc = mysqli_num_rows($qcc);

			//nek iya
			if ($tcc != 0)
				{
				//re-direct
				$pesan = "Artikel Tersebut Sudah Ada. Silahkan Ganti Yang Lain...!!";
				$ke = "$filenya&s=baru";
				pekem($pesan,$ke);
				exit();
				}
			else
				{
				//insert
				mysqli_query($koneksi, "INSERT INTO guru_mapel_artikel(kd, kd_guru_mapel, kategori, judul, rangkuman, isi, postdate) VALUES ".
								"('$artkd', '$gmkd', '$kategorix', '$judulx', '$rangkumanx', '$isix', '$today')");

				//re-direct
				xloc($$filenya);
				exit();
				}
			}

		//nek edit
		if ($s == "edit")
			{
			//update
			mysqli_query($koneksi, "UPDATE guru_mapel_artikel SET kategori = '$kategorix', ".
							"judul = '$judulx', ".
							"rangkuman = '$rangkumanx', ".
							"isi = '$isix' ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND kd = '$artkd'");

			//diskonek
			xfree($qbw);
			xclose($koneksi);

			//re-direct
			xloc($filenya);
			exit();
			}
		}
	}
//proses : GURU /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





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
require("../../inc/js/openwindow.js");


?>

	
		
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  



<script type="text/javascript" src="../../inc/class/ckeditor/ckeditor.js"></script>



<?php


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
	$qpel = mysqli_query($koneksi, "SELECT guru_mapel.* ".
							"FROM guru_mapel ".
							"WHERE user_kode = '$no1_session' ".
							"AND kd = '$gmkd'");
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
		$filenya = "artikel.php?gmkd=$gmkd";
		$juduli = $judul;

		echo '<h3>'.$judul.'</h3>';


		//menu elearning
		require("i_menu.php");

		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">ARTIKEL</h3>
	        </div>
	        
	        
	        <div class="box-body">';

			//daftar artikel
			echo '<a href="'.$filenya.'&s=baru&artkd='.$x.'" title="Entry Baru" class="btn btn-danger">Entry Baru >></a>
			<hr>';
		
			//jika baru atau edit //////////////////////////////////////////////////////////////////////////
			if (($s == "edit") OR ($s == "baru"))
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
				$qkat = mysqli_query($koneksi, "SELECT * FROM guru_mapel_kategori ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"ORDER BY kategori ASC");
				$rkat = mysqli_fetch_assoc($qkat);
		
		
				//view
				echo '<p>
				<strong>Kategori :</strong>
				<br>
				<select name="kategorix">
				<option value="'.$dt_katkd.'" selected>'.$dt_katkd.'</option>';
		
				do
					{
					//nilai
					$kat_kd = nosql($rkat['kd']);
					$kat_katx = cegah($rkat['kategori']);
					$kat_kat = balikin($rkat['kategori']);
		
					echo '<option value="'.$kat_katx.'">'.$kat_kat.'</option>';
					}
				while ($rkat = mysqli_fetch_assoc($qkat));
		
				echo '</select>
				</p>
				<br>
		
				<p>
				<strong>Judul :</strong>
				<br>
				<input name="judulx" type="text" value="'.$dt_judul.'" class="btn-block">
				</p>
				<br>
		
				<p>
				<strong>Rangkuman (Max 3kalimat) : </strong>
				<br>
				<textarea name="rangkumanx" rows="5" wrap="virtual" class="btn-block">'.$dt_rangkuman.'</textarea>
				</p>
				<br>
		
				<p>
				<strong>Isi Artikel : </strong>
				<br>
		
				<textarea id="editor" name="editor" rows="20" style="width: 100%" class="btn-block">'.$dt_isi.'</textarea>
				</p>
				<br>
		
				<p>
				<input name="s" type="hidden" value="'.$s.'">
				<input name="artkd" type="hidden" value="'.$artkd.'">
				<input name="btnBTLx" type="submit" value="BATAL" class="btn btn-primary">
				<input name="btnSMPx" type="submit" value="SIMPAN >>" class="btn btn-danger">
				</p>';
				
									
				?>
				
				
					
				<script type="text/javascript">
				//<![CDATA[
				var roxyFileman = '<?php echo $sumber;?>/inc/class/ckeditor/plugins/fileman/index.html';
				 
				$(function(){
			    CKEDITOR.replace( 'editor',{filebrowserBrowseUrl:roxyFileman,
			                         filebrowserImageBrowseUrl:roxyFileman+'?type=image',
			                         removeDialogTabs: 'link:upload;image:upload'}); 
				});
				
				
			
				//]]>
				</script>
				
				<?php
				
				}
		
			//jika daftar //////////////////////////////////////////////////////////////////////////////////
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
		
		
						//jumlah komentar
						$qitusx = mysqli_query($koneksi, "SELECT * FROM guru_mapel_artikel_msg ".
													"WHERE kd_guru_mapel_artikel = '$dt_kd' ".
													"ORDER BY postdate ASC");
						$ritusx = mysqli_fetch_assoc($qitusx);
						$titusx = mysqli_num_rows($qitusx);
		
						echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
						echo '<td valign="top">
						<br>
						<a name="'.$dt_kd.'"></a>
						<big><strong>'.$dt_judul.'</strong></big>
						<br>
						<em>'.$dt_rangkuman.'</em>
						<br>
						<br>
						[<em>Kategori : <strong>'.$dt_katkd.'</strong></em>].
						[<em>'.$dt_postdate.'</em>].
						<br>
						[<a href="'.$filenya.'&page='.$page.'&s=view&artkd='.$dt_kd.'#'.$dt_kd.'" title="('.$titusx.') Komentar">(<strong>'.$titusx.'</strong>) Komentar</a>].
						[<a href="'.$filenya.'&page='.$page.'&bk=artikel&artkd='.$dt_kd.'#'.$dt_kd.'" title="Beri Komentar">Beri Komentar</a>].
						<br>
						<a href="'.$filenya.'&s=edit&artkd='.$dt_kd.'" class="btn btn-success">EDIT</a> 
						<a href="'.$filenya.'&s=hapus&artkd='.$dt_kd.'" class="btn btn-danger">HAPUS</a>';
		
						//jika view
						if (($s == "view") AND ($artkd == $dt_kd))
							{
							//jika hapus
							if ($a == "hapus")
								{
								//hapus
								mysqli_query($koneksi, "DELETE FROM guru_mapel_artikel_msg ".
												"WHERE kd_guru_mapel_artikel = '$artkd' ".
												"AND kd = '$msgkd'");
		
								//re-direct
								$ke = "$filenya&page=$page&s=view&artkd=$dt_kd#$dt_kd";
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
									[<a href="'.$filenya.'&page='.$page.'&s=view&artkd='.$dt_kd.'&a=hapus&msgkd='.$itusx_kd.'"><img src="'.$sumber.'/img/delete.gif" width="16" height="16" border="0"></a>].
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
							if ($_POST['btnSMP'])
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
							<input name="btnSMP" type="submit" value="SIMPAN" class="btn btn-danger">
							<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">';
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
					<font color="blue"><strong>'.$count.'</strong></font> Data '.$pagelist.'
					</td>
				    </tr>
					</table>';
					}
				else
					{
					echo '<p>
					<font color="blue"><strong>TIDAK ADA Artikel. Silahkan Entry Dahulu...!!</strong></font>
					</p>';
					}
		
				echo '</td>
		  		</tr>
				</table>';
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [ARTIKEL].";
							


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