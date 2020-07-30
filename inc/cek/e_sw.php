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



//cek user SISWA
$qswa = mysqli_query($koneksi, "SELECT * FROM m_user ".
			"WHERE nomor = '$no1_session' ".
			"AND tipe = 'SISWA'");
$rswa = mysqli_fetch_assoc($qswa);
$tswa = mysqli_num_rows($qswa);

//jika bukan
if (empty($tswa))
	{
	//re-direct
	$pesan = "Anda Bukan Seorang Siswa. Terima Kasih.";
	$ke = "$sumber/index.php";
	pekem($pesan,$ke);
	exit();
	}
?>