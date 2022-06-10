<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지</title>
<%@ include file="../includes/header.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			// 태크.val() : 태그에 입력된 값
			// 태크.val("값") : 태그의 값을 변경 
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			if(userId == ""){
				alert("아이디를 입력하세요.");
				$("#userId").focus(); // 입력포커스 이동
				return; // 함수 종료
			}
			if(userPw == ""){
				alert("아이디를 입력하세요.");
				$("#userPw").focus();
				return;
			}
			// 폼 내부의 데이터를 전송할 주소
			document.form1.action="${path}/member/loginCheck.do"
			// 제출
			document.form1.submit();
		});
	});
</script>
</head>
<body>

<h2 style="
text-decoration: none; 
font-family: 'Comic Sans MS', 'Comic Sans', 'Independence_hall';
text-align: center; 
display: inline-block; 
color: #001d48;
letter-spacing: -1px; 
border-radius: 20px; 
padding: 5px 15px;
margin-left: -4px;
background-color:#bebebe;
display: table; 
margin-left: auto; 
margin-right: auto;
margin: 10% auto;
margin-bottom:2%;
">✷ Login ✷</h2>
<div style="text-align:center; margin: 10% auto;margin-top:50px; position: relative; border-radius: 20px; justify-content: center; display: grid; background-color: #bebebe; width:500px; height:200px;">
	<form name="form1" method="post" >
		<table style="border:1px; width:500px; height:134px; margin: 20px auto;" >
	
			<tr>
				<td>아이디</td>
				<td><input name="userId" id="userId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPw" id="userPw"></td>
			</tr>
			</div>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnLogin">로그인</button>
					
				<c:if test="${msg == 'failure'}">
					<div style="color: red">
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
				<c:if test="${param.msg == 'nologin'}">
					<div style="color: red">
						로그인 후 사용이 가능합니다.
					</div>
				</c:if>
				<c:if test="${msg == 'logout'}">
					<div style="color: red">
						로그아웃되었습니다.
					</div>
				</c:if>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>