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
$gmkd = nosql($_REQUEST['gmkd']);
$tankd = nosql($_REQUEST['tankd']);
$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}

$filenya = "tanya.php?gmkd=$gmkd&page=$page";



//focus...
$diload = "document.formx.jawaban.focus();";




//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika batal
if ($_POST['btnBTL'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);
	$tankd = nosql($_POST['tankd']);
	$page = nosql($_POST['page']);

	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//re-direct
	$ke = $filenya;
	xloc($ke);
	exit();
	}





//jika jawab
if ($_POST['btnSMP'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);
	$tankd = nosql($_POST['tankd']);
	$s = nosql($_POST['s']);
	$jawaban = cegah2($_POST['jawaban']);
	$page = nosql($_POST['page']);

	//cek
	if (empty($jawaban))
		{
		//diskonek
		xfree($qbw);
		xclose($koneksi);

		//re-direct
		$pesan = "Jawaban Belum Diberikan. Harap Diperhatikan.";
		$ke = "$filenya&s=jawab&tankd=$tankd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//update
		mysqli_query($koneksi, "UPDATE guru_mapel_tanya SET jawaban = '$jawaban', ".
						"postdate = '$today' ".
						"WHERE kd_guru_mapel = '$gmkd' ".
						"AND kd = '$tankd'");

		//diskonek
		xfree($qbw);
		xclose($koneksi);

		//re-direct
		$ke = $filenya;
		xloc($ke);
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
		$filenya = "tanya.php?gmkd=$gmkd";
		$juduli = $judul;


		//judul
		xheadline($judul);

		//menu elearning
		require("i_menu.php");


		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">TANYA JAWAB</h3>
	        </div>
	        
	        
	        <div class="box-body">';

		
		
				//jika jawab
				if ($s == "jawab")
					{
					//query
					$qtya = mysqli_query($koneksi, "SELECT * FROM guru_mapel_tanya ".
											"WHERE kd_guru_mapel = '$gmkd' ".
											"AND kd = '$tankd'");
					$rtya = mysqli_fetch_assoc($qtya);
					$ttya = mysqli_num_rows($qtya);
					$tya_uskode = balikin($rtya['user_kode']);
					$tya_usnama = balikin($rtya['user_nama']);
					$tya_tanya = balikin($rtya['tanya']);
					$tya_jawaban = balikin($rtya['jawaban']);
					$tya_postdate = $rtya['postdate'];
		
					//cek
					if (empty($tya_jawaban))
						{
						$tya_jwb = "-";
						}
					else
						{
						$tya_jwb = $tya_jawaban;
						}
		
					echo '<p>
					<font color="blue"><strong><em>'.$tya_tanya.'</em></strong></font>
					<br>
					[<em>Postdate : '.$tya_postdate.'</em>]. ['.$tya_uskode.'. '.$tya_usnama.'].
					</p>
					<br>
		
					<p>
					<strong>Jawaban Sebelumnya :</strong>
					<br>
					<em>'.$tya_jwb.'</em>
					</p>
					<br>
		
					<p>
					<strong>Jawaban :</strong>
					<br>
					<textarea name="jawaban" rows="10" class="btn-block" wrap="virtual"></textarea>
					</p>
					<br>
					
					<p>
					<input name="gmkd" type="hidden" value="'.$gmkd.'">
					<input name="tankd" type="hidden" value="'.$tankd.'">
					<input name="s" type="hidden" value="'.$s.'">
					<input name="page" type="hidden" value="'.$page.'">
					<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">
					<input name="btnSMP" type="submit" value="SIMPAN >>" class="btn btn-danger">
					</p>';
					}
		
				//jika daftar tanya
				else
					{
					//query
					$p = new Pager();
					$start = $p->findStart($limit);
		
					$sqlcount = "SELECT * FROM guru_mapel_tanya ".
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
		
							$d_kd = nosql($data['kd']);
							$d_tanya = balikin($data['tanya']);
							$d_jawaban = balikin($data['jawaban']);
							$d_postdate = $data['postdate'];
		
							//cek
							if (empty($d_jawaban))
								{
								$d_jwb = "<a href=\"$filenya&tankd=$d_kd&s=jawab\" class=\"btn btn-danger\">BERI JAWABAN >></a>";
								}
							else
								{
								$d_jwb = "<font color=\"blue\"><strong>TELAH DIJAWAB</strong></font>. <br> <a href=\"$filenya&tankd=$d_kd&s=jawab\" class=\"btn btn-danger\">UBAH JAWABAN >></a>";
								}
		
							echo "<tr valign=\"top\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
							echo '<td>
							<p>
							<em>'.$d_tanya.'</em>
							<br>
							[Postdate : '.$d_postdate.'].
							</p>
							
							<p>
							'.$d_jwb.'
							</p>
							<hr>
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
						<hr>
						</td>
					    	</tr>
						</table>';
						}
					else
						{
						echo '<p>
						<font color="blue"><strong>Tidak Ada Yang Bertanya. Mungkin Lain Waktu...</strong></font>
						</p>';
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
		$ke = "../index.php";
		pekem($pesan,$ke);
		exit();
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//masukin ke log mapel guru ////////////////////////////////////////////////////////////////////////////////
$ketnya = "Menu Tanya Jawab";
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [TANYA JAWAB].";
							


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