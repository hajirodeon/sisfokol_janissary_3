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
require("../../inc/class/paging.php");
$tpl = LoadTpl("../../template/egr.html");

nocache;

//nilai
$filenya = "logs.php";
$judul = "LOG HISTORY";
$judulku = "[$tipe_session : $no1_session.$nm1_session] ==> $judul";
$juduli = $judul;
$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}



//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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



//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<div class="row">
<div class="col-lg-12">


  <div class="box box-warning">
    <div class="box-header">

      <h3 class="box-title">LOG HISTORY</h3>
    </div>
    
    
    <div class="box-body">


		<table width="100%" height="300" border="0" cellspacing="0" cellpadding="3">
		<tr valign="top">
		<td>';
		
			//query
			$p = new Pager();
			$start = $p->findStart($limit);

			$sqlcount = "SELECT * FROM user_blog_status ".
					"WHERE kd_user = '$kd1_session' ".
					"AND user_tipe = '$tipe_session' ".
					"AND user_kode = '$no1_session' ".
					"ORDER BY postdate DESC";
			$sqlresult = $sqlcount;

			$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
			$pages = $p->findPages($count, $limit);
			$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
			$pagelist = $p->pageList($_GET['page'], $pages, $target);
			$data = mysqli_fetch_array($result);

			//nek ada
			if ($count != 0)
				{
				echo '<table width="100%" border="0" cellpadding="3" cellspacing="0">';

				do
					{
					if ($warna_set ==0)
						{
						//$warna = $e_warna01;
						$warna_set = 1;
						}
					else
						{
						//$warna = $e_warna02;
						$warna_set = 0;
						}


					$nomer = $nomer + 1;
					$dt_usertipe = balikin($data['user_tipe']);
					$dt_userkode = balikin($data['user_kode']);
					$dt_usernama = balikin($data['user_nama']);
					$dt_status = balikin($data['status']);
					$dt_postdate = balikin($data['postdate']);

					echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$e_warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
					echo '<td>
					[<i>'.$dt_postdate.'</i>]. 
					<br>
					'.$dt_status.'
					<hr>					
					</td>
					</tr>';
					}
				while ($data = mysqli_fetch_assoc($result));

				echo '</table>
				<font color="red"><strong>'.$count.'</strong></font> Log. '.$pagelist.'';
				}

		
		
		echo '</td>
		</tr>
		</table>
		
	</div>
	
	</div>
	
</div>

</div>';
		
		
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//online terakhir ////////////////////////////////////////////////////////////////////////////////
$ipnya = get_client_ip_env();
							


//insert
$xyz = md5("$kd1_session$today");
mysqli_query($koneksi, "INSERT INTO user_blog_status(kd, kd_user, user_tipe, ".
				"user_kode, user_nama, status, ".
				"onlineya, ipnya, postdate) VALUES ".
				"('$xyz', '$kd1_session', '$tipe_session', ".
				"'$no1_session', '$nm1_session', '$judul', ".
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