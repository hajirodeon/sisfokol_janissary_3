<?php
//FUNGSI - FUNGSI ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//untuk mencegah si jahil #1
function cegah($str)
	{
    	$str = trim(htmlentities(htmlspecialchars($str)));
	$search = array ("'\''",
						"'%'",
						"'@'",
						"'_'",
						"'1=1'",
						"'/'",
						"'!'",
						"'<'",
						"'>'",
						"'\('",
						"'\)'",
						"';'",
						"'-'",
						"'_'");

	$replace = array ("xpsijix",
						"xpersenx",
						"xtkeongx",
						"xgwahx",
						"x1smdgan1x",
						"xgmringx",
						"xpentungx",
						"xkkirix",
						"xkkananx",
						"xkkurix",
						"xkkurnanx",
						"xkommax",
						"xstrix",
						"xstripbwhx");

	$str = preg_replace($search,$replace,$str);
	return $str;
  	}



//untuk mencegah si jahil #2
function cegah2($str)
	{
    	$str = trim($str);
	$search = array ("'\''",
						"'%'",
						"'@'",
						"'_'",
						"'1=1'",
						"'/'",
						"'!'",
						"'<'",
						"'>'",
						"'\('",
						"'\)'",
						"';'",
						"'-'",
						"'_'");

	$replace = array ("xpsijix",
						"xpersenx",
						"xtkeongx",
						"xgwahx",
						"x1smdgan1x",
						"xgmringx",
						"xpentungx",
						"xkkirix",
						"xkkananx",
						"xkkurix",
						"xkkurnanx",
						"xkommax",
						"xstrix",
						"xstripbwhx");

	$str = preg_replace($search,$replace,$str);
	return $str;
  	}



//untuk anti-sql
function nosql($str)
	{
    	$str = trim(htmlentities(addslashes(htmlspecialchars($str))));
	$search = array ("'\''",
						"'%'",
						"'@'",
						"'_'",
						"'1=1'",
						"'/'",
						"'!'",
						"'<'",
						"'>'",
						"'\('",
						"'\)'",
						"';'",
						"'-'",
						"'_'",
						"'select '",
						"'delete '",
						"'update '",
						"'alter '",
						"'insert '",
						"'grant '");

	$replace = array ("xpsijix",
						"xpersenx",
						"xtkeongx",
						"xgwahx",
						"x1smdgan1x",
						"xgmringx",
						"xpentungx",
						"xkkirix",
						"xkkananx",
						"xkkurix",
						"xkkurnanx",
						"xkommax",
						"xstrix",
						"xstripbwhx",
						"xtselectx",
						"xtdeletex",
						"xtupdatex",
						"xtalterx",
						"xtinsertx",
						"xtgrantx");

	$str = preg_replace($search,$replace,$str);

	return $str;
  	}



//balikino. . o . . .. o. . .. . balikin
function balikin($str)
	{
	$search = array ("'xpsijix'",
						"'xpersenx'",
						"'xtkeongx'",
						"'xgwahx'",
						"'x1smdgan1x'",
						"'xgmringx'",
						"'xpentungx'",
						"'xkkirix'",
						"'xkkananx'",
						"'xkkurix'",
						"'xkkurnanx'",
						"'xkommax'",
						"'xstrix'",
						"'xstripbwhx'");

	$replace = array ("'",
						"%",
						"@",
						"_",
						"1=1",
						"/",
						"!",
						"<",
						">",
						"(",
						")",
						";",
						"-",
						"_");

	$str = preg_replace($search,$replace,$str);

	return $str;
  	}



//balikin2
function balikin2($str)
	{
	$search = array ("'xpsijix'",
						"'xpersenx'",
						"'xtkeongx'",
						"'xgwahx'",
						"'x1smdgan1x'",
						"'xgmringx'",
						"'xpentungx'",
						"'xkkirix'",
						"'xkkananx'",
						"'xkkurix'",
						"'xkkurnanx'",
						"'xkommax'",
						"'xstrix'",
						"'xstripbwhx'");

	$replace = array ("'",
						"%",
						"@",
						"_",
						"1=1",
						"/",
						"!",
						"<",
						">",
						"(",
						")",
						";",
						"-",
						"_");

	$str = preg_replace($search,$replace,$str);
	return $str;
  	}



