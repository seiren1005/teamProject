<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
  <head>
	<meta charset="EUC-KR">
	<title>TCP</title>
    <style>.img-concert { width: 200px; height: 100px;}
    </style>
  </head>
  <body>
  <div class="container">
  <div class="row">
  
  <div class="col-md-2"></div>
  <div class="col-md-8">
  <h1>TCP스쿨</h1>
    <a href="#" target='_black' onclick=test() id="TCP">
    <img class="img-concert" src="http://www.tcpschool.com/img/logo.png" />
  </a>
  
  
  </div>
  <div class="col-md-2"></div>
   
   </div>
   </div>
  </body>
  
  <script>
  function test() {
      if (!confirm("공부 일기장과 같이 이동 하시겠습니까?")) {
          alert("취소(아니오)를 누르셨습니다.");
          window.location = '/deteil/diteil-TCP';
      } else {
          alert("공부 일기장으로 이동합니다.");
          window.open("http://www.tcpschool.com/");
          window.location = '/board/list';
      }
      
  }
 </script>

  
 <%@include file="../includes/footer.jsp" %>