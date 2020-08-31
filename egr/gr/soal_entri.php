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
$filenya = "soal_entri.php?gmkd=$gmkd";

$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}
	
$kd = nosql($_REQUEST['kd']);
$kunci = cegah($_REQUEST['kunci']);
$kunci2 = balikin($_REQUEST['kunci']);
$skd = nosql($_REQUEST['skd']);


$limit = 100;



//nilai
$path1 = "../../filebox/soal/$skd";
$path12 = "../../filebox/soal/$skd/$kd";
$path11 = "../../filebox/soal";
chmod("$path11", 0777);
chmod("$path12", 0777);

//cek, sudah ada belum
if (!file_exists($path1))
	{
	mkdir("$path1", 0777);
	chmod("$path11", 0755);
	chmod("$path1", 0777);
	}


//cek, sudah ada belum
if (!file_exists($path12))
	{
	mkdir("$path12", 0777);
	chmod("$path1", 0777);
	chmod("$path12", 0777);
	}







$firma_slug = "/$kd"; 
$nilku = $_SERVER['REQUEST_URI'];

//pecah
$nilku2 = explode("/", $nilku);
$nilku21 = $nilku2[1];
$nilku22 = $nilku2[2];


//$_SESSION["myRoxySession"] = "/$nilku21/$nilku22/filebox/soal/$skd".$firma_slug;
$_SESSION["myRoxySession"] = "/$nilku21/filebox/soal/$skd".$firma_slug;






//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika ke daftar
if ($_POST['btnDF'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);
	
	
	//re-direct
	$ke = "soal.php?gmkd=$gmkd";
	xloc($ke);
	exit();
	}




//jika import
if ($_POST['btnIM'])
	{
	$gmkd = nosql($_POST['gmkd']);
	$skd = nosql($_POST['skd']);
	
	//re-direct
	$ke = "$filenya&skd=$skd&s=import";
	xloc($ke);
	exit();
	}






//import sekarang
if ($_POST['btnIMX'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);
	$skd = nosql($_POST['skd']);
	$filex_namex2 = strip(strtolower($_FILES['filex_xls']['name']));

	//nek null
	if (empty($filex_namex2))
		{
		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		$ke = "$filenya&skd=$skd&s=import";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//deteksi .xls
		$ext_filex = substr($filex_namex2, -4);

		if ($ext_filex == ".xls")
			{
			//nilai
			$path1 = "../../filebox";
			$path2 = "../../filebox/excel";
			chmod($path1,0777);
			chmod($path2,0777);

			//nama file import, diubah menjadi baru...
			$filex_namex2 = "soal-$gmkd.xls";

			//mengkopi file
			copy($_FILES['filex_xls']['tmp_name'],"../../filebox/excel/$filex_namex2");

			//chmod
            $path3 = "../../filebox/excel/$filex_namex2";
			chmod($path1,0755);
			chmod($path2,0777);
			chmod($path3,0777);

			//file-nya...
			$uploadfile = $path3;


			//require
			require('../../inc/class/PHPExcel.php');
			require('../../inc/class/PHPExcel/IOFactory.php');


			  // load excel
			  $load = PHPExcel_IOFactory::load($uploadfile);
			  $sheets = $load->getActiveSheet()->toArray(null,true,true,true);
			
			  $i = 1;
			  foreach ($sheets as $sheet) 
			  	{
			    // karena data yang di excel di mulai dari baris ke 2
			    // maka jika $i lebih dari 1 data akan di masukan ke database
			    if ($i > 1) 
			    	{
				      // nama ada di kolom A
				      // sedangkan alamat ada di kolom B
				      $i_xyz = md5("$x$i");
				      $i_no = cegah($sheet['A']);
				      $i_isi = nl2br(cegah2($sheet['B']));
				      $i_kunci = cegah($sheet['C']);
					  
						//cek
						$qcc = mysqli_query($koneksi, "SELECT * FROM guru_mapel_soal ".
												"WHERE kd_guru_mapel = '$gmkd' ".
												"AND jadwal_kd = '$skd' ".
												"AND no = '$i_no'");
						$rcc = mysqli_fetch_assoc($qcc);
						$tcc = mysqli_num_rows($qcc);
		
						//jika ada, update				
						if (!empty($tcc))
							{
							mysqli_query($koneksi, "UPDATE guru_mapel_soal SET isi = '$i_isi', ".
											"kunci = '$i_kunci', ".
											"postdate = '$today' ".
											"WHERE kd_guru_mapel = '$gmkd' ".
											"AND jadwal_kd = '$skd' ".
											"AND no = '$i_no'");
							}
		
		
						else
							{
							//insert
							mysqli_query($koneksi, "INSERT INTO guru_mapel_soal(kd, kd_guru_mapel, jadwal_kd, ".
											"no, isi, kunci, postdate) VALUES ".
											"('$i_xyz', '$gmkd', '$skd', ".
											"'$i_no', '$i_isi', '$i_kunci', '$today')");
							}
					  
				    }
			
			    $i++;
			  }





			//hapus file, jika telah import
			$path1 = "../../filebox/excel/$filex_namex2";
			chmod($path1,0777);
			unlink ($path1);


			//re-direct
			$ke = "$filenya&skd=$skd";
			xloc($ke);
			exit();
			}
		else
			{
			//salah
			$pesan = "Bukan File .xls . Harap Diperhatikan...!!";
			$ke = "$filenya&skd=$skd&s=import";
			pekem($pesan,$ke);
			exit();
			}
		}
	}