//untuk stripfile
function strip($string)
	{
    $string = str_replace(array('[\', \']'), '', $string);
    $string = preg_replace('/\[.*\]/U', '', $string);
    $string = preg_replace('/&(amp;)?#?[a-z0-9]+;/i', '.', $string);
    $string = htmlentities($string, ENT_COMPAT, 'utf-8');
    $string = preg_replace('/&([a-z])(acute|uml|circ|grave|ring|cedil|slash|tilde|caron|lig|quot|rsquo);/i', '\\1', $string );
    $string = preg_replace(array('/[^a-z0-9]/i', '/[-]+/') , '.', $string);
    return strtolower(trim($string, '.'));
  	}







//untuk strip2
function strip2($string)
	{
    $string = str_replace(array('[\', \']'), '', $string);
    $string = preg_replace('/\[.*\]/U', '', $string);
    $string = preg_replace('/&(amp;)?#?[a-z0-9]+;/i', '-', $string);
    $string = htmlentities($string, ENT_COMPAT, 'utf-8');
    $string = preg_replace('/&([a-z])(acute|uml|circ|grave|ring|cedil|slash|tilde|caron|lig|quot|rsquo);/i', '\\1', $string );
    $string = preg_replace(array('/[^a-z0-9]/i', '/[-]+/') , '-', $string);
    return strtolower(trim($string, '-'));
  	}






//target template
function ParseVal($template, $assigned=array())
	{
	foreach($assigned as $word => $replace)
		{
		$template = preg_replace("/\{".$word."\}/i", "$replace",$template);
		}
		return $template;
	}



//file template
function LoadTpl($template="")
	{
	$filename = $template;
	if (file_exists($filename))
		{
		if ($FH = fopen($filename, 'r'))
			{
			$template = fread($FH,filesize($filename));
			fclose($FH);
			}
		else
			{
			die("<strong>File Template $filename Tidak Bisa Dibuka...!</strong>");
			}
		}
	else
		{
		die("<strong>File Template $filename Tidak Ada., <br>Harap Dicek...!</strong>");
		}
	return $template;
	}



//xclose
function xfree($str)
	{
	mysqli_free_result($str);
	}



//xclose
function xclose($str)
	{
	mysqli_close($str);
	}



//xkapital
function xkapital($str)
	{
	echo strtoupper("$str");
	}



//xheadline
function xheadline($str)
	{
	echo strtoupper("<big><strong>$str</strong></big>");
	}



//gedi
function xgedi($str)
	{
	echo "<big><strong>$str</strong></big>";
	}



//auto-kembali
function xloc($str)
	{
	echo "<script>location.href='$str'</script>";
	}



//auto-kembali, onload
function xloc2($str,$str1)
	{
	echo "<script>location.href='$str';window.onload='$str1'</script>";
	}



//pesan
function xpesan($str)
	{
	echo "<script>alert('$str');</script>";
	}



//kembali dgn pesan
function pekem($str,$str1)
	{
	echo "<script>alert('$str');location.href='$str1'</script>";
	}



//kembali dgn pesan, history back
function pekem2($str)
	{
	echo "<script>alert('$str');history.back();</script>";
	}



//kosongkan cache
function nocache()
	{
	"header('cache-control:private') \n ".
	"header('pragma:no-cache') \n ".
	"header('cache-control:no-cache') \n ".
	"flush()";
	}



function my_filesize($str)
	{
   	// cek.
   	if(!is_file($str)) exit("File Tidak Ada...!!");

   	// tipe size...
   	$kb = 1024;         // Kilobyte
   	$mb = 1024 * $kb;   // Megabyte
   	$gb = 1024 * $mb;   // Gigabyte
   	$tb = 1024 * $gb;   // Terabyte

   	// jadikan per bytes.
   	$size = filesize($str);

   	//jika dan hanya jika
   	if($size < $kb)
   		{
    	return $size." B";
   		}

	else if($size < $mb)
		{
       	return round($size/$kb,2)." KB";
   		}

	else if($size < $gb)
		{
       	return round($size/$mb,2)." MB";
   		}

	else if($size < $tb)
		{
       	return round($size/$gb,2)." GB";
   		}

	else
		{
       	return round($size/$tb,2)." TB";
		}
	}







