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
$filenya = "soal.php?gmkd=$gmkd";
$kd = nosql($_REQUEST['kd']);
$kunci = cegah($_REQUEST['kunci']);
$kunci2 = balikin($_REQUEST['kunci']);
$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}



//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika import
if ($_POST['btnIM'])
	{
	//nilai
	$gmkd = cegah($_POST['gmkd']);

	//re-direct
	$ke = "$filenya&s=import";
	xloc($ke);
	exit();
	}












//lama
//import sekarang
if ($_POST['btnIMX'])
	{
	//nilai
	$gmkd = cegah($_POST['gmkd']);
	$filex_namex2 = strip(strtolower($_FILES['filex_xls']['name']));

	//nek null
	if (empty($filex_namex2))
		{
		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		$ke = "$filenya&s=import";
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
			$filex_namex2 = "babsoal.xls";

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
				      $o_xyz = md5("$x$i");
				      $o_no = cegah($sheet['A']);
				      $o_nama = cegah($sheet['B']);
				      $o_durasi = cegah($sheet['C']);
					  
						//cek
						$qcc = mysqli_query($koneksi, "SELECT * FROM guru_mapel_jadwal ".
												"WHERE kd_guru_mapel = '$gmkd' ".
												"AND no = '$o_no' ".
												"AND nama = '$o_nama'");
						$rcc = mysqli_fetch_assoc($qcc);
						$tcc = mysqli_num_rows($qcc);
		
						//jika ada, update				
						if (!empty($tcc))
							{
							mysqli_query($koneksi, "UPDATE guru_mapel_jadwal SET nama = '$o_nama', ".
											"durasi = '$o_durasi' ".
											"WHERE kd_guru_mapel = '$gmkd' ".
											"AND no = '$o_no'");
							}
		
		
						else
							{
							//insert
							mysqli_query($koneksi, "INSERT INTO guru_mapel_jadwal(kd, kd_guru_mapel, no, nama, durasi, postdate) VALUES ".
											"('$o_xyz', '$gmkd', '$o_no', '$o_nama', '$o_durasi', '$today')");
							}
					  
				    }
			
			    $i++;
			  }





			//re-direct
			xloc($filenya);
			exit();
			}
		else
			{
			//salah
			$pesan = "Bukan File .xls . Harap Diperhatikan...!!";
			$ke = "$filenya&s=import";
			pekem($pesan,$ke);
			exit();
			}
		}
	}











