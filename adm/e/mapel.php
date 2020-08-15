<?php
session_start();

require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");
require("../../inc/cek/adm.php");
require("../../inc/class/paging.php");
$tpl = LoadTpl("../../template/admin.html");

nocache;

//nilai
$filenya = "mapel.php";
$judul = "Data Guru Mengajar";
$judulku = "[MASTER] ==> $judul";
$judulx = $judul;
$kd = nosql($_REQUEST['kd']);
$s = nosql($_REQUEST['s']);
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
	//re-direct
	$ke = "$filenya?s=import";
	xloc($ke);
	exit();
	}












//lama
//import sekarang
if ($_POST['btnIMX'])
	{
	$filex_namex2 = strip(strtolower($_FILES['filex_xls']['name']));

	//nek null
	if (empty($filex_namex2))
		{
		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		$ke = "$filenya?s=import";
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
			$filex_namex2 = "gurumengajar.xls";

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
				      $i_userkode = cegah($sheet['B']);
				      $i_usernama = cegah($sheet['C']);
				      $i_tapel = cegah($sheet['D']);
				      $i_kelas = cegah($sheet['E']);
				      $i_mapelkode = cegah($sheet['F']);
				      $i_mapelnama = cegah($sheet['G']);
				      
						//cek
						$qcc = mysqli_query($koneksi, "SELECT * FROM guru_mapel ".
												"WHERE tapel = '$i_tapel' ".
												"AND kelas = '$i_kelas' ".
												"AND mapel_kode = '$i_mapelkode'");
						$rcc = mysqli_fetch_assoc($qcc);
						$tcc = mysqli_num_rows($qcc);
		
						//jika ada, update				
						if (!empty($tcc))
							{
							mysqli_query($koneksi, "UPDATE guru_mapel SET user_kode = '$i_userkode', ".
											"user_name = '$i_usernama' ".
											"WHERE tapel = '$i_tapel' ".
											"AND kelas = '$i_kelas' ".
											"AND mapel_kode = '$i_mapelkode'");
							}
		
		
						else
							{
							//insert
							mysqli_query($koneksi, "INSERT INTO guru_mapel(kd, user_kode, user_nama, ".
											"tapel, kelas, mapel_kode, mapel_nama, postdate) VALUES ".
											"('$i_xyz', '$i_userkode', '$i_usernama', ".
											"'$i_tapel', '$i_kelas', '$i_mapelkode', '$i_mapelnama', '$today')");
							}
					  
				    }
			
			    $i++;
			  }





			//hapus file, jika telah import
			$path1 = "../../filebox/excel/$filex_namex2";
			chmod($path1,0777);
			unlink ($path1);


			//re-direct
			xloc($filenya);
			exit();
			}
		else
			{
			//salah
			$pesan = "Bukan File .xls . Harap Diperhatikan...!!";
			$ke = "$filenya?s=import";
			pekem($pesan,$ke);
			exit();
			}
		}
	}