//ketahui ip
function get_client_ip_env() 
	{
		$ipaddress = '';
	if (getenv('HTTP_CLIENT_IP'))
		$ipaddress = getenv('HTTP_CLIENT_IP');
	else if(getenv('HTTP_X_FORWARDED_FOR'))
		$ipaddress = getenv('HTTP_X_FORWARDED_FOR');
	else if(getenv('HTTP_X_FORWARDED'))
		$ipaddress = getenv('HTTP_X_FORWARDED');
	else if(getenv('HTTP_FORWARDED_FOR'))
		$ipaddress = getenv('HTTP_FORWARDED_FOR');
	else if(getenv('HTTP_FORWARDED'))
		$ipaddress = getenv('HTTP_FORWARDED');
	else if(getenv('REMOTE_ADDR'))
		$ipaddress = getenv('REMOTE_ADDR');
	else
		$ipaddress = 'UNKNOWN';
	
		return $ipaddress;
	}

							





//penghapus
function delete($file)
	{
	if (file_exists($file))
		{
   		chmod($file,0777);
   		if (is_dir($file))
			{
     		$handle = opendir($file);
     		while($filename = readdir($handle))
				{
       			if ($filename != "." && $filename != "..")
					{
         			delete($file."/".$filename);
       				}
     			}
     			closedir($handle);
     			rmdir($file);
   				}
		else
			{
     		unlink($file);
   			}
 		}
	}



//pencacah bilangan duit
function xduit($str)
	{
	//bernilai 3 digit
	if (strlen($str) == 3)
		{
		$nil1 = substr($str,-3);
		echo "Rp. $nil1,00";
		}

	//bernilai 4 digit
	else if (strlen($str) == 4)
		{
		$nil1 = substr($str,0,1);
		$nil2 = substr($str,-3);
		echo "Rp. $nil1.$nil2,00";
		}


	//jika ada 5 digit
	else if (strlen($str) == 5)
		{
		$nil1 = substr($str,0,2);
		$nil2 = substr($str,-3);
		echo "Rp. $nil1.$nil2,00";
		}

	//jika ada 6 digit
	else if (strlen($str) == 6)
		{
		$nil1 = substr($str,0,3);
		$nil2 = substr($str,-3);
		echo "Rp. $nil1.$nil2,00";
		}

	//jika ada 7 digit
	else if (strlen($str) == 7)
		{
		$nil1 = substr($str,0,1);
		$nil2 = substr($str,1,3);
		$nil3 = substr($str,-3);
		echo "Rp. $nil1.$nil2.$nil3,00";
		}

	//jika ada 8 digit
	else if (strlen($str) == 8)
		{
		$nil1 = substr($str,0,2);
		$nil2 = substr($str,2,3);
		$nil3 = substr($str,-3);
		echo "Rp. $nil1.$nil2.$nil3,00";
		}

	//jika ada 9 digit
	else if (strlen($harga) == 9)
		{
		$nil1 = substr($str,0,3);
		$nil2 = substr($str,3,3);
		$nil3 = substr($str,-3);
		echo "Rp. $nil1.$nil2.$nil3,00";
		}
	}



//pencacah bilangan duit
function xduit2($str)
	{
	//bernilai 3 digit
	if (strlen($str) == 3)
		{
		$nil1 = substr($str,-3);
		$nillx = "Rp. $nil1,00";
		return $nillx;
		}

	//bernilai 4 digit
	else if (strlen($str) == 4)
		{
		$nil1 = substr($str,0,1);
		$nil2 = substr($str,-3);
		$nillx = "Rp. $nil1.$nil2,00";
		return $nillx;
		}


	//jika ada 5 digit
	else if (strlen($str) == 5)
		{
		$nil1 = substr($str,0,2);
		$nil2 = substr($str,-3);
		$nillx = "Rp. $nil1.$nil2,00";
		return $nillx;
		}

	//jika ada 6 digit
	else if (strlen($str) == 6)
		{
		$nil1 = substr($str,0,3);
		$nil2 = substr($str,-3);
		$nillx = "Rp. $nil1.$nil2,00";
		return $nillx;
		}

	//jika ada 7 digit
	else if (strlen($str) == 7)
		{
		$nil1 = substr($str,0,1);
		$nil2 = substr($str,1,3);
		$nil3 = substr($str,-3);
		$nillx = "Rp. $nil1.$nil2.$nil3,00";
		return $nillx;
		}

	//jika ada 8 digit
	else if (strlen($str) == 8)
		{
		$nil1 = substr($str,0,2);
		$nil2 = substr($str,2,3);
		$nil3 = substr($str,-3);
		$nillx = "Rp. $nil1.$nil2.$nil3,00";
		return $nillx;
		}

	//jika ada 9 digit
	else if (strlen($harga) == 9)
		{
		$nil1 = substr($str,0,3);
		$nil2 = substr($str,3,3);
		$nil3 = substr($str,-3);
		$nillx = "Rp. $nil1.$nil2.$nil3,00";
		return $nillx;
		}
	}



