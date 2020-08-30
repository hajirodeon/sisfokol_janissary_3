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
$linkkd = nosql($_REQUEST['linkkd']);
$filenya = "link.php?gmkd=$gmkd";
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


//nek edit
if ($s == "edit")
	{
	//nilai
	$linkkd = nosql($_REQUEST['linkkd']);

	//query
	$qnil = mysqli_query($koneksi, "SELECT * FROM guru_mapel_link ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND kd = '$linkkd'");
	$rnil = mysqli_fetch_assoc($qnil);
	$y_judul = balikin($rnil['judul']);
	$y_url = balikin($rnil['url']);
	}



//jika hapus
if ($_POST['btnHPS'])
	{
	//nilai
	$jml = nosql($_POST['jml']);
	$page = nosql($_POST['page']);

	//query
	$p = new Pager();
	$start = $p->findStart($limit);

	$sqlcount = "SELECT guru_mapel_link.* ".
					"FROM guru_mapel_link ".
					"WHERE kd_guru_mapel = '$gmkd' ".
					"ORDER BY judul ASC";
	$sqlresult = $sqlcount;

	$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
	$pages = $p->findPages($count, $limit);
	$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
	$target = $filenya;
	$pagelist = $p->pageList($_GET['page'], $pages, $target);
	$data = mysqli_fetch_array($result);


	do
		{
		//ambil nilai
		$i = $i + 1;
		$yuk = "item";
		$yuhu = "$yuk$i";
		$kd = nosql($_POST["$yuhu"]);

		//del data
		mysqli_query($koneksi, "DELETE FROM guru_mapel_link ".
						"WHERE kd_guru_mapel = '$gmkd' ".
						"AND kd = '$kd'");
		}
	while ($data = mysqli_fetch_assoc($result));


	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//auto-kembali
	xloc($filenya);
	exit();
	}


//jika simpan
if ($_POST['btnSMP'])
	{
	//nilai
	$s = nosql($_POST['s']);
	$gmkd = nosql($_POST['gmkd']);
	$linkkd = nosql($_POST['linkkd']);
	$judul = cegah($_POST['judul']);
	$url = cegah($_POST['url']);


	//nek null
	if ((empty($judul)) OR (empty($url)))
		{
		//diskonek
		xfree($qbw);
		xclose($koneksi);

		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!";
		pekem($pesan,$filenya);
		exit();
		}
	else
		{
		//nek edit
		if ($s == "edit")
			{
			//update
			mysqli_query($koneksi, "UPDATE guru_mapel_link SET judul = '$judul', ".
							"url = '$url' ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND kd = '$linkkd'");

			//diskonek
			xfree($qbw);
			xclose($koneksi);

			//re-direct
			xloc($filenya);
			exit();
			}





		//nek baru
		if (empty($s))
			{
			//cek
			$qcc = mysqli_query($koneksi, "SELECT * FROM guru_mapel_link ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"AND judul = '$judul'");
			$rcc = mysqli_fetch_assoc($qcc);
			$tcc = mysqli_num_rows($qcc);

			//nek ada
			if ($tcc != 0)
				{
				//diskonek
				xfree($qcc);
				xfree($qbw);
				xclose($koneksi);

				//re-direct
				$pesan = "Ditemukan Duplikasi. Silahkan Diganti...!";
				pekem($pesan,$filenya);
				exit();
				}
			else
				{
				//insert data
				mysqli_query($koneksi, "INSERT INTO guru_mapel_link(kd, kd_guru_mapel, judul, url, postdate) VALUES ".
								"('$x', '$gmkd', '$judul', '$url', '$today')");

				//diskonek
				xfree($qcc);
				xfree($qbw);
				xclose($koneksi);

				//re-direct
				xloc($filenya);
				exit();
				}
			}
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
	$qpel = mysqli_query($koneksi, "SELECT guru_mapel.* ".
							"FROM guru_mapel ".
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
		$filenya = "link.php?gmkd=$gmkd";
		$juduli = $judul;


		echo '<h3>'.$judul.'</h3>';



		//menu elearning
		require("i_menu.php");

		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">LINK</h3>
	        </div>
	        
	        
	        <div class="box-body">
			<div class="row">
				    <div class="col-lg-6">

						<p>
						<strong>Judul :</strong>
						<br>
						<input name="judul" type="text" value="'.$y_judul.'" class="btn-block">
						</p>
						<br>
					
						<p>
						<strong>URL / Alamat Web :</strong>
						<br>
						<input name="url" type="text" value="'.$y_url.'" class="btn-block">
						</p>
						<br>
					
						<input name="gmkd" type="hidden" value="'.$gmkd.'">
						<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">
						<input name="btnSMP" type="submit" value="SIMPAN >>" class="btn btn-danger">
					</div>
				</div>
				
			<br>';
		
			//query
			$p = new Pager();
			$start = $p->findStart($limit);
		
			$sqlcount = "SELECT * FROM guru_mapel_link ".
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
						<tr bgcolor="'.$warnaheader.'">
						<td width="1">&nbsp;</td>
						<td width="1">&nbsp;</td>
						<td valign="top"><strong>Link</strong></td>
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
		
					echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
					echo '<td width="1">
					<input name="kd'.$nomer.'" type="hidden" value="'.$kd.'">
					<input type="checkbox" name="item'.$nomer.'" value="'.$kd.'">
					</td>
					<td width="1">
					<a href="'.$filenya.'&s=edit&linkkd='.$kd.'"><img src="'.$sumber.'/img/edit.gif" width="16" height="16" border="0"></a>
					</td>
					<td valign="top">
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
				
				<input type="button" name="Button" value="SEMUA" onClick="checkAll('.$limit.')" class="btn btn-success">
				<input name="btnBTL" type="reset" value="BATAL" class="btn btn-primary">
				<input name="btnHPS" type="submit" value="HAPUS" class="btn btn-danger">
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
		$ke = "mapel.php";
		pekem($pesan,$ke);
		exit();
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////







//masukin ke log mapel guru ////////////////////////////////////////////////////////////////////////////////
$ketnya = "Menu Link";
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [LINK].";
							


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