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
  			
 			<p>이번에 소개할 사이트는  토호호의 www이문이라고 하는  일본 사이트입니다. 글자뿐이라 보기 힘들다는 단점이 있지만  
  				일본과 한국이 어떤 점이 다른지 일본어로 어떻게 설명하고 있는지 확인 할 수 있어 어느정도 코딩과 일본어 지식이 있다면 
				일본에서 일하고 싶거나 필요가 있다면 설명서를 읽는다는 가벼운 마음으로 접근해 보는 것을 어떨까요 .</p>
 
  <a href="#" target='_black' onclick=test2() id="">
    <img class="img-concert" src="https://www.tohoho-web.com/image/tohowww.gif" />
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
            window.location = '/board/list';
        }
    }
</script>

 <%@include file="../includes/footer.jsp" %>