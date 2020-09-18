<?php
session_start();

require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");
require("../../inc/cek/adm.php");
require("../../inc/class/paging.php");
$tpl = LoadTpl("../../template/admin.html");

nocache;

//nilai
$filenya = "reset_pass.php";
$judul = "Reset Password";
$judulku = "[SETTING]. $judul";
$judulx = $judul;
$kd = nosql($_REQUEST['kd']);
$s = nosql($_REQUEST['s']);
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
	//re-direct
	xloc($filenya);
	exit();
	}





//jika cari
if ($_POST['btnCARI'])
	{
	//nilai
	$kunci = cegah($_POST['kunci']);


	//re-direct
	$ke = "$filenya?kunci=$kunci";
	xloc($ke);
	exit();
	}





//nek pegawai : reset
if ($s == "reset")
	{ 
	//nilai
	$nilku = substr($x,0,5);
	
	//pass baru
	$passbarux = md5($nilku);
	
	
	//update
	mysqli_query($koneksi, "UPDATE m_user SET passwordx = '$passbarux' ".
					"WHERE kd = '$kd'"); 
	
	//re-direct
	$pesan = "Password Baru : $nilku";
	pekem($pesan,$filenya);
	exit();
	}






/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//isi *START
ob_start();


//require
require("../../template/js/jumpmenu.js");
require("../../template/js/checkall.js");
require("../../template/js/swap.js");
?>


  
  <script>
  	$(document).ready(function() {
    $('#table-responsive').dataTable( {
        "scrollX": true
    } );
} );
  </script>
  
<?php
//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika null
if (empty($kunci))
	{
	$sqlcount = "SELECT * FROM m_user ".
					"ORDER BY nama ASC";
	}
	
else
	{
	$sqlcount = "SELECT * FROM m_user ".
					"WHERE nomor LIKE '%$kunci%' ".
					"OR nama LIKE '%$kunci%' ".
					"OR tipe LIKE '%$kunci%' ".
					"ORDER BY nama ASC";
	}
	
	

//query
$p = new Pager();
$start = $p->findStart($limit);

$sqlresult = $sqlcount;

$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
$pages = $p->findPages($count, $limit);
$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
$pagelist = $p->pageList($_GET['page'], $pages, $target);
$data = mysqli_fetch_array($result);



echo '<form action="'.$filenya.'" method="post" name="formx">
<p>
<input name="kunci" type="text" value="'.$kunci2.'" size="20" class="btn btn-warning" placeholder="Kata Kunci...">
<input name="btnCARI" type="submit" value="CARI" class="btn btn-danger">
<input name="btnBTL" type="submit" value="RESET" class="btn btn-info">
</p>
	

<div class="table-responsive">          
<table class="table" border="1">
<thead>

<tr valign="top" bgcolor="'.$warnaheader.'">
<td width="100"><strong><font color="'.$warnatext.'">TIPE</font></strong></td>
<td width="150"><strong><font color="'.$warnatext.'">IMAGE</font></strong></td>
<td width="50"><strong><font color="'.$warnatext.'">NOINDUK</font></strong></td>
<td><strong><font color="'.$warnatext.'">NAMA</font></strong></td>
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
		$i_tipe = balikin($data['tipe']);
		$i_kode = balikin($data['nomor']);
		$i_nama = balikin($data['nama']);
		$i_akses = $i_kode;


		$nil_foto1 = "$sumber/filebox/profil/$i_kd/thumb-$i_kd.jpg";

		
		echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
		echo '<td>'.$i_tipe.'</td>
		<td><img src="'.$nil_foto1.'" width="150"></td>
		<td>'.$i_kode.'</td>
		<td>
		'.$i_nama.'
		
		<hr>
		<a href="'.$filenya.'?s=reset&kd='.$i_kd.'" class="btn btn-primary">RESET PASSWORD >></a>
		</td>
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

<input name="jml" type="hidden" value="'.$count.'">
<input name="s" type="hidden" value="'.$s.'">
<input name="kd" type="hidden" value="'.$kdx.'">
<input name="page" type="hidden" value="'.$page.'">
</td>
</tr>
</table>
</form>';




//isi
$isi = ob_get_contents();
ob_end_clean();

require("../../inc/niltpl.php");


//null-kan
xclose($koneksi);
exit();
?>