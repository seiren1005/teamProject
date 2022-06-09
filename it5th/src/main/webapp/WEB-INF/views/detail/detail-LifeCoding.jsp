<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>생활 코딩 소개 </title>
    <link rel="stylesheet" type="text/css" href="reset.css" />
    <style>
      .img-concert {
        width: 200px;
        height: 100px;
      }
    </style>
  </head>
<body>
	<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
         <br> <h1>생활 코딩 </h1> <br>
  
  			<p>이번에 소개할 사이트는 생활코딩 이라는 사이트 입니다.</p>
 			 <p>생활코딩은 개인적으로 강력 추천하는 코딩 페이지 입니다. 각 부분별로 설명이 세세하게 나누어져있고 언어의 종류도 넓습니다.
  			생활코딩 최대의 장점은 유튜브에서 무료로 동영상 강의를 수강할 수 있다는 것입니다.</p>
 
 			 <div id="player"></div>
		
 
 
  <a onclick=test() href="https://www.opentutorials.org/course/1" target='_black' data-bs-toggle="tooltip" data-bs-placement="right" title="새창에 생할코딩페이지를 띄우고 공부일기장으로 이동합니다" >
    <img href="/diaryBoard/list" class="img-concert" src="https://i.ytimg.com/vi/1ttLx9MbrCI/maxresdefault.jpg" style="display : block ; margin : auto;"/>
  </a>
  	

        </div>
        <div class="col-md-2"></div>
    </div>
</div>
</body>
<script>
            var tag = document.createElement('script');

            tag.src = "https://www.youtube.com/iframe_api";
            var firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
            
            var player;
            function onYouTubeIframeAPIReady() {
            player = new YT.Player('player', {
                height: '360',
                width: '640',
                videoId: '1ttLx9MbrCI',
                });
            }
   // https://www.googleapis.com/youtube/v3/search?part=snippet&q=kpop+music&key={본인의_API_KEY}
            
            var tag = document.createElement('script');
            tag.src = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=kpop+music&key={AIzaSyANd2dm_Qc_MgAUQbURDceYgMOaPrMoPuo}"
            		
    </script>
     <script>
    function test() {
        if (!confirm("공부 일기장과 같이 이동 하시겠습니까?")) {
            alert("취소(아니오)를 누르셨습니다.");
        } else {
            alert("공부 일기장으로 이동합니다");
            window.open("https://www.opentutorials.org/course/1");   
            window.location = '/diaryBoard/list';
        }
    }
	</script>
</html>



<%@include file="../includes/footer.jsp" %>