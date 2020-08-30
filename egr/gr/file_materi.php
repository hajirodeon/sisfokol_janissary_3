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
$filenya = "file_materi.php?gmkd=$gmkd";
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





//nilai folder //////////////////////////////////////////////////////////////
$path1 = "../../filebox/materi/$gmkd";
$path2x = "../../filebox/materi";



//cek, sudah ada belum folder-nya...
if (!file_exists($path1))
	{
	chmod("$path2x",0777);
	mkdir("$path1", 0777, true);
	chmod("$path2x",0755);
	chmod("$path1",0755);
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


//hapus
if ($s == "hapus")
	{
	//nilai
	$filekd = nosql($_REQUEST['filekd']);
	$gmkd = nosql($_REQUEST['gmkd']);

	//query
	$qcc = mysqli_query($koneksi, "SELECT * FROM guru_mapel_file_materi ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND kd = '$filekd'");
	$rcc = mysqli_fetch_assoc($qcc);

	//hapus file
	$cc_filex = balikin($rcc['filex']);
	$path1 = "../../filebox/materi/$gmkd/$filekd/$cc_filex";
	chmod("$path1",0777);
	unlink ($path1);

	//hapus query
	mysqli_query($koneksi, "DELETE FROM guru_mapel_file_materi ".
					"WHERE kd_guru_mapel = '$gmkd' ".
					"AND kd = '$filekd'");

	//null-kan
	xclose($koneksi);

	//re-direct
	xloc($filenya);
	exit();
	}





//upload image
if ($_POST['btnUPL'])
	{
	//ambil nilai
	$kdku = cegah($_POST['kdku']);
	$ket = cegah($_POST['ket']);
	$filex_namex = strtolower($_FILES['filex']['name']);
	$filex_namex2 = strip($filex_namex);
	$filesize = 1;



	//deteksi .zip/doc/ppt/xls/pdf/png/jpg
	$ext_filex = substr($filex_namex, -4);
	
	//deteksi .docx/pptx/xlsx/jpeg
	$ext_filex2 = substr($filex_namex, -5);


	if (($ext_filex == ".zip") OR ($ext_filex == ".doc") OR ($ext_filex == ".ppt") 
	OR ($ext_filex == ".xls") OR ($ext_filex == ".pdf") OR ($ext_filex == ".png") 
	OR ($ext_filex == ".jpg") OR ($ext_filex2 == ".docx") OR ($ext_filex2 == ".pptx") 
	OR ($ext_filex2 == ".xlsx") OR ($ext_filex2 == ".jpeg"))
		{
		//nek null
		if ((empty($ket)) OR (empty($filex_namex)))
			{
			//null-kan
			xclose($koneksi);
	
			//re-direct
			$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
			pekem($pesan,$filenya);
			exit();
			}
		else
			{
			//nilai folder //////////////////////////////////////////////////////////////
			$path1 = "../../filebox/materi/$gmkd";
			$path2x = "../../filebox/materi";
			chmod("$path2x",0777);
	
			//cek, sudah ada belum folder-nya...
			if (!file_exists($path1))
				{
				mkdir("$path1", 0777, true);
				}
	
	
			//nilai folder //////////////////////////////////////////////////////////////
			$path2 = "../../filebox/materi/$gmkd/$kdku";
			chmod("$path2x",0777);
	
			//cek, sudah ada belum folder-nya...
			if (!file_exists($path2))
				{
				mkdir("$path2", 0777, true);
				}
	
	
	


	
			//nilai file-nya...
			$filex1 = "../../filebox/materi/$gmkd/$kdku/$filex_namex2";
			chmod("$filex1",0777);
	
			//cek, sudah ada belum
			if (!file_exists($filex1))
				{
				//mengkopi file
	//			move_uploaded_file($_FILES['filex']['tmp_name'],"../../../filebox/e/materi/$gmkd/$kdku/$filex_namex");
				copy($_FILES['filex']['tmp_name'],"../../filebox/materi/$gmkd/$kdku/$filex_namex2");
	
				//query
				mysqli_query($koneksi, "INSERT INTO guru_mapel_file_materi(kd, kd_guru_mapel, ket, filex, postdate) VALUES ".
								"('$kdku', '$gmkd', '$ket', '$filex_namex2', '$today')");
	
	
	
				//nilai file-nya...
				$filex1 = "../../filebox/materi/$gmkd/$kdku/$filex_namex2";
				chmod("$filex1",0755);
		
	
				//null-kan
				xclose($koneksi);
	
				//re-direct
				xloc($filenya);
				exit();
				}
			else
				{
				//null-kan
				xclose($koneksi);
	
				//re-direct
				$pesan = "Sudah Ada. Ganti Yang Lain...!!";
				pekem($pesan,$filenya);
				exit();
				}
			}
		
		}
	else
		{
		//salah
		$pesan = "Format File Tidak Didukung. Harap Diperhatikan...!!";
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
		$filenya = "file_materi.php?gmkd=$gmkd";
		$juduli = $judul;


		echo '<h3>'.$judul.'</h3>';


		//menu elearning
		require("i_menu.php");

		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">FILE MATERI</h3>
	        </div>
	        
	        
	        <div class="box-body">
			
			<div class="row">
				    <div class="col-lg-6">
				
						<p>
						<strong>Judul/Nama File Materi :</strong>
						<br>
						<input name="ket" type="text" value="'.$y_judul.'" size="30" class="btn-block">
						</p>
						<br>
					
						<p>
						File .zip/doc/docx/ppt/pptx/xls/xlsx/pdf/png/jpg/jpeg : 
						<br>
						<input name="filex" type="file" size="30">
						</p>
						<b>
						
						<p>
						<input name="gmkd" type="hidden" value="'.$gmkd.'">
						<input name="kdku" type="hidden" value="'.$x.'">
						<input name="btnUPL" type="submit" value="SIMPAN & UPLOAD">
						</p>
					</div>
				</div>
			<br>';
		
			//query
			$p = new Pager();
			$start = $p->findStart($limit);
		
			$sqlcount = "SELECT * FROM guru_mapel_file_materi ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"ORDER BY ket ASC";
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
						<td valign="top"><strong>FILE MATERI</strong></td>
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
					$fle_kd = nosql($data['kd']);
					$fle_ket = balikin($data['ket']);
					$fle_filex = $data['filex'];
					$fle_postdate = $data['postdate'];
					$file_path = "../../filebox/materi/$gmkd/$kd/$fle_filex";

												
					
					echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
					echo '<td>
					<p>
					<b>'.$fle_ket.'</b>
					</p>
					<br>
					
					<p>
					PostDate : '.$fle_postdate.'
					</p>
					<br>
					
					<p>
					[<a href="'.$file_path.'" title="Download" target="_blank">Download</a>].
					[<a href="'.$filenya.'&s=hapus&filekd='.$fle_kd.'" title="Hapus"><img src="'.$sumber.'/img/delete.gif" width="16" height="16" border="0"></a>].
					</p>
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
$ketnya = "Menu File Materi";
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [FILE MATERI].";
							


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