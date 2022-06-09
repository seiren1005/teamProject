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
<br>
<a>
<img class="img-concert" src="../../resources/img/tcpschool_main.png" style="width:600px; height:400px; display : block ; margin : auto;"  />
<br>
  <p>
  컴퓨터 언어인 코드를 사용하여 프로그램을 만들어가는 과정인 코딩은 4차 산업혁명 시대가 시작된 지금 
  어느 때보다 중요성이 강조되고 있고 초중고 학생들은 물론 개발자와 일반인까지 코딩을 배우는 이들이 늘어나고 있는 지금.
 이미 개발자들 사이에서 코딩 교육 사이트로 잘 알려진 TCP스쿨은 코딩을 처음 접하는 학생들을 위한 웹의 기초, 코딩수학, 딥러닝 사례 등을 제공하며 
 전문가 과정인 PHP, Python, JAVA, C등의 고급언어까지 포함해 모두 16개의 커리큘럼을 제공하고 있습니다.
  </p>
</a>

<img class="img-concert" src="../../resources/img/TCP2.gif" style="width:600px; height:400px; display : block ; margin : auto;"  />

<p>
프로그래밍 언어를 공부하는 코딩은 직접 보고, 듣는 학습뿐만 아니라 키보드로 직접 코드를 작성해 보는 것이 매우 중요합니다.
 TCP스쿨 에서는 아무런 설치 없이 홈페이지에서 직접 실습할 수 있도록 수백까지의 예제가 준비되어 있어, 코딩 학습하기가 아주 좋습니다.
 <br>
TCP코리아의 서연균 대표는 “4차 산업혁명시대를 이끌어갈 학생들에게 코딩교육의 도움이 되고, 
나아가 코딩의 고수가 많이 배출되어 전 세계를 무대로 정진하기를 바라는 마음으로 TCP스쿨을 제작하여 무료로 제공하고 있습니다.
</p>




    <a href="#" target='_black' onclick=test() id="TCP" data-bs-toggle="tooltip" data-bs-placement="right" title="새창에 TCP페이지를 띄우고 공부일기장으로 이동합니다">
    <img class="img-concert" src="http://www.tcpschool.com/img/logo.png"  style= "display : block ; margin : auto;"/>
 	</a>

  <div class="col-md-2"></div>
   
   </div>
   </div>
  </body>
  
  <script type="text/javascript">
  function test() {
      if (!confirm("공부 일기장과 같이 이동 하시겠습니까?")) {
          alert("취소(아니오)를 누르셨습니다.");
          window.location = '/detail/ditail-TCP';
      } else {
          alert("공부 일기장으로 이동합니다.");
          window.open("http://www.tcpschool.com/");
          window.location = '/diaryBoard/list';
      }
      
  }
  
  $(document).ready(function(){
      const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
      const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
  });
  
 </script>

  
 <%@include file="../includes/footer.jsp" %>