<?php
require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");



//ambil nilai
$kd = nosql($_REQUEST['kd']);
?>


        <style>
            video {
              max-width: 100%;
              border: 5px solid yellow;
              border-radius: 9px;
            }
        </style>
        
        



<div id="panggilku" style="display:none">
	<video id="your-video-id" controls="" autoplay=""></video>
</div>


.


<script type="text/javascript">
            // capture camera and/or microphone
            navigator.mediaDevices.getUserMedia({ video: true, audio: true }).then(function(camera) {

                // preview camera during recording
                document.getElementById('your-video-id').muted = true;
                document.getElementById('your-video-id').srcObject = camera;

                // recording configuration/hints/parameters
                var recordingHints = {
                    type: 'video'
                };

                // initiating the recorder
                var recorder = RecordRTC(camera, recordingHints);

                // starting recording here
                recorder.startRecording();

                // auto stop recording after 3 seconds
                var milliSeconds = 1 * 3000;
                setTimeout(function() {

                    // stop recording
                    recorder.stopRecording(function() {
                        
                        // get recorded blob
                        var blob = recorder.getBlob();

                        // generating a random file name
                        var fileName = getFileName('mp4');

                        // we need to upload "File" --- not "Blob"
                        var fileObject = new File([blob], fileName, {
                            type: 'video/mp4'
                        });

                        




		
		
		
							//blob ke base64
							var reader = new FileReader();
								 reader.readAsDataURL(blob); 
								 reader.onloadend = function() {
								     var base64data = reader.result;                
								     //console.log(base64data);
								     
								     //alert(base64data);
								     
										//unggah ke server
										var image = base64data;
						
											$.ajax({
											url: "i_dvideo2_record2.php?kd=<?php echo $kd;?>",
											type:"POST",
											data:{
												base64: image
											  },
											success:function(data){					
												//
												$("#cobaku").html(data);
												}
											});
		
										//$("#cobaku").html(base64data);
		
		
		
								 }               
		
		                




                        // release camera
                        document.getElementById('your-video-id').srcObject = null;
                        camera.getTracks().forEach(function(track) {
                            track.stop();
                        });

                    });

                }, milliSeconds);
            });

  







            // this function is used to generate random file name
            function getFileName(fileExtension) {
                var d = new Date();
                var year = d.getUTCFullYear();
                var month = d.getUTCMonth();
                var date = d.getUTCDate();
                var jam = d.getUTCHours();
                var menit = d.getUTCMinutes();
                var detik = d.getUTCSeconds();
                return 'video-' + year + month + date + jam + menit + detik + '-' + getRandomString() + '.' + fileExtension;
            }

            function getRandomString() {
                if (window.crypto && window.crypto.getRandomValues && navigator.userAgent.indexOf('Safari') === -1) {
                    var a = window.crypto.getRandomValues(new Uint32Array(3)),
                        token = '';
                    for (var i = 0, l = a.length; i < l; i++) {
                        token += a[i].toString(5);
                    }
                    return token;
                } else {
                    return (Math.random() * new Date().getTime()).toString(5).replace(/\./g, '');
                }
            }
        </script>


