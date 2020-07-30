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


//cek user GURU
$qsur = mysqli_query($koneksi, "SELECT guru_mapel.*, guru_mapel.kd AS gmkd ".
						"FROM guru_mapel ".
						"WHERE user_kode = '$no1_session'");
$rsur = mysqli_fetch_assoc($qsur);
$tsur = mysqli_num_rows($qsur);

//jika bukan guru
if (empty($tsur))
	{
	//re-direct
	$pesan = "Anda Bukan Seorang Guru Terima Kasih.";
	$ke = "$sumber/index.php";
	pekem($pesan,$ke);
	exit();
	}
?>