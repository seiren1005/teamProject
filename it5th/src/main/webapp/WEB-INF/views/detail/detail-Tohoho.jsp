<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>とほほのWWW入門</title>
</head>
<body>
	<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8"  style = "padding: 15px 0px 105px 0px;">
         
  	
  			<br><h1 style="text-align:center;color:blue;"><span style="color:red">とほほの</span>WWW入門</h1><br>
  			
 			<p>이번에 소개할 사이트는  토호호의 www입문이라고 하는 HTML이나 CSS, JavaScript 등 다양한 웹 기술의 종합
 			  일본 사이트입니다. 글자뿐이라 보기 힘들다는 오레 되었고 일본어라는 단점이 있지만  일본과 한국이 어떤 점이 다른지 일본어로 어떻게 설명하고 있는지 
 			  확인 할 수 있으니 어느정도 코딩과 일본어 지식이 있다면 
			일본에서 일하고 싶거나 필요가 있다면 설명서를 읽는다는 가벼운 마음으로 접근해 보는 것을 어떨까요?

				
				
				</p>
				
				
				<img class="img-concert" src="../../resources/img/tohoho1.png" style="width:600px; height:600px; display : block ; margin : auto;"  />
 				<br>
 				<p>とほほのＷＷＷ入門은 HTML이나 JavaScript, Ruby, Python등의 기초 지식을 배울 수 있는, 웹 제작 초보자에게 있어서는 바이블과 같은, 매우 고맙운 존재입니다. </p>
 				
 				<img class="img-concert" src="../../resources/img/tohoho2.jpg" style="width:600px; height:400px; display : block ; margin : auto;"  />
 				<br>
 				<p>	
				杜甫々（とほほ）토호호씨와 부인이 운영하는 비영리 사이트이자
				1996년에 오픈해 벌써 2022년 기준으로 26년을 맞이하는 사이트입니다.
				2016년 10월을 마지막으로 갱신이 되지 않는 것 같지만, 
				그래도 20년간 컨텐츠를 계속 내보내는 것은, 꽤 힘든 일이었던 것은 아닐까하는 생각이 듭니다.
 				
 				「WWW 입문」의 새로운 사이트  Bootstrap 사이트. 토호호 부트스트렙 입문도 있습니다.
 				<br>
				◇とほほのBootstrap入門
					<br>
				http://www.tohoho-web.com/ex/bootstrap.html
					<br>
				◇とほほのＷＷＷ入門
					<br>
				http://www.tohoho-web.com/</p>
 				
 				
 				
  <a href="#" target='_black' onclick=test2() id="" data-bs-toggle="tooltip" data-bs-placement="right" title="새창에 とほほ페이지를 띄우고 공부일기장으로 이동합니다">
    <img class="img-concert" src="https://www.tohoho-web.com/image/tohowww.gif" style="display : block ; margin : auto;" />
  </a>
        
        
        
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
</body>
<script>
    function test2() {
        if (!confirm("공부 일기장과 같이 이동 하시겠습니까?")) {
            alert("취소(아니오)를 누르셨습니다.");
        } else {
            alert("공부 일기장으로 이동합니다.");
            window.open("https://www.tohoho-web.com/www.htm");
            window.location = '/diaryBoard/list';
        }
    }
</script>

 <%@include file="../includes/footer.jsp" %>