//jika export
//export
if ($_POST['btnEX'])
	{
	//require
	require('../../inc/class/excel/OLEwriter.php');
	require('../../inc/class/excel/BIFFwriter.php');
	require('../../inc/class/excel/worksheet.php');
	require('../../inc/class/excel/workbook.php');

		

	//nama file e...
	$i_filename = "gurumengajar.xls";
	$i_judul = "gurumengajar";
	


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
	$worksheet1->write_string(0,1,"GURU_KODE");
	$worksheet1->write_string(0,2,"GURU_NAMA");
	$worksheet1->write_string(0,3,"TAPEL");
	$worksheet1->write_string(0,4,"KELAS");
	$worksheet1->write_string(0,5,"MAPEL_KODE");
	$worksheet1->write_string(0,6,"MAPEL_NAMA");

	
	

	//data
	$qdt = mysqli_query($koneksi, "SELECT * FROM guru_mapel ".
							"ORDER BY tapel DESC, ".
							"kelas ASC, ".
							"mapel_kode ASC");
	$rdt = mysqli_fetch_assoc($qdt);


	do
		{
		//nilai
		$dt_nox = $dt_nox + 1;
		$dt_userkode = balikin($rdt['user_kode']);
		$dt_usernama = balikin($rdt['user_nama']);
		$dt_tapel = balikin($rdt['tapel']);
		$dt_kelas = balikin($rdt['kelas']);
		$dt_mapelkode = balikin($rdt['mapel_kode']);
		$dt_mapelnama = balikin($rdt['mapel_nama']);

		//ciptakan
		$worksheet1->write_string($dt_nox,0,$dt_nox);
		$worksheet1->write_string($dt_nox,1,$dt_userkode);
		$worksheet1->write_string($dt_nox,2,$dt_usernama);
		$worksheet1->write_string($dt_nox,3,$dt_tapel);
		$worksheet1->write_string($dt_nox,4,$dt_kelas);
		$worksheet1->write_string($dt_nox,5,$dt_mapelkode);
		$worksheet1->write_string($dt_nox,6,$dt_mapelnama);
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
	//re-direct
	xloc($filenya);
	exit();
	}





//jika cari
if ($_POST['btnCARI'])
	{
	//nilai
	$kunci = cegah($_POST['kunci']);


	//re-direct
	$ke = "$filenya?kunci=$kunci";
	xloc($ke);
	exit();
	}




//nek entri baru
if ($_POST['btnBARU'])
	{
	//re-direct
	//$ke = "$filenya?s=baru&kd=$x";
	$ke = "$filenya?s=baru&kd=$x";
	xloc($ke);
	exit();
	}











//jika simpan
if ($_POST['btnSMP'])
	{
	$s = nosql($_POST['s']);
	$kd = nosql($_POST['kd']);
	$page = nosql($_POST['page']);
	$e_nis = cegah($_POST['e_guru']);
	$e_tapel = cegah($_POST['e_tapel']);
	$e_kelas = cegah($_POST['e_kelas']);
	$e_mapelkode = cegah($_POST['e_mapel']);


	//detal guru
	$qst = mysqli_query($koneksi, "SELECT * FROM m_user ".
									"WHERE tipe = 'GURU' ".
									"AND nomor = '$e_nis'");
	$rowst = mysqli_fetch_assoc($qst);
	$e_nama = cegah($rowst['nama']);
	
	

	//detail mapel
	$qst = mysqli_query($koneksi, "SELECT * FROM m_mapel ".
									"WHERE kode = '$e_mapelkode'");
	$rowst = mysqli_fetch_assoc($qst);
	$e_mapelnama = cegah($rowst['mapel']);


	
	
	

	//nek null
	if ((empty($e_nis)) OR (empty($e_nama)) OR (empty($e_tapel)) OR (empty($e_kelas)) OR (empty($e_mapelkode)))
		{
		//re-direct
		$pesan = "Belum Ditulis. Harap Diulangi...!!";
		$ke = "$filenya?s=$s&kd=$kd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//jika update
		if ($s == "edit")
			{
			mysqli_query($koneksi, "UPDATE guru_mapel SET user_kode = '$e_nis', ".
							"user_nama = '$e_nama', ".
							"tapel = '$e_tapel', ".
							"kelas = '$e_kelas', ".
							"mapel_kode = '$e_mapelkode', ".
							"mapel_nama = '$e_mapelnama' ".
							"WHERE kd = '$kd'");

			//re-direct
			xloc($filenya);
			exit();
			}



		//jika baru
		if ($s == "baru")
			{
			//cek
			$qcc = mysqli_query($koneksi, "SELECT * FROM guru_mapel ".
									"WHERE tapel = '$e_tapel' ".
									"AND kelas = '$e_kelas' ".
									"AND mapel_kode = '$e_mapelkode'");
			$rcc = mysqli_fetch_assoc($qcc);
			$tcc = mysqli_num_rows($qcc);

			//nek ada
			if ($tcc != 0)
				{
				//re-direct
				$pesan = "Sudah Ada. Silahkan Ganti Yang Lain...!!";
				$ke = "$filenya?s=baru&kd=$kd";
				pekem($pesan,$ke);
				exit();
				}
			else
				{
				mysqli_query($koneksi, "INSERT INTO guru_mapel(kd, user_kode, user_nama, ".
								"tapel, kelas, mapel_kode, mapel_nama, postdate) VALUES ".
								"('$kd', '$e_nis', '$e_nama', ".
								"'$e_tapel', '$e_kelas', '$e_mapelkode', '$e_mapelnama', '$today')");

				//re-direct
				xloc($filenya);
				exit();
				}
			}
		}
	}




//jika hapus
if ($_POST['btnHPS'])
	{
	//ambil nilai
	$jml = nosql($_POST['jml']);
	$page = nosql($_POST['page']);
	$ke = "$filenya?page=$page";

	//ambil semua
	for ($i=1; $i<=$jml;$i++)
		{
		//ambil nilai
		$yuk = "item";
		$yuhu = "$yuk$i";
		$kd = nosql($_POST["$yuhu"]);

		//del
		mysqli_query($koneksi, "DELETE FROM guru_mapel ".
						"WHERE kd = '$kd'");
		}

	//auto-kembali
	xloc($filenya);
	exit();
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//isi *START
ob_start();


//require
require("../../template/js/jumpmenu.js");
require("../../template/js/checkall.js");
require("../../template/js/swap.js");




//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika import
if ($s == "import")
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
		<input name="btnBTL" type="submit" value="BATAL" class="btn btn-info">
		<input name="btnIMX" type="submit" value="IMPORT >>" class="btn btn-danger">
	</p>
	
	
	</form>';	
	?>
		


	</div>
	
	</div>


	<?php
	}








//jika edit / baru
else if (($s == "baru") OR ($s == "edit"))
	{
	$kdx = nosql($_REQUEST['kd']);

	$qx = mysqli_query($koneksi, "SELECT * FROM guru_mapel ".
						"WHERE kd = '$kdx'");
	$rowx = mysqli_fetch_assoc($qx);
	$e_nis = balikin($rowx['user_kode']);
	$e_nama = balikin($rowx['user_nama']);
	$e_tapel = balikin($rowx['tapel']);
	$e_kelas = balikin($rowx['kelas']);
	$e_mapelkode = balikin($rowx['mapel_kode']);
	$e_mapelnama = balikin($rowx['mapel_nama']);
	?>
	
	
	
	<div class="row">

	<div class="col-md-6">
		
	<?php
	echo '<form action="'.$filenya.'" method="post" name="formx2">
	
	
		
	<p>
	TAHUN PELAJARAN : 
	<br>
	<select name="e_tapel" class="btn btn-warning">
	<option value="'.$e_tapel.'" selected>--'.$e_tapel.'--</option>';
	
	$qst = mysqli_query($koneksi, "SELECT * FROM m_tapel ".
							"ORDER BY tapel DESC");
	$rowst = mysqli_fetch_assoc($qst);
	
	do
		{
		$st_kd = nosql($rowst['kd']);
		$st_nama1 = balikin($rowst['tapel']);
	
		echo '<option value="'.$st_nama1.'">'.$st_nama1.'</option>';
		}
	while ($rowst = mysqli_fetch_assoc($qst));
	
	echo '</select>
	</p>
	
		
	
	<p>
	KELAS : 
	<br>
	<select name="e_kelas" class="btn btn-warning">
	<option value="'.$e_kelas.'" selected>--'.$e_kelas.'--</option>';
	
	$qst = mysqli_query($koneksi, "SELECT * FROM m_kelas ".
							"ORDER BY kelas ASC");
	$rowst = mysqli_fetch_assoc($qst);
	
	do
		{
		$st_kd = nosql($rowst['kd']);
		$st_nama1 = balikin($rowst['kelas']);
	
		echo '<option value="'.$st_nama1.'">'.$st_nama1.'</option>';
		}
	while ($rowst = mysqli_fetch_assoc($qst));
	
	echo '</select>
	</p>
	
	
	<p>
	GURU : 
	<br>
	<select name="e_guru" class="btn btn-warning">
	<option value="'.$e_nis.'" selected>'.$e_nis.'. '.$e_nama.'</option>';
	
	$qst = mysqli_query($koneksi, "SELECT * FROM m_user ".
									"WHERE tipe = 'GURU' ".
									"ORDER BY nama ASC");
	$rowst = mysqli_fetch_assoc($qst);
	
	do
		{
		$st_kd = nosql($rowst['kd']);
		$st_nip = balikin($rowst['nomor']);
		$st_nama = balikin($rowst['nama']);
	
		echo '<option value="'.$st_nip.'">'.$st_nama.' ['.$st_nip.']</option>';
		}
	while ($rowst = mysqli_fetch_assoc($qst));
	
	echo '</select>
	</p>
	
	

	
	<p>
	MAPEL : 
	<br>

	<select name="e_mapel" class="btn btn-warning">
	<option value="'.$e_mapelkode.'" selected>'.$e_mapelkode.'. '.$e_mapelnama.'</option>';
	
	$qst = mysqli_query($koneksi, "SELECT * FROM m_mapel ".
									"ORDER BY mapel ASC");
	$rowst = mysqli_fetch_assoc($qst);
	
	do
		{
		$st_kd = nosql($rowst['kd']);
		$st_kode = balikin($rowst['kode']);
		$st_nama = balikin($rowst['mapel']);
	
		echo '<option value="'.$st_kode.'">'.$st_nama.' ['.$st_kode.']</option>';
		}
	while ($rowst = mysqli_fetch_assoc($qst));
	
	echo '</select>
	
	
	</p>
	
	
	
	
	
	
	
	
	
	<p>
	<input name="jml" type="hidden" value="'.$count.'">
	<input name="s" type="hidden" value="'.$s.'">
	<input name="kd" type="hidden" value="'.$kdx.'">
	<input name="page" type="hidden" value="'.$page.'">
	
	<input name="btnSMP" type="submit" value="SIMPAN" class="btn btn-danger">
	<input name="btnBTL" type="submit" value="BATAL" class="btn btn-info">
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
		$sqlcount = "SELECT * FROM guru_mapel ".
						"ORDER BY tapel DESC, ".
						"kelas ASC, ".
						"user_nama ASC, ".
						"mapel_kode ASC";
		}
		
	else
		{
		$sqlcount = "SELECT * FROM guru_mapel ".
						"WHERE user_kode LIKE '%$kunci%' ".
						"OR user_nama LIKE '%$kunci%' ".
						"OR tapel LIKE '%$kunci%' ".
						"OR kelas LIKE '%$kunci%' ".
						"OR mapel_kode LIKE '%$kunci%' ".
						"OR mapel_nama LIKE '%$kunci%' ".
						"ORDER BY tapel DESC, ".
						"kelas ASC, ".
						"user_nama ASC, ".
						"mapel_kode ASC";
		}
		
		
	
	//query
	$p = new Pager();
	$start = $p->findStart($limit);
	
	$sqlresult = $sqlcount;
	
	$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
	$pages = $p->findPages($count, $limit);
	$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
	$pagelist = $p->pageList($_GET['page'], $pages, $target);
	$data = mysqli_fetch_array($result);
	
	
	
	echo '<form action="'.$filenya.'" method="post" name="formx">
	<p>
	<input name="btnBARU" type="submit" value="ENTRI BARU" class="btn btn-danger">
	<input name="btnIM" type="submit" value="IMPORT" class="btn btn-primary">
	<input name="btnEX" type="submit" value="EXPORT" class="btn btn-success">
	</p>
	<br>



	<p>
	<input name="kunci" type="text" value="'.$kunci2.'" size="20" class="btn btn-warning" placeholder="Kata Kunci...">
	<input name="btnCARI" type="submit" value="CARI" class="btn btn-danger">
	<input name="btnBTL" type="submit" value="RESET" class="btn btn-info">
	</p>
		
	
	<div class="table-responsive">          
	<table class="table" border="1">
	<thead>
	
	<tr valign="top" bgcolor="'.$warnaheader.'">
	<td width="20">&nbsp;</td>
	<td width="20">&nbsp;</td>
	<td width="200"><strong><font color="'.$warnatext.'">TAHUN PELAJARAN</font></strong></td>
	<td width="150"><strong><font color="'.$warnatext.'">KELAS</font></strong></td>
	<td width="300"><strong><font color="'.$warnatext.'">GURU</font></strong></td>
	<td><strong><font color="'.$warnatext.'">MAPEL</font></strong></td>
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
			$i_nip = balikin($data['user_kode']);
			$i_nama = balikin($data['user_nama']);
			$i_tapel = balikin($data['tapel']);
			$i_kelas = balikin($data['kelas']);
			$i_mapel_kode = balikin($data['mapel_kode']);
			$i_mapel_nama = balikin($data['mapel_nama']);
			
			
			echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
			echo '<td>
			<input type="checkbox" name="item'.$nomer.'" value="'.$i_kd.'">
	        </td>
			<td>
			<a href="'.$filenya.'?s=edit&page='.$page.'&kd='.$i_kd.'">EDIT</a>
			</td>
			<td>'.$i_tapel.'</td>
			<td>'.$i_kelas.'</td>
			<td>'.$i_nip.'. '.$i_nama.'</td>
			<td>'.$i_mapel_kode.'. '.$i_mapel_nama.'</td>
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








//isi
$isi = ob_get_contents();
ob_end_clean();

require("../../inc/niltpl.php");


//null-kan
xclose($koneksi);
exit();
?>