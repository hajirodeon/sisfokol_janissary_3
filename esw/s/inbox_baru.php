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
$tpl = LoadTpl("../../template/esw.html");

nocache;

//nilai
$filenya = "inbox_baru.php";
$judul = "Buat Pesan Baru";
$judulku = "[$tipe_session : $no1_session.$nm1_session] ==> $judul";
$juduli = $judul;
$etujuan = cegah($_REQUEST['etujuan']);
$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}



//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if ($_POST['btnOK'])
	{
	//ambil nilai
	$etujuan = cegah($_POST["etujuan"]);

	//cek null
	if (empty($etujuan))
		{
		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		pekem($pesan,$filenya);
		exit();
		}

	else
		{
		//query
		$q = mysqli_query($koneksi, "SELECT * FROM m_user ".
							"WHERE nomor = '$etujuan' LIMIT 0,1");
		$row = mysqli_fetch_assoc($q);
		$total = mysqli_num_rows($q);

		//cek, ada
		if (!empty($total))
			{
			//auto-kembali
			$ke = "$filenya?etujuan=$etujuan";
			xloc($ke);
			exit();
			}
		else
			{
			//re-direct
			$pesan = "NOMOR INDUK TIDAK DITEMUKAN. HARAP DIULANGI...!!!";
			pekem($pesan, $filenya);
			exit();
			}
		}
	}

	
	
	
	
	
//jika kirim
if ($_POST['btnKRM'])
	{
	//nilai
	$etujuan = cegah($_POST['etujuan']);
	$t_msg = cegah($_POST['t_msg']);


	//nek null
	if (empty($t_msg))
		{
		//nilai
		$pesan = "Input Tidak Lengkap. Harap Diperhatikan...!!";
		$ke = "$filenya?etujuan=$etujuan";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//isi
		$isi_msg = $t_msg;

		//detail teman
		$qtku = mysqli_query($koneksi, "SELECT * FROM m_user ".
								"WHERE nomor = '$etujuan'");
		$rtku = mysqli_fetch_assoc($qtku);
		$ttku = mysqli_num_rows($qtku);
		$tk_uskd = nosql($rtku['kd']);
		$tk_usno = cegah($rtku['nomor']);
		$tk_usnama = cegah($rtku['nama']);
		$tk_ustipe = cegah($rtku['tipe']);

		//query
		mysqli_query($koneksi, "INSERT INTO user_blog_msg(kd, kd_guru_mapel, tapel, kelas, kd_user, user_tipe, user_kode, user_nama, ".
						"untuk, uuser_tipe, uuser_kode, uuser_nama, msg, postdate) VALUES ".
						"('$x', '-', '-', '-', '$kd1_session', '$tipe_session', '$no1_session', '$nm1_session', ".
						"'$tk_uskd', '$tk_ustipe', '$tk_usno', '$tk_usnama', '$isi_msg', '$today')");


		//re-direct
		$pesan = "Pesan Baru Berhasil Dikirim.";
		$ke = "inbox_terkirimm.php";
		pekem($pesan,$ke);
		exit();
		}
	}

	
	
	
	
	
//jika batal
if ($_POST['btnBTL'])
	{
	//re-direct
	$ke = "inbox.php";
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



//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<div class="row">
<div class="col-lg-12">


  <div class="box box-success">
    <div class="box-header">

      <h3 class="box-title">BUAT PESAN BARU</h3>
    </div>
    
    
    <div class="box-body">
		
		<a href="inbox.php" class="btn btn-success">INBOX >></a>
		<a href="inbox_terkirimm.php" class="btn btn-warning">TERKIRIM >></a>
		<a href="inbox_baru.php" class="btn btn-danger">BUAT BARU >></a>  

		<hr>
		
		
		
		<p>
		Kepada, Nomor Induk : 
		<br>
		<input name="etujuan" type="text" size="15" value="'.$etujuan.'">
		
		<input name="btnOK" type="submit" value="OK >>" class="btn btn-danger">
		</p>
		<br>';
		
		
		//jika tujuan sudah ada
		if (!empty($etujuan))
			{
			//detail
			$q = mysqli_query($koneksi, "SELECT * FROM m_user ".
							"WHERE nomor = '$etujuan' LIMIT 0,1");
			$row = mysqli_fetch_assoc($q);
			$etipe = balikin($row['tipe']);
			$enama = balikin($row['nama']);
			

			echo '<p>
			<b>'.$etipe.'. '.$enama.'</b>
			</p>
			<br>
			
			<p>
			Isi Pesan :
			<br>
			<textarea name="t_msg" rows="5" class="btn-block" wrap="virtual"></textarea>

			<INPUT type="hidden" name="etujuan" value="'.$etujuan.'">
			<input name="btnKRM" type="submit" value="KIRIM" class="btn btn-danger">
			<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">';
			
			}
		
		
		
		echo '<hr>
		
		
		
		
		
		
		
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