//angka ke huruf
function xhuruf($str)
	{
	$str = ereg_replace("1", "SATU ", $str);
	$str = ereg_replace("2", "DUA ", $str);
	$str = ereg_replace("3", "TIGA ", $str);
	$str = ereg_replace("4", "EMPAT ", $str);
	$str = ereg_replace("5", "LIMA ", $str);
	$str = ereg_replace("6", "ENAM ", $str);
	$str = ereg_replace("7", "TUJUH ", $str);
	$str = ereg_replace("8", "DELAPAN ", $str);
	$str = ereg_replace("9", "SEMBILAN ", $str);
	$str = ereg_replace("0", " ", $str);
	echo $str;
	}



//pencacah bilangan duit ---> bilangan
function xduitf($str)
	{
	//empat digit. ribu. ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	if (strlen($str) == 4)
		{
		$nil1 = substr($str,0,1);

		//nek seribu
		if ($nil1 == "1")
			{
			echo "SERIBU ";
			}
		else
			{
			echo xhuruf($nil1);
			echo " RIBU ";
			}

		$nil2 = substr($str,-3,-2);


		//nek nol
		if ($nil2 == "0")
			{
			echo "";
			}

		//nek satu
		else if ($nil2 == "1")
			{
			echo " SERATUS ";
			}
		else
			{
			echo xhuruf($nil2);
			echo " RATUS ";
			}

		$nil3 = substr($str,-2,-1);
		$nil4 = substr($str,-1);

		//nek belas
		if (($nil3 == "1") AND ($nil4 == "0"))
			{
			echo " SEPULUH ";
			}
		else if (($nil3 == "1") AND ($nil4 == "1"))
			{
			echo " SEBELAS ";
			}
		else if (($nil3 == "1") AND ($nil4 > "1"))
			{
			echo xhuruf($nil4);
			echo " BELAS ";
			}
		else
			{
			//nek nul
			if ($nil3 == "0")
				{
				echo "";
				echo xhuruf($nil4);
				}
			else
				{
				echo xhuruf($nil3);
				echo " PULUH ";
				echo xhuruf($nil4);
				}
			}
		}



	//lima digit. puluh ribu. ///////////////////////////////////////////////////////////////////////////////////////////////////////////
	if (strlen($str) == 5)
		{
		$nil1 = substr($str,0,1);
		$nil2 = substr($str,-4,-3);

		//nek sepuluh
		if (($nil1 == "1") AND ($nil2 == "0"))
			{
			echo "SEPULUH RIBU ";
			}
		else if (($nil1 == "1") AND ($nil2 == "1"))
			{
			echo " SEBELAS RIBU ";
			}
		else if (($nil1 == "1") AND ($nil2 > "1"))
			{
			echo xhuruf($nil2);
			echo " BELAS RIBU ";
			}
		else
			{
			echo xhuruf($nil1);
			echo " PULUH ";
			echo xhuruf($nil2);
			echo " RIBU ";
			}


		$nil3 = substr($str,-3,-2);

		//nek nol
		if ($nil3 == "0")
			{
			echo xhuruf($nil3);
			echo "";
			}
		else if ($nil3 == "1")
			{
			echo " SERATUS ";
			}
		else
			{
			echo xhuruf($nil3);
			echo " RATUS ";
			}

		$nil4 = substr($str,-2,-1);
		$nil5 = substr($str,-1);

		//nek belas
		if (($nil4 == "1") AND ($nil5 == "0"))
			{
			echo " SEPULUH ";
			}
		else if (($nil4 == "1") AND ($nil5 == "1"))
			{
			echo " SEBELAS ";
			}
		else if (($nil4 == "1") AND ($nil5 > "1"))
			{
			echo xhuruf($nil5);
			echo " BELAS ";
			}
		else
			{
			//nek nol
			if ($nil4 == "0")
				{
				echo "";
				echo xhuruf($nil5);
				}
			else
				{
				echo xhuruf($nil4);
				echo " PULUH ";
				echo xhuruf($nil5);
				}
			}
		}


	//enam digit. ratusan ribu. /////////////////////////////////////////////////////////////////////////////////////////////////////////
	if (strlen($str) == 6)
		{
		$nil1 = substr($str,0,1);

		//nek seratus
		if ($nil1 == "1")
			{
			echo "SERATUS ";
			}
		else
			{
			echo xhuruf($nil1);
			echo " RATUS ";
			}

		$nil2 = substr($str,-5,-4);
		$nil3 = substr($str,-4,-3);

		//nek belas
		if (($nil2 == "1") AND ($nil3 == "0"))
			{
			echo " SEPULUH RIBU ";
			}
		else if (($nil2 == "1") AND ($nil3 == "1"))
			{
			echo " SEBELAS RIBU ";
			}
		else if (($nil2 == "1") AND ($nil3 > "1"))
			{
			echo xhuruf($nil3);
			echo " BELAS RIBU ";
			}
		else
			{
			//nek nol
			if ($nil2 == "0")
				{
				echo "";
				echo xhuruf($nil3);
				echo " RIBU ";
				}
			else
				{
				echo xhuruf($nil2);
				echo " PULUH ";
				echo xhuruf($nil3);
				echo " RIBU ";
				}
			}


		$nil4 = substr($str,-3,-2);

		//nek nol
		if ($nil4 == "0")
			{
			echo xhuruf($nil4);
			echo "";
			}
		else if ($nil4 == "1")
			{
			echo " SERATUS ";
			}
		else
			{
			echo xhuruf($nil4);
			echo " RATUS ";
			}

		$nil5 = substr($str,-2,-1);
		$nil6 = substr($str,-1);

		//nek belas
		if (($nil5 == "1") AND ($nil6 == "0"))
			{
			echo " SEPULUH ";
			}
		else if (($nil5 == "1") AND ($nil6 == "1"))
			{
			echo " SEBELAS ";
			}
		else if (($nil5 == "1") AND ($nil6 > "1"))
			{
			echo xhuruf($nil6);
			echo " BELAS ";
			}
		else
			{
			//nek nol
			if ($nil5 == "0")
				{
				echo "";
				echo xhuruf($nil6);
				}
			else
				{
				echo xhuruf($nil5);
				echo " PULUH ";
				echo xhuruf($nil6);
				}
			}
		}


	//tujuh digit. juta. ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	if (strlen($str) == 7)
		{
		$nil1 = substr($str,0,1);
		echo xhuruf($nil1);
		echo " JUTA ";

		$nil2 = substr($str,-6,-5);


		//nek nol
		if ($nil2 == "0")
			{
			echo xhuruf($nil2);
			echo "";
			}
		//nek seratus
		else if ($nil2 == "1")
			{
			echo " SERATUS ";
			}
		else
			{
			echo xhuruf($nil2);
			echo " RATUS ";
			}

		$nil3 = substr($str,-5,-4);
		$nil4 = substr($str,-4,-3);


		//nek belas
		if (($nil3 == "1") AND ($nil4 == "0"))
			{
			echo " SEPULUH RIBU ";
			}
		else if (($nil3 == "1") AND ($nil4 == "1"))
			{
			echo " SEBELAS RIBU ";
			}
		else if (($nil3 == "1") AND ($nil4 > "1"))
			{
			echo xhuruf($nil4);
			echo " BELAS RIBU ";
			}
		else if (($nil3 > "1") AND ($nil4 > "1"))
			{
			echo xhuruf($nil3);
			echo " PULUH ";
			echo xhuruf($nil4);
			echo " RIBU ";
			}
		//nek null
		else if (($nil2 == "0") AND ($nil3 == "0")
			AND ($nil4 == "0") AND ($nil5 == "0")
			AND ($nil6 == "0") AND ($nil7 == "0"))
			{
			echo xhuruf($nil4);
			echo " RIBU ";
			}
		else if ($nil4 == "1")
			{
			echo " SERIBU ";
			}
		else if ($nil4 > "1")
			{
			echo xhuruf($nil4);
			echo " RIBU ";
			}


		$nil5 = substr($str,-3,-2);


		//nek nol
		if ($nil5 == "0")
			{
			echo xhuruf($nil5);
			echo "";
			}
		//seratus
		else if ($nil5 == "1")
			{
			echo " SERATUS ";
			}
		else
			{
			echo xhuruf($nil5);
			echo " RATUS ";
			}

		$nil6 = substr($str,-2,-1);
		$nil7 = substr($str,-1);

		//nek sepuluh
		if (($nil6 == "1") AND ($nil7 == "0"))
			{
			echo " SEPULUH ";
			}
		//sebelas
		else if (($nil6 == "1") AND ($nil7 == "1"))
			{
			echo " SEBELAS ";
			}
		else if (($nil6 == "1") AND ($nil7 > "1"))
			{
			echo xhuruf($nil7);
			echo " BELAS ";
			}
		else
			{
			//nek nol
			if ($nil6 == "0")
				{
				echo "";
				echo xhuruf($nil7);
				}

			else
				{
				echo xhuruf($nil6);
				echo " PULUH ";
				echo xhuruf($nil7);
				}
			}
		}

	//delapan digit. puluhan juta. //////////////////////////////////////////////////////////////////////////////////////////////////////
	if (strlen($str) == 8)
		{
		$nil1 = substr($str,0,1);
		$nil2 = substr($str,-7,-6);

		//sepuluh
		if (($nil1 == "1") AND ($nil2 == "0"))
			{
			echo "SEPULUH ";
			}
		//sebelas
		else if (($nil1 == "1") AND ($nil2 == "1"))
			{
			echo " SEBELAS ";
			}
		//nek belas
		else if (($nil1 == "1") AND ($nil2 > "1"))
			{
			echo xhuruf($nil2);
			echo " BELAS ";
			}
		else
			{
			echo xhuruf($nil1);
			echo " PULUH ";
			echo xhuruf($nil2);
			}

		echo " JUTA ";

		$nil3 = substr($str,-6,-5);

		//nek seratus
		if ($nil3 == "1")
			{
			echo "SERATUS ";
			}

		//nek nol
		else if ($nil3 == "0")
			{
			echo xhuruf($nil3);
			echo "";
			}
		else
			{
			echo xhuruf($nil3);
			echo " RATUS ";
			}

		$nil4 = substr($str,-5,-4);
		$nil5 = substr($str,-4,-3);
		$nil6 = substr($str,-3,-2);
		$nil7 = substr($str,-2,-1);
		$nil8 = substr($str,-1);


		//nek belas
		if (($nil4 == "1") AND ($nil5 == "0"))
			{
			echo " SEPULUH RIBU ";
			}
		else if (($nil4 == "1") AND ($nil5 == "1"))
			{
			echo " SEBELAS RIBU ";
			}
		else if (($nil4 == "1") AND ($nil5 > "1"))
			{
			echo xhuruf($nil5);
			echo " BELAS RIBU ";
			}
		else if (($nil4 > "1") AND ($nil5 > "1"))
			{
			echo xhuruf($nil4);
			echo " PULUH ";
			echo xhuruf($nil5);
			echo " RIBU ";
			}
		else if ($nil5 == "1")
			{
			echo " SERIBU ";
			}
		else if ($nil5 > "1")
			{
			echo xhuruf($nil5);
			echo " RIBU ";
			}



		//nek seratus
		if ($nil6 == "1")
			{
			echo "SERATUS ";
			}

		//nek nol
		else if ($nil6 == "0")
			{
			echo xhuruf($nil6);
			echo "";
			}
		else
			{
			echo xhuruf($nil6);
			echo " RATUS ";
			}



		//nek belas
		if (($nil7 == "1") AND ($nil8 == "0"))
			{
			echo " SEPULUH ";
			}
		else if (($nil7 == "1") AND ($nil8 == "1"))
			{
			echo " SEBELAS ";
			}
		else if (($nil7 == "1") AND ($nil8 > "1"))
			{
			echo xhuruf($nil8);
			echo " BELAS ";
			}
		else
			{
			//nek nol
			if ($nil7 == "0")
				{
				echo "";
				echo xhuruf($nil8);
				}
			else
				{
				echo xhuruf($nil7);
				echo " PULUH ";
				echo xhuruf($nil8);
				}
			}
		}


	//sembilan digit. ratusan juta. ////////////////////////////////////////////////////////////////////////////////////////////////////
	if (strlen($str) == 9)
		{
		$nil1 = substr($str,0,1);
		$nil2 = substr($str,-8,-7);
		$nil3 = substr($str,-7,-6);


		//seratus
		if ($nil1 == "1")
			{
			echo "SERATUS ";
			}
		else
			{
			echo xhuruf($nil1);
			echo " RATUS ";
			}

		//belas
		if (($nil2 == "1") AND ($nil3 == "0"))
			{
			echo " SEPULUH ";
			}
		else if (($nil2 == "1") AND ($nil3 == "1"))
			{
			echo " SEBELAS ";
			}
		else if (($nil2 == "1") AND ($nil3 > "1"))
			{
			echo xhuruf($nil3);
			echo " BELAS ";
			}
		else
			{
			//nek nol
			if ($nil2 == "0")
				{
				echo "";
				echo xhuruf($nil3);
				}
			else
				{
				echo xhuruf($nil2);
				echo " PULUH ";
				echo xhuruf($nil3);
				}
			}


		echo " JUTA ";


		$nil4 = substr($str,-6,-5);
		$nil5 = substr($str,-5,-4);
		$nil6 = substr($str,-4,-3);
		$nil7 = substr($str,-3,-2);
		$nil8 = substr($str,-2,-1);
		$nil9 = substr($str,-1);


		//nek ratus
		if ($nil4 == "1")
			{
			echo " SERATUS ";
			}
		//nek nol
		else if ($nil4 == "0")
			{
			echo xhuruf($nil4);
			echo "";
			}
		else
			{
			echo xhuruf($nil4);
			echo " RATUS ";
			}

		//nek belas
		if (($nil5 == "1") AND ($nil6 == "0"))
			{
			echo " SEPULUH RIBU ";
			}
		else if (($nil5 == "1") AND ($nil6 == "1"))
			{
			echo " SEBELAS RIBU ";
			}
		else if (($nil5 == "1") AND ($nil6 > "1"))
			{
			echo xhuruf($nil6);
			echo " BELAS RIBU ";
			}
		else if (($nil5 > "1") AND ($nil6 > "1"))
			{
			echo xhuruf($nil5);
			echo " PULUH ";
			echo xhuruf($nil6);
			echo " RIBU ";
			}
		else if ($nil6 == "1")
			{
			echo " SERIBU ";
			}
		else if ($nil6 > "1")
			{
			echo xhuruf($nil6);
			echo " RIBU ";
			}



		//nek seratus
		if ($nil7 == "1")
			{
			echo "SERATUS ";
			}

		//nek nol
		else if ($nil7 == "0")
			{
			echo xhuruf($nil7);
			echo "";
			}
		else
			{
			echo xhuruf($nil7);
			echo " RATUS ";
			}



		//nek belas
		if (($nil8 == "1") AND ($nil9 == "0"))
			{
			echo " SEPULUH ";
			}
		else if (($nil8 == "1") AND ($nil9 == "1"))
			{
			echo " SEBELAS ";
			}
		else if (($nil8 == "1") AND ($nil9 > "1"))
			{
			echo xhuruf($nil9);
			echo " BELAS ";
			}
		else
			{
			//nek nol
			if ($nil8 == "0")
				{
				echo "";
				echo xhuruf($nil9);
				}
			else
				{
				echo xhuruf($nil8);
				echo " PULUH ";
				echo xhuruf($nil9);
				}
			}
		}

	echo "RUPIAH";
	}








