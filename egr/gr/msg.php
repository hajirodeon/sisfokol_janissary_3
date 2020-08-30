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
$katkd = nosql($_REQUEST['katkd']);
$filenya = "msg.php?gmkd=$gmkd";

$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}
	
	

//focus...
$diload = "document.formx.msg.focus();";


//nek enter, ke simpan
$x_enter = 'onKeyDown="var keyCode = event.keyCode;
if (keyCode == 13)
	{
	document.formx.btnSMP.focus();
	}"';





//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika kirim
if ($_POST['btnKRM'])
	{
	//nilai
	$tapelnya = cegah($_POST['tapelnya']);
	$kelasnya = cegah($_POST['kelasnya']);
	$mapelnya = cegah($_POST['mapelnya']);
	$t_msg = cegah($_POST['t_msg']);


	//nek null
	if (empty($t_msg))
		{
		//nilai
		$pesan = "Input Tidak Lengkap. Harap Diperhatikan...!!";
		pekem($pesan,$filenya);
		exit();
		}
	else
		{
		//isi
		$isi_msg = "[$mapelnya]. $t_msg";

		//looping teman
		$qtku = mysqli_query($koneksi, "SELECT * FROM m_user ".
					"WHERE tapel_nama = '$tapelnya' ".
					"AND kelas_nama = '$kelasnya' ".
					"AND tipe = 'SISWA' ".
					"ORDER BY nama ASC");
		$rtku = mysqli_fetch_assoc($qtku);
		$ttku = mysqli_num_rows($qtku);

		//jika ada
		if ($ttku != 0)
			{
			do
				{
				$tno = $tno + 1;
				$xyz = md5("$x$tno");
				$tk_uskd = nosql($rtku['kd']);
				$tk_ustipe = cegah($rtku['tipe']);
				$tk_usno = cegah($rtku['nomor']);
				$tk_usnama = cegah($rtku['nama']);

				//query
				mysqli_query($koneksi, "INSERT INTO user_blog_msg(kd, kd_guru_mapel, tapel, kelas, kd_user, user_tipe, user_kode, user_nama, ".
								"untuk, uuser_tipe, uuser_kode, uuser_nama, msg, postdate) VALUES ".
								"('$xyz', '$gmkd', '$tapelnya', '$kelasnya', '$kd1_session', '$tipe_session', '$no1_session', '$nm1_session', ".
								"'$tk_uskd', '$tk_ustipe', '$tk_usno', '$tk_usnama', '$isi_msg', '$today')");
				}
			while ($rtku = mysqli_fetch_assoc($qtku));
			}

		//re-direct
		$pesan = "Message Berhasil Dikirim, Untuk Semua Siswa Kelas ini.";
		pekem($pesan,$filenya);
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
		$filenya = "msg.php?gmkd=$gmkd";
		$juduli = $judul;


		//judul
		echo '<h3>'.$judul.'</h3>';



		//menu elearning
		require("i_menu.php");



		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">BroadCast Pesan</h3>
	        </div>
	        
	        
	        <div class="box-body">

		
				<table width="100%" border="0" cellspacing="0" cellpadding="3">
				<tr valign="top">
				<td>
				<textarea name="t_msg" rows="5" class="btn-block" wrap="virtual"></textarea>
				<br>
				<INPUT type="hidden" name="tapelnya" value="'.$pel_tapel.'">
				<INPUT type="hidden" name="kelasnya" value="'.$pel_kelas.'">
				<INPUT type="hidden" name="mapelnya" value="'.$pel_nm.'">
				<input name="btnKRM" type="submit" value="KIRIM" class="btn btn-danger">
				<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">
				<br><br><br>
				</td>
				</tr>
				</table>
				<br>
				
				<hr>
				<h3>
				PESAN TERKIRIM KEPADA SEMUA SISWA DALAM KELAS INI
				</h3>
				<hr>';
				




				//query
				$p = new Pager();
				$start = $p->findStart($limit);
		
				$sqlcount = "SELECT * FROM user_blog_msg ".
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
						$dt_uuser_kode = balikin($data['uuser_kode']);
						$dt_uuser_nama = balikin($data['uuser_nama']);
						$dt_msg = balikin($data['msg']);
						$dt_dibaca = balikin($data['dibaca']);
						$dt_dibaca_postdate = balikin($data['dibaca_postdate']);
						$dt_postdate = balikin($data['postdate']);
		

						echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
						echo '<td valign="top">
						<em>'.$dt_postdate.'</em>

						<p>						
						Kepada : <b>'.$dt_uuser_kode.'. '.$dt_uuser_nama.'</b>
						</p>
						<br>
						
						<p>	
						<i>'.$dt_msg.'</i>
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
					</td>
				    </tr>
					</table>';
					}
				else
					{
					echo '<p>
					<font color="blue"><strong>TIDAK ADA PESAN TERKIRIM. Silahkan Entry Dahulu...!!</strong></font>
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
$ketnya = "Menu BroadCast Pesan";
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [BROADCAST PESAN].";
							


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