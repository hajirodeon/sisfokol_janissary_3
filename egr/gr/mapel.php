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
$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}



//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//re-direct kalender
if ($_POST['btnKAL'])
	{
	//nilai
	$gmkd = nosql($_POST['gmkd']);
	$ubln = nosql($_POST['ubln']);
	$uthn = nosql($_POST['uthn']);

	//cek null
	if ((empty($ubln)) OR (empty($uthn)))
		{
		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diperhatikan...!!";
		$ke = "mapel.php?s=detail&gmkd=$gmkd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//re-direct
		$ke = "kalender.php?gmkd=$gmkd&ubln=$ubln&uthn=$uthn";
		xloc($ke);
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

require("../../inc/js/swap.js");
require("../../inc/js/wz_jsgraphics.js");
require("../../inc/js/pie.js");




//view : guru ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//mapel-nya...
$qpel = mysqli_query($koneksi, "SELECT guru_mapel.* ".
						"FROM guru_mapel ".
						"WHERE user_kode = '$no1_session' ".
						"AND kd = '$gmkd'");
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
	$filenya = "mapel.php?gmkd=$gmkd";
	$juduli = $judul;
	$limit = 5; //batas data maksimal preview


	echo '<h3>'.$judul.'</h3>';


	//menu
	require("i_menu.php");

	
	echo '<div class="row">';
	
	
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM m_user ".
						"WHERE tipe = 'SISWA' ".
						"AND tapel_nama = '$pel_tapel2' ".
						"AND kelas_nama = '$pel_kelas2'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);
	
	
	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">SISWA</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-users"></i>
            </div>
            <a href="dsiswa.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>';
	
	
	
	
	
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_news ".
						"WHERE kd_guru_mapel = '$gmkd'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);
	
	
	
	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">BERITA</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-print"></i>
            </div>
            <a href="news.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>';
        



	
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_artikel ".
						"WHERE kd_guru_mapel = '$gmkd'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);
	
	
	
	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">ARTIKEL</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-print"></i>
            </div>
            <a href="artikel.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>';

        
		

	
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_forum ".
						"WHERE kd_guru_mapel = '$gmkd'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);
	
	

	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">FORUM</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-comments"></i>
            </div>
            <a href="forum.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>';





		

	
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_tugas ".
						"WHERE kd_guru_mapel = '$gmkd'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);
	
	

	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">TUGAS</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-edit"></i>
            </div>
            <a href="tugas.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>';





	
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_kategori ".
						"WHERE kd_guru_mapel = '$gmkd'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);
	
	

	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">KATEGORI</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-database"></i>
            </div>
            <a href="kategori.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>';





	
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_file_materi ".
						"WHERE kd_guru_mapel = '$gmkd'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);
	
	
	
	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">FILE MATERI</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-archive"></i>
            </div>
            <a href="file_materi.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>';

        
	
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_link ".
						"WHERE kd_guru_mapel = '$gmkd'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);
		
	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">LINK</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-link"></i>
            </div>
            <a href="link.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>';

		
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_video ".
						"WHERE kd_guru_mapel = '$gmkd'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);

	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">VIDEO YOUTUBE</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-play"></i>
            </div>
            <a href="dvideo.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>';

		
		
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_kalender ".
						"WHERE kd_guru_mapel = '$gmkd'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);
		
		
	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">KALENDER AGENDA</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-clock-o"></i>
            </div>
            <a href="kalender.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>';

        
		
		
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_soal ".
						"WHERE kd_guru_mapel = '$gmkd'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);
		
		
	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">SOAL</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-compass"></i>
            </div>
            <a href="soal.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>';
	
	
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_chatroom ".
						"WHERE kd_guru_mapel = '$gmkd'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);

        
	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">CHATROOM</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-commenting"></i>
            </div>
            <a href="chatroom.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>';
		
		
			
	//total
	$qpelku = mysqli_query($koneksi, "SELECT * FROM guru_mapel_tanya ".
						"WHERE kd_guru_mapel = '$gmkd'");
	$rpelku = mysqli_fetch_assoc($qpelku);
	$tpelku = mysqli_num_rows($qpelku);
		
		
	echo '<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
            <div class="inner">
              <h3>'.$tpelku.'</h3>

              <p><font color="white">TANYA JAWAB</font></p>
            </div>
            <div class="icon">
              <i class="fa fa-comment-o"></i>
            </div>
            <a href="tanya.php?gmkd='.$gmkd.'" class="small-box-footer">
              Selengkapnya <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
    </div>

		
		
		
    </div>';
        
        
	echo '<div class="row">
    <div class="col-lg-8">


      <div class="box box-warning">
        <div class="box-header">

          <h3 class="box-title">POLLING</h3>
        </div>
        
        
        <div class="box-body">';

			
				//polling ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
								            position:'left',
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
			
					<font color="blue">
					<strong>
					Belum Ada Data Polling.
					<br>
					Silahkan Entry Baru...!!
					</strong>
					</font>
			
					</td>
					</tr>
					</table>';
					}
				//polling ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			echo '<hr>
			<a href="polling.php?gmkd='.$gmkd.'" title="SELENGKAPNYA" class="btn btn-block btn-danger">SELENGKAPNYA >></a>
			
			</div>

         </div>';





      echo '<div class="box box-warning">
        <div class="box-header">

          <h3 class="box-title">BERITA</h3>
        </div>
        
        
        <div class="box-body">';
		
			//news //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			$p = new Pager();
			$start = $p->findStart($limit);
		
			$sqlcount = "SELECT guru_mapel_news.*, guru_mapel_news.kd AS nkd ".
							"FROM guru_mapel_news ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"ORDER BY postdate DESC";
			$sqlresult = $sqlcount;
		
			$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
			$pages = $p->findPages($count, $limit);
			$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
			$target = $filenya;
			$pagelist = $p->pageList($_GET['page'], $pages, $target);
			$data = mysqli_fetch_array($result);
		
			//nek ada
			if ($count != 0)
				{
				echo '<table width="100%" border="0" cellpadding="3" cellspacing="0">';
		
				do
			  		{
					$nomer = $nomer + 1;
		
					$dt_kd = nosql($data['kd']);
					$dt_katkd = balikin($data['kategori']);
					$dt_judul = balikin($data['judul']);
					$dt_rangkuman = balikin($data['rangkuman']);
					$dt_postdate = $data['postdate'];
		
					//kategori
					$kat_kategori = $dt_katkd;
		
					//jumlah komentar
					$qitusx = mysqli_query($koneksi, "SELECT * FROM guru_mapel_news_msg ".
												"WHERE kd_guru_mapel_news = '$dt_kd' ".
												"ORDER BY postdate ASC");
					$ritusx = mysqli_fetch_assoc($qitusx);
					$titusx = mysqli_num_rows($qitusx);
		
					echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$e_warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
					echo '<td valign="top">
					<br>
					<a name="'.$dt_kd.'"></a>
					<big><strong>'.$dt_judul.'</strong></big>
					<br>
					<em>'.$dt_rangkuman.'</em>
					<br>
					<br>
					[<em>Kategori : <strong>'.$kat_kategori.'</strong></em>].
					[<em>'.$dt_postdate.'</em>].
					<br>
					
					[<a href="news.php?gmkd='.$gmkd.'&s=view&artkd='.$dt_kd.'#'.$dt_kd.'" title="('.$titusx.') Komentar">(<strong>'.$titusx.'</strong>) Komentar</a>].
					[<a href="news.php?gmkd='.$gmkd.'&bk=news&artkd='.$dt_kd.'#'.$dt_kd.'" title="Beri Komentar">Beri Komentar</a>].
					<br>
					
					<a href="news.php?gmkd='.$gmkd.'&s=edit&artkd='.$dt_kd.'" class="btn btn-success">EDIT</a>
					<a href="news.php?gmkd='.$gmkd.'&s=hapus&artkd='.$dt_kd.'" class="btn btn-danger">HAPUS</a>
		
					<hr>
					</td>
					</tr>';
			  		}
				while ($data = mysqli_fetch_assoc($result));
		
				echo '</table>';
				}
			else
				{
				echo '<p>
				<font color="blue">
				<strong>
				TIDAK ADA BERITA.
				<br>
				Silahkan Entry Dahulu...!!
				</strong>
				</font>
				</p>';
				}
			//news //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

			
			
			echo '<hr>
			<a href="news.php?gmkd='.$gmkd.'" title="SELENGKAPNYA" class="btn btn-block btn-danger">SELENGKAPNYA >></a>
				
				
			</div>

         </div>';








      echo '<div class="box box-warning">
        <div class="box-header">

          <h3 class="box-title">ARTIKEL</h3>
        </div>
        
        
        <div class="box-body">';
	

			//artikel ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			$p = new Pager();
			$start = $p->findStart($limit);
		
			$sqlcount = "SELECT guru_mapel_artikel.*, guru_mapel_artikel.kd AS nkd ".
							"FROM guru_mapel_artikel ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"ORDER BY postdate DESC";
			$sqlresult = $sqlcount;
		
			$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
			$pages = $p->findPages($count, $limit);
			$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
			$target = $filenya;
			$pagelist = $p->pageList($_GET['page'], $pages, $target);
			$data = mysqli_fetch_array($result);
		
			//nek ada
			if ($count != 0)
				{
				echo '<table width="100%" border="0" cellpadding="3" cellspacing="0">';
		
				do
			  		{
					$nomer = $nomer + 1;
		
					$dt_kd = nosql($data['kd']);
					$dt_katkd = balikin($data['kategori']);
					$dt_judul = balikin($data['judul']);
					$dt_rangkuman = balikin($data['rangkuman']);
					$dt_postdate = $data['postdate'];
		
					//kategori
					$kat_kategori = $dt_katkd;
		
					//jumlah komentar
					$qitusx = mysqli_query($koneksi, "SELECT * FROM guru_mapel_artikel_msg ".
												"WHERE kd_guru_mapel_artikel = '$dt_kd' ".
												"ORDER BY postdate ASC");
					$ritusx = mysqli_fetch_assoc($qitusx);
					$titusx = mysqli_num_rows($qitusx);
		
					echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$e_warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
					echo '<td valign="top">
					<br>
					<a name="'.$dt_kd.'"></a>
					<big><strong>'.$dt_judul.'</strong></big>
					<br>
					<em>'.$dt_rangkuman.'</em>
					<br>
					<br>
					[<em>Kategori : <strong>'.$kat_kategori.'</strong></em>].
					[<em>'.$dt_postdate.'</em>].
					<br>
					
					[<a href="artikel.php?gmkd='.$gmkd.'&s=view&artkd='.$dt_kd.'#'.$dt_kd.'" title="('.$titusx.') Komentar">(<strong>'.$titusx.'</strong>) Komentar</a>].
					[<a href="artikel.php?gmkd-'.$gmkd.'&bk=artikel&artkd='.$dt_kd.'#'.$dt_kd.'" title="Beri Komentar">Beri Komentar</a>].
					<br>
					
					<a href="artikel.php?gmkd='.$gmkd.'&s=edit&artkd='.$dt_kd.'" class="btn btn-success">EDIT</a> 
					<a href="artikel.php?gmkd='.$gmkd.'&s=hapus&artkd='.$dt_kd.'" class="btn btn-danger">HAPUS</a>
					<hr>
					</td>
					</tr>';
			  		}
				while ($data = mysqli_fetch_assoc($result));
		
				echo '</table>';
				}
			else
				{
				echo '<p>
				<font color="blue">
				<strong>
				TIDAK ADA Artikel.
				<br>
				Silahkan Entry Dahulu...!!
				</strong>
				</font>
				</p>';
				}
			//artikel ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			
			echo '<hr>
			<a href="artikel.php?gmkd='.$gmkd.'" title="SELENGKAPNYA" class="btn btn-block btn-danger">SELENGKAPNYA >></a>
			
			</div>

         </div>';
				



      echo '<div class="box box-warning">
        <div class="box-header">

          <h3 class="box-title">FORUM</h3>
        </div>
        
        
        <div class="box-body">';


				//forum /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				$p = new Pager();
				$start = $p->findStart($limit);
			
				$sqlcount = "SELECT guru_mapel_forum.*, guru_mapel_forum.kd AS fkd ".
								"FROM guru_mapel_forum ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"ORDER BY postdate DESC";
				$sqlresult = $sqlcount;
			
				$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
				$pages = $p->findPages($count, $limit);
				$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
				$target = $filenya;
				$pagelist = $p->pageList($_GET['page'], $pages, $target);
				$data = mysqli_fetch_array($result);
			
				//nek ada
				if ($count != 0)
					{
					echo '<table width="100%" border="0" cellpadding="3" cellspacing="0">';
			
					do
				  		{
						$nomer = $nomer + 1;
			
						$i_fkd = nosql($data['fkd']);
						$i_topik = balikin($data['topik']);
						$i_postdate = $data['postdate'];
			
						//jumlah komentar
						$qitusx = mysqli_query($koneksi, "SELECT * FROM guru_mapel_forum_msg ".
													"WHERE kd_guru_mapel_forum = '$i_fkd'");
						$ritusx = mysqli_fetch_assoc($qitusx);
						$titusx = mysqli_num_rows($qitusx);
			
						echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$e_warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
						echo '<td valign="top">
						<br>
						<big><strong>'.$i_topik.'</strong></big>
						<br>
						[<em>'.$i_postdate.'</em>].
						<br>
						[<a href="forum.php?gmkd='.$gmkd.'&s=view&stkd='.$i_fkd.'#'.$i_fkd.'" title="('.$titusx.') Komentar">(<strong>'.$titusx.'</strong>) Komentar</a>].
						[<a href="forum.php?gmkd='.$gmkd.'&bk=topik&stkd='.$i_fkd.'#'.$i_fkd.'" title="Beri Komentar">Beri Komentar</a>].
						<br>
						<a href="forum.php?gmkd='.$gmkd.'&s=hapus&stkd='.$i_fkd.'" title="HAPUS" class="btn btn-danger">HAPUS</a>
						</td>
						</tr>';
				  		}
					while ($data = mysqli_fetch_assoc($result));
			
					echo '</table>';
					}
				else
					{
					echo '<p>
					<font color="blue">
					<strong>
					TIDAK ADA Topik Forum.
					<br>
					Silahkan Entry Dahulu...!!
					</strong>
					</font>
					</p>';
					}
				//forum ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

				echo '<hr>
				<a href="forum.php?gmkd='.$gmkd.'" title="SELENGKAPNYA" class="btn btn-block btn-danger">SELENGKAPNYA >></a>
				
			</div>

         </div>
         
		 
		 </div>





    <div class="col-lg-4">

		<div class="box box-warning box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">KATEGORI</h3>
            </div>

            <div class="box-body">';
			
				//kategori //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				$p = new Pager();
				$start = $p->findStart($limit);
			
				$sqlcount = "SELECT guru_mapel_kategori.* ".
								"FROM guru_mapel_kategori ".
								"WHERE kd_guru_mapel = '$gmkd' ".
								"ORDER BY kategori ASC";
				$sqlresult = $sqlcount;
			
				$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
				$pages = $p->findPages($count, $limit);
				$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
				$target = $filenya;
				$pagelist = $p->pageList($_GET['page'], $pages, $target);
				$data = mysqli_fetch_array($result);
			
				//nek ada
				if ($count != 0)
					{
					echo '<UL>';
			
					do
				  		{
						$nomer = $nomer + 1;
			
						$dt_kd = nosql($data['kd']);
						$dt_kategori = balikin($data['kategori']);
			
						echo '<LI>
						<p>'.$dt_kategori.'</p>
						</LI>';
				  		}
					while ($data = mysqli_fetch_assoc($result));
			
					echo '</UL>';
					}
				else
					{
					echo '<font color="blue">
					<strong>
					TIDAK ADA Kategori.
					<br>
					Silahkan Entry Dahulu...!!
					</strong>
					</font>';
					}
				//kategori //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            echo '<hr>
			<a href="kategori.php?gmkd='.$gmkd.'" title="SELENGKAPNYA" class="btn btn-block btn-danger">SELENGKAPNYA >></a>

            
            </div>

          </div>




	<div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">FILE MATERI</h3>
        </div>

        <div class="box-body">';

		
			//file materi ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			$p = new Pager();
			$start = $p->findStart($limit);
		
			$sqlcount = "SELECT * FROM guru_mapel_file_materi ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"ORDER BY postdate DESC";
			$sqlresult = $sqlcount;
		
			$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
			$pages = $p->findPages($count, $limit);
			$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
			$target = $filenya;
			$pagelist = $p->pageList($_GET['page'], $pages, $target);
			$data = mysqli_fetch_array($result);
		
			//nek ada
			if ($count != 0)
				{
				do
			  		{
					$fle_kd = nosql($data['kd']);
					$fle_ket = balikin($data['ket']);
					$fle_filex = balikin($data['filex']);
					$fle_postdate = $data['postdate'];
					//$file_path = "../../filebox/e/materi/$gmkd/$fle_kd/$fle_filex";
		
					echo '<p>
					<em>'.$fle_ket.'</em>
					<br>
					<strong>'.$fle_postdate.'</strong>
					<br>
					[<a href="'.$fle_filex.'" title="Download" target="_blank">Download</a>].
					[<a href="'.$filenya.'&s=hapus&filekd='.$fle_kd.'" title="Hapus"><img src="'.$sumber.'/img/delete.gif" width="16" height="16" border="0"></a>].
					</p>
					<br>';
			  		}
				while ($data = mysqli_fetch_assoc($result));
				}
			else
				{
				echo '<font color="blue">
				<strong>
				TIDAK ADA File Materi.
				<br>
				Silahkan Entry Dahulu...!!
				</strong>
				</font>';
				}
			//file materi ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			
			echo '<hr>
			<a href="file_materi.php?gmkd='.$gmkd.'" title="SELENGKAPNYA" class="btn btn-block btn-danger">SELENGKAPNYA >></a>
			
			</div>

         </div>

			

	<div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">LINK</h3>
        </div>

        <div class="box-body">';
			
			//link //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			$p = new Pager();
			$start = $p->findStart($limit);
		
			$sqlcount = "SELECT guru_mapel_link.* ".
							"FROM guru_mapel_link ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"ORDER BY postdate DESC";
			$sqlresult = $sqlcount;
		
			$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
			$pages = $p->findPages($count, $limit);
			$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
			$target = $filenya;
			$pagelist = $p->pageList($_GET['page'], $pages, $target);
			$data = mysqli_fetch_array($result);
		
			//nek ada
			if ($count != 0)
				{
				echo '<UL>';
		
				do
			  		{
					$nomer = $nomer + 1;
		
					$dt_kd = nosql($data['kd']);
					$dt_judul = balikin($data['judul']);
					$dt_url = balikin($data['url']);
		
					echo '<LI>
					<p>
					<a href="'.$dt_url.'" title="'.$dt_judul.'" target="_blank">'.$dt_judul.'</a>
					</p>
					</LI>';
			  		}
				while ($data = mysqli_fetch_assoc($result));
		
				echo '</UL>';
				}
			else
				{
				echo '<font color="blue">
				<strong>
				TIDAK ADA Link.
				<br>
				Silahkan Entry Dahulu...!!
				</strong>
				</font>';
				}
			//link //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			
			echo '<hr>
			<a href="link.php?gmkd='.$gmkd.'" title="SELENGKAPNYA" class="btn btn-block btn-danger">SELENGKAPNYA >></a>
			
			</div>

         </div>





	<div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">VIDEO YOUTUBE</h3>
        </div>

        <div class="box-body">';
			
			//link //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			$p = new Pager();
			$start = $p->findStart($limit);
		
			$sqlcount = "SELECT * FROM guru_mapel_video ".
							"WHERE kd_guru_mapel = '$gmkd' ".
							"ORDER BY postdate DESC";
			$sqlresult = $sqlcount;
		
			$count = mysqli_num_rows(mysqli_query($koneksi, $sqlcount));
			$pages = $p->findPages($count, $limit);
			$result = mysqli_query($koneksi, "$sqlresult LIMIT ".$start.", ".$limit);
			$target = $filenya;
			$pagelist = $p->pageList($_GET['page'], $pages, $target);
			$data = mysqli_fetch_array($result);
		
			//nek ada
			if ($count != 0)
				{
				echo '<UL>';
		
				do
			  		{
					$nomer = $nomer + 1;
		
					$dt_kd = nosql($data['kd']);
					$dt_judul = balikin($data['judul']);
					$dt_url = balikin($data['url']);
		
					echo '<LI>
					<p>
					<a href="'.$dt_url.'" title="'.$dt_judul.'" target="_blank">'.$dt_judul.'</a>
					</p>
					</LI>';
			  		}
				while ($data = mysqli_fetch_assoc($result));
		
				echo '</UL>';
				}
			else
				{
				echo '<font color="blue">
				<strong>
				TIDAK ADA VIDEO.
				<br>
				Silahkan Entry Dahulu...!!
				</strong>
				</font>';
				}
			//link //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			
			echo '<hr>
			<a href="dvideo.php?gmkd='.$gmkd.'" title="SELENGKAPNYA" class="btn btn-block btn-danger">SELENGKAPNYA >></a>
			
			</div>

         </div>




			
	<div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">KALENDER AGENDA</h3>
        </div>

        <div class="box-body">
        
			<p>
				<select name="ubln">
				<option value="'.$ubln.'">'.$arrbln[$ubln].'</option>';
				for ($ibln=1;$ibln<=12;$ibln++)
					{
					echo '<option value="'.$ibln.'">'.$arrbln[$ibln].'</option>';
					}
				echo '</select>';
			
				//tahun
				echo '<select name="uthn">
				<option value="'.$uthn.'">'.$uthn.'</option>';
				for ($ithn=$tahun-1;$ithn<=$tahun;$ithn++)
					{
					echo '<option value="'.$ithn.'">'.$ithn.'</option>';
					}
				echo '</select>
				<br>
				<input name="gmkd" type="hidden" value="'.$gmkd.'">
			</p>
			<br>
			
			<p>
			<input name="btnKAL" type="submit" value="SELENGKAPNYA >>" class="btn btn-block btn-danger">
			</p>
			
			</div>

         </div>

			

	<div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">SOAL</h3>
        </div>

        <div class="box-body">
			
			<a href="soal.php?gmkd='.$gmkd.'" title="SELENGKAPNYA" class="btn btn-block btn-danger">SELENGKAPNYA >></a>
			
			
			</div>

         </div>


	<div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">TUGAS</h3>
        </div>

        <div class="box-body">
			
			<a href="tugas.php?gmkd='.$gmkd.'" title="SELENGKAPNYA" class="btn btn-block btn-danger">SELENGKAPNYA >></a>

			</div>

         </div>


			

	<div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">CHATROOM</h3>
        </div>

        <div class="box-body">
			
			<a href="chatroom.php?gmkd='.$gmkd.'" title="SELENGKAPNYA" class="btn btn-block btn-danger">SELENGKAPNYA >></a>

			</div>

         </div>

			

	<div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">TANYA JAWAB</h3>
        </div>

        <div class="box-body">';


			//tanya /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			$qtya = mysqli_query($koneksi, "SELECT guru_mapel_tanya.*, guru_mapel_tanya.kd AS tkd ".
									"FROM guru_mapel_tanya ".
									"WHERE kd_guru_mapel = '$gmkd' ".
									"ORDER BY postdate DESC");
			$rtya = mysqli_fetch_assoc($qtya);
			$ttya = mysqli_num_rows($qtya);
			
			//nek ada
			if ($ttya != 0)
				{
				$dt_kd = nosql($rtya['tkd']);
				$dt_tanya = balikin($rtya['tanya']);
			
				echo '<em>'.$dt_tanya.'</em>
				<br>
				[<a href="tanya.php?gmkd='.$gmkd.'&tankd='.$dt_kd.'&s=jawab">Jawab</a>].';
				}
			else
				{
				echo '<font color="blue">
				<strong>
				Tidak Ada Yang Bertanya.
				<br>
				Mungkin Lain Waktu...
				</strong>
				</font>';
				}
			//tanya /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

			echo '<hr>

			<a href="tanya.php?gmkd='.$gmkd.'" title="SELENGKAPNYA" class="btn btn-block btn-danger">SELENGKAPNYA >></a>
			
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
	$ke = "../index.php";
	pekem($pesan,$ke);
	exit();
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




?>

<!-- jQuery 3 -->
<script src="<?php echo $sumber;?>/template/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<?php echo $sumber;?>/template/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="<?php echo $sumber;?>/template/adminlte/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<?php echo $sumber;?>/template/adminlte/dist/js/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="<?php echo $sumber;?>/template/adminlte/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="<?php echo $sumber;?>/template/adminlte/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<?php echo $sumber;?>/template/adminlte/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll -->
<script src="<?php echo $sumber;?>/template/adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS -->
<script src="<?php echo $sumber;?>/template/adminlte/bower_components/chart.js/Chart.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<?php echo $sumber;?>/template/adminlte/dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?php echo $sumber;?>/template/adminlte/dist/js/demo.js"></script>



<?php

//masukin ke log mapel guru ////////////////////////////////////////////////////////////////////////////////
$ketnya = "Menu Tanya Jawab";
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
$judulx = "[$pel_tapel. $pel_kelas]. $pel_nm [BERANDA].";
							


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
