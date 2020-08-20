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
$filenya = "guru.php";
$judul = "[LOG] Kehadiran Guru";
$judulku = "[$adm_session] ==> $judul";
$judulku = "$judul";
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




$utgl = nosql($_REQUEST['utgl']);
$ubln = nosql($_REQUEST['ubln']);
$uthn = nosql($_REQUEST['uthn']);


$ubln = round($ubln);



//jika null, kasi hari ini
if ((empty($s)) AND (empty($utgl)))
	{
	//nilai
	$bulanx = round($bulan);
	
	//re-direct
	$ke = "$filenya?utgl=$tanggal&ubln=$bulanx&uthn=$tahun";
	xloc($ke);
	exit();
	}






//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//isi *START
ob_start();


//require
require("../../template/js/jumpmenu.js");
require("../../template/js/checkall.js");
require("../../template/js/swap.js");
?>


  
  <script>
  	$(document).ready(function() {
    $('#table-responsive').dataTable( {
        "scrollX": true
    } );
} );
  </script>
  


<?php		
echo '<a href="'.$filenya.'" class="btn btn-danger">PER TANGGAL >></a>
<a href="'.$filenya.'?s=pbulan" class="btn btn-danger">PER BULAN >></a>
<a href="'.$filenya.'?s=pguru" class="btn btn-danger">PER GURU >></a>
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
		echo '<option value="'.$filenya.'?utgl='.$itgl.'">'.$itgl.'</option>';
		}
	echo '</select>';
	
	echo "<select name=\"ublnx\" onChange=\"MM_jumpMenu('self',this,0)\" class=\"btn btn-warning\">";
	echo '<option value="'.$ubln.''.$uthn.'" selected>'.$arrbln[$ubln].' '.$uthn.'</option>';
	
	for ($i=1;$i<=12;$i++)
		{
		$ibln = $i;
		$ithn = $tahun;
	
		echo '<option value="'.$filenya.'?utgl='.$utgl.'&ubln='.$ibln.'&uthn='.$ithn.'">'.$arrbln[$ibln].' '.$ithn.'</option>';
		}
	
	for ($i=1;$i<=12;$i++)
		{
		$ibln = $i;
		$ithn = $tahun - 1;
	
	
		echo '<option value="'.$filenya.'?utgl='.$utgl.'&ubln='.$ibln.'&uthn='.$ithn.'">'.$arrbln[$ibln].' '.$ithn.'</option>';
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
					"WHERE tipe = 'GURU' ".
					"ORDER BY nama ASC";
	$sqlresult = $sqlcount;


	$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
	$pages = $p->findPages($count, $limit);
	$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
	$target = "$filenya?utgl=$utgl&ubln=$ubln&uthn=$uthn";
	$pagelist = $p->pageList($_GET['page'], $pages, $target);
	$data = mysqli_fetch_array($result);


	//nek ada
	if ($count != 0)
		{
		echo '<div class="table-responsive">          
		  <table class="table" border="1">
		    <thead>
			<tr bgcolor="'.$warnaheader.'">
			<td width="50" valign="top"><strong>NIP</strong></td>
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
											"WHERE user_tipe = 'GURU' ".
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
		<font color="blue"><strong>TIDAK ADA DATA.</strong></font>
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
	
		echo '<option value="'.$filenya.'?s=pbulan&utgl='.$utgl.'&ubln='.$ibln.'&uthn='.$ithn.'">'.$arrbln[$ibln].' '.$ithn.'</option>';
		}
	
	for ($i=1;$i<=12;$i++)
		{
		$ibln = $i;
		$ithn = $tahun - 1;
	
	
		echo '<option value="'.$filenya.'?s=pbulan&utgl='.$utgl.'&ubln='.$ibln.'&uthn='.$ithn.'">'.$arrbln[$ibln].' '.$ithn.'</option>';
		}
	
	echo '</select>
			
	</td>
	</tr>
	</table>
	<br>';




	//jika bulan sudah dipilih
	if (!empty($ubln))
		{
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
									"WHERE user_tipe = 'GURU' ".
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
				echo '<b><a href="'.$filenya.'?utgl='.$utglx.'&ubln='.$ublnx.'&uthn='.$uthn.'">'.$tdtf.'</a></b> Guru Hadir';
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
		
	}





	
	
//jika per guru //////////////////////////////////////////////////////////////////////////////
else if ($s == "pguru")
	{
	echo '<p>PER GURU : </p>
	<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
	<tr>
	<td>';
	echo "<select name=\"ublnx\" onChange=\"MM_jumpMenu('self',this,0)\" class=\"btn btn-warning\">";
	echo '<option value="'.$ubln.''.$uthn.'" selected>'.$arrbln[$ubln].' '.$uthn.'</option>';
	
	for ($i=1;$i<=12;$i++)
		{
		$ibln = $i;
		$ithn = $tahun;
	
		echo '<option value="'.$filenya.'?s=pguru&utgl='.$utgl.'&ubln='.$ibln.'&uthn='.$ithn.'">'.$arrbln[$ibln].' '.$ithn.'</option>';
		}
	
	for ($i=1;$i<=12;$i++)
		{
		$ibln = $i;
		$ithn = $tahun - 1;
	
	
		echo '<option value="'.$filenya.'?s=pguru&utgl='.$utgl.'&ubln='.$ibln.'&uthn='.$ithn.'">'.$arrbln[$ibln].' '.$ithn.'</option>';
		}
	
	echo '</select>
			
	</td>
	</tr>
	</table>
	<br>';






	//jika bulan sudah dipilih
	if (!empty($ubln))
		{
		//query
		$limit = 5;
		$p = new Pager();
		$start = $p->findStart($limit);
	
		$sqlcount = "SELECT * FROM m_user ".
						"WHERE tipe = 'GURU' ".
						"ORDER BY nama ASC";
		$sqlresult = $sqlcount;
	
	
		$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
		$pages = $p->findPages($count, $limit);
		$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
		$target = "$filenya?s=pguru&utgl=$utgl&ubln=$ubln&uthn=$uthn";
		$pagelist = $p->pageList($_GET['page'], $pages, $target);
		$data = mysqli_fetch_array($result);
	
	
		//nek ada
		if ($count != 0)
			{
			echo '<div class="table-responsive">          
			  <table class="table" border="1">
			    <thead>
				<tr bgcolor="'.$warnaheader.'">
				<td width="50" valign="top"><strong>NIP</strong></td>
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
													"WHERE user_tipe = 'GURU' ".
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
			<font color="blue"><strong>TIDAK ADA DATA. </strong></font>
			</p>';
			}
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