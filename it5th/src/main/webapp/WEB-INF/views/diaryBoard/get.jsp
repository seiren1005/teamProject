<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

<meta charset="EUC-KR">
<title>Insert title here</title>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">

<input style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
 name="diaryregdater" readonly="readonly" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.diaryregdate}"/>' ><h1>공부 일기</h1>

<form class="p-5 mb-4 bg-light rounded-3">
	<div class="input_wrap">
		<label style="transform: translate(0px, 10px)">일기 번호</label>
		<input class="form-control" name="diarybno" readonly="readonly" value='<c:out value="${pageInfo.diarybno}"/>' >
	</div>
	
	<div class="input_wrap">
		<label style="transform: translate(0px, 10px)">제목</label>
		<input class="form-control" name="diarytitle" readonly="readonly" value='<c:out value="${pageInfo.diarytitle}"/>' >
	</div>
	<div class="input_wrap">
		<label style="transform: translate(0px, 10px)">내용</label>
		<textarea  class="form-control" rows="3" name="diarycontent" readonly="readonly"><c:out value="${pageInfo.diarycontent}"/></textarea>
	</div> 
	<div class="input_wrap">
		<label style="transform: translate(0px, 10px)">일기 작성자</label>
		<input class="form-control" name="diarywriter" readonly="readonly" value='<c:out value="${pageInfo.diarywriter}"/>' >
	</div>
	<div class="input_wrap">
		<label style="transform: translate(0px, 10px)">일기쓴 날</label>
		<input class="form-control" name="diaryregdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.diaryregdate}"/>' >
	</div>
	<div class="input_wrap">
		<label style="transform: translate(0px, 10px)">일기 수정일</label>
		<input class="form-control" name="diaryupdateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.diaryupdateDate}"/>' >
	</div>		
	<br>
	<div class="btn_wrap">
		<a class="btn" id="list_btn"  style="float: right;">목록 페이지</a> 
		<a class="btn" id="modify_btn"  style="float: right;">수정 하기</a>
	</div>
	</form>
	<form id="infoForm" action="/diaryboard/modify" method="get" >
		<input type="hidden" id="diarybno" name="diarybno" value='<c:out value="${pageInfo.diarybno}"/>' >
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
		<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
		<input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
	</form>
	   </div>
        <div class="col-md-2"></div>
    </div>
</div>
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#diarybno").remove();
		form.attr("action", "/diaryBoard/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/diaryBoard/modify");
		form.submit();
	});	
</script>	
</body>
<%@include file="../includes/footer.jsp" %>