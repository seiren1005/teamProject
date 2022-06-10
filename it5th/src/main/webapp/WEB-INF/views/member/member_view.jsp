<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 상세 페이지</title>
<%@ include file="../includes/header.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnUpdate").click(function(){
			// 확인 대화상자	
			if(confirm("수정하시겠습니까?")){
				document.form1.action = "${path}/member/update.do";
				document.form1.submit();
			}
		});
	});
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			// 확인 대화상자 
			if(confirm("삭제하시겠습니까?")){
				document.form1.action = "${path}/member/delete.do";
				document.form1.submit();
			}
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
">✷USER VIEW ✷</h2>
<div style="text-align:center; margin: 10% auto;margin-top:50px; position: relative; border-radius: 20px; justify-content: center; display: grid; background-color: #bebebe; width:600px; height:400px;">
	<form name="form1" method="post">
		<table style= "margin-top:50px; border:1; width:400px; ">
			<tr>
				<td>아이디</td>
				 <!-- id는 수정이 불가능하도록 readonly속성 추가 -->
				<td><input name="userId" value="${dto.userId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="userName" value="${dto.userName}"></td>
			</tr>
			<!-- 누락된 부분 -->
			<tr>
				<td>이메일주소</td>
				<td><input name="userEmail" value="${dto.userEmail}"></td>
			</tr>
			<!-- 누락된 부분 -->
			<tr>
				<td>회원가입일자</td>
				<td>
					<fmt:formatDate value="${dto.userRegdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			</tr>
			<tr>
				<td>회원정보 수정일자</td>
				<td>
					<fmt:formatDate value="${dto.userUpdatedate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" id="btnUpdate">
					<input type="button" value="삭제" id="btnDelete">
					<div style="color: red;">${message}</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>