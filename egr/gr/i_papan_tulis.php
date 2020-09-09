<?php
session_start();

//ambil nilai
require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");
require("../../inc/cek/janissari.php");
require("../../inc/cek/e_gr.php");



//ambil nilai
$gmkd = nosql($_REQUEST['gmkd']);

?>

<style>
body {
	margin:0px;
	-webkit-touch-callout: none;
	-webkit-text-size-adjust: none;
	-webkit-user-select: none;
}
</style>




<link href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../../inc/class/jquery_drawr/web/jquery.drawr.combined.js?v=2"></script>







<div id="drawr-container" style="width:100vw;height:100vh;">
	<canvas class="demo-canvas drawr-test1"></canvas>
</div>
<input type="file" id="file-picker" style="display:none;">




<script type="text/javascript">

//membuat document jquery
$(document).ready(function(){
	
	



	$("#drawr-container .demo-canvas").drawr({
		"enable_tranparency" : false
	});

	$(".demo-canvas").drawr("start");





	
	//add custom save button.
	var buttoncollection = $("#drawr-container .demo-canvas").drawr("button", {
		"icon":"mdi mdi-folder-open mdi-24px"
	}).on("touchstart mousedown",function(){
		//alert("demo of a custom button with your own functionality!");
		$("#file-picker").click();
	});
	
	
	var buttoncollection = $("#drawr-container .demo-canvas").drawr("button", {
		"icon":"mdi mdi-content-save mdi-24px"
	}).on("touchstart mousedown",function(){
		var imagedata = $("#drawr-container .demo-canvas").drawr("export","image/png");
		var element = document.createElement('a');
		
			
			$.ajax({
			  url:"i_papan_tulis_simpan.php?gmkd=<?php echo $gmkd;?>",
			  // send the base64 post parameter
			  data:{
			    base64: imagedata
			  },
			  // important POST method !
			  type:"post",
			  complete:function(){
			    //console.log("Ready");
			    //alert("ready");
			  }
			});
	

		element.style.display = 'none';
		document.body.appendChild(element);
		element.click();
		document.body.removeChild(element);



	});
	
	
	
	
	
	
	$("#file-picker")[0].onchange = function(){
		var file = $("#file-picker")[0].files[0];
		if (!file.type.startsWith('image/')){ return }
		var reader = new FileReader();
		reader.onload = function(e) { 
			$("#drawr-container .demo-canvas").drawr("load",e.target.result);
		};
		reader.readAsDataURL(file);
	};











function moveItem() {
    
		var imagedata = $("#drawr-container .demo-canvas").drawr("export","image/png");
		var element = document.createElement('a');
		
			
			$.ajax({
			  url:"i_papan_tulis_simpan.php?gmkd=<?php echo $gmkd;?>",
			  // send the base64 post parameter
			  data:{
			    base64: imagedata
			  },
			  // important POST method !
			  type:"post",
			  complete:function(){
			    //console.log("Ready");
			    //alert("ready");
			  }
			});
	

		element.style.display = 'none';
		document.body.appendChild(element);
		element.click();
		document.body.removeChild(element);


}



setInterval(moveItem, 5000);







  
    

});

</script>


<hr>







