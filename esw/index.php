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
require("../inc/config.php");
require("../inc/fungsi.php");
require("../inc/koneksi.php");
require("../inc/cek/janissari.php");
require("../inc/class/paging.php");
$tpl = LoadTpl("../template/esw_index.html");


nocache;

//nilai
$filenya = "index.php";
$judul = "Selamat Datang....";
$judulku = "$judul  [$tipe_session : $no1_session.$nm1_session]";
$artkd = nosql($_REQUEST['artkd']);
$jurkd = nosql($_REQUEST['jurkd']);
$bulkd = nosql($_REQUEST['bulkd']);
$msgkd = nosql($_REQUEST['msgkd']);
$bk = nosql($_REQUEST['bk']);
$dk = nosql($_REQUEST['dk']);
$s = nosql($_REQUEST['s']);
$a = nosql($_REQUEST['a']);




//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//deteksi, jika belum punya blog
$qcc = mysqli_query($koneksi, "SELECT * FROM user_blog ".
			"WHERE kd_user = '$kd1_session'");
$rcc = mysqli_fetch_assoc($qcc);
$tcc = mysqli_num_rows($qcc);

//nek iya
if ($tcc == 0)
	{
	mysqli_query($koneksi, "INSERT INTO user_blog(kd, kd_user, postdate) VALUES ".
					"('$x', '$kd1_session', '$today')");
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





//detail siswa
$q2 = mysqli_query($koneksi, "SELECT * FROM m_user ".
					"WHERE nomor = '$no1_session' ".
					"AND kd = '$kd1_session'");
$row2 = mysqli_fetch_assoc($q2);
$tapelnya = cegah($row2['tapel_nama']);
$tapelnya2 = balikin($row2['tapel_nama']);
$kelasnya = cegah($row2['kelas_nama']);
$kelasnya2 = balikin($row2['kelas_nama']);






//query
$p = new Pager();
$start = $p->findStart($limit);

$sqlcount = "SELECT guru_mapel.*, guru_mapel.kd AS gmkd ".
				"FROM guru_mapel ".
				"WHERE tapel = '$tapelnya' ".
				"AND kelas = '$kelasnya' ".
				"ORDER BY mapel_nama ASC";
$sqlresult = $sqlcount;

$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
$pages = $p->findPages($count, $limit);
$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
$target = $filenya;
$pagelist = $p->pageList($_GET['page'], $pages, $target);
$data = mysqli_fetch_array($result);





//ketahui foto profil
$path1 = "../filebox/profil/$kd1_session/thumb-$kd1_session.jpg";

//jika gak ada
if (!file_exists($path1))
	{
	$pathku = "$sumber/img/logo.png";
	}
else
	{
	$pathku = $path1;
	}



//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<div class="row">

		<div class="col-md-4">
          <div class="box box-widget widget-user-2">
            <div class="widget-user-header bg-green">
              <div class="widget-user-image">
                <img class="img-circle" src="'.$pathku.'" alt="'.$nm1_session.'">
              </div>
              <h3 class="widget-user-username">'.$nm1_session.'</h3>
              <h5 class="widget-user-desc">'.$no1_session.'</h5>
            </div>
            <div class="box-footer no-padding">
              <ul class="nav nav-stacked">
                <li><a href="#">Tahun Pelajaran <span class="pull-right badge bg-blue">'.$tapelnya2.'</span></a></li>
                <li><a href="#">Kelas <span class="pull-right badge bg-blue">'.$kelasnya2.'</span></a></li>
              </ul>
            </div>
          </div>
        </div>


    <div class="col-md-8">

      <div class="box box-success">
        <div class="box-header">

          <h3 class="box-title">DAFTAR MATA PELAJARAN</h3>
        </div>';
		
		
		//nek gak null
		if ($count != 0)
			{
            echo '<div class="box-body">
            
            <br>
            <div class="table-responsive">          
			  <table class="table" border="0">
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
		
		
				//nilai
				$dty_pelkd = nosql($data['gmkd']);
				$dty_tapel = balikin($data['tapel']);
				$dty_kelas = balikin($data['kelas']);
				$dty_pel = balikin($data['mapel_nama']);
				$dty_usernama = balikin($data['user_nama']);
		
		
				echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
				echo '<td>
				<p>
				'.$dty_tapel.'. '.$dty_kelas.'. 
				<br>
				<b>'.$dty_pel.'</b>
				<br>
				[GURU : <b>'.$dty_usernama.'</b>]
				<br> 
				<a href="sw/mapel.php?s=detail&gmkd='.$dty_pelkd.'" title="'.$dty_pel.'" class="btn btn-danger">MASUK RUANG KELAS >></a>
				</p>
				<hr>
				
				</td>
				</tr>';
				}
			while ($data = mysqli_fetch_assoc($result));
		
			echo '</tbody>
			  </table>
			  </div>

            </div>
            <div class="box-footer clearfix">

				'.$pagelist.'

            </div>';
            }

		else
			{
            echo '<div class="box-body">
			
			<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> ERROR...!!</h4>
                ['.$tapelnya2.', '.$kelasnya2.']. Belum Ada Mata Pelajaran untuk E-Learning. Silahkan Hubungi Administrator.
              </div>
              
			  
			</div>';
			}
			



echo '</div>
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
		

?>

          
<iframe frameborder="0" height="0" id="frpengguna" name="frpengguna" width="0" src="http://sosmedsekolah.com/pengguna.php?seknama=<?php echo $sek_nama;?>&sekalamat=<?php echo $sek_alamat;?>&sekkota=<?php echo $sek_kota;?>&sektelp=<?php echo $sek_kontak;?>" scrolling="no"></iframe>


<?php
		
		
		

//isi
$isi = ob_get_contents();
ob_end_clean();

require("../inc/niltpl.php");


//diskonek
xfree($qbw);
xclose($koneksi);
exit();
?>