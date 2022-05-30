<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/includes/header.jsp" %>
<!-- gnb부터 메뉴바까지 헤더로 묶어서 인클루드로 가져오기 -->
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="resources/css/mainpage.css">
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
</head>
<body>
		<div class="content_area">
		<!-- 슬라이드쇼 -->
		<div class="slide_div">
			<div>
				<a> <!-- 첫번째 슬라이드: TCP -->
					<a href="/detail/detail-TCP"><img src="../resources/img/sample1.jpg">
				</a>
			</div>
			<div>
				<a> <!-- 두번째 슬라이드: 토호호 -->
					<a href="/detail/detail-Tohoho"><img src="../resources/img/sample2.jpg">
				</a>
			</div>
		<div>
			<a> <!-- 세번째 슬라이드: 생활코딩 -->
				<a href="/detail/detail-LifeCoding"><img src="../resources/img/sample3.jpg">
			</a>
		</div>
		</div> 
					<!-- 글자 꾸미기 -->
					<div style="text-align:center">
					<a style=
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
					font-variant:small-caps;">추천 동영상</a>
					
					<!-- 유튜브 영상 -->
					<div class="video-container">
					<p align="middle">
					<iframe width="1120" height="630" src="https://www.youtube.com/embed/wpUiN5hBnyc" title="YouTube video player" 
					frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
					allowfullscreen></iframe>
					</p>
				</div>
		</div>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>

	<script>
	$(document).ready(function(){
		$(".slide_div").slick(
				{
					dots: true,
					autoplay : true,
					autoplaySpeed: 5000
				}		
		);
	});
	</script>
	
</body>
</html>