function resize_image($file, $width, $height) {
    list($w, $h) = getimagesize($file);
    /* calculate new image size with ratio */
    $ratio = max($width/$w, $height/$h);
    $h = ceil($height / $ratio);
    $x = ($w - $width / $ratio) / 2;
    $w = ceil($width / $ratio);
    /* read binary data from image file */
    $imgString = file_get_contents($file);
    /* create image from string */
    $image = imagecreatefromstring($imgString);
    $tmp = imagecreatetruecolor($width, $height);
    imagecopyresampled($tmp, $image,
    0, 0,
    $x, 0,
    $width, $height,
    $w, $h);
    imagejpeg($tmp, $file, 100);
    return $file;
    /* cleanup memory */
    imagedestroy($image);
    imagedestroy($tmp);
	}











function seo_friendly_url($string){
    $string = str_replace(array('[\', \']'), '', $string);
    $string = preg_replace('/\[.*\]/U', '', $string);
    $string = preg_replace('/&(amp;)?#?[a-z0-9]+;/i', '-', $string);
    $string = htmlentities($string, ENT_COMPAT, 'utf-8');
    $string = preg_replace('/&([a-z])(acute|uml|circ|grave|ring|cedil|slash|tilde|caron|lig|quot|rsquo);/i', '\\1', $string );
    $string = preg_replace(array('/[^a-z0-9]/i', '/[-]+/') , '-', $string);
    return strtolower(trim($string, '-'));
}





