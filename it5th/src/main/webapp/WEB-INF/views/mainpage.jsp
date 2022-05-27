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
				<a>
					<img src="../resources/img/sample1.jpg">
				</a>
			</div>
			<div>
				<a>
					<img src="../resources/img/sample2.jpg">
				</a>
			</div>
		<div>
			<a>
				<img src="../resources/img/sample3.jpg">
			</a>
		</div>
		</div>
					<h2 style="font-family: 'Nanum Gothic', sans-serif;">추천 동영상</h2>
					<!-- 유튜브 영상 -->
					<div class="video-container">
					<iframe width="560" height="315" src="https://www.youtube.com/embed/wpUiN5hBnyc" title="YouTube video player" 
					frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
					allowfullscreen></iframe>
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