//jika export
//export
if ($_POST['btnEX'])
	{
	$gmkd = nosql($_POST['gmkd']);
	$skd = nosql($_POST['skd']);
	
	
	//require
	require('../../inc/class/excel/OLEwriter.php');
	require('../../inc/class/excel/BIFFwriter.php');
	require('../../inc/class/excel/worksheet.php');
	require('../../inc/class/excel/workbook.php');




	
	//detail skd jadwal
	$qku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_jadwal ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND kd = '$skd'");
	$rku = mysqli_fetch_assoc($qku);
	$u_nama = seo_friendly_url(balikin($rku['nama']));

	
	
	

	//nama file e...
	$i_filename = "soal-$u_nama.xls";
	$i_judul = "soal";
	



	//header file
	function HeaderingExcel($i_filename)
		{
		header("Content-type:application/vnd.ms-excel");
		header("Content-Disposition:attachment;filename=$i_filename");
		header("Expires: 0");
		header("Cache-Control: must-revalidate, post-check=0,pre-check=0");
		header("Pragma: public");
		}

	
	
	
	//bikin...
	HeaderingExcel($i_filename);
	$workbook = new Workbook("-");
	$worksheet1 =& $workbook->add_worksheet($i_judul);
	$worksheet1->write_string(0,0,"NO.");
	$worksheet1->write_string(0,1,"ISI");
	$worksheet1->write_string(0,2,"KUNCI");



	//data
	$qdt = mysqli_query($koneksi, "SELECT * FROM guru_mapel_soal ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND jadwal_kd = '$skd' ".
							"ORDER BY round(no) ASC");
	$rdt = mysqli_fetch_assoc($qdt);

	do
		{
		//nilai
		$dt_nox = $dt_nox + 1;
		$dt_no = balikin($rdt['no']);
		$dt_isi = strip_tags(balikin($rdt['isi']));
		$dt_kunci = strip_tags(balikin($rdt['kunci']));



		//ciptakan
		$worksheet1->write_string($dt_nox,0,$dt_no);
		$worksheet1->write_string($dt_nox,1,$dt_isi);
		$worksheet1->write_string($dt_nox,2,$dt_kunci);
		}
	while ($rdt = mysqli_fetch_assoc($qdt));


	//close
	$workbook->close();

	
	
	//re-direct
	$ke = "$filenya&skd=$skd";
	xloc($ke);
	exit();
	}








//nek batal
if ($_POST['btnBTL'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);
	$skd = nosql($_POST['skd']);

	//re-direct
	$ke = "$filenya&skd=$skd";
	xloc($ke);
	exit();
	}





//jika cari
if ($_POST['btnCARI'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);
	$skd = nosql($_POST['skd']);	
	$kunci = cegah($_POST['kunci']);


	//re-direct
	$ke = "$filenya&skd=$skd&kunci=$kunci";
	xloc($ke);
	exit();
	}




//nek entri baru
if ($_POST['btnBARU'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);
	$skd = nosql($_POST['skd']);
	
	//re-direct
	$ke = "$filenya&skd=$skd&s=baru&kd=$x";
	xloc($ke);
	exit();
	}







