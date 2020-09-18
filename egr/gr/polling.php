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
$tpl = LoadTpl("../../template/egr.html");

nocache;

//nilai
$s = nosql($_REQUEST['s']);
$gmkd = nosql($_REQUEST['gmkd']);
$filenya = "polling.php?gmkd=$gmkd";



//focus
$diload = "document.formx.topik.focus();";


//nek enter, ke simpan
$x_enter = 'onKeyDown="var keyCode = event.keyCode;
if (keyCode == 13)
	{
	document.formx.btnSMP.focus();
	}"';





//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//nek batal
if ($_POST['btnBTL'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);

	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//re-direct
	xloc($filenya);
	exit();
	}




//nek simpan
if ($_POST['btnSMP'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);
	$topik = cegah($_POST['topik']);
	$opsi1 = cegah($_POST['opsi1']);
	$opsi2 = cegah($_POST['opsi2']);
	$opsi3 = cegah($_POST['opsi3']);
	$opsi4 = cegah($_POST['opsi4']);
	$opsi5 = cegah($_POST['opsi5']);


	//cek null
	if ((empty($topik)) OR (empty($opsi1)) OR (empty($opsi2)) OR (empty($opsi3)) OR (empty($opsi4)) OR (empty($opsi5)))
		{
		//diskonek
		xfree($qbw);
		xclose($koneksi);

		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diperhatikan...!!";
		$ke = "$filenya&s=baru";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//hapus yang ada...
		mysqli_query($koneksi, "DELETE FROM guru_mapel_polling ".
						"WHERE kd_guru_mapel = '$gmkd'");

		//entry baru
		mysqli_query($koneksi, "INSERT INTO guru_mapel_polling(kd, kd_guru_mapel, topik, opsi1, opsi2, opsi3, opsi4, opsi5, postdate) VALUES ".
						"('$x', '$gmkd', '$topik', '$opsi1', '$opsi2', '$opsi3', '$opsi4', '$opsi5', '$today')");

		//diskonek
		xfree($qbw);
		xclose($koneksi);

		///re-direct
		xloc($filenya);
		exit();
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
		$filenya = "polling.php?gmkd=$gmkd";
		$juduli = $judul;


		//judul
		echo '<h3>'.$judul.'</h3>';


		//menu elearning
		require("i_menu.php");

		echo '<div class="row">
	    <div class="col-lg-12">
	
	
	      <div class="box box-warning">
	        <div class="box-header">
	
	          <h3 class="box-title">POLLING</h3>
	        </div>
	        
	        
	        <div class="box-body">
				<a href="'.$filenya.'&s=baru" title="Buat Baru" class="btn btn-danger">Buat Baru >></a>
				<hr>';

				//jika tulis baru
				if ($s == "baru")
					{
					echo '<table width="100%" border="0" cellspacing="0" cellpadding="3">
					<tr valign="top">
					<td>
					Topik :
					<br>
					<input name="topik" type="text" value="" class="btn-block">
					<br>
					<br>
		
					Opsi #01 :
					<br>
					<input name="opsi1" type="text" value="" class="btn-block">
					<br>
					<br>
		
					Opsi #02 :
					<br>
					<input name="opsi2" type="text" value="" class="btn-block">
					<br>
					<br>
		
					Opsi #03 :
					<br>
					<input name="opsi3" type="text" value="" class="btn-block">
					<br>
					<br>
		
					Opsi #04 :
					<br>
					<input name="opsi4" type="text" value="" class="btn-block">
					<br>
					<br>
		
					Opsi #05 :
					<br>
					<input name="opsi5" type="text" value="" class="btn-block">
					<br>
					<br>
		
					<input name="gmkd" type="hidden" value="'.$gmkd.'">
					<input name="btnSMP" type="submit" value="SIMPAN" class="btn btn-danger">
					<input name="btnBTL" type="submit" value="BATAL" class="btn btn-primary">
					</td>
					</tr>
					</table>
					<br>';
					}
		
				//jika view
				else
					{
					//cek
					$qcc = mysqli_query($koneksi, "SELECT * FROM guru_mapel_polling ".
											"WHERE kd_guru_mapel = '$gmkd'");
					$rcc = mysqli_fetch_assoc($qcc);
					$tcc = mysqli_num_rows($qcc);
					$cc_topik = balikin($rcc['topik']);
					$cc_opsi1 = balikin($rcc['opsi1']);
					$cc_opsi2 = balikin($rcc['opsi2']);
					$cc_opsi3 = balikin($rcc['opsi3']);
					$cc_opsi4 = balikin($rcc['opsi4']);
					$cc_opsi5 = balikin($rcc['opsi5']);
					$cc_nil_opsi1 = nosql($rcc['nil_opsi1']);
					$cc_nil_opsi2 = nosql($rcc['nil_opsi2']);
					$cc_nil_opsi3 = nosql($rcc['nil_opsi3']);
					$cc_nil_opsi4 = nosql($rcc['nil_opsi4']);
					$cc_nil_opsi5 = nosql($rcc['nil_opsi5']);
					$cc_total = round($cc_nil_opsi1 + $cc_nil_opsi2 + $cc_nil_opsi3 + $cc_nil_opsi4 + $cc_nil_opsi5);
			

		
					//jika nol
					if ((empty($cc_nil_opsi1)) AND (empty($cc_nil_opsi2)) AND (empty($cc_nil_opsi3)) AND (empty($cc_nil_opsi4))
						AND (empty($cc_nil_opsi5)))
						{
						$cc_nil_opsi1 = 1;
						$cc_nil_opsi2 = 1;
						$cc_nil_opsi3 = 1;
						$cc_nil_opsi4 = 1;
						$cc_nil_opsi5 = 1;
						}
		
		
		
					//jika ada
					if ($tcc != 0)
						{
						echo '<p>
						Topik :
						<br>
						<strong>'.$cc_topik.'</strong>
						</p>
						<br>


						<p>
						[Total : <strong>'.$cc_total.'</strong> vote].
						</p>
						<br>';
						?>
						
						<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
						<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
						<canvas id="demobar"></canvas>

				
				      	<script  type="text/javascript">
				
				    	  var ctx = document.getElementById("demobar").getContext("2d");
				    	  var data = {
				    	            labels: ["<?php echo $cc_opsi1;?>","<?php echo $cc_opsi2;?>","<?php echo $cc_opsi3;?>","<?php echo $cc_opsi4;?>","<?php echo $cc_opsi5;?>"],
				    	            datasets: [
				    	            {
				    	              label: "Polling",
				    	              data: ["<?php echo $cc_nil_opsi1;?>", "<?php echo $cc_nil_opsi2;?>", "<?php echo $cc_nil_opsi3;?>", "<?php echo $cc_nil_opsi4;?>", "<?php echo $cc_nil_opsi5;?>"],
				                    backgroundColor: [
				                      "rgba(59, 100, 222, 1)",
				                      "rgba(203, 222, 225, 0.9)",
				                      "rgba(102, 50, 179, 1)",
				                      "rgba(201, 29, 29, 1)",
				                      "rgba(81, 230, 153, 1)",
				                      "rgba(246, 34, 19, 1)"]
				    	            }
				    	            ]
				    	            };
				
				    	  var myBarChart = new Chart(ctx, {
				    	            type: 'pie',
				    	            data: data,
				    	            options: {
				                    	responsive: true, 
				                    	legend: {
								            display: true,
								            position:'right',
								            labels: {
								                fontColor: 'rgb(255, 99, 132)'
								            }
								        },
								        
										tooltips: {
										    enabled: true
										  },
										  plugins: {
										    datalabels: {
										      formatter: (value, ctx) => {
										
										        let sum = ctx.dataset._meta[0].total;
										        let percentage = (value * 100 / sum).toFixed(2) + "%";
										        return percentage;
										
										
										      },
										      color: '#fff',
										    }
									 	}
									 
				    	          	}
				    	        });
				    	</script>
						<?php						
						}
		
					//tidak ada
					else
						{
						echo '<table width="100%" border="0" cellspacing="0" cellpadding="3">
						<tr valign="top">
						<td>
						<font color="blue"><strong>Belum Ada Data Polling. Silahkan Entry Baru...!!</strong></font>
						</td>
						</tr>
						</table>
						<br>';
						}
					}
		
		

		echo '</div>
		</div>
		
		</div>
		
		</div>';
				
		}

	//jika tidak
	else
		{
		//re-direct
		$pesan = "Silahkan Lihat Daftar Mata Pelajaran.";
		$ke = "../index.php";
		pekem($pesan,$ke);
		exit();
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//masukin ke log mapel guru ////////////////////////////////////////////////////////////////////////////////
$ketnya = "Menu Polling";
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [POLLING].";
							


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
