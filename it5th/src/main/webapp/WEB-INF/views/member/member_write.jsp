<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원등록 페이지</title>
<%@ include file="../includes/header.jsp" %>
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
">✷USER REGISTER ✷</h2>
<div style="text-align:center; margin: 10% auto;margin-top:50px; position: relative; border-radius: 20px; justify-content: center; display: grid; background-color: #bebebe; width:600px; height:400px;">
	<form name="form1" method="post" action="${path}/member/insert.do">
			<table style= "margin-top:50px; border:1; width:400px; ">
			<tr>
				<td>아이디</td>
				<td><input name="userId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="userName"></td>
			</tr>
			<tr>
				<td>이메일주소</td>
				<td><input name="userEmail"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="확인">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>