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
$tankd = nosql($_REQUEST['tankd']);
$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}

$filenya = "tanya.php?gmkd=$gmkd&page=$page";



//focus
$diload = "document.formx.tanya.focus();";




//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika hapus
if ($s == "hapus")
	{
	//nilai
	$tkd = nosql($_REQUEST['tkd']);
	$gmkd = nosql($_REQUEST['gmkd']);

	//hapus
	mysqli_query($koneksi, "DELETE FROM guru_mapel_tanya ".
					"WHERE kd_guru_mapel = '$gmkd' ".
					"AND kd = '$tkd'");

	//re-direct
	$ke = "tanya.php?gmkd=$gmkd";
	xloc($ke);
	exit();
	}





//nek simpan tanya
if ($_POST['btnSMP'])
	{
	//nilai
	$s = nosql($_REQUEST['s']);
	$gmkd = nosql($_REQUEST['gmkd']);
	$tanya = cegah($_REQUEST['tanya']);

	//cek
	if (empty($tanya))
		{
		//re-direct
		$pesan = "Input Pertanyaan Tidak Lengkap. Harap Diperhatikan...!!";
		$ke = "tanya.php?gmkd=$gmkd&s=tanya";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//insert
		mysqli_query($koneksi, "INSERT INTO guru_mapel_tanya(kd, kd_guru_mapel, dari, ".
						"user_kode, user_nama, tanya, postdate) VALUES ".
						"('$x', '$gmkd', '$kd1_session', ".
						"'$no1_session', '$nm1_session', '$tanya', '$today')");

		//re-direct
		$ke = "tanya.php?gmkd=$gmkd";
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
		$filenya = "tanya.php?gmkd=$gmkd";
		$juduli = $judul;


		//judul
		echo "<h3>$judul</h3>";

		//menu elearning
		require("i_menu.php");

		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-success">
	        <div class="box-header">
	
	          <h3 class="box-title">TANYA JAWAB</h3>
	          
	          (<a href="'.$filenya.'&s=tanya" title="Tanya / Konsultasi">Tulis Tanya/Konsultasi</a>)
	        </div>
	        
	        
	        <div class="box-body">';


				//jika jawab
				if ($s == "tanya")
					{
					echo '<strong>Pertanyaan / Konsultasi :</strong>
					<br>
					<textarea name="tanya" rows="10" wrap="virtual" class="btn-block"></textarea>
					<br>
					<input name="gmkd" type="hidden" value="'.$gmkd.'">
					<input name="s" type="hidden" value="'.$s.'">
					<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">
					<input name="btnSMP" type="submit" value="KIRIM >>" class="btn btn-danger">';
					}
		
				//jika daftar tanya
				else
					{
					//query
					$p = new Pager();
					$start = $p->findStart($limit);
		
					$sqlcount = "SELECT * FROM guru_mapel_tanya ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"AND dari = '$kd1_session' ".
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
		
							//jika null
							if (empty($d_jawaban))
								{
								$d_jawaban = "<font color='red'>-masih nunggu jawaban dari Bapak/Ibu Guru-</font>";
								}
		
		
							echo "<tr valign=\"top\" onmouseover=\"this.bgColor='$e_warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
							echo '<td>
							<p>
							<strong>'.$d_tanya.'</strong>
							<br>
		
							Jawaban :
							<br>
							<em>'.$d_jawaban.'</em>
							<br>
							<br>
		
							<em>[Postdate : '.$d_postdate.'].</em>
							[<a href="'.$filenya.'&s=hapus&tkd='.$d_kd.'" title="Hapus..."><img src="'.$sumber.'/img/delete.gif" width="16" height="16" border="0"></a>]
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
						echo '<div class="alert alert-danger alert-dismissible">
		                <h4><i class="icon fa fa-ban"></i> ERROR...!!</h4>Belum Ada Data Pertanyaan. Silahkan Bertanya / Konsultasi. . .
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm. [GURU : $pel_guru]. [TANYA JAWAB].";
							


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