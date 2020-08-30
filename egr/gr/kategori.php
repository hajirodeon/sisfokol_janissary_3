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
$tpl = LoadTpl("../../template/egr.html");

nocache;

//nilai
$s = nosql($_REQUEST['s']);
$gmkd = nosql($_REQUEST['gmkd']);
$katkd = nosql($_REQUEST['katkd']);
$filenya = "kategori.php?gmkd=$gmkd";


//focus...
$diload = "document.formx.kategori.focus();";


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
	$katkd = nosql($_REQUEST['katkd']);

	//query
	$qnil = mysqli_query($koneksi, "SELECT guru_mapel_kategori.* ".
							"FROM guru_mapel_kategori ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND kd = '$katkd'");
	$rnil = mysqli_fetch_assoc($qnil);
	$y_kategori = balikin($rnil['kategori']);
	}



//jika hapus
if ($_POST['btnHPS'])
	{
	//nilai
	$jml = nosql($_POST['jml']);

	for ($i=1;$i<=$jml;$i++)
		{
		//ambil nilai
		$yuk = "item";
		$yuhu = "$yuk$i";
		$kd = nosql($_POST["$yuhu"]);

		//del data
		mysqli_query($koneksi, "DELETE FROM guru_mapel_kategori ".
						"WHERE kd_guru_mapel = '$gmkd' ".
						"AND kd = '$kd'");
		}

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
	$katkd = nosql($_POST['katkd']);
	$kategori = cegah($_POST['kategori']);


	//nek null
	if (empty($kategori))
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
			mysqli_query($koneksi, "UPDATE guru_mapel_kategori SET kategori = '$kategori' ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND kd = '$katkd'");

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
			$qcc = mysqli_query($koneksi, "SELECT guru_mapel_kategori.* ".
									"FROM guru_mapel ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"AND kategori = '$kategori'");
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
				$pesan = "Ditemukan Duplikasi Kategori. Silahkan Diganti...!";
				pekem($pesan,$filenya);
				exit();
				}
			else
				{
				//insert data
				mysqli_query($koneksi, "INSERT INTO guru_mapel_kategori(kd, kd_guru_mapel, kategori) VALUES ".
								"('$x', '$gmkd', '$kategori')");

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
		$filenya = "kategori.php?gmkd=$gmkd";
		$juduli = $judul;

		echo '<h3>'.$judul.'</h3>';
	
	
		//menu
		require("i_menu.php");
	
			
		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">KATEGORI</h3>
	        </div>
	        
	        
	        <div class="box-body">';

				echo '<table width="100%" border="0" cellspacing="0" cellpadding="3">
				<tr valign="top">
				<td>
				<input name="kategori" type="text" value="'.$y_kategori.'" size="30" '.$x_enter.'>
				<input name="gmkd" type="hidden" value="'.$gmkd.'">
				<input name="btnSMP" type="submit" value="SIMPAN" class="btn btn-danger">
				<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">
				</td>
				</tr>
				</table>
				<br>';
		
		
				//query
				$qdt = mysqli_query($koneksi, "SELECT guru_mapel_kategori.* ".
										"FROM guru_mapel_kategori ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"ORDER BY kategori ASC");
				$rdt = mysqli_fetch_assoc($qdt);
				$tdt = mysqli_num_rows($qdt);
		
				//nek ada
				if ($tdt != 0)
					{
					echo '<div class="table-responsive">          
					  <table class="table" border="1">
					    <thead>
						<tr bgcolor="'.$warnaheader.'">
						<td width="1">&nbsp;</td>
						<td width="1">&nbsp;</td>
						<td valign="top"><strong>Kategori</strong></td>
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
		
						$kd = nosql($rdt['kd']);
						$kategori = balikin($rdt['kategori']);
		
						echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
						echo '<td width="1">
						<input name="kd'.$nomer.'" type="hidden" value="'.$kd.'">
						<input type="checkbox" name="item'.$nomer.'" value="'.$kd.'">
						</td>
						<td width="1">
						<a href="'.$filenya.'&s=edit&katkd='.$kd.'"><img src="'.$sumber.'/img/edit.gif" width="16" height="16" border="0"></a>
						</td>
						<td valign="top">
						'.$kategori.'
						</td>
						</tr>';
				  		}
					while ($rdt = mysqli_fetch_assoc($qdt));
		
					echo '</tbody>
					  </table>
					  </div>
					  
					<table width="100%" border="0" cellspacing="0" cellpadding="3">
				    <tr>
					<td>
					<input type="button" name="button" value="SEMUA" onClick="checkAll('.$limit.')" class="btn btn-success">
					<input name="btnBTL" type="reset" value="BATAL" class="btn btn-primary">
					<input name="btnHPS" type="submit" value="HAPUS" class="btn btn-danger">
					<input name="jml" type="hidden" value="'.$tdt.'">
					<input name="s" type="hidden" value="'.$s.'">
					<input name="katkd" type="hidden" value="'.$katkd.'">
					
					<font color="blue"><strong>'.$tdt.'</strong></font> Data</td>
				    </tr>
					</table>';
					}
				else
					{
					echo '<p>
					<font color="blue"><strong>TIDAK ADA DATA. Silahkan Entry Dahulu...!!</strong></font>
					</p>';
					}
		
				echo '<br><br><br>
				</td>
				</tr>
				</table>';
	

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
$ketnya = "Menu Kategori";
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [KATEGORI].";
							


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