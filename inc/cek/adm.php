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



///cek session //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$kd3_session = nosql($_SESSION['kd3_session']);
$username3_session = nosql($_SESSION['username3_session']);
$adm_session = nosql($_SESSION['adm_session']);
$pass3_session = nosql($_SESSION['pass3_session']);
$hajirobe_session = nosql($_SESSION['hajirobe_session']);

$qbw = mysqli_query($koneksi, "SELECT * FROM adminx ".
			"WHERE kd = '$kd3_session' ".
			"AND usernamex = '$username3_session' ".
			"AND passwordx = '$pass3_session'");
$rbw = mysqli_fetch_assoc($qbw);
$tbw = mysqli_num_rows($qbw);

if (($tbw == 0) OR (empty($kd3_session))
	OR (empty($username3_session))
	OR (empty($pass3_session))
	OR (empty($adm_session))
	OR (empty($hajirobe_session)))
	{
	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//redirect
	$pesan = "ANDA BELUM LOGIN. SILAHKAN LOGIN DAHULU...!!!";
	pekem($pesan, $sumber);
	exit();
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
?>