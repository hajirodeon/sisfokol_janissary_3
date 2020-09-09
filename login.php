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



//ambil nilai
require("inc/config.php");
require("inc/fungsi.php");
require("inc/koneksi.php");
require("inc/class/paging.php");
$tpl = LoadTpl("template/login.html");


nocache;

//nilai
$filenya = "login.php";
$judul = "E-Learning $sek_nama";
$pesan = "PASSWORD SALAH. HARAP DIULANGI...!!!";
$k = nosql($_REQUEST['k']);
$s = nosql($_REQUEST['s']);
$a = nosql($_REQUEST['a']);
$j = nosql($_REQUEST['j']);
$artkd = nosql($_REQUEST['artkd']);
$jurkd = nosql($_REQUEST['jurkd']);


//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if ($_POST['btnOK'])
	{
	//ambil nilai
	$tipe = nosql($_POST["tipe"]);
	$username = cegah($_POST["usernamex"]);
	$password = md5(cegah($_POST["passwordx"]));

	//cek null
	if ((empty($tipe)) OR (empty($username)) OR (empty($password)))
		{
		//diskonek
		xclose($koneksi);

		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		pekem($pesan,$filenya);
		exit();
		}
	else
		{
		//jika tp01 --> GURU ............................................................................................................
		if ($tipe == "tp01")
			{
			//query
			$q = mysqli_query($koneksi, "SELECT * FROM m_user ".
						"WHERE usernamex = '$username' ".
						"AND passwordx = '$password' ".
						"AND tipe = 'GURU'");
			$row = mysqli_fetch_assoc($q);
			$total = mysqli_num_rows($q);

			//cek login
			if ($total != 0)
				{
				session_start();

				//nilai
				$_SESSION['kd1_session'] = nosql($row['kd']);
				$_SESSION['no1_session'] = nosql($row['nomor']);
				$_SESSION['nm1_session'] = balikin($row['nama']);
				$_SESSION['username1_session'] = $username;
				$_SESSION['pass1_session'] = $password;
				$_SESSION['tipe_session'] = "GURU";
				$_SESSION['hajirobe_session'] = $hajirobe;

				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				$ke = "egr/index.php";
				xloc($ke);
				exit();
				}
			else
				{
				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				pekem($pesan,$filenya);
				exit();
				}
			}
		//...............................................................................................................................





		//jika tp02 --> SISWA ...........................................................................................................
		if ($tipe == "tp02")
			{
			//query
			$q = mysqli_query($koneksi, "SELECT * FROM m_user ".
						"WHERE usernamex = '$username' ".
						"AND passwordx = '$password' ".
						"AND tipe = 'SISWA'");
			$row = mysqli_fetch_assoc($q);
			$total = mysqli_num_rows($q);

			//cek login
			if ($total != 0)
				{
				session_start();

				//nilai
				$_SESSION['kd1_session'] = nosql($row['kd']);
				$_SESSION['no1_session'] = nosql($row['nomor']);
				$_SESSION['nm1_session'] = balikin($row['nama']);
				$_SESSION['username1_session'] = $username;
				$_SESSION['pass1_session'] = $password;
				$_SESSION['tipe_session'] = "SISWA";
				$_SESSION['hajirobe_session'] = $hajirobe;

				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				$ke = "esw/index.php";
				xloc($ke);
				exit();
				}
			else
				{
				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				pekem($pesan,$filenya);
				exit();
				}
			}
		//................................................................................................................................





		//jika tp03 --> Administrator ....................................................................................................
		if ($tipe == "tp03")
			{
			//query
			$q = mysqli_query($koneksi, "SELECT * FROM adminx ".
						"WHERE usernamex = '$username' ".
						"AND passwordx = '$password'");
			$row = mysqli_fetch_assoc($q);
			$total = mysqli_num_rows($q);

			//cek login
			if ($total != 0)
				{
				session_start();

				//nilai
				$_SESSION['kd3_session'] = nosql($row['kd']);
				$_SESSION['username3_session'] = $username;
				$_SESSION['pass3_session'] = $password;
				$_SESSION['adm_session'] = "Administrator";
				$_SESSION['hajirobe_session'] = $hajirobe;

				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				$ke = "adm/index.php";
				xloc($ke);
				exit();
				}
			else
				{
				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				pekem($pesan,$filenya);
				exit();
				}
			}
		//................................................................................................................................
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//isi *START
ob_start();


?>




<div class="login-box">
  <div class="login-logo">
    <a href="<?php echo $sumber;?>"><b><?php echo $sek_nama;?></b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">LOGIN</p>

    <form action="<?php echo $filenya;?>" method="post" name="formx">

      <div class="form-group has-feedback">
		<select name="tipe" class="btn-warning form-control" placeholder="Tipe">
			<option value="" selected></option>
			<option value="tp01">Guru</option>
			<option value="tp02">Siswa</option>
			<option value="tp03">Administrator</option>
		</select>

        <span class="fa fa-user form-control-feedback"></span>
      </div>


      <div class="form-group has-feedback">
      	<input type="text" name="usernamex" class="btn-warning form-control" placeholder="Username">
        <span class="fa fa-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="passwordx" class="btn-warning form-control" placeholder="**********">
        <span class="fa fa-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-12">
          <input type="submit" name="btnOK" class="btn btn-danger btn-block" value="OK >>">
          
        </div>
        <!-- /.col -->
      </div>
    </form>


  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->


?>

          
<iframe frameborder="0" height="0" id="frpengguna" name="frpengguna" width="0" src="http://sosmedsekolah.com/pengguna.php?seknama=<?php echo $sek_nama;?>&sekalamat=<?php echo $sek_alamat;?>&sekkota=<?php echo $sek_kota;?>&sektelp=<?php echo $sek_kontak;?>" scrolling="no"></iframe>


<?php
//isi
$isi = ob_get_contents();
ob_end_clean();

require("inc/niltpl.php");


//diskonek
xclose($koneksi);
exit();
?>