//jika export
//export
if ($_POST['btnEX'])
	{
	//nilai
	$gmkd = cegah($_POST['gmkd']);

		
	//require
	require('../../inc/class/excel/OLEwriter.php');
	require('../../inc/class/excel/BIFFwriter.php');
	require('../../inc/class/excel/worksheet.php');
	require('../../inc/class/excel/workbook.php');


	//nama file e...
	$i_filename = "babsoal.xls";
	$i_judul = "babsoal";
	



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
	$worksheet1->write_string(0,1,"NAMA");
	$worksheet1->write_string(0,2,"DURASI");


	//data
	$qdt = mysqli_query($koneksi, "SELECT * FROM guru_mapel_jadwal ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"ORDER BY round(no) ASC");
	$rdt = mysqli_fetch_assoc($qdt);

	do
		{
		//nilai
		$dt_nox = $dt_nox + 1;
		$dt_no = balikin($rdt['no']);
		$dt_nama = balikin($rdt['nama']);
		$dt_durasi = balikin($rdt['durasi']);


		//ciptakan
		$worksheet1->write_string($dt_nox,0,$dt_no);
		$worksheet1->write_string($dt_nox,1,$dt_nama);
		$worksheet1->write_string($dt_nox,2,$dt_durasi);
		}
	while ($rdt = mysqli_fetch_assoc($qdt));


	//close
	$workbook->close();

	
	
	//re-direct
	xloc($filenya);
	exit();
	}








//nek batal
if ($_POST['btnBTL'])
	{
	//nilai
	$gmkd = cegah($_POST['gmkd']);

		
	//re-direct
	xloc($filenya);
	exit();
	}





//jika cari
if ($_POST['btnCARI'])
	{
	//nilai
	$gmkd = cegah($_POST['gmkd']);


	//nilai
	$kunci = cegah($_POST['kunci']);


	//re-direct
	$ke = "$filenya&kunci=$kunci";
	xloc($ke);
	exit();
	}




//nek entri baru
if ($_POST['btnBARU'])
	{
	//nilai
	$gmkd = cegah($_POST['gmkd']);

		

	//re-direct
	$ke = "$filenya&s=baru&kd=$x";
	xloc($ke);
	exit();
	}







//jika simpan
if ($_POST['btnSMP'])
	{
	//nilai
	$gmkd = cegah($_POST['gmkd']);
	$s = nosql($_POST['s']);
	$kd = nosql($_POST['kd']);
	$page = nosql($_POST['page']);
	$e_no = cegah($_POST['e_no']);
	$e_nama = cegah($_POST['e_nama']);
	$e_durasi = cegah($_POST['e_durasi']);
	$e_aktif = cegah($_POST['e_aktif']);


	//nek null
	if ((empty($e_no)) OR (empty($e_nama)) OR (empty($e_durasi)))
		{
		//re-direct
		$pesan = "Belum Ditulis. Harap Diulangi...!!";
		$ke = "$filenya&s=$s&kd=$kd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//jika update
		if ($s == "edit")
			{
			mysqli_query($koneksi, "UPDATE guru_mapel_jadwal SET no = '$e_no', ".
							"nama = '$e_nama', ".
							"aktif = '$e_aktif', ".
							"durasi = '$e_durasi' ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND kd = '$kd'");

			//re-direct
			xloc($filenya);
			exit();
			}



		//jika baru
		if ($s == "baru")
			{
			mysqli_query($koneksi, "INSERT INTO guru_mapel_jadwal(kd, kd_guru_mapel, no, ".
							"nama, durasi, aktif, postdate) VALUES ".
							"('$kd', '$gmkd', '$e_no', ".
							"'$e_nama', '$e_durasi', '$e_aktif', '$today')");

							
			//re-direct
			xloc($filenya);
			exit();
			}
		}
	}






//jika hapus
if ($s == "hapus")
	{
	//del
	mysqli_query($koneksi, "DELETE FROM guru_mapel_jadwal ".
					"WHERE kd_guru_mapel = '$gmkd' ".
					"AND kd = '$kd'");

	//auto-kembali
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


//require
require("../../template/js/jumpmenu.js");
require("../../template/js/checkall.js");
require("../../template/js/swap.js");



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
		$filenya = "soal.php?gmkd=$gmkd";
		$juduli = $judul;


		//judul
		echo "<h3>$judul</h3>";

		//menu elearning
		require("i_menu.php");


		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">SOAL</h3>
	        </div>
	        
	        
	        <div class="box-body">';

		//jika edit / baru
		if (($s == "baru") OR ($s == "edit"))
			{
			$kdx = nosql($_REQUEST['kd']);
		
			$qx = mysqli_query($koneksi, "SELECT * FROM guru_mapel_jadwal ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"AND kd = '$kdx'");
			$rowx = mysqli_fetch_assoc($qx);
			$e_no = balikin($rowx['no']);
			$e_durasi = balikin($rowx['durasi']);
			$e_nama = balikin($rowx['nama']);
			$e_aktif = balikin($rowx['aktif']);
			
			//jika aktif
			if ($e_aktif == "true")
				{
				$e_aktif_ket = "AKTIF";
				}
				
			else if ($e_aktif == "false")
				{
				$e_aktif_ket = "Tidak Aktif";
				}


			echo '<form action="'.$filenya.'" method="post" name="formx2">
			
			
			<p>
			No : 
			<br>
			<input name="e_no" type="text" value="'.$e_no.'" size="5" class="btn-warning">
			</p>
			<br>
			
			
			
			<p>
			Judul / Nama / BAB : 
			<br>
			<input name="e_nama" type="text" value="'.$e_nama.'" size="50" class="btn-warning">
			</p>
			<br>
			
			
			<p>
			Durasi : 
			<br>
			<input name="e_durasi" type="text" value="'.$e_durasi.'" size="5" class="btn-warning"> Menit
			</p>
			<br>
			
			
			<p>
			Status Bisa Dikerjakan Siswa : 
			<br>
			<select name="e_aktif" class="btn-warning">
				<option value="'.$e_aktif.'" selected>'.$e_aktif_ket.'</option>
				<option value="true">AKTIF</option>
				<option value="false">Tidak Aktif</option>
			</select>
			</p>
			<br>


			
			<p>
			<input name="jml" type="hidden" value="'.$count.'">
			<input name="s" type="hidden" value="'.$s.'">
			<input name="kd" type="hidden" value="'.$kdx.'">
			<input name="page" type="hidden" value="'.$page.'">
			<input name="gmkd" type="hidden" value="'.$gmkd.'">
			
			<input name="btnBTL" type="submit" value="BATAL" class="btn btn-info">
			<input name="btnSMP" type="submit" value="SIMPAN >>" class="btn btn-danger">
			</p>
			
			
			</form>';
			
			?>
				
			
			
			</div>
		
		
		
		
			</div>
		
		
			<?php
			}
			
		
		
		
		
		
		
		
		
		
		//jika import
		else if ($s == "import")
			{
			echo '<form action="'.$filenya.'" method="post" enctype="multipart/form-data" name="formxx2">
			<p>
				<input name="filex_xls" type="file" size="30" class="btn btn-warning">
			</p>
		
			<p>
				<input name="gmkd" type="hidden" value="'.$gmkd.'">
				<input name="btnBTL" type="submit" value="BATAL" class="btn btn-info">
				<input name="btnIMX" type="submit" value="IMPORT >>" class="btn btn-danger">
			</p>
			
			
			</form>';	
			}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		else
			{
			//jika null
			if (empty($kunci))
				{
				$sqlcount = "SELECT * FROM guru_mapel_jadwal ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"ORDER BY round(no) ASC";
				}
				
			else
				{
				$sqlcount = "SELECT * FROM guru_mapel_jadwal ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"AND (durasi LIKE '%$kunci%' ".
								"OR nama LIKE '%$kunci%') ".
								"ORDER BY round(no) ASC";
				}
				
				
			
			//query
			$p = new Pager();
			$start = $p->findStart($limit);
			
			$sqlresult = $sqlcount;
			
			$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
			$pages = $p->findPages($count, $limit);
			$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
			$target = "$filenya";
			$pagelist = $p->pageList($_GET['page'], $pages, $target);
			$data = mysqli_fetch_array($result);
			
			
			
			echo '<form action="'.$filenya.'" method="post" name="formxx">
			<p>
			<input name="gmkd" type="hidden" value="'.$gmkd.'">
			<input name="btnBARU" type="submit" value="ENTRI BARU" class="btn btn-danger">
			</p>
			<br>
			
			</form>
		
		
		
			<form action="'.$filenya.'" method="post" name="formx">
			<p>
			<input name="kunci" type="text" value="'.$kunci2.'" size="20" class="btn btn-warning" placeholder="Kata Kunci...">
			<input name="btnCARI" type="submit" value="CARI" class="btn btn-danger">
			<input name="btnBTL" type="submit" value="RESET" class="btn btn-info">
			</p>
			<br>';
				
			
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
					$i_nama = balikin($data['nama']);
					$i_durasi = balikin($data['durasi']);
					$i_aktif = balikin($data['aktif']);


					//jika aktif
					if ($i_aktif == "true")
						{
						$i_aktif_ket = "<font color=green>AKTIF</font>";
						$warnaku = $warna;
						}
						
					else if ($i_aktif == "false")
						{
						$i_aktif_ket = "Tidak Aktif";
						$warnaku = "red";
						}
					
					
					$i_soal_jml = balikin($data['soal_jml']);
					$i_soal_postdate = balikin($data['soal_postdate']);
					
					echo '<div class="table-responsive">          
					<table class="table" border="1">
					<thead>
					
					<tr valign="top" bgcolor="'.$warnaheader.'">
					<td width="50"><strong><font color="'.$warnatext.'">NO</font></strong></td>
					<td><strong><font color="'.$warnatext.'">JUDUL/NAMA/BAB</font></strong></td>
					<td width="100"><strong><font color="'.$warnatext.'">STATUS</font></strong></td>
					</tr>
					</thead>
					<tbody>';


					//jumlah siswa yg mengerjakan
					$qyuk = mysqli_query($koneksi, "SELECT * FROM siswa_soal ".
											"WHERE kd_guru_mapel = '$gmkd' ".
											"AND jadwal_kd = '$i_kd' ".
											"AND jawab <> ''");
					$tyuk = mysqli_num_rows($qyuk);

					
							
					echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
					echo '<td>'.$i_no.'</td>
					<td>
					<p>
					'.$i_nama.'
					</p>
					<br>
						
						<p>
						Jumlah Soal : <b>'.$i_soal_jml.'</b>, 
						
						Durasi : <b>'.$i_durasi.' Menit</b>,
						
						Postdate : <b>'.$i_soal_postdate.'</b>
						</p>
					<br>
														
						<p>
						<a href="'.$filenya.'&s=edit&page='.$page.'&kd='.$i_kd.'" class="btn btn-danger">EDIT >></a>
						
						<a href="'.$filenya.'&s=hapus&page='.$page.'&kd='.$i_kd.'" class="btn btn-danger">HAPUS >></a>
						
						<a href="soal_entri.php?gmkd='.$gmkd.'&skd='.$i_kd.'" class="btn btn-danger">ENTRI SOAL >></a>
						</p>
						<br>
						
														
						<p>
						<b>'.$tyuk.'</b> Siswa Mengerjakan.
						</p>
						
						<p>
						<a href="soal_ujian_siswa_log.php?gmkd='.$gmkd.'&jkd='.$i_kd.'" class="btn btn-success">LOG PENGERJAAN SISWA >></a> 

						<a href="soal_ujian_siswa_rekap.php?gmkd='.$gmkd.'&jkd='.$i_kd.'" class="btn btn-warning">REKAP NILAI SISWA >></a> 
						
						<a href="soal_ujian_analisis.php?gmkd='.$gmkd.'&jkd='.$i_kd.'" class="btn btn-primary">ANALISIS SOAL >></a>
						</p>
						<br>
						
																			
					</td>
					<td bgcolor="'.$warnaku.'">'.$i_aktif_ket.'</td>
			        </tr>';
					
					echo '</tbody>
					</table>
					</div>';		
					}
				while ($data = mysqli_fetch_assoc($result));
				}

					
					
							
			echo '<table width="100%" border="0" cellspacing="0" cellpadding="3">
			<tr>
			<td>
			<strong><font color="#FF0000">'.$count.'</font></strong> Data. '.$pagelist.'
			<br>
		
			<input name="jml" type="hidden" value="'.$count.'">
			<input name="s" type="hidden" value="'.$s.'">
			<input name="kd" type="hidden" value="'.$kdx.'">
			<input name="page" type="hidden" value="'.$page.'">
			<input name="gmkd" type="hidden" value="'.$gmkd.'">
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
			






//isi
$isi = ob_get_contents();
ob_end_clean();

require("../../inc/niltpl.php");


//null-kan
xclose($koneksi);
exit();
?>