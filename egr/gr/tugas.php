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
$filenya = "tugas.php?gmkd=$gmkd";
$kd = nosql($_REQUEST['kd']);
$kunci = cegah($_REQUEST['kunci']);
$kunci2 = balikin($_REQUEST['kunci']);
$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}



//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
	$e_nama = cegah($_POST['e_nama']);


	//nek null
	if (empty($e_nama))
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
			mysqli_query($koneksi, "UPDATE guru_mapel_tugas SET topik = '$e_nama' ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"AND kd = '$kd'");

			//re-direct
			xloc($filenya);
			exit();
			}



		//jika baru
		if ($s == "baru")
			{
			mysqli_query($koneksi, "INSERT INTO guru_mapel_tugas(kd, kd_guru_mapel, topik, postdate) VALUES ".
							"('$kd', '$gmkd', '$e_nama', '$today')");

							
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
	mysqli_query($koneksi, "DELETE FROM guru_mapel_tugas ".
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
		$filenya = "tugas.php?gmkd=$gmkd";
		$juduli = $judul;


		//judul
		echo "<h3>$judul</h3>";

		//menu elearning
		require("i_menu.php");


		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">TUGAS</h3>
	        </div>
	        
	        
	        <div class="box-body">';

		//jika edit / baru
		if (($s == "baru") OR ($s == "edit"))
			{
			$kdx = nosql($_REQUEST['kd']);
		
			$qx = mysqli_query($koneksi, "SELECT * FROM guru_mapel_tugas ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"AND kd = '$kdx'");
			$rowx = mysqli_fetch_assoc($qx);
			$e_nama = balikin($rowx['topik']);



			echo '<form action="'.$filenya.'" method="post" name="formx2">
			
			<p>
			Judul / Nama Tugas : 
			<br>
			<input name="e_nama" type="text" value="'.$e_nama.'" size="50" class="btn-warning">
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
			
		
		
		
		
		
		
		
		else
			{
			//jika null
			if (empty($kunci))
				{
				$sqlcount = "SELECT * FROM guru_mapel_tugas ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"ORDER BY postdate DESC";
				}
				
			else
				{
				$sqlcount = "SELECT * FROM guru_mapel_tugas ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"AND topik LIKE '%$kunci%' ".
								"ORDER BY postdate DESC";
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
			<input name="btnBARU" type="submit" value="ENTRI BARU >>" class="btn btn-danger">
			</p>
			<br>
			


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
					$i_nama = balikin($data['topik']);
					$i_postdate = balikin($data['postdate']);
					
					echo '<div class="table-responsive">          
					<table class="table" border="1">
					<thead>
					
					<tr valign="top" bgcolor="'.$warnaheader.'">
					<td><strong><font color="'.$warnatext.'">JUDUL/NAMA TUGAS</font></strong></td>
					</tr>
					</thead>
					<tbody>';


					//jumlah siswa yg mengumpulkan
					$qyuk = mysqli_query($koneksi, "SELECT * FROM siswa_tugas ".
											"WHERE kd_guru_mapel = '$gmkd' ".
											"AND tugas_kd = '$i_kd' ".
											"AND filex <> ''");
					$tyuk = mysqli_num_rows($qyuk);

					
							
					echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
					echo '<td>
					<p>
					<i>['.$i_postdate.'].</i>
					<br>
					'.$i_nama.'
					</p>
					<br>
						
														
						<p>
						<a href="'.$filenya.'&s=edit&page='.$page.'&kd='.$i_kd.'" class="btn btn-danger">EDIT >></a>
						
						<a href="'.$filenya.'&s=hapus&page='.$page.'&kd='.$i_kd.'" class="btn btn-danger">HAPUS >></a>
						</p>
						<br>
						
														
						<p>
						<b>'.$tyuk.'</b> Siswa Mengumpulkan Tugas.
						</p>
						
						<p>
						<a href="tugas_log.php?gmkd='.$gmkd.'&jkd='.$i_kd.'" class="btn btn-success">YANG MENGUMPULKAN TUGAS >></a> 
						</p>
						<br>
						
																			
					</td>
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