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
$excelku = nosql($_REQUEST['excelku']);
$gmkd = nosql($_REQUEST['gmkd']);
$katkd = nosql($_REQUEST['katkd']);
$filenya = "dsiswa.php?gmkd=$gmkd";
$utgl = nosql($_REQUEST['utgl']);
$ubln = nosql($_REQUEST['ubln']);
$uthn = nosql($_REQUEST['uthn']);


$ubln = round($ubln);




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





//jika null, kasi hari ini
if (empty($utgl))
	{
	//nilai
	$bulanx = round($bulan);
	
	//re-direct
	$ke = "$filenya&s=$s&utgl=$tanggal&ubln=$bulanx&uthn=$tahun";
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

	
	
	
	



//export excel : per tanggal //////////////////////////////////////////////////////////////////////////////
if ($excelku == "ptgl")
	{
	//require
	require('../../inc/class/excel/OLEwriter.php');
	require('../../inc/class/excel/BIFFwriter.php');
	require('../../inc/class/excel/worksheet.php');
	require('../../inc/class/excel/workbook.php');


	//nama file e...
	$i_filename = "kehadiran-siswa-$utgl-$ubln-$uthn.xls";
	$i_judul = "$utgl-$ubln-$uthn";
	



	//header file
	function HeaderingExcel($i_filename)
		{
		header("Content-type:application/vnd.ms-excel");
		header("Content-Disposition:attachment;filename=$i_filename");
		header("Expires: 0");
		header("Cache-Control: must-revalidate, post-check=0,pre-check=0");
		header("Pragma: public");
		}


		
	//query
	$qku = mysqli_query($koneksi, "SELECT * FROM m_user ".
								"WHERE tipe = 'SISWA' ".
								"AND tapel_nama = '$pel_tapel2' ".
								"AND kelas_nama = '$pel_kelas2' ".
								"ORDER BY nama ASC");
	$rku = mysqli_fetch_assoc($qku);

		
	//bikin...
	HeaderingExcel($i_filename);
	$workbook = new Workbook("-");
	$worksheet1 =& $workbook->add_worksheet($i_judul);
	$worksheet1->write_string(0,0,"NO.");
	$worksheet1->write_string(0,1,"NIS");
	$worksheet1->write_string(0,2,"NAMA");
	$worksheet1->write_string(0,3,"ONLINE TERAKHIR");

			
	do
  		{
		$nomer = $nomer + 1;

		$kd = nosql($rku['kd']);
		$enis = balikin($rku['nomor']);
		$enama = balikin($rku['nama']);


		//status online ato tidak
		$qku2 = mysqli_query($koneksi, "SELECT * FROM guru_mapel_log ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND user_tipe = 'SISWA' ".
										"AND user_kode = '$enis' ".
										"AND round(DATE_FORMAT(postdate, '%d')) = '$utgl' ".
										"AND round(DATE_FORMAT(postdate, '%m')) = '$ubln' ".
										"AND round(DATE_FORMAT(postdate, '%Y')) = '$uthn' ".
										"ORDER BY postdate DESC LIMIT 0,1");
		$rku2 = mysqli_fetch_assoc($qku2);
		$tku2 = mysqli_num_rows($qku2);
		$ku_postdate = balikin($rku2['postdate']);


		//jika ya
		if (!empty($tku))
			{
			$ku_onlinenyax = "$ku_postdate";
			}
		else
			{
			$ku_onlinenyax = "Tidak";
			}
			
			
		//ciptakan
		$worksheet1->write_string($nomer,0,$nomer);
		$worksheet1->write_string($nomer,1,$enis);
		$worksheet1->write_string($nomer,2,$enama);
		$worksheet1->write_string($nomer,3,$ku_onlinenyax);
  		}
	while ($rku = mysqli_fetch_assoc($qku));

	//close
	$workbook->close();
		
		
	//re-direct
	$ke = "$filenya&utgl=$utgl&ubln=$ubln&uthn=$uthn";
	xloc($ke);
	exit();
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////












//export excel : per bulan //////////////////////////////////////////////////////////////////////////////
if ($excelku == "pbln")
	{
	//require
	require('../../inc/class/excel/OLEwriter.php');
	require('../../inc/class/excel/BIFFwriter.php');
	require('../../inc/class/excel/worksheet.php');
	require('../../inc/class/excel/workbook.php');


	//nama file e...
	$i_filename = "kehadiran-siswa-$ubln-$uthn.xls";
	$i_judul = "$ubln-$uthn";
	



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
	$worksheet1->write_string(0,1,"TANGGAL");
	$worksheet1->write_string(0,2,"HARI");
	$worksheet1->write_string(0,3,"KETERANGAN");


	//mendapatkan jumlah tanggal maksimum dalam suatu bulan
	$tgl = 0;
	$bulan = $ubln;
	$bln = $bulan + 1;
	$thn = $uthn;

	$lastday = mktime (0,0,0,$bln,$tgl,$thn);

	//total tanggal dalam sebulan
	$tkhir = strftime ("%d", $lastday);

	//lopping tgl
	for ($i=1;$i<=$tkhir;$i++)
		{
		//ketahui harinya
		$day = $i;
		$month = $bulan;
		$year = $thn;


		//mencari hari
		$a = substr($year, 2);
			//mengambil dua digit terakhir tahun

		$b = (int)($a/4);
			//membagi tahun dengan 4 tanpa memperhitungkan sisa

		$c = $month;
			//mengambil angka bulan

		$d = $day;
			//mengambil tanggal

		$tot1 = $a + $b + $c + $d;
			//jumlah sementara, sebelum dikurangani dengan angka kunci bulan

		//kunci bulanan
		if ($c == 1)
			{
			$kunci = "2";
			}

		else if ($c == 2)
			{
			$kunci = "7";
			}

		else if ($c == 3)
			{
			$kunci = "1";
			}

		else if ($c == 4)
			{
			$kunci = "6";
			}

		else if ($c == 5)
			{
			$kunci = "5";
			}

		else if ($c == 6)
			{
			$kunci = "3";
			}

		else if ($c == 7)
			{
			$kunci = "2";
			}

		else if ($c == 8)
			{
			$kunci = "7";
			}

		else if ($c == 9)
			{
			$kunci = "5";
			}

		else if ($c == 10)
			{
			$kunci = "4";
			}

		else if ($c == 11)
			{
			$kunci = "2";
			}

		else if ($c == 12)
			{
			$kunci = "1";
			}

		$total = $tot1 - $kunci;

		//angka hari
		$hari = $total%7;

		//jika angka hari == 0, sebenarnya adalah 7.
		if ($hari == 0)
			{
			$hari = ($hari +7);
			}

		//kabisat, tahun habis dibagi empat alias tanpa sisa
		$kabisat = (int)$year % 4;

		if ($kabisat ==0)
			{
			$hri = $hri-1;
			}



		//hari ke-n
		if ($hari == 3)
			{
			$hri = 4;
			$dino = "Rabu";
			}

		else if ($hari == 4)
			{
			$hri = 5;
			$dino = "Kamis";
			}

		else if ($hari == 5)
			{
			$hri = 6;
			$dino = "Jum'at";
			}

		else if ($hari == 6)
			{
			$hri = 7;
			$dino = "Sabtu";
			}

		else if ($hari == 7)
			{
			$hri = 1;
			$dino = "Minggu";
			}

		else if ($hari == 1)
			{
			$hri = 2;
			$dino = "Senin";
			}

		else if ($hari == 2)
			{
			$hri = 3;
			$dino = "Selasa";
			}


		//nek minggu,
		if ($hri == 1)
			{
			$warna = "red";
			$mggu_attr = "disabled";
			}
		else
			{
			if ($warna_set ==0)
				{
				$warna = $e_warna01;
				$warna_set = 1;
				$mggu_attr = "";
				}
			else
				{
				$warna = $e_warna02;
				$warna_set = 0;
				$mggu_attr = "";
				}
			}


		//cek digit
		//tgl
		if (strlen($i) == 1)
			{
			$utglx = "0$i";
			}
		else
			{
			$utglx = $i;
			}


		//bln
		if (strlen($ubln) == 1)
			{
			$ublnx = "0$ubln";
			}
		else
			{
			$ublnx = $ubln;
			}


		//nilainya...
		$qdtf = mysqli_query($koneksi, "SELECT DISTINCT(user_kode) AS nisku ".
								"FROM guru_mapel_log ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"AND user_tipe = 'SISWA' ".
								"AND round(DATE_FORMAT(postdate, '%d')) = '$utglx' ".
								"AND round(DATE_FORMAT(postdate, '%m')) = '$ublnx' ".
								"AND round(DATE_FORMAT(postdate, '%Y')) = '$uthn' ".
								"ORDER BY postdate DESC");
		$rdtf = mysqli_fetch_assoc($qdtf);
		$tdtf = mysqli_num_rows($qdtf);

		
		//jika hadir
		if (!empty($tdtf))
			{
			$tdtfket = "$tdtf Siswa Hadir";
			}
		else
			{
			$tdtfket = "-";
			}

		//ciptakan
		$worksheet1->write_string($i,0,$i);
		$worksheet1->write_string($i,1,$i);
		$worksheet1->write_string($i,2,$dino);
		$worksheet1->write_string($i,3,$tdtfket);
		}



	//close
	$workbook->close();
		
		
	//re-direct
	$ke = "$filenya&s=pbln&utgl=$utgl&ubln=$ubln&uthn=$uthn";
	xloc($ke);
	exit();
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////











//export excel : per siswa //////////////////////////////////////////////////////////////////////////////
if ($excelku == "psiswa")
	{
	//require
	require('../../inc/class/excel/OLEwriter.php');
	require('../../inc/class/excel/BIFFwriter.php');
	require('../../inc/class/excel/worksheet.php');
	require('../../inc/class/excel/workbook.php');


	//nama file e...
	$i_filename = "kehadiran-per-siswa-$ubln-$uthn.xls";
	$i_judul = "$ubln-$uthn";
	



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
	$worksheet1->write_string(0,1,"NIS");
	$worksheet1->write_string(0,2,"NAMA");

	//mendapatkan jumlah tanggal maksimum dalam suatu bulan
	$tgl = 0;
	$bulan = $ubln;
	$bln = $bulan + 1;
	$thn = $uthn;

	$lastday = mktime (0,0,0,$bln,$tgl,$thn);

	//total tanggal dalam sebulan
	$tkhir = strftime ("%d", $lastday);

	//lopping tgl
	for ($i=1;$i<=$tkhir;$i++)
		{
		//ketahui harinya
		$day = $i;
		$month = $bulan;
		$year = $thn;


		//mencari hari
		$a = substr($year, 2);
			//mengambil dua digit terakhir tahun

		$b = (int)($a/4);
			//membagi tahun dengan 4 tanpa memperhitungkan sisa

		$c = $month;
			//mengambil angka bulan

		$d = $day;
			//mengambil tanggal

		$tot1 = $a + $b + $c + $d;
			//jumlah sementara, sebelum dikurangani dengan angka kunci bulan

		//kunci bulanan
		if ($c == 1)
			{
			$kunci = "2";
			}

		else if ($c == 2)
			{
			$kunci = "7";
			}

		else if ($c == 3)
			{
			$kunci = "1";
			}

		else if ($c == 4)
			{
			$kunci = "6";
			}

		else if ($c == 5)
			{
			$kunci = "5";
			}

		else if ($c == 6)
			{
			$kunci = "3";
			}

		else if ($c == 7)
			{
			$kunci = "2";
			}

		else if ($c == 8)
			{
			$kunci = "7";
			}

		else if ($c == 9)
			{
			$kunci = "5";
			}

		else if ($c == 10)
			{
			$kunci = "4";
			}

		else if ($c == 11)
			{
			$kunci = "2";
			}

		else if ($c == 12)
			{
			$kunci = "1";
			}

		$total = $tot1 - $kunci;

		//angka hari
		$hari = $total%7;

		//jika angka hari == 0, sebenarnya adalah 7.
		if ($hari == 0)
			{
			$hari = ($hari +7);
			}

		//kabisat, tahun habis dibagi empat alias tanpa sisa
		$kabisat = (int)$year % 4;

		if ($kabisat ==0)
			{
			$hri = $hri-1;
			}



		//hari ke-n
		if ($hari == 3)
			{
			$hri = 4;
			$dino = "Rabu";
			}

		else if ($hari == 4)
			{
			$hri = 5;
			$dino = "Kamis";
			}

		else if ($hari == 5)
			{
			$hri = 6;
			$dino = "Jum'at";
			}

		else if ($hari == 6)
			{
			$hri = 7;
			$dino = "Sabtu";
			}

		else if ($hari == 7)
			{
			$hri = 1;
			$dino = "Minggu";
			}

		else if ($hari == 1)
			{
			$hri = 2;
			$dino = "Senin";
			}

		else if ($hari == 2)
			{
			$hri = 3;
			$dino = "Selasa";
			}



		
		//kasi kolom
		$worksheet1->write_string(0,2+$i,"$dino, Tgl.$i");
		}



	//null kan
	$i = 0;




		
	//query
	$qku = mysqli_query($koneksi, "SELECT * FROM m_user ".
								"WHERE tipe = 'SISWA' ".
								"AND tapel_nama = '$pel_tapel2' ".
								"AND kelas_nama = '$pel_kelas2' ".
								"ORDER BY nama ASC");
	$rku = mysqli_fetch_assoc($qku);

	do
  		{
		$nomer = $nomer + 1;
		$kd = nosql($rku['kd']);
		$enis = balikin($rku['nomor']);
		$enama = balikin($rku['nama']);


		//status online ato tidak
		$qku2 = mysqli_query($koneksi, "SELECT * FROM guru_mapel_log ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND user_tipe = 'SISWA' ".
										"AND user_kode = '$enis' ".
										"AND round(DATE_FORMAT(postdate, '%d')) = '$utgl' ".
										"AND round(DATE_FORMAT(postdate, '%m')) = '$ubln' ".
										"AND round(DATE_FORMAT(postdate, '%Y')) = '$uthn' ".
										"ORDER BY postdate DESC LIMIT 0,1");
		$rku2 = mysqli_fetch_assoc($qku2);
		$tku2 = mysqli_num_rows($qku2);
		$ku_postdate = balikin($rku2['postdate']);


		//jika ya
		if (!empty($tku))
			{
			$ku_onlinenyax = "$ku_postdate";
			}
		else
			{
			$ku_onlinenyax = "Tidak";
			}
			
			
		//ciptakan
		$worksheet1->write_string($nomer,0,$nomer);
		$worksheet1->write_string($nomer,1,$enis);
		$worksheet1->write_string($nomer,2,$enama);
		
		
		
		
		
		//mendapatkan jumlah tanggal maksimum dalam suatu bulan
		$tgl = 0;
		$bulan = $ubln;
		$bln = $bulan + 1;
		$thn = $uthn;
	
		$lastday = mktime (0,0,0,$bln,$tgl,$thn);
	
		//total tanggal dalam sebulan
		$tkhir = strftime ("%d", $lastday);
	
		//lopping tgl
		for ($i=1;$i<=$tkhir;$i++)
			{
			//ketahui harinya
			$day = $i;
			$month = $bulan;
			$year = $thn;
	
	
			//mencari hari
			$a = substr($year, 2);
				//mengambil dua digit terakhir tahun
	
			$b = (int)($a/4);
				//membagi tahun dengan 4 tanpa memperhitungkan sisa
	
			$c = $month;
				//mengambil angka bulan
	
			$d = $day;
				//mengambil tanggal
	
			$tot1 = $a + $b + $c + $d;
				//jumlah sementara, sebelum dikurangani dengan angka kunci bulan
	
			//kunci bulanan
			if ($c == 1)
				{
				$kunci = "2";
				}
	
			else if ($c == 2)
				{
				$kunci = "7";
				}
	
			else if ($c == 3)
				{
				$kunci = "1";
				}
	
			else if ($c == 4)
				{
				$kunci = "6";
				}
	
			else if ($c == 5)
				{
				$kunci = "5";
				}
	
			else if ($c == 6)
				{
				$kunci = "3";
				}
	
			else if ($c == 7)
				{
				$kunci = "2";
				}
	
			else if ($c == 8)
				{
				$kunci = "7";
				}
	
			else if ($c == 9)
				{
				$kunci = "5";
				}
	
			else if ($c == 10)
				{
				$kunci = "4";
				}
	
			else if ($c == 11)
				{
				$kunci = "2";
				}
	
			else if ($c == 12)
				{
				$kunci = "1";
				}
	
			$total = $tot1 - $kunci;
	
			//angka hari
			$hari = $total%7;
	
			//jika angka hari == 0, sebenarnya adalah 7.
			if ($hari == 0)
				{
				$hari = ($hari +7);
				}
	
			//kabisat, tahun habis dibagi empat alias tanpa sisa
			$kabisat = (int)$year % 4;
	
			if ($kabisat ==0)
				{
				$hri = $hri-1;
				}
	
	
	
			//hari ke-n
			if ($hari == 3)
				{
				$hri = 4;
				$dino = "Rabu";
				}
	
			else if ($hari == 4)
				{
				$hri = 5;
				$dino = "Kamis";
				}
	
			else if ($hari == 5)
				{
				$hri = 6;
				$dino = "Jum'at";
				}
	
			else if ($hari == 6)
				{
				$hri = 7;
				$dino = "Sabtu";
				}
	
			else if ($hari == 7)
				{
				$hri = 1;
				$dino = "Minggu";
				}
	
			else if ($hari == 1)
				{
				$hri = 2;
				$dino = "Senin";
				}
	
			else if ($hari == 2)
				{
				$hri = 3;
				$dino = "Selasa";
				}
	
	
	
	

			//status online ato tidak
			$qku2 = mysqli_query($koneksi, "SELECT * FROM guru_mapel_log ".
											"WHERE kd_guru_mapel = '$gmkd' ".
											"AND user_tipe = 'SISWA' ".
											"AND user_kode = '$enis' ".
											"AND round(DATE_FORMAT(postdate, '%d')) = '$i' ".
											"AND round(DATE_FORMAT(postdate, '%m')) = '$ubln' ".
											"AND round(DATE_FORMAT(postdate, '%Y')) = '$uthn' ".
											"ORDER BY postdate DESC LIMIT 0,1");
			$rku2 = mysqli_fetch_assoc($qku2);
			$tku2 = mysqli_num_rows($qku2);


			//jika ada, hadir
			if (!empty($tku2))
				{
				$kuket = "HADIR";
				}
			else
				{
				$kuket = "-";
				}


			
			//kasi kolom
			$worksheet1->write_string($nomer,2+$i,$kuket);
			}

		
		
		//null kan
		$i = 0;
  		}
	while ($rku = mysqli_fetch_assoc($qku));







	//close
	$workbook->close();
		
		
	//re-direct
	$ke = "$filenya&s=psiswa&utgl=$utgl&ubln=$ubln&uthn=$uthn";
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
	        
	        
			
			<a href="'.$filenya.'" class="btn btn-danger">PER TANGGAL >></a>
			<a href="'.$filenya.'&s=pbulan" class="btn btn-danger">PER BULAN >></a>
			<a href="'.$filenya.'&s=psiswa" class="btn btn-danger">PER SISWA >></a>
			<hr>';
			

			//jika per tanggal /////////////////////////////////////////////////////////////////////////////
			if (empty($s))
				{
				echo '<p>PER TANGGAL : </p>
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
						
						
						
				<a href="'.$filenya.'&utgl='.$utgl.'&ubln='.$ubln.'&uthn='.$uthn.'&excelku=ptgl" class="btn btn-success">EXPORT EXCEL >></a>
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
				$target = "$filenya&utgl=$utgl&ubln=$ubln&uthn=$uthn";
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
		

				}




			//jika per bulan //////////////////////////////////////////////////////////////////////////////
			else if ($s == "pbulan")
				{
				echo '<p>PER BULAN : </p>
				<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
				<tr>
				<td>';
				echo "<select name=\"ublnx\" onChange=\"MM_jumpMenu('self',this,0)\" class=\"btn btn-warning\">";
				echo '<option value="'.$ubln.''.$uthn.'" selected>'.$arrbln[$ubln].' '.$uthn.'</option>';
				
				for ($i=1;$i<=12;$i++)
					{
					$ibln = $i;
					$ithn = $tahun;
				
					echo '<option value="'.$filenya.'&s=pbulan&utgl='.$utgl.'&ubln='.$ibln.'&uthn='.$ithn.'">'.$arrbln[$ibln].' '.$ithn.'</option>';
					}
				
				for ($i=1;$i<=12;$i++)
					{
					$ibln = $i;
					$ithn = $tahun - 1;
				
				
					echo '<option value="'.$filenya.'&s=pbulan&utgl='.$utgl.'&ubln='.$ibln.'&uthn='.$ithn.'">'.$arrbln[$ibln].' '.$ithn.'</option>';
					}
				
				echo '</select>
						
				<a href="'.$filenya.'&utgl='.$utgl.'&ubln='.$ubln.'&uthn='.$uthn.'&excelku=pbln" class="btn btn-success">EXPORT EXCEL >></a>
				</td>
				</tr>
				</table>
				<br>';




				echo '<div class="table-responsive">          
				  <table class="table" border="1">
				    <thead>
					<tr bgcolor="'.$warnaheader.'">
				    <td width="30"><strong>Tgl.</strong></td>
					<td width="75"><strong>Hari</strong></td>
					<td><strong>Ket.</strong></td>
					</tr>
					
					</thead>
			    <tbody>';
	
				//mendapatkan jumlah tanggal maksimum dalam suatu bulan
				$tgl = 0;
				$bulan = $ubln;
				$bln = $bulan + 1;
				$thn = $uthn;
	
				$lastday = mktime (0,0,0,$bln,$tgl,$thn);
	
				//total tanggal dalam sebulan
				$tkhir = strftime ("%d", $lastday);
	
				//lopping tgl
				for ($i=1;$i<=$tkhir;$i++)
					{
					//ketahui harinya
					$day = $i;
					$month = $bulan;
					$year = $thn;
	
	
					//mencari hari
					$a = substr($year, 2);
						//mengambil dua digit terakhir tahun
	
					$b = (int)($a/4);
						//membagi tahun dengan 4 tanpa memperhitungkan sisa
	
					$c = $month;
						//mengambil angka bulan
	
					$d = $day;
						//mengambil tanggal
	
					$tot1 = $a + $b + $c + $d;
						//jumlah sementara, sebelum dikurangani dengan angka kunci bulan
	
					//kunci bulanan
					if ($c == 1)
						{
						$kunci = "2";
						}
	
					else if ($c == 2)
						{
						$kunci = "7";
						}
	
					else if ($c == 3)
						{
						$kunci = "1";
						}
	
					else if ($c == 4)
						{
						$kunci = "6";
						}
	
					else if ($c == 5)
						{
						$kunci = "5";
						}
	
					else if ($c == 6)
						{
						$kunci = "3";
						}
	
					else if ($c == 7)
						{
						$kunci = "2";
						}
	
					else if ($c == 8)
						{
						$kunci = "7";
						}
	
					else if ($c == 9)
						{
						$kunci = "5";
						}
	
					else if ($c == 10)
						{
						$kunci = "4";
						}
	
					else if ($c == 11)
						{
						$kunci = "2";
						}
	
					else if ($c == 12)
						{
						$kunci = "1";
						}
	
					$total = $tot1 - $kunci;
	
					//angka hari
					$hari = $total%7;
	
					//jika angka hari == 0, sebenarnya adalah 7.
					if ($hari == 0)
						{
						$hari = ($hari +7);
						}
	
					//kabisat, tahun habis dibagi empat alias tanpa sisa
					$kabisat = (int)$year % 4;
	
					if ($kabisat ==0)
						{
						$hri = $hri-1;
						}
	
	
	
					//hari ke-n
					if ($hari == 3)
						{
						$hri = 4;
						$dino = "Rabu";
						}
	
					else if ($hari == 4)
						{
						$hri = 5;
						$dino = "Kamis";
						}
	
					else if ($hari == 5)
						{
						$hri = 6;
						$dino = "Jum'at";
						}
	
					else if ($hari == 6)
						{
						$hri = 7;
						$dino = "Sabtu";
						}
	
					else if ($hari == 7)
						{
						$hri = 1;
						$dino = "Minggu";
						}
	
					else if ($hari == 1)
						{
						$hri = 2;
						$dino = "Senin";
						}
	
					else if ($hari == 2)
						{
						$hri = 3;
						$dino = "Selasa";
						}
	
	
					//nek minggu,
					if ($hri == 1)
						{
						$warna = "red";
						$mggu_attr = "disabled";
						}
					else
						{
						if ($warna_set ==0)
							{
							$warna = $e_warna01;
							$warna_set = 1;
							$mggu_attr = "";
							}
						else
							{
							$warna = $e_warna02;
							$warna_set = 0;
							$mggu_attr = "";
							}
						}
	
	
					//cek digit
					//tgl
					if (strlen($i) == 1)
						{
						$utglx = "0$i";
						}
					else
						{
						$utglx = $i;
						}
	
	
					//bln
					if (strlen($ubln) == 1)
						{
						$ublnx = "0$ubln";
						}
					else
						{
						$ublnx = $ubln;
						}
	
	
					//nilainya...
					$qdtf = mysqli_query($koneksi, "SELECT DISTINCT(user_kode) AS nisku ".
											"FROM guru_mapel_log ".
											"WHERE kd_guru_mapel = '$gmkd' ".
											"AND user_tipe = 'SISWA' ".
											"AND round(DATE_FORMAT(postdate, '%d')) = '$utglx' ".
											"AND round(DATE_FORMAT(postdate, '%m')) = '$ublnx' ".
											"AND round(DATE_FORMAT(postdate, '%Y')) = '$uthn' ".
											"ORDER BY postdate DESC");
					$rdtf = mysqli_fetch_assoc($qdtf);
					$tdtf = mysqli_num_rows($qdtf);
	

	
	
					echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
					echo '<td valign="top" align="center" bgcolor="'.$warna.'"><strong>'.$i.'.</strong></td>
					<td valign="top" bgcolor="'.$warna.'"><strong>'.$dino.'</strong></td>
					<td valign="top">';
					
					//jika hadir
					if (!empty($tdtf))
						{
						echo '<b><a href="'.$filenya.'&utgl='.$utglx.'&ubln='.$ublnx.'&uthn='.$uthn.'">'.$tdtf.'</a></b> Siswa Hadir';
						}
					else
						{
						echo '-';
						}
						
						
					echo '</td>
					</tr>';
					}
	
				echo '</tbody>
				  </table>
				  </div>';


		
					
				}





				
				
			//jika per siswa //////////////////////////////////////////////////////////////////////////////
			else if ($s == "psiswa")
				{
				echo '<p>PER SISWA : </p>
				<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
				<tr>
				<td>';
				echo "<select name=\"ublnx\" onChange=\"MM_jumpMenu('self',this,0)\" class=\"btn btn-warning\">";
				echo '<option value="'.$ubln.''.$uthn.'" selected>'.$arrbln[$ubln].' '.$uthn.'</option>';
				
				for ($i=1;$i<=12;$i++)
					{
					$ibln = $i;
					$ithn = $tahun;
				
					echo '<option value="'.$filenya.'&s=psiswa&utgl='.$utgl.'&ubln='.$ibln.'&uthn='.$ithn.'">'.$arrbln[$ibln].' '.$ithn.'</option>';
					}
				
				for ($i=1;$i<=12;$i++)
					{
					$ibln = $i;
					$ithn = $tahun - 1;
				
				
					echo '<option value="'.$filenya.'&s=psiswa&utgl='.$utgl.'&ubln='.$ibln.'&uthn='.$ithn.'">'.$arrbln[$ibln].' '.$ithn.'</option>';
					}
				
				echo '</select>
						
				<a href="'.$filenya.'&utgl='.$utgl.'&ubln='.$ubln.'&uthn='.$uthn.'&excelku=psiswa" class="btn btn-success">EXPORT EXCEL >></a>
				</td>
				</tr>
				</table>
				<br>';




				//query
				$limit = 5;
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
				$target = "$filenya&s=psiswa&utgl=$utgl&ubln=$ubln&uthn=$uthn";
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
						<td valign="top"><strong>NAMA</strong></td>';
						
							//mendapatkan jumlah tanggal maksimum dalam suatu bulan
							$tgl = 0;
							$bulan = $ubln;
							$bln = $bulan + 1;
							$thn = $uthn;
				
							$lastday = mktime (0,0,0,$bln,$tgl,$thn);
				
							//total tanggal dalam sebulan
							$tkhir = strftime ("%d", $lastday);
				
							//lopping tgl
							for ($i=1;$i<=$tkhir;$i++)
								{
								//ketahui harinya
								$day = $i;
								$month = $bulan;
								$year = $thn;
				
				
								//mencari hari
								$a = substr($year, 2);
									//mengambil dua digit terakhir tahun
				
								$b = (int)($a/4);
									//membagi tahun dengan 4 tanpa memperhitungkan sisa
				
								$c = $month;
									//mengambil angka bulan
				
								$d = $day;
									//mengambil tanggal
				
								$tot1 = $a + $b + $c + $d;
									//jumlah sementara, sebelum dikurangani dengan angka kunci bulan
				
								//kunci bulanan
								if ($c == 1)
									{
									$kunci = "2";
									}
				
								else if ($c == 2)
									{
									$kunci = "7";
									}
				
								else if ($c == 3)
									{
									$kunci = "1";
									}
				
								else if ($c == 4)
									{
									$kunci = "6";
									}
				
								else if ($c == 5)
									{
									$kunci = "5";
									}
				
								else if ($c == 6)
									{
									$kunci = "3";
									}
				
								else if ($c == 7)
									{
									$kunci = "2";
									}
				
								else if ($c == 8)
									{
									$kunci = "7";
									}
				
								else if ($c == 9)
									{
									$kunci = "5";
									}
				
								else if ($c == 10)
									{
									$kunci = "4";
									}
				
								else if ($c == 11)
									{
									$kunci = "2";
									}
				
								else if ($c == 12)
									{
									$kunci = "1";
									}
				
								$total = $tot1 - $kunci;
				
								//angka hari
								$hari = $total%7;
				
								//jika angka hari == 0, sebenarnya adalah 7.
								if ($hari == 0)
									{
									$hari = ($hari +7);
									}
				
								//kabisat, tahun habis dibagi empat alias tanpa sisa
								$kabisat = (int)$year % 4;
				
								if ($kabisat ==0)
									{
									$hri = $hri-1;
									}
				
				
				
								//hari ke-n
								if ($hari == 3)
									{
									$hri = 4;
									$dino = "Rabu";
									}
				
								else if ($hari == 4)
									{
									$hri = 5;
									$dino = "Kamis";
									}
				
								else if ($hari == 5)
									{
									$hri = 6;
									$dino = "Jum'at";
									}
				
								else if ($hari == 6)
									{
									$hri = 7;
									$dino = "Sabtu";
									}
				
								else if ($hari == 7)
									{
									$hri = 1;
									$dino = "Minggu";
									}
				
								else if ($hari == 1)
									{
									$hri = 2;
									$dino = "Senin";
									}
				
								else if ($hari == 2)
									{
									$hri = 3;
									$dino = "Selasa";
									}
				
				
								//nek minggu,
								if ($hri == 1)
									{
									$warna = "red";
									}
								else
									{
									$warna = $warnaheader;
									}
				

						
								echo '<td width="50" valign="top" align="center" bgcolor="'.$warna.'"><strong>'.$dino.' Tgl.'.$i.'</strong></td>';
								}
						
						
						echo '</tr>
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
		
		
							
							
						echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$e_warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
						echo '<td valign="top">
						'.$enis.'
						</td>
						<td valign="top">
						'.$enama.'
						</td>';
						
						//mendapatkan jumlah tanggal maksimum dalam suatu bulan
						$tgl = 0;
						$bulan = $ubln;
						$bln = $bulan + 1;
						$thn = $uthn;



			
						$lastday = mktime (0,0,0,$bln,$tgl,$thn);
			
						//total tanggal dalam sebulan
						$tkhir = strftime ("%d", $lastday);
			
						//lopping tgl
						for ($i=1;$i<=$tkhir;$i++)
							{
							//ketahui harinya
							$day = $i;
							$month = $bulan;
							$year = $thn;
			
			
							//mencari hari
							$a = substr($year, 2);
								//mengambil dua digit terakhir tahun
			
							$b = (int)($a/4);
								//membagi tahun dengan 4 tanpa memperhitungkan sisa
			
							$c = $month;
								//mengambil angka bulan
			
							$d = $day;
								//mengambil tanggal
			
							$tot1 = $a + $b + $c + $d;
								//jumlah sementara, sebelum dikurangani dengan angka kunci bulan
			
							//kunci bulanan
							if ($c == 1)
								{
								$kunci = "2";
								}
			
							else if ($c == 2)
								{
								$kunci = "7";
								}
			
							else if ($c == 3)
								{
								$kunci = "1";
								}
			
							else if ($c == 4)
								{
								$kunci = "6";
								}
			
							else if ($c == 5)
								{
								$kunci = "5";
								}
			
							else if ($c == 6)
								{
								$kunci = "3";
								}
			
							else if ($c == 7)
								{
								$kunci = "2";
								}
			
							else if ($c == 8)
								{
								$kunci = "7";
								}
			
							else if ($c == 9)
								{
								$kunci = "5";
								}
			
							else if ($c == 10)
								{
								$kunci = "4";
								}
			
							else if ($c == 11)
								{
								$kunci = "2";
								}
			
							else if ($c == 12)
								{
								$kunci = "1";
								}
			
							$total = $tot1 - $kunci;
			
							//angka hari
							$hari = $total%7;
			
							//jika angka hari == 0, sebenarnya adalah 7.
							if ($hari == 0)
								{
								$hari = ($hari +7);
								}
			
							//kabisat, tahun habis dibagi empat alias tanpa sisa
							$kabisat = (int)$year % 4;
			
							if ($kabisat ==0)
								{
								$hri = $hri-1;
								}
			
			
			
							//hari ke-n
							if ($hari == 3)
								{
								$hri = 4;
								$dino = "Rabu";
								}
			
							else if ($hari == 4)
								{
								$hri = 5;
								$dino = "Kamis";
								}
			
							else if ($hari == 5)
								{
								$hri = 6;
								$dino = "Jum'at";
								}
			
							else if ($hari == 6)
								{
								$hri = 7;
								$dino = "Sabtu";
								}
			
							else if ($hari == 7)
								{
								$hri = 1;
								$dino = "Minggu";
								}
			
							else if ($hari == 1)
								{
								$hri = 2;
								$dino = "Senin";
								}
			
							else if ($hari == 2)
								{
								$hri = 3;
								$dino = "Selasa";
								}
			
			
							//nek minggu,
							if ($hri == 1)
								{
								$warnax = "red";
								}
							else
								{
								$warnax = $warna;
								}
			



							//status online ato tidak
							$qku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_log ".
															"WHERE kd_guru_mapel = '$gmkd' ".
															"AND user_tipe = 'SISWA' ".
															"AND user_kode = '$enis' ".
															"AND round(DATE_FORMAT(postdate, '%d')) = '$i' ".
															"AND round(DATE_FORMAT(postdate, '%m')) = '$ubln' ".
															"AND round(DATE_FORMAT(postdate, '%Y')) = '$uthn' ".
															"ORDER BY postdate DESC LIMIT 0,1");
							$rku = mysqli_fetch_assoc($qku);
							$tku = mysqli_num_rows($qku);


							//jika ada, hadir
							if (!empty($tku))
								{
								$kuket = "<b><font color='green'>HADIR</font></b>";
								}
							else
								{
								$kuket = "-";
								}




					
							echo "<td valign=\"top\" bgcolor=\"$warnax\" onmouseover=\"this.bgColor='$e_warnaover';\" onmouseout=\"this.bgColor='$warnax';\">";
							
							echo ''.$kuket.'
							
							</td>';
							}
					
						
						
						echo '</tr>';
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
$ketnya = "Menu Kehadiran Siswa";
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