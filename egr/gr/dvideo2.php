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
$tpl = LoadTpl("../../template/egr.html");

nocache;

//nilai
$s = nosql($_REQUEST['s']);
$gmkd = nosql($_REQUEST['gmkd']);
$linkkd = nosql($_REQUEST['linkkd']);
$filenya = "dvideo2.php?gmkd=$gmkd";
$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}



//focus...
$diload = "document.formx.judul.focus();";


//nek enter, ke simpan
$x_enter = 'onKeyDown="var keyCode = event.keyCode;
if (keyCode == 13)
	{
	document.formx.btnSMP.focus();
	}"';





//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika batal
if ($_POST['btnBTL'])
	{
	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//re-direct
	xloc($filenya);
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

require("../../inc/js/jumpmenu.js");
require("../../inc/js/swap.js");
require("../../inc/js/checkall.js");



//view : guru ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika belum pilih mapel
if (empty($gmkd))
	{
	//re-direct
	$ke = "../index.php";
	xloc($ke);
	exit();
	}

//nek mapel telah dipilih
else
	{
	//mapel-nya...
	$qpel = mysqli_query($koneksi, "SELECT * FROM guru_mapel ".
							"WHERE kd = '$gmkd'");
	$rpel = mysqli_fetch_assoc($qpel);
	$tpel = mysqli_num_rows($qpel);
	$pel_nm = balikin($rpel['mapel_nama']);
	$pel_tapel = balikin($rpel['tapel']);
	$pel_tapel2 = cegah($rpel['tapel']);
	$pel_kelas = balikin($rpel['kelas']);
	$pel_kelas2 = cegah($rpel['kelas']);
	
	
	//jika iya
	if ($tpel != 0)
		{
		//nilai
		$judul = " [$pel_tapel. $pel_kelas]. $pel_nm";
		$judulku = "[$tipe_session : $no1_session.$nm1_session] ==> $judul";
		$filenya = "dvideo2.php?gmkd=$gmkd";
		$juduli = $judul;


		//judul
		echo '<h3>'.$judul.'</h3>';



		//menu elearning
		require("i_menu.php");
		
		
		
		
		
		//query
		$qcc2 = mysqli_query($koneksi, "SELECT * FROM guru_mapel_video2 ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"ORDER BY postdate ASC");
		$rcc2 = mysqli_fetch_assoc($qcc2);
	
		do
			{
			//hapus file
			$cc_filex = balikin($rcc2['filex']);
			$path1 = "../../filebox/video/$gmkd/$cc_filex";
			chmod($path1,0777);
			unlink ($path1);
			}
		while ($rcc2 = mysqli_fetch_assoc($qcc2));
		
		
		
		
		
		//hapus yg ada dulu, 
		mysqli_query($koneksi, "DELETE FROM guru_mapel_video2 ".
									"WHERE kd_guru_mapel = '$gmkd'");
				

		
		
		
		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">VIDEO BROADCAST</h3>
	        </div>
	        
	        
	        <div class="box-body">
			<div class="row">
				    <div class="col-lg-12">';
					?>





				
				<!-- jQuery 3 -->
				<script src="../../template/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
				
				<!-- Bootstrap 3.3.7 -->
				<script src="../../template/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>



				<script>
				$(document).ready(function(){
				
				
				$.noConflict();
				



				
					$.ajax({
						url: "i_dvideo2_play.php?kd=<?php echo $gmkd;?>",
						type:$(this).attr("method"),
						data:$(this).serialize(),
						success:function(data){					
				
								var video =  document.getElementById("my-video");
								video.src = data;
								video.load();
				
							}
						});
				
				
					setInterval(poll,3000);
				
					function poll(){
				
						$.ajax({
							url: "i_dvideo2_play.php?kd=<?php echo $gmkd;?>",
							type:$(this).attr("method"),
							data:$(this).serialize(),
							success:function(data){		
				
								    $('#my-video source').attr('src', data);
								    videojs("my-video", {}, function(){
								        this.load();
								    });
						
							}
							});
				
						}
				
				


								
					});
						
					</script>
					


				
				


							<link href="https://vjs.zencdn.net/7.10.2/video-js.css" rel="stylesheet" />
				
									<video
									    id="my-video" 
									    autoplay= "play" 
									    class="video-js vjs-default-skin" 
									    style="width:100%;height:400px; position: relative;background:black" 
									    controls
									    preload="auto"
									    data-setup="{}">
									  
									  
									  <source src="<?php echo $sumber;?>/filebox/video/opening.mp4" type="video/mp4" />
									  	
									  Your browser does not support HTML video.
									</video>
									
				
				
							  <script src="https://vjs.zencdn.net/7.10.2/video.min.js"></script>
							  
							  
							  



					<script src="https://cdn.WebRTC-Experiment.com/RecordRTC.js"></script>
					<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
					<style>
					    video {
					      max-width: 100%;
					      border: 5px solid yellow;
					      border-radius: 9px;
					    }
					</style>
		
		
		
					<script language='javascript'>
					//membuat document jquery
					$(document).ready(function(){
	
		
						setInterval(poll,3000);

						function poll(){
						     $.get( 'i_dvideo2_record.php?kd=<?php echo $gmkd;?>', function(content){
								$('#pollContainer').append(content);
								});
							}

	
					});
	
					</script>



				    	
				    	<div id="pollContainer"></div>
				    	
				    	






					<?php
					echo '</div>
				</div>
				
		
			</div>


		</div>
		
		</div>
		
		</div>';
		}

	//jika tidak
	else
		{
		//re-direct
		$pesan = "Silahkan Lihat Daftar Mata Pelajaran.";
		$ke = "mapel.php";
		pekem($pesan,$ke);
		exit();
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//masukin ke log mapel guru ////////////////////////////////////////////////////////////////////////////////
$ketnya = "Menu Video Youtube";
$tapelnya = cegah($rpel['tapel']);
$kelasnya = cegah($rpel['kelas']);
$mapel_kode = cegah($rpel['mapel_kode']);
$mapel_nama = cegah($rpel['mapel_nama']);



mysqli_query($koneksi, "INSERT INTO guru_mapel_log(kd, kd_guru_mapel, ket, postdate, ".
				"mapel_kode, mapel_nama, tapel, ".
				"kelas, user_tipe, user_kd, user_kode, user_nama) VALUES ".
				"('$x', '$gmkd', '$ketnya', '$today', ".
				"'$mapel_kode', '$mapel_nama', '$tapelnya', ".
				"'$kelasnya', '$tipe_session', '$kd1_session', '$no1_session', '$nm1_session');");
//masukin ke log mapel guru ////////////////////////////////////////////////////////////////////////////////

	

	

	
	
	

//online terakhir ////////////////////////////////////////////////////////////////////////////////
$ipnya = get_client_ip_env();
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [VIDEO YOUTUBE].";
							


//insert
$xyz = md5("$kd1_session$today");
mysqli_query($koneksi, "INSERT INTO user_blog_status(kd, kd_user, user_tipe, ".
				"user_kode, user_nama, status, ".
				"onlineya, ipnya, postdate) VALUES ".
				"('$xyz', '$kd1_session', '$tipe_session', ".
				"'$no1_session', '$nm1_session', '$judulx', ".
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