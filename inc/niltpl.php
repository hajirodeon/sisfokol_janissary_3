<?php
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
/////// SISFOKOL JANISSARI                          ///////
/////// (customization)                             ///////
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



//nilai /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$konten = ParseVal($tpl, array ("judul" => $judul,
					"judulku" => $judulku,
					"filenya" => $filenya,
					"sumber" => $sumber,
					"isi" => $isi,
					"isimenu" => $isimenu,
					"isiprofil" => $isiprofil,
					"diload" => $diload,
					"versi" => $versi,
					"author" => $author,
					"keywords" => $keywords,
					"url" => $url,
					"wkdet" => $wkdet,
					"wkurl" => $wkurl,
					"sek_nama" => $sek_nama,
					"sek_alamat" => $sek_alamat,
					"sek_kontak" => $sek_kontak,
					"description" => $description));

//tampilkan
echo $konten;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////







//masukkan dalam logs siswa, khusus elearning /////////////////////////////////////////////////////////////////
$nilku = $_SERVER['REQUEST_URI'];;

// proses parsing
$pecah = explode("/", $nilku);


//ambil deretan
$j_nil1 = $pecah[3];
$j_nil2 = $pecah[4];

//jika benar, seorang siswa sedang masuk elearning
if (($j_nil1 == "e") AND ($j_nil2 == "sw"))
	{
	//cek user SISWA
	$qswa = mysql_query("SELECT * FROM m_user ".
				"WHERE kd = '$kd1_session' ".
				"AND tipe = 'SISWA'");
	$rswa = mysql_fetch_assoc($qswa);
	$tswa = mysql_num_rows($qswa);

	if ($tswa != 0)
		{
		//simpan ke database
		mysql_query("INSERT INTO user_learning (kd, kd_user, kd_guru_mapel, ket, postdate) VALUES ".
				"('$x', '$kd1_session', '$gmkd', '$judul', '$today')");
		}
	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////






//kill process //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
set_time_limit(600);  //set maksimal loading : 600 detik atau 10 menit
$result=mysql_query("show processlist");
while ($row=mysql_fetch_array($result))
	{
	$process_id=$row["Id"];

	if (($row["Time"] > 0) OR ($row["Command"]=="Sleep"))
		{
		//print $row["Id"];
		$sql="kill $process_id";
		mysql_query($sql);
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
?>