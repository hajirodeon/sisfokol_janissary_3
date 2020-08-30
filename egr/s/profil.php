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
$filenya = "profil.php";
$judul = "Ganti Profil";
$judulku = "[$tipe_session : $no1_session.$nm1_session] ==> $judul";
$juduli = $judul;
$kd = $kd1_session;


//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika ganti foto profil ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
if ($_POST['btnGNT'])
	{
	//nilai
	$filex_namex = strip(strtolower($_FILES['filex_foto']['name']));
	
	

	//nek null
	if (empty($filex_namex))
		{
		//null-kan
		xclose($koneksi);

		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		pekem($pesan,$filenya);
		exit();
		}
	else
		{
		//deteksi .jpg
		$ext_filex = substr($filex_namex, -4);

		if ($ext_filex == ".jpg")
			{
			//nilai
			$path1 = "../../filebox/profil/$kd";
			$path2 = "../../filebox/profil";
			chmod($path1,0777);
			chmod($path2,0777);


			//cek, sudah ada belum
			if (!file_exists($path1))
				{
				//bikin folder kd_user
				mkdir("$path1", $chmod);
				}



			//hapus file
			$cc_filex1 = "asli-$kd.jpg";
			$path11 = "../../filebox/profil/$kd/$cc_filex1";
			chmod($path11,0777);
			unlink ($path11);

			//hapus file
			$cc_filex2 = "thumb-$kd.jpg";
			$path12 = "../../filebox/profil/$kd/$cc_filex2";
			chmod($path12,0777);
			unlink ($path12);



			//mengkopi file
			//copy($_FILES['filex_foto']['tmp_name'],"../../filebox/profil/$kd/$cc_filex1");
			copy($_FILES['filex_foto']['tmp_name'],"../../filebox/profil/$kd/$cc_filex2");

			
			
			
				
			//bikin image thumbnail ///////////////////////////////////////////////////////////////////////////////
			$pathku = "../../filebox/profil/$kd/$cc_filex2";
			resize_image($pathku, 100, 100);




			chmod($path12,0755);
			chmod($path11,0755);


			//re-direct
			xloc($filenya);
			exit();
			}
		else
			{
			//salah
			$pesan = "Bukan FIle Image .jpg . Harap Diperhatikan...!!";
			pekem($pesan,$filenya);
			exit();
			}
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



//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<div class="row">
<div class="col-lg-12">


  <div class="box box-warning">
    <div class="box-header">

      <h3 class="box-title">GANTI PROFIL</h3>
    </div>
    
    
    <div class="box-body">


		<table width="100%" height="300" border="0" cellspacing="0" cellpadding="3">
		<tr valign="top">
		<td>';

		$y_filex = "thumb-$kd.jpg";
		
		//nek null foto
		if (empty($y_filex))
			{
			$nil_foto = "$sumber/img/foto_blank.jpg";
			}
		else
			{
			$nil_foto = "$sumber/filebox/profil/$kd/$y_filex";
			}
	
		echo '<p>
		<img src="'.$nil_foto.'" alt="'.$y_nama.'" width="150" height="150" border="1">
		</p>
		<hr>
		<br>
		
		<p>
		File .jpg :
		<br>
		<input name="filex_foto" type="file" size="15">
		<br>
		<input name="btnGNT" type="submit" value="GANTI FOTO PROFIL >>" class="btn btn-danger">
		</p>


		
		<br>
		<br>
		<br>
		</td>
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