/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//ARRAY /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$arrbln = array(
       '1' => 'Januari',
       '2' => 'Pebruari',
	   '3' => 'Maret',
	   '4' => 'April',
	   '5' => 'Mei',
	   '6' => 'Juni',
	   '7' => 'Juli',
	   '8' => 'Agustus',
	   '9' => 'September',
	   '10' => 'Oktober',
	   '11' => 'Nopember',
	   '12' => 'Desember'
	);

$arrbln1 = array(
       '01' => 'Januari',
       '02' => 'Pebruari',
	   '03' => 'Maret',
	   '04' => 'April',
	   '05' => 'Mei',
	   '06' => 'Juni',
	   '07' => 'Juli',
	   '08' => 'Agustus',
	   '09' => 'September',
	   '10' => 'Oktober',
	   '11' => 'Nopember',
	   '12' => 'Desember'
	);

$arrbln2 = array(
       '1' => 'Jan',
       '2' => 'Peb',
	   '3' => 'Mar',
	   '4' => 'Apr',
	   '5' => 'Mei',
	   '6' => 'Jun',
	   '7' => 'Jul',
	   '8' => 'Agu',
	   '9' => 'Sep',
	   '10' => 'Okt',
	   '11' => 'Nop',
	   '12' => 'Des'
	);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//RANDOM dan SAAT INI ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//ambil saat ini
