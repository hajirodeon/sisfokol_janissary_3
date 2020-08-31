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

$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}
	
$kd = nosql($_REQUEST['kd']);
$kunci = cegah($_REQUEST['kunci']);
$kunci2 = balikin($_REQUEST['kunci']);
$skd = nosql($_REQUEST['skd']);
$jkd = nosql($_REQUEST['jkd']);
$kd = nosql($_REQUEST['kd']);
$filenya = "soal_ujian_siswa_log.php?gmkd=$gmkd";



//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika ke daftar
if ($_POST['btnDF'])
	{
	//re-direct
	$ke = "soal.php?gmkd=$gmkd";
	xloc($ke);
	exit();
	}






//nek batal
if ($_POST['btnBTL'])
	{
	//re-direct
	$ke = "$filenya&jkd=$jkd";
	xloc($ke);
	exit();
	}





//jika cari
if ($_POST['btnCARI'])
	{
	//nilai
	$kunci = cegah($_POST['kunci']);


	//re-direct
	$ke = "$filenya&jkd=$jkd&kunci=$kunci";
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
	
	

require("../../inc/js/jumpmenu.js");
require("../../inc/js/swap.js");
require("../../inc/js/checkall.js");



?>


		
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  



<script type="text/javascript" src="../../inc/class/ckeditor/ckeditor.js"></script>



  
<?php
//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
		$filenya = "soal_ujian_siswa_log.php?gmkd=$gmkd&jkd=$jkd";
		$juduli = $judul;


		//judul
		echo "<h3>$judul</h3>";

		//menu elearning
		require("i_menu.php");


		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">LOG PENGERJAAN SOAL OLEH SISWA</h3>
	          <hr>
	        </div>
	        
	        
	        <div class="box-body">';



				//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				//query
				$p = new Pager();
				$start = $p->findStart($limit);
				
				$sqlcount = "SELECT * FROM siswa_soal ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"AND jadwal_kd = '$jkd' ".
								"ORDER BY postdate DESC";
				
				$sqlresult = $sqlcount;
				
				$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
				$pages = $p->findPages($count, $limit);
				$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
				$target = "$filenya&jkd=$jkd";
				$pagelist = $p->pageList($_GET['page'], $pages, $target);
				$data = mysqli_fetch_array($result);
				
				
				
				
				//detail jkd jadwal
				$qku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_jadwal ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND kd = '$jkd'");
				$rku = mysqli_fetch_assoc($qku);
				$u_nama = balikin($rku['nama']);
				$u_durasi = balikin($rku['durasi']);
				$u_soal_jml = balikin($rku['soal_jml']);
			
				
				
				
				
				
				//ketahui jumlah siswa yg mengerjakan
				$qjos = mysqli_query($koneksi, "SELECT DISTINCT(siswa_kd) AS skd ".
										"FROM siswa_soal ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND jadwal_kd = '$jkd'");
				$tjos = mysqli_num_rows($qjos);
				
				echo '<form action="'.$filenya.'" method="post" name="formxx">
				
				<p>
				JUDUL/NAMA/BAB : <b>'.$u_nama.'</b>
				</p>
				
				<p>
				Durasi : <b>'.$u_durasi.' Menit</b>
				</p>
				
				
				
				<p>
				<input name="gmkd" type="hidden" value="'.$gmkd.'">
				<input name="jkd" type="hidden" value="'.$jkd.'">
				<a href="soal.php?gmkd='.$gmkd.'" class="btn btn-danger"><< DAFTAR JUDUL/NAMA/BAB</a>
				</p>
				<br>
				
				</form>
				
				
				
				<form action="'.$filenya.'" method="post" name="formx">
				
				
				<p>
				Siswa yang mengerjakan : <b>'.$tjos.'</b>
				</p>
				
				<div class="table-responsive">          
				<table class="table" border="1">
				<thead>
				
				<tr valign="top" bgcolor="'.$warnaheader.'">
				<td width="50"><strong><font color="'.$warnatext.'">POSTDATE</font></strong></td>
				<td><strong><font color="'.$warnatext.'">SISWA</font></strong></td>
				<td width="50"><strong><font color="'.$warnatext.'">SOAL</font></strong></td>
				<td width="50"><strong><font color="'.$warnatext.'">JAWAB</font></strong></td>
				
				</tr>
				</thead>
				<tbody>';
				
				if ($count != 0)
					{
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
						$i_postdate = balikin($data['postdate']);
						$i_swkd = nosql($data['siswa_kd']);
						$i_skd = balikin($data['soal_kd']);
						$i_jawab = balikin($data['jawab']);
						
						
						//detail siswa
						$qyuk = mysqli_query($koneksi, "SELECT * FROM m_user ".
												"WHERE kd = '$i_swkd'");
						$ryuk = mysqli_fetch_assoc($qyuk);
						$yuk_nis = balikin($ryuk['nomor']);
						$yuk_nama = balikin($ryuk['nama']);
				
						
						
						
						//detail soal
						$qyuk2 = mysqli_query($koneksi, "SELECT * FROM guru_mapel_soal ".
												"WHERE kd = '$i_skd'");
						$ryuk2 = mysqli_fetch_assoc($qyuk2);
						$yuk2_no = balikin($ryuk2['no']);
						
						
						
						
						
						echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
						echo '<td>'.$i_postdate.'</td>
						<td>
						'.$yuk_nis.'. '.$yuk_nama.'. 
						</td>
						<td>
						Nomor '.$yuk2_no.'
						
						</td>
						<td>'.$i_jawab.'</td>
				        </tr>';
						}
					while ($data = mysqli_fetch_assoc($result));
					}
				
				
				echo '</tbody>
				  </table>
				  </div>
				
				
				<table width="100%" border="0" cellspacing="0" cellpadding="3">
				<tr>
				<td>
				<strong><font color="#FF0000">'.$count.'</font></strong> Data. '.$pagelist.'
				<br>
				<input name="gmkd" type="hidden" value="'.$gmkd.'">
				<input name="jkd" type="hidden" value="'.$jkd.'">
				
				<input name="jml" type="hidden" value="'.$count.'">
				<input name="s" type="hidden" value="'.$s.'">
				<input name="kd" type="hidden" value="'.$kdx.'">
				<input name="page" type="hidden" value="'.$page.'">
				</td>
				</tr>
				</table>
				</form>';
				
				
	
	
	
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
			











//masukin ke log mapel guru ////////////////////////////////////////////////////////////////////////////////
$ketnya = "Menu Log Pengerjaan Soal oleh Siswa";
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [Log Pengerjaan Soal oleh Siswa].";
							


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




//null-kan
xclose($koneksi);
exit();
?>