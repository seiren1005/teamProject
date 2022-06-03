<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트 소개 페이지</title>
<link rel="stylesheet" href="resources/css/mainpage.css">
</head>
<body>
<%@include file="/WEB-INF/views/includes/header.jsp" %>
<!-- 안내박스 -->
		<div class="container">
			<div style="text-align:center">
			<h2 style=
			"text-decoration:none; 
			font-family: 'Comic Sans MS', 'Comic Sans', 'Independence_hall'; 
			color: black; 
			font-weight: bold; 
			padding: 8px; 
			background: gold; 
			line-height: 170%; 
			border: 1px solid black; 
			box-shadow: -2px 2px 0px black; 
			display:inline-block; 
			margin: 7px 7px 7px 7px; 
			font-variant:small-caps;">웹사이트 소개</h2>
			
			<br>
			<div style="text-align:center">
     		<h2 style=
     		"font-family: 'Nanum Myeongjo'; 
     		color: black; 
		     text-decoration:none; 
		     font-style: font-weight: bold; 
		     padding: 8px 12px; 
		     background: #ffffff; 
		     line-height: 170%; 
		     border: 2px solid black; 
		     box-shadow: 2px 2px 0px ; 
		     display: inline-block;">이 웹 사이트는 글로벌인 IT 5기 팀프로젝트로 만든 <br>
		     							 코딩 학습 사이트 안내 웹 사이트입니다.</h2>
					<br>
				</div>
			</div>
<!-- gnb부터 메뉴바까지 헤더로 묶어서 인클루드로 가져오기 -->
		<div class="content_area">
		<!-- 글자 꾸미기 -->
		<div style="text-align:center">
		<h2 style=
		"text-decoration:none; 
		font-family: 'Comic Sans MS', 'Comic Sans', 'Independence_hall'; 
		color: black; 
		font-weight: bold; 
		padding: 8px; 
		background: gold; 
		line-height: 170%; 
		border: 1px solid black; 
		box-shadow: -2px 2px 0px black; 
		display:inline-block; 
		margin: 7px 7px 7px 7px; 
		font-variant:small-caps;">찾아오시는 길</h2>
		
		<!-- 카카오맵 연동 -->
		<p style="margin-top:-12px">
		</p>
			<div id="map" 
			style="width:1000px;
			height:500px;
			margin: auto !important;"></div>

				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af8478efa102e3f270f38715f40a210c&libraries=services"></script>
				<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 영등포구 영중로 56', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">4층 글로벌인</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});   
</script>
	<br>
	<div style="text-align:center">
     <h2 style=
     "font-family: 'Nanum Myeongjo'; 
     color: black; 
     text-decoration:none; 
     font-style: font-weight: bold; 
     padding: 8px 12px; 
     background: #ffffff; 
     line-height: 170%; 
     border: 2px solid black; 
     box-shadow: 2px 2px 0px ; 
     display: inline-block;"> 
    	 서울시 영등포구 영중로 56 신한빌딩 4, 5층 주식회사 글로벌인 <br>
      	영등포시장역 3번출구 도보 2분, 영등포역 3번출구 도보 10분이내 </h2> 
     </div>
</div>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>