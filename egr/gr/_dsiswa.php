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
$filenya = "dsiswa.php?gmkd=$gmkd";
$utgl = nosql($_REQUEST['utgl']);
$ubln = nosql($_REQUEST['ubln']);
$uthn = nosql($_REQUEST['uthn']);




//jika null, kasi hari ini
if (empty($utgl))
	{
	//re-direct
	$ke = "$filenya&s=$s&utgl=$tanggal&ubln=$bulan&uthn=$tahun";
	xloc($ke);
	exit();
	}




$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}





//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika batal
if ($_POST['btnBTL'])
	{
	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//re-direct
	xloc($filenya);
	exit();
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




//isi *START
ob_start();

require("../../inc/js/jumpmenu.js");
require("../../inc/js/swap.js");
require("../../inc/js/checkall.js");



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
		$filenya = "dsiswa.php?gmkd=$gmkd";
		$juduli = $judul;

		echo '<h3>'.$judul.'</h3>';
	
	
		//menu
		require("i_menu.php");
	
			
		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">KEHADIRAN SISWA</h3>
	        </div>
	        
	        
	        <div class="box-body">
	        
				<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
				<tr>
				<td>';
				echo "<select name=\"utglx\" onChange=\"MM_jumpMenu('self',this,0)\" class=\"btn btn-warning\">";
				echo '<option value="'.$utgl.'">'.$utgl.'</option>';
				for ($itgl=1;$itgl<=31;$itgl++)
					{
					echo '<option value="'.$filenya.'&utgl='.$itgl.'">'.$itgl.'</option>';
					}
				echo '</select>';
				
				echo "<select name=\"ublnx\" onChange=\"MM_jumpMenu('self',this,0)\" class=\"btn btn-warning\">";
				echo '<option value="'.$ubln.''.$uthn.'" selected>'.$arrbln[$ubln].' '.$uthn.'</option>';
				
				for ($i=1;$i<=12;$i++)
					{
					$ibln = $i;
					$ithn = $tahun;
				
					echo '<option value="'.$filenya.'&utgl='.$utgl.'&ubln='.$ibln.'&uthn='.$ithn.'">'.$arrbln[$ibln].' '.$ithn.'</option>';
					}
				
				for ($i=1;$i<=12;$i++)
					{
					$ibln = $i;
					$ithn = $tahun - 1;
				
				
					echo '<option value="'.$filenya.'&utgl='.$utgl.'&ubln='.$ibln.'&uthn='.$ithn.'">'.$arrbln[$ibln].' '.$ithn.'</option>';
					}
				
				echo '</select>
						
				</td>
				</tr>
				</table>
				<br>';


				//query
				$p = new Pager();
				$start = $p->findStart($limit);
			
				$sqlcount = "SELECT * FROM m_user ".
								"WHERE tipe = 'SISWA' ".
								"AND tapel_nama = '$pel_tapel2' ".
								"AND kelas_nama = '$pel_kelas2' ".
								"ORDER BY nama ASC";
				$sqlresult = $sqlcount;
			
			
				$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
				$pages = $p->findPages($count, $limit);
				$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
				$target = "$filenya&&utgl=$utgl&ubln=$ubln&uthn=$uthn";
				$pagelist = $p->pageList($_GET['page'], $pages, $target);
				$data = mysqli_fetch_array($result);
			
			
				//nek ada
				if ($count != 0)
					{
					echo '<div class="table-responsive">          
					  <table class="table" border="1">
					    <thead>
						<tr bgcolor="'.$warnaheader.'">
						<td width="50" valign="top"><strong>NIS</strong></td>
						<td valign="top"><strong>NAMA</strong></td>
						<td width="200" valign="top"><strong>ONLINE TERAKHIR</strong></td>
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
		
						$kd = nosql($data['kd']);
						$enis = balikin($data['nomor']);
						$enama = balikin($data['nama']);
		
		
						//status online ato tidak
						$qku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_log ".
														"WHERE kd_guru_mapel = '$gmkd' ".
														"AND user_tipe = 'SISWA' ".
														"AND user_kode = '$enis' ".
														"AND round(DATE_FORMAT(postdate, '%d')) = '$utgl' ".
														"AND round(DATE_FORMAT(postdate, '%m')) = '$ubln' ".
														"AND round(DATE_FORMAT(postdate, '%Y')) = '$uthn' ".
														"ORDER BY postdate DESC LIMIT 0,1");
						$rku = mysqli_fetch_assoc($qku);
						$tku = mysqli_num_rows($qku);
						$ku_postdate = balikin($rku['postdate']);
		
		
						//jika ya
						if (!empty($tku))
							{
							$ku_onlinenyax = "<font color='green'>$ku_postdate</font>";
							}
						else
							{
							$ku_onlinenyax = "<font color='red'>Tidak</font>";
							}
							
							
							
							
						echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$e_warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
						echo '<td valign="top">
						'.$enis.'
						</td>
						<td valign="top">
						'.$enama.'
						</td>
						
						<td valign="top">
						'.$ku_onlinenyax.'
						</td>
						</tr>';
				  		}
					while ($data = mysqli_fetch_assoc($result));

		
					echo '</tbody>
					  </table>
					  </div>
					<table width="100%" border="0" cellspacing="0" cellpadding="3">
				    <tr>
					<td>
					<font color="blue"><strong>'.$count.'</strong></font> Data '.$pagelist.'
					</td>
				    </tr>
					</table>';
					}
				else
					{
					echo '<p>
					<font color="blue"><strong>TIDAK ADA DATA. Silahkan Entry Dahulu...!!</strong></font>
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
$ketnya = "Menu Daftar Siswa";
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [SISWA].";
							


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