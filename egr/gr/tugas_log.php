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
$jkd = nosql($_REQUEST['jkd']);
$katkd = nosql($_REQUEST['katkd']);
$filenya = "tugas_log.php?gmkd=$gmkd";

$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}
	
$kd = nosql($_REQUEST['kd']);
$kunci = cegah($_REQUEST['kunci']);
$kunci2 = balikin($_REQUEST['kunci']);
$skd = nosql($_REQUEST['skd']);


$limit = 10;


//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika ke daftar
if ($_POST['btnDF'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);
	
	
	//re-direct
	$ke = "tugas.php?gmkd=$gmkd";
	xloc($ke);
	exit();
	}






//nek batal
if ($_POST['btnBTL'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);
	$jkd = nosql($_POST['jkd']);

	//re-direct
	$ke = "$filenya&jkd=$jkd";
	xloc($ke);
	exit();
	}





//jika cari
if ($_POST['btnCARI'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);
	$jkd = nosql($_POST['jkd']);	
	$kunci = cegah($_POST['kunci']);


	//re-direct
	$ke = "$filenya&jkd=$jkd&kunci=$kunci";
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
	$jkd = nosql($_POST['jkd']);
	$s = nosql($_POST['s']);
	$swkd = nosql($_POST['swkd']);
	$page = nosql($_POST['page']);
	$e_nilai = cegah($_POST['e_nilai']);
	$editor = cegah2($_POST['editor']);

	//nek null
	if ((empty($e_nilai)) OR (empty($editor)))
		{
		//re-direct
		$pesan = "Belum Ditulis. Harap Diulangi...!!";
		$ke = "$filenya&jkd=$jkd&s=$s&kd=$kd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//beri nilai
		mysqli_query($koneksi, "UPDATE siswa_tugas SET nilai = '$e_nilai', ".
						"nilai_ket = '$editor', ".
						"nilai_postdate = '$today' ".
						"WHERE kd_guru_mapel = '$gmkd' ".
						"AND tugas_kd = '$jkd' ".
						"AND siswa_kd = '$swkd'");

		//re-direct
		$ke = "$filenya&jkd=$jkd";
		xloc($ke);
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



?>


		
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  




  
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
		$filenya = "tugas_log.php?gmkd=$gmkd";
		$juduli = $judul;


		//judul
		echo "<h3>$judul</h3>";

		//menu elearning
		require("i_menu.php");


		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">SISWA MENGUMPULKAN TUGAS</h3>
	          <hr>
	        </div>
	        
	        
	        <div class="box-body">';


			
			
			//jika edit nilai
			if ($s == "edit")
				{
				//edit 
				$qx = mysqli_query($koneksi, "SELECT * FROM siswa_tugas ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"AND tugas_kd = '$jkd' ".
									"AND siswa_kd = '$kd'");
				$rowx = mysqli_fetch_assoc($qx);
				$e_kd = balikin($rowx['kd']);
				$e_postdate = balikin($rowx['postdate']);
				$e_siswakd = balikin($rowx['siswa_kd']);
				$e_filex = balikin($rowx['filex']);
				$e_nilai = balikin($rowx['nilai']);
				$e_nilai_ket = balikin($rowx['nilai_ket']);



				//detail siswa
				$qyuk = mysqli_query($koneksi, "SELECT * FROM m_user ".
										"WHERE kd = '$e_siswakd'");
				$ryuk = mysqli_fetch_assoc($qyuk);
				$yuk_kd = nosql($ryuk['kd']);
				$yuk_nis = balikin($ryuk['nomor']);
				$yuk_nama = balikin($ryuk['nama']);
		
				
						
						
				echo '<form action="'.$filenya.'" method="post" name="formx2">
				
				
				<p>
				Siswa : 
				<br>
				<b>'.$yuk_nis.' . '.$yuk_nama.'</b>
				</p>
				<br>
				
				<p>
				Tugas Yang Dikumpulkan :
				<br>
				<i>'.$e_postdate.'</i>
				<br>';
				
				$file_path = "../../filebox/tugas/$gmkd/$e_kd/$e_filex";
					
				echo '<a href="'.$file_path.'" title="Unduh" target="_blank" class="btn btn-danger">CEK & UNDUH >></a>
				</p>
				<hr>
				
				
				<p>
				Nilai : 
				<br>
				<select name="e_nilai" class="btn btn-warning">
				<option value="'.$e_nilai.'" selected>'.$e_nilai.'</option>
				<option value="A+">A+</option>
				<option value="A">A</option>
				<option value="A-">A-</option>
				<option value="B+">B+</option>
				<option value="B">B</option>
				<option value="B-">B-</option>
				<option value="C+">C+</option>
				<option value="C">C</option>
				<option value="C-">C-</option>
				<option value="K">K</option>
				</select>
				</p>
				<br>
				
				
				
				
				<p>
				Keterangan : 
				<br>
				<textarea id="editor" name="editor" rows="5" style="width: 100%" class="btn-block btn-warning">'.$e_nilai_ket.'</textarea>
				</p>
				<br>
				
				<p>
				<input name="jml" type="hidden" value="'.$count.'">
				<input name="s" type="hidden" value="'.$s.'">
				<input name="kd" type="hidden" value="'.$kdx.'">
				<input name="swkd" type="hidden" value="'.$yuk_kd.'">
				<input name="page" type="hidden" value="'.$page.'">
				<input name="gmkd" type="hidden" value="'.$gmkd.'">
				<input name="skd" type="hidden" value="'.$skd.'">
				<input name="jkd" type="hidden" value="'.$jkd.'">
				
				<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">
				<input name="btnSMP" type="submit" value="SIMPAN >>" class="btn btn-danger">
				</p>
				
				
				</form>';
				}
				
			
			
			
			
			
			
			else
				{
				//jika null
				if (empty($kunci))
					{
					$sqlcount = "SELECT * FROM m_user ".
									"WHERE tipe = 'SISWA' ".
									"AND tapel_nama = '$pel_tapel2' ".
									"AND kelas_nama = '$pel_kelas2' ".
									"ORDER BY nama ASC";
					}
					
				else
					{
					$sqlcount = "SELECT * FROM m_user ".
									"WHERE tipe = 'SISWA' ".
									"AND tapel_nama = '$pel_tapel2' ".
									"AND kelas_nama = '$pel_kelas2' ".
									"AND (nomor LIKE '%$kunci%' ".
									"OR nama LIKE '%$kunci%') ".
									"ORDER BY nama ASC";
					}
					
					
				
				//query
				$p = new Pager();
				$start = $p->findStart($limit);
				
				$sqlresult = $sqlcount;
				
				$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
				$pages = $p->findPages($count, $limit);
				$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
				$target = "$filenya&jkd=$jkd";
				$pagelist = $p->pageList($_GET['page'], $pages, $target);
				$data = mysqli_fetch_array($result);
				
				
				
				
				//detail 
				$qku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_tugas ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND kd = '$jkd'");
				$rku = mysqli_fetch_assoc($qku);
				$u_nama = balikin($rku['topik']);
				
				
				
				//ketahui siswa yang mengerjakan
				$qmboh = mysqli_query($koneksi, "SELECT * FROM siswa_tugas ".
										"WHERE kd_guru_mapel = '$gmkd' ".
										"AND tugas_kd = '$jkd'");
				$tmboh = mysqli_num_rows($qmboh);
				
				
				//yg belum
				$tbelum = $count -$tmboh;
				

				
				
				echo '<form action="'.$filenya.'" method="post" name="formx">


				<p>
				<b>'.$u_nama.'</b>
				</p>
				
				<p>
				<font color="green"><b>'.$tmboh.'</b></font> Siswa Mengumpulkan Tugas.
				<br> 
				<font color="red"><b>'.$tbelum.'</b></font> Belum. 
				</p>
				
				<p>
				<input name="skd" type="hidden" value="'.$skd.'">
				<input name="gmkd" type="hidden" value="'.$gmkd.'">
				<input name="jkd" type="hidden" value="'.$jkd.'">
				<input name="btnDF" type="submit" value="<< LIHAT JUDUL/NAMA TUGAS LAIN" class="btn btn-danger">
				</p>
				<br>
				

				<p>
				<input name="kunci" type="text" value="'.$kunci2.'" size="20" class="btn btn-warning" placeholder="Kata Kunci...">
				<input name="btnCARI" type="submit" value="CARI" class="btn btn-danger">
				<input name="btnBTL" type="submit" value="RESET" class="btn btn-info">
				</p>
				<br>
				
				<div class="table-responsive">          
				<table class="table" border="1">
				<thead>
				
				<tr valign="top" bgcolor="'.$warnaheader.'">
				<td width="150"><strong><font color="'.$warnatext.'">SISWA</font></strong></td>
				<td><strong><font color="'.$warnatext.'">NILAI</font></strong></td>
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
						$i_user_kode = balikin($data['nomor']);
						$i_user_nama = balikin($data['nama']);
						
						
						
						//detail nilai
						$qyuk = mysqli_query($koneksi, "SELECT * FROM siswa_tugas ".
											"WHERE kd_guru_mapel = '$gmkd' ".
											"AND siswa_kd = '$i_kd' ".
											"AND tugas_kd = '$jkd' ".
											"ORDER BY postdate DESC");
						$ryuk = mysqli_fetch_assoc($qyuk);
						$tyuk = mysqli_num_rows($qyuk);
						$i_nilai = balikin($ryuk['nilai']);
						$i_nilai_ket = balikin($ryuk['nilai_ket']);
						$i_postdate = balikin($ryuk['postdate']);


			
						
						echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
						echo '<td>
						'.$i_user_nama.' ['.$i_user_kode.']
						</td>
						
						<td>';

								
						//jika belum
						if (empty($tyuk))
							{
							echo '<p>
							<font color="red">
							<b>Belum Kirim Tugas</b>
							</font>
							</p>';								
							}
							
						else
							{
							echo '<p>
							Tugas Dikirim : 
							<br>
							<b>'.$i_postdate.'</b>
							</p>
							<br>

							<p>
							Nilai : 
							<br>
							<b>'.$i_nilai.'</b> . 
							<i>'.$i_nilai_ket.'</i>
							<br>
							<br>
							<a href="'.$filenya.'&jkd='.$jkd.'&s=edit&page='.$page.'&kd='.$i_kd.'" class="btn btn-danger">CEK & BERI NILAI >></a>
							</p>';
							}

						echo '</td>
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
				<input name="jkd" type="hidden" value="'.$jkd.'">
				<input name="skd" type="hidden" value="'.$skd.'">
			
				<input name="jml" type="hidden" value="'.$count.'">
				<input name="s" type="hidden" value="'.$s.'">
				<input name="kd" type="hidden" value="'.$kdx.'">
				<input name="page" type="hidden" value="'.$page.'">
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