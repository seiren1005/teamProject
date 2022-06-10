<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
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
">✷USER LIST ✷</h2>
<div style="text-align:center; margin: 10% auto;margin-top:50px; position: relative; border-radius: 20px; justify-content: center; display: grid; background-color: #bebebe; width:800px; height:450px;">
	<form name="form1" method="post" >
	<table border="1" width="700px">
	<input type="button" value="회원등록" onclick="location.href='${path}/member/write.do'">
		<tr>
			<th>아이디</th>
			<th style="background-color:#326c5c;">이름</th>
			<th>이메일</th>
			<th>회원가입일자</th>
		</tr>
		<c:forEach var="row" items="${list}">
		<tr>
			<td>${row.userId}</td>
			<!-- 회원정보 상세조회를 위해 a태그 추가 -->
			<td style="background-color:#326c5c;"><a href="${path}/member/view.do?userId=${row.userId}">${row.userName}</a></td>
			<td>${row.userEmail}</td>
			<td>${row.userRegdate}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>