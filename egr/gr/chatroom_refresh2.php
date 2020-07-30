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




//nilai
$kd1_session = nosql($_SESSION['kd1_session']);
$gmkd = nosql($_REQUEST['gmkd']);
$s = nosql($_REQUEST['s']);
$filenya = "chatroom_refresh2.php?gmkd=$gmkd";
$judulku = "Chat Refresh2";


$chatdatalist = 1000;

?>


<style>
body {
  margin: 0 auto;
  max-width: 800px;
  padding: 0 20px;
}

.container {
  border: 2px solid #dedede;
  background-color: #f1f1f1;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}

.darker {
  border-color: #ccc;
  background-color: #ddd;
}

.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  max-width: 60px;
  width: 100%;
  margin-right: 20px;
  border-radius: 50%;
}

.container img.right {
  float: right;
  margin-left: 20px;
  margin-right:0;
}

.time-right {
  float: right;
  color: #aaa;
}

.time-left {
  float: left;
  color: #999;
}
</style>



<?php
//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika view
if ($s == "view")
	{
	//query
	$p = new Pager();
	$start = $p->findStart($limit);

	$sqlcount = "SELECT guru_mapel_chatroom.*, guru_mapel_chatroom.postdate AS cpd ".
					"FROM guru_mapel_chatroom ".
					"WHERE kd_guru_mapel = '$gmkd' ".
					"ORDER BY postdate DESC";
	$sqlresult = $sqlcount;

	$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
	$limit = $chatdatalist; //maksimal
	$pages = $p->findPages($count, $limit);
	$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
	$pagelist = $p->pageList($_GET['page'], $pages, $target);
	$data = mysqli_fetch_array($result);

	//nek ada
	if ($count != 0)
		{
		do
			{
			$feh_mukd = nosql($data['kd_user']);
			$feh_nomor = nosql($data['user_kode']);
			$feh_nama = balikin($data['user_nama']);
			$feh_msg = balikin($data['msg']);
			$feh_postdate = balikin($data['cpd']);

			//jika teman...
			if ($feh_mukd != $kd1_session)
				{
				echo '<div class="container">
				  <img src="../../filebox/profil/'.$feh_mukd.'/thumb-'.$feh_mukd.'.jpg" alt="'.$feh_nama.'" style="width:100%;">
				  <p>
				  	<b>'.$feh_nomor.'. '.$feh_nama.'</b>
				  </p>
				  
				  <p>
				  	<i>'.$feh_msg.'</i>
				  </p>
				  
				  <span class="time-right">'.$feh_postdate.'</span>
				</div>';
				}
				
			else
				{
				echo '<div class="container darker">
					<img src="../../filebox/profil/'.$feh_mukd.'/thumb-'.$feh_mukd.'.jpg" alt="'.$feh_nama.'" class="right" style="width:100%;">
				  		<p>'.$feh_msg.'</p>
				  	<span class="time-left">'.$feh_postdate.'</span>
				</div>';
				}
				
			}
		while ($data = mysqli_fetch_assoc($result));
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//diskonek
xfree($result);
exit();
?>