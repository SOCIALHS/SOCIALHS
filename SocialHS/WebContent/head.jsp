<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>    
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"x
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

<script src="//code.jquery.com/jquery.min.js"></script>
	<script>
	function Alm() {
		$.ajax({
			url: "AlarmController",
			type: "get",
			dataType: "JSON",
			success: function(data){
				console.log(data);
				var msnList = data.msnAlm;
				var memList = data.memAlm;
				var comList = data.comAlm;
				var newAlm = "";
				if (memList == undefined){
					console.log("모집 언디파인드");
				} else {
					newAlm += "<b>모집 알람</b>";	
					newAlm += "<hr>";
					$.each(memList, function(member){
						newAlm += '"'+ this.title+'"'+ "모집글에 신청 알림<br>";
					});
					newAlm += "<br><br>";
				}
				if (msnList == undefined){
					console.log("쪽지 언디파인드");
				} else {
					newAlm += "<b>쪽지 알람</b>";	
					newAlm += "<hr>";
					$.each(msnList, function(member){
						newAlm += '"'+ this.send_id+'"'+ "님께서 보낸 쪽지 알림<br>";
					});
					newAlm += "<br><br>";
				}
				if (comList == undefined){
					console.log("댓글 언디파인드");
				} else {
					newAlm += "<b>댓글 알람</b>";	
					newAlm += "<hr>";
					$.each(comList, function(member){
						newAlm += '"'+ this.title+'"'+ "글에 댓글 알림<br>";
					});
					newAlm += "<br><br>";
				}
					console.log(newAlm);
					console.log("data.almCnt: "+ data.almCnt);
					
				$("#newAlm").html(newAlm);
				if (data.almCnt == '0'){
					$("#almCnt").attr("class", "badge badge-dark");							
					$("#almCnt").html(data.almCnt);
				} else {
					$("#almCnt").attr("class", "badge badge-danger");							
					$("#almCnt").html(data.almCnt);
				}
				var btnChk = true;
				$("#almBtn").on("click", function(){
					if (btnChk == true){
						$("#newAlm").css("display", "block");
						btnChk = false;
					} else {
						$("#newAlm").css("display", "none");
						btnChk = true;
					}
				});

			},
			error: function(jqXHR, textStatus, errorThrown){
					console.log("실패: \n"
						+ "jqXHR.readyState: "+ jqXHR.readyState+ "\n"
						+ "textStatus: "+ textStatus+ "\n"
						+ "errorThrown: "+ errorThrown);
			}
		});
	}
	</script>
<script>
	$(document).ready(function() {
		Alm();
		setInterval(Alm(), 3000
		);
	});
</script>
<style>
	#newAlm {
	    display: none;
	    position: absolute;
	    background-color: #f9f9f9;
	    width: 250px; height: 160px;
	    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	    padding: 12px 16px;
	    z-index: 1; 
	    overflow: auto;
		word-wrap: break-word;
		text-size: 9px;
	}
	#almOutter {
	    position: relative;
    	display: inline-block;
	}
	#inner {
		display: block;
	}
</style>