//jika simpan
if ($_POST['btnSMP'])
	{
	$gmkd = nosql($_POST['gmkd']);
	$skd = nosql($_POST['skd']);
	$s = nosql($_POST['s']);
	$kd = nosql($_POST['kd']);
	$page = nosql($_POST['page']);
	$e_no = cegah($_POST['e_no']);
	$editor = cegah2($_POST['editor']);
	$e_kunci = cegah($_POST['e_kunci']);

	//nek null
	if ((empty($e_no)) OR (empty($editor)) OR (empty($e_kunci)))
		{
		//re-direct
		$pesan = "Belum Ditulis. Harap Diulangi...!!";
		$ke = "$filenya&skd=$skd&s=$s&kd=$kd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//jika update
		if ($s == "edit")
			{
			mysqli_query($koneksi, "UPDATE guru_mapel_soal SET no = '$e_no', ".
							"isi = '$editor', ".
							"kunci = '$e_kunci', ".
							"postdate = '$today' ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND jadwal_kd = '$skd' ".
							"AND kd = '$kd'");

			//re-direct
			$ke = "$filenya&skd=$skd";
			xloc($ke);
			exit();
			}



		//jika baru
		if ($s == "baru")
			{
			//cek
			$qcc = mysqli_query($koneksi, "SELECT * FROM guru_mapel_soal ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"AND jadwal_kd = '$skd' ".
									"AND no = '$e_no'");
			$rcc = mysqli_fetch_assoc($qcc);
			$tcc = mysqli_num_rows($qcc);

			//nek ada
			if ($tcc != 0)
				{
				//re-direct
				$pesan = "Sudah Ada. Silahkan Ganti Yang Lain...!!";
				$ke = "$filenya&skd=$skd&s=baru&kd=$kd";
				pekem($pesan,$ke);
				exit();
				}
			else
				{
				mysqli_query($koneksi, "INSERT INTO guru_mapel_soal(kd, kd_guru_mapel, jadwal_kd, no, isi, kunci, postdate) VALUES ".
								"('$kd', '$gmkd', '$skd', '$e_no', '$editor', '$e_kunci', '$today')");

				//re-direct
				$ke = "$filenya&skd=$skd";
				xloc($ke);
				exit();
				}
			}
		}
	}









//jika simpan + entri baru
if ($_POST['btnSMP2'])
	{
	$gmkd = nosql($_POST['gmkd']);
	$skd = nosql($_POST['skd']);
	$s = nosql($_POST['s']);
	$kd = nosql($_POST['kd']);
	$page = nosql($_POST['page']);
	$e_no = cegah($_POST['e_no']);
	$editor = cegah2($_POST['editor']);
	$e_kunci = cegah($_POST['e_kunci']);

	//nek null
	if ((empty($e_no)) OR (empty($editor)) OR (empty($e_kunci)))
		{
		//re-direct
		$pesan = "Belum Ditulis. Harap Diulangi...!!";
		$ke = "$filenya&skd=$skd&s=$s&kd=$kd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//jika baru
		if ($s == "baru")
			{
			//cek
			$qcc = mysqli_query($koneksi, "SELECT * FROM guru_mapel_soal ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"AND jadwal_kd = '$skd' ".
									"AND no = '$e_no'");
			$rcc = mysqli_fetch_assoc($qcc);
			$tcc = mysqli_num_rows($qcc);

			//nek ada
			if ($tcc != 0)
				{
				//re-direct
				$pesan = "Sudah Ada. Silahkan Ganti Yang Lain...!!";
				$ke = "$filenya&skd=$skd&s=baru&kd=$kd";
				pekem($pesan,$ke);
				exit();
				}
			else
				{
				//insert
				mysqli_query($koneksi, "INSERT INTO guru_mapel_soal(kd, kd_guru_mapel, jadwal_kd, no, isi, kunci, postdate) VALUES ".
								"('$kd', '$gmkd', '$skd', '$e_no', '$editor', '$e_kunci', '$today')");

				//re-direct
				$ke = "$filenya&skd=$skd&s=baru&kd=$x";
				xloc($ke);
				exit();
				}
			}
		}
	}
