date_default_timezone_set('Asia/Jakarta');


$tahun = date("Y");
$bulan = date("m");
$tanggal = date("d");
$jam = date("H");
$menit = date("i");
$detik = date("s");
$today = "$tahun:$bulan:$tanggal $jam:$menit:$detik";
$today2 = "$tahun:$bulan:$tanggal";
$today3 = "$tahun$bulan$tanggal$jam$menit$detik";
$today4 = "$tanggal$bulan$tahun";

//pengatur random
$nirand = rand(1,1000);
$nirandx = "$today3$nirand";
$xnirand = rand(1,$nirand);
$hajirobe = md5($nirandx);
$x = md5($nirandx);

//pass baru
$passbaru = substr($hajirobe,0,7);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//KONFIGURASI WARNA TABEL - DATA ////////////////////////////////////////////////////////////////////////////////////////////////////////
$warna01 = "#F8F8F8";
$warna02 = "#FDF0DE";
$warnaover = "#ffddbb";
$warnaheader = "#E5AB1F";
$warnatext = "black";
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//KONFIGURASI WARNA TABEL - DATA, temanku ///////////////////////////////////////////////////////////////////////////////////////////////
$tk_warna01 = "#F8F8F8";
$tk_warna02 = "#E6FDDE";
$tk_warnaover = "#E9FFBB";
$tk_warnaheader = "#D0E51F";
$tk_warnatext = "black";
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//KONFIGURASI WARNA TABEL - DATA, e-learning ///////////////////////////////////////////////////////////////////////////////////////////
$e_warna01 = "#F8F8F8";
$e_warna02 = "#E3E1F9";
$e_warnaover = "#C7CBFA";
$e_warnaheader = "#C0C5EF";
$e_warnatext = "black";
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




//META //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$author = "Agus Muhajir";
$description = "E-Learning untuk Sekolah BIASAWAE";
$url = "http://biasawae.id";
$keywords = "sisfokol, janissary, kendal, jawa tengah, sekolah, sisfo, biasawae, agus, muhajir, tekniknih, teknik, sd, smp, sma, smk, mts, ma";
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//VERSI /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$versi = "SISFOKOL Janissary v3.2.0";
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
?>
