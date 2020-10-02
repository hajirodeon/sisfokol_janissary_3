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
$linkkd = nosql($_REQUEST['linkkd']);
$filenya = "dvideo.php?gmkd=$gmkd";
$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}



//focus...
$diload = "document.formx.judul.focus();";


//nek enter, ke simpan
$x_enter = 'onKeyDown="var keyCode = event.keyCode;
if (keyCode == 13)
	{
	document.formx.btnSMP.focus();
	}"';





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
	$pel_guru = balikin($rpel['user_nama']);


	//jika iya
	if ($tpel != 0)
		{
		//nilai
		$judul = "[$pel_tapel. $pel_kelas]. <br>$pel_nm. <br>[GURU : $pel_guru].";
		$judulku = "[$tipe_session : $no1_session.$nm1_session] ==> $pel_nm. [GURU : $pel_guru].";
		$filenya = "dvideo.php?gmkd=$gmkd";
		$juduli = $judul;


		//judul
		echo '<h3>'.$judul.'</h3>';



		//menu elearning
		require("i_menu.php");

		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-success">
	        <div class="box-header">
	
	          <h3 class="box-title">VIDEO YOUTUBE</h3>
	        </div>
	        
	        
	        <div class="box-body">
			<br>';
		
			//query
			$p = new Pager();
			$start = $p->findStart($limit);
		
			$sqlcount = "SELECT * FROM guru_mapel_video ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"ORDER BY judul ASC";
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
				echo '<div class="table-responsive">          
					  <table class="table" border="1">
					    <thead>
						<tr bgcolor="'.$e_warnaheader.'">
						<td valign="top"><strong>VIDEO YOUTUBE</strong></td>
						</tr>
						
					</thead>
			    <tbody>';
		
				do
			  		{
					if ($warna_set ==0)
						{
						$warna = $e_warna01;
						$warna_set = 1;
						}
					else
						{
						$warna = $e_warna02;
						$warna_set = 0;
						}
		
					$nomer = $nomer + 1;
		
					$kd = nosql($data['kd']);
					$judul = balikin($data['judul']);
					$url = balikin($data['url']);

					//ambil kode untuk embed
					$pecahku = explode("=", $url);
					$i_kata1 = trim($pecahku[1]);
					
					//sebelum tanda &
					$pecahku2 = explode("&", $i_kata1);
					$i_filex2 = trim($pecahku2[0]);

		
					echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$e_warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
					echo '<td valign="top">
					
					<iframe width="100%" height="300" src="https://www.youtube.com/embed/'.$i_filex2.'"></iframe>
					<br>
					<a href="'.$url.'" title="'.$judul.'" target="_blank">'.$judul.'</a>
					
					
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
				<br>
				
				<input name="jml" type="hidden" value="'.$count.'">
				<input name="s" type="hidden" value="'.$s.'">
				<input name="page" type="hidden" value="'.$page.'">
				<input name="linkkd" type="hidden" value="'.$linkkd.'">


				</td>
			    </tr>
				</table>';
				}
			else
				{
				echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> ERROR...!!</h4>
                TIDAK ADA DATA.
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
$ketnya = "Menu Video Youtube";
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm. [GURU : $pel_guru]. [VIDEO YOUTUBE].";
							


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