//jika hapus
if ($_POST['btnHPS'])
	{
	//ambil nilai
	$gmkd = nosql($_POST['gmkd']);
	$skd = nosql($_POST['skd']);
	$jml = nosql($_POST['jml']);
	$page = nosql($_POST['page']);
	$ke = "$filenya&skd=$skd&page=$page";

	//ambil semua
	for ($i=1; $i<=$jml;$i++)
		{
		//ambil nilai
		$yuk = "item";
		$yuhu = "$yuk$i";
		$kd = nosql($_POST["$yuhu"]);

		//del
		mysqli_query($koneksi, "DELETE FROM guru_mapel_soal ".
						"WHERE kd_guru_mapel = '$gmkd' ".
						"AND jadwal_kd = '$skd' ".
						"AND kd = '$kd'");
		}

	//auto-kembali
	$ke = "$filenya&skd=$skd";
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
		$filenya = "soal_entri.php?gmkd=$gmkd";
		$juduli = $judul;


		//judul
		echo "<h3>$judul</h3>";

		//menu elearning
		require("i_menu.php");


		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">ENTRI SOAL</h3>
	          <hr>
	        </div>
	        
	        
	        <div class="box-body">';


			
			
			//jika edit / baru
			if (($s == "baru") OR ($s == "edit"))
				{
				$kdx = nosql($_REQUEST['kd']);
			
				$qx = mysqli_query($koneksi, "SELECT * FROM guru_mapel_soal ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"AND jadwal_kd = '$skd' ".
									"AND kd = '$kdx'");
				$rowx = mysqli_fetch_assoc($qx);
				$e_no = balikin($rowx['no']);
				$editor = balikin($rowx['isi']);
				$e_kunci = balikin($rowx['kunci']);


				echo '<form action="'.$filenya.'" method="post" name="formx2">
				
				
				<p>
				Nomor Urut : 
				<br>
				<input name="e_no" type="text" value="'.$e_no.'" size="5" class="btn btn-warning">
				</p>
				<br>
				
				
				
				<p>
				Isi Soal, Lengkap dengan Opsi Pilihan Ganda : 
				<br>
				<textarea id="editor" name="editor" rows="20" style="width: 100%" class="btn-block">'.$editor.'</textarea>
				</p>
				<br>
				
				
				<p>
				Kunci Jawaban : 
				<br>
				<select name="e_kunci" class="btn btn-warning">
				<option value="'.$e_kunci.'" selected>'.$e_kunci.'</option>
				<option value="A">A</option>
				<option value="B">B</option>
				<option value="C">C</option>
				<option value="D">D</option>
				<option value="E">E</option>
				</select>
				</p>
				<br>
				
				
				<p>
				<input name="jml" type="hidden" value="'.$count.'">
				<input name="s" type="hidden" value="'.$s.'">
				<input name="kd" type="hidden" value="'.$kdx.'">
				<input name="page" type="hidden" value="'.$page.'">
				<input name="gmkd" type="hidden" value="'.$gmkd.'">
				<input name="skd" type="hidden" value="'.$skd.'">
				
				<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">
				<input name="btnSMP" type="submit" value="SIMPAN >>" class="btn btn-danger">
				';
				
				
				//simpan dan entri baru
				if ($s == "baru")
					{
					echo '<input name="btnSMP2" type="submit" value="SIMPAN + ENTRI BARU >>" class="btn btn-danger">';
					}
				
				
				echo '</p>
				
				
				</form>';
				
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
				
				
				
				
				


			
			//jika import
			else if ($s == "import")
				{
				?>
				<div class="row">
			
				<div class="col-md-12">
					
				<?php
				echo '<form action="'.$filenya.'" method="post" enctype="multipart/form-data" name="formxx2">
				<p>
					<input name="filex_xls" type="file" size="30" class="btn btn-warning">
				</p>
			
				<p>
					<input name="s" type="hidden" value="'.$s.'">
					<input name="skd" type="hidden" value="'.$skd.'">
					<input name="gmkd" type="hidden" value="'.$gmkd.'">
					<input name="btnBTL" type="submit" value="BATAL" class="btn btn-info">
					<input name="btnIMX" type="submit" value="IMPORT >>" class="btn btn-danger">
				</p>
				
				
				</form>';	
				?>
					
			
			
				</div>
				
				</div>
			
			
				<?php
				}


			
			
			else
				{
				//jika null
				if (empty($kunci))
					{
					$sqlcount = "SELECT * FROM guru_mapel_soal ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"AND jadwal_kd = '$skd' ".
									"ORDER BY round(no) ASC";
					}
					
				else
					{
					$sqlcount = "SELECT * FROM guru_mapel_soal ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"AND jadwal_kd = '$skd' ".
									"AND isi LIKE '%$kunci%' ".
									"ORDER BY round(no) ASC";
					}
					
					
				
				//query
				$p = new Pager();
				$start = $p->findStart($limit);
				
				$sqlresult = $sqlcount;
				
				$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
				$pages = $p->findPages($count, $limit);
				$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
				$target = $filenya;
				$pagelist = $p->pageList($_GET['page'], $pages, $target);
				$data = mysqli_fetch_array($result);
				
				
				
				
				//detail skd jadwal
				$qku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_jadwal ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND kd = '$skd'");
				$rku = mysqli_fetch_assoc($qku);
				$u_nama = balikin($rku['nama']);
				$u_durasi = balikin($rku['durasi']);
				$u_aktif = balikin($rku['aktif']);
				
				
				
				//ketahui jumlah soal
				$qmboh = mysqli_query($koneksi, "SELECT * FROM guru_mapel_soal ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND jadwal_kd = '$skd'");
				$tmboh = mysqli_num_rows($qmboh);
				
				//update
				mysqli_query($koneksi, "UPDATE guru_mapel_jadwal SET soal_postdate = '$today', ".
								"soal_jml = '$tmboh' ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"AND kd = '$skd'");
				
				
				
				echo '<form action="'.$filenya.'" method="post" name="formxx">
				
				<input name="btnDF" type="submit" value="<< LIHAT JUDUL/NAMA/BAB LAIN" class="btn btn-danger">
				<hr>
				<br>
				
				<p>
				<b>'.$u_nama.'</b>
				</p>
								
				<p>
				[Durasi Pengerjaan : <b>'.$u_durasi.' Menit</b>].
				</p>
				
				<p>
				<input name="skd" type="hidden" value="'.$skd.'">
				<input name="gmkd" type="hidden" value="'.$gmkd.'">
				<input name="btnIM" type="submit" value="IMPORT SOAL >>" class="btn btn-danger">
				<input name="btnEX" type="submit" value="EXPORT SOAL >>" class="btn btn-danger">
				<input name="btnBARU" type="submit" value="ENTRI BARU >>" class="btn btn-danger">
				</p>
				<br>
				



				<p>
				<input name="gmkd" type="hidden" value="'.$gmkd.'">
				<input name="kunci" type="text" value="'.$kunci2.'" size="20" class="btn btn-warning" placeholder="Kata Kunci...">
				<input name="btnCARI" type="submit" value="CARI" class="btn btn-danger">
				<input name="btnBTL" type="submit" value="RESET" class="btn btn-info">
				</p>
				<br>
				
				<div class="table-responsive">          
				<table class="table" border="1">
				<thead>
				
				<tr valign="top" bgcolor="'.$warnaheader.'">
				<td width="20">&nbsp;</td>
				<td width="20">&nbsp;</td>
				<td width="50"><strong><font color="'.$warnatext.'">NO</font></strong></td>
				<td><strong><font color="'.$warnatext.'">ISI</font></strong></td>
				<td width="50"><strong><font color="'.$warnatext.'">KUNCI</font></strong></td>
				<td width="50"><strong><font color="'.$warnatext.'">POSTDATE</font></strong></td>
				
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
						$i_no = balikin($data['no']);
						$i_isi = balikin($data['isi']);
						$i_kunci = balikin($data['kunci']);
						$i_postdate = balikin($data['postdate']);
			
						
						echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
						echo '<td>
						<input type="checkbox" name="item'.$nomer.'" value="'.$i_kd.'">
				        </td>
						<td>
						<a href="'.$filenya.'&skd='.$skd.'&s=edit&page='.$page.'&kd='.$i_kd.'"><img src="'.$sumber.'/template/img/edit.gif" width="16" height="16" border="0"></a>
						</td>
						<td>'.$i_no.'</td>
						<td>'.$i_isi.'</td>
						<td>'.$i_kunci.'</td>
						<td>'.$i_postdate.'</td>
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
				<input name="skd" type="hidden" value="'.$skd.'">
			
				<input name="jml" type="hidden" value="'.$count.'">
				<input name="s" type="hidden" value="'.$s.'">
				<input name="kd" type="hidden" value="'.$kdx.'">
				<input name="page" type="hidden" value="'.$page.'">
				
				<input name="btnALL" type="button" value="SEMUA" onClick="checkAll('.$count.')" class="btn btn-primary">
				<input name="btnBTL" type="reset" value="BATAL" class="btn btn-warning">
				<input name="btnHPS" type="submit" value="HAPUS" class="btn btn-danger">
				</td>
				</tr>
				</table>
				</form>';
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
			






//masukin ke log mapel guru ////////////////////////////////////////////////////////////////////////////////
$ketnya = "Menu Entri Soal";
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [ENTRI SOAL].";
							


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