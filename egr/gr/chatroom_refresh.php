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


//nilai
$kd1_session = nosql($_SESSION['kd1_session']);
$gmkd = nosql($_REQUEST['gmkd']);
$s = nosql($_REQUEST['s']);
$filenya = "chatroom_refresh.php?gmkd=$gmkd";
$judulku = "Chat Refresh";




//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
//jika simpan
if ($_POST['btnSMP'])
	{
	//nilai
	$kd1_session = nosql($_SESSION['kd1_session']);
	$gmkd = nosql($_POST['gmkd']);
	$i_chat = cegah($_POST['chat']);


	//insert
	mysqli_query($koneksi, "INSERT INTO guru_mapel_chatroom(kd, kd_guru_mapel, kd_user, msg, postdate) VALUES ".
					"('$x', '$gmkd', '$kd1_session', '$i_chat', '$today')");

	//diskonek
	xclose($koneksi);

	//re-direct
	xloc($filenya);
	exit();
	}
 * 
 */
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////










//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<html>
<head>
<title>'.$judulku.'</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="'.$sumber.'/inc/style/chat.css" rel="stylesheet" type="text/css">

<script language="JavaScript">
function createRequestObject(){
var request_;
var browser = navigator.appName;

if(browser == "Microsoft Internet Explorer"){
	 request_ = new ActiveXObject("Microsoft.XMLHTTP");
}else{
	 request_ = new XMLHttpRequest();
	}
return request_;
}

var http = new Array();
var http2 = new Array();


function getInfo(){

var curDateTime = new Date();
http[curDateTime] = createRequestObject();

http[curDateTime].open(\'get\', \'chatroom_refresh2.php?s=view&gmkd='.$gmkd.'\');

http[curDateTime].onreadystatechange = function(){
	if (http[curDateTime].readyState == 4)
    	{
       	if (http[curDateTime].status == 200 || http[curDateTime].status == 304)
        	{
       	 	var response = http[curDateTime].responseText;
			document.getElementById(\'view_ajax\').innerHTML = response;
        	}
    	}
	}

	http[curDateTime].send(null);
}


function go(){
getInfo();
window.setTimeout("go()", 2000);
}

</script>

</head>';





echo '<body text="#000000" leftmargin="0" topmargin="0" onLoad="go();document.formx.chat.focus();">
<form action="JavaScript: send()" method="get" name="formx">
<div id="view_ajax" style="overflow=auto; width: 100%; height: 500px; border: 1px;" align="left">
</div>

</form>
</body>
</html>';


//diskonek
xfree($result);
exit();
?>