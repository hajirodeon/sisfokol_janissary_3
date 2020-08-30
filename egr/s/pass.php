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
$tpl = LoadTpl("../../template/egr.html");

nocache;

//nilai
$filenya = "pass.php";
$diload = "document.formx.passlama.focus();";
$judul = "Ganti Password";
$judulku = "[$tipe_session : $no1_session.$nm1_session] ==> $judul";
$juduli = $judul;


//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//simpan
if ($_POST['btnSMP'])
	{
	//ambil nilai
	$passlama = md5(cegah($_POST["passlama"]));
	$passbaru = md5(cegah($_POST["passbaru"]));
	$passbaru2 = md5(cegah($_POST["passbaru2"]));

	//cek null
	if ((empty($passlama)) OR (empty($passbaru)) OR (empty($passbaru2)))
		{
		//diskonek
		xfree($qbw);
		xclose($koneksi);

		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		pekem($pesan,$filenya);
		exit();
		}
	//nek pass baru, gak sama.
	else if ($passbaru != $passbaru2)
		{
		//diskonek
		xfree($qbw);
		xclose($koneksi);

		//re-direct
		$pesan = "Password Baru Tidak Sama. Harap Diulangi...!!";
		pekem($pesan,$filenya);
		exit();
		}
	else
		{
		//query
		$q = mysqli_query($koneksi, "SELECT * FROM m_user ".
							"WHERE tipe = '$tipe_session' ".
							"AND kd = '$kd1_session' ".
							"AND usernamex = '$username1_session' ".
							"AND passwordx = '$passlama'");
		$row = mysqli_fetch_assoc($q);
		$total = mysqli_num_rows($q);

		//cek
		if ($total != 0)
			{
			//perintah SQL
			mysqli_query($koneksi, "UPDATE m_user SET passwordx = '$passbaru' ".
							"WHERE tipe = '$tipe_session' ".
							"AND kd = '$kd1_session' ".
							"AND usernamex = '$username1_session'");

			//diskonek
			xfree($q);
			xfree($qbw);
			xclose($koneksi);

			//auto-kembali
			$pesan = "PASSWORD BERHASIL DIGANTI.";
			$ke = "../index.php";
			pekem($pesan, $ke);
			exit();
			}
		else
			{
			//diskonek
			xfree($q);
			xfree($qbw);
			xclose($koneksi);

			//re-direct
			$pesan = "PASSWORD LAMA TIDAK COCOK. HARAP DIULANGI...!!!";
			pekem($pesan, $filenya);
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

      <h3 class="box-title">GANTI PASSWORD</h3>
    </div>
    
    
    <div class="box-body">


		<table width="100%" height="300" border="0" cellspacing="0" cellpadding="3">
		<tr valign="top">
		<td>
		
		<p>Password Lama : <br>
		<input name="passlama" type="password" size="15">
		</p>
		<br>
		
		<p>Password Baru : <br>
		<input name="passbaru" type="password" size="15">
		</p>
		<br>
		
		<p>RE-Password Baru : <br>
		<input name="passbaru2" type="password" size="15">
		</p>
		<br>
		
		<p>
		<input name="btnSMP" type="submit" value="SIMPAN" class="btn btn-danger">
		<input name="btnBTL" type="reset" value="BATAL" class="btn btn-primary">
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