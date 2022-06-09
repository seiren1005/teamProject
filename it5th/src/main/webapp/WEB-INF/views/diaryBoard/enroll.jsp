<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>


<meta charset="EUC-KR">
<title>Insert title here</title>

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
        
<h1 >공부일기 작성</h1>
<p style="float:left;">매일 매일 기록해보자</p>
<a style="float:right" href="/detail/check" class="top_btn">출석체크</a>  
<br>
   

<form action="/diaryBoard/enroll" method="post" class="p-5 mb-4 bg-light rounded-3">
	<div class="input_wrap">
		<label >Title</label>
		<input class="form-control" name="diarytitle">
	</div>
	<div class="input_wrap">
		<label>Content</label>
		<textarea class="form-control" rows="3" name="diarycontent" id="inputbox"></textarea>
	</div>
	<div class="input_wrap">
		<label>Writer</label>
		<input class="form-control" name="diarywriter">
	</div>
	<button class="btn"  style="float: right;">등록</button>
	
</form>


<button id="showBtn" type="button" class="btn btn-light">HTML TEST해보기</button>
<button id="hideBtn" type="button" class="btn btn-light">숨기기!</button>
<p style="none">


	<div class="p-5 mb-4 bg-light rounded-3" id="hidep" style="display:none" >	
            			<div class = "panel-heading" style="font-weight: 600;">html 확인해보기
   					<button id="preview" type="button" class="btn btn-success"  
   					data-bs-toggle="tooltip" data-bs-placement="top" title="Content에 작성한 HTML코드를 미리 확인해 보세요">Run</button>
            </div>
            
            
            <div id="section"  style="overflow:scroll; width:702px; height:350px;">
    			<div id="result"></div>
  			</div>
  			</div>
            		</div>
            		
 </div>
        <div class="col-md-2"></div>
    </div>
</div>
<script>

$(function() {
    $("#showBtn").on("click", function() {
        $("#hidep").show();
    })
    $("#hideBtn").on("click", function() {
        $("#hidep").hide();
    })
})







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


