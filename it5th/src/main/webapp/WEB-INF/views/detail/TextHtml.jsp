<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>



<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-6">
        <textarea id="inputbox" cols="20" rows="10"></textarea>
   		<button id="preview">Run</button>
        </div>
        <div class="col-md-6" id="result">
      
        </div>
    </div>
</div>
</body>
<script>
window.onload=function() {
 document.getElementById("preview").onclick=processText;
}

function processText() {
 var txtBox = document.getElementById("inputbox");
 var lines = txtBox.value.split("\n");

 // 택스트 lnnerhtml로 변환 resultString 결과 (String)파일 
 var resultString  = "<p>";
 for (var i = 0; i < lines.length; i++) {
   resultString += lines[i] + "<br />";
 }
 resultString += "</p>";


 var   blk   = document.getElementById("result");
 blk.innerHTML  =  resultString; 
}
</script>

</html>
<%@include file="../includes/footer.jsp" %>