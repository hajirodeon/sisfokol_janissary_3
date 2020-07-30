<?php
session_start();

require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");
require("../../inc/class/paging.php");

	

$limit = 100;


$filenyax = "$sumber/esw/sw/i_jawabku.php";




//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika form
if ((isset($_GET['aksi']) && $_GET['aksi'] == 'form'))
	{
	//ambil nilai
	$gmkd = trim(cegah($_GET['gmkd']));
	$skd = trim(cegah($_GET['skd']));
	$jkd = trim(cegah($_GET['jkd']));
	$sesiku = $skd;
	

	//query
	$p = new Pager();
	$start = $p->findStart($limit);
	
	$sqlcount = "SELECT * FROM guru_mapel_soal ".
					"WHERE kd_guru_mapel = '$gmkd' ".
					"AND jadwal_kd = '$jkd' ".
					"ORDER BY round(no) ASC";
	
	$sqlresult = $sqlcount;
	
	$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
	$pages = $p->findPages($count, $limit);
	$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
	$pagelist = $p->pageList($_GET['page'], $pages, $target);
	$data = mysqli_fetch_array($result);
	
		
		
	echo '<div class="table-responsive">
	<table class="table" border="0">
    <tbody>
    <tr align="left">
    <td align="left">
    DIJAWAB : ';
	
	do 
		{
		$nomer = $nomer + 1;
		$i_kd = nosql($data['kd']);
		$i_no = balikin($data['no']);
		$i_kunci = balikin($data['kunci']);
		$i_isi = balikin($data['isi']);
		$i_postdate = balikin($data['postdate']);

		
		//yg dijawab
		$qyuk = mysqli_query($koneksi, "SELECT * FROM siswa_soal ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"AND jadwal_kd = '$jkd' ".
								"AND siswa_kd = '$skd' ".
								"AND soal_kd = '$i_kd'");
		$ryuk = mysqli_fetch_assoc($qyuk);
		$yuk_kdku = nosql($ryuk['kd']);
		$yuk_jawabku = balikin($ryuk['jawab']);
		
		
		
		
		echo '[<a href="#ku'.$i_kd.'"><b>'.$i_no.'</b> <span class="badge">'.$yuk_jawabku.'</span></a>]. ';
		}
	while ($data = mysqli_fetch_assoc($result));
	
		
	echo '</td>
	</tr>
	</tbody>
	</table>
	</div>';
	
	
	//null-kan
	mysqli_free_result();
	xclose($koneksi);
	exit();
	}
	

	
	

//null-kan
mysqli_free_result();
xclose($koneksi);
exit();
?>