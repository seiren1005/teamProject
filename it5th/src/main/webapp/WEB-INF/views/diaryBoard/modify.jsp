<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="col-md-2"></div>
        <div class="col-md-8">
        
<h1>공부일기 수정</h1>
	<form id="modifyForm" action="/diaryBoard/modify" method="post" class="p-5 mb-4 bg-light rounded-3">
	<div class="input_wrap">
		<label style="transform: translate(0px, 10px)">일기 번호</label>
		<input class="form-control" name="diarybno" readonly="readonly" value='<c:out value="${pageInfo.diarybno}"/>' >
	</div>
	<div class="input_wrap">
		<label style="transform: translate(0px, 10px)">제목</label>
		<input class="form-control" name="diarytitle" value='<c:out value="${pageInfo.diarytitle}"/>' >
	</div>
	<div class="input_wrap">
		<label style="transform: translate(0px, 10px)">내용</label>
		<textarea class="form-control" rows="3" name="diarycontent"><c:out value="${pageInfo.diarycontent}"/></textarea>
	</div>
	<div class="input_wrap">
		<label style="transform: translate(0px, 10px)">일기 작성자</label>
		<input class="form-control" name="diarywriter" readonly="readonly" value='<c:out value="${pageInfo.diarywriter}"/>' >
	</div>
	<div class="input_wrap">
		<label style="transform: translate(0px, 10px)">일기 등록일</label>
		<input class="form-control" name="diaryregdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.diaryregdate}"/>' >
	</div>
	<div class="input_wrap">
		<label style="transform: translate(0px, 10px)">일기 수정일</label>
		<input class="form-control" name="diaryupdateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.diaryupdateDate}"/>' >
	</div>		
	<br>
	<div class="btn_wrap">
		<a class="btn" id="list_btn" style="float: right;">목록 페이지</a> 
		<a class="btn" id="modify_btn" style="float: right;">수정 완료</a>
		<a class="btn" id="delete_btn" style="float: right;">삭제</a>
		<a class="btn" id="cancel_btn" style="float: right;">수정 취소</a>
	</div>
	</form>
	<form id="infoForm" action="/diaryboard/modify" method="get">
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

	let form = $("#infoForm");		// 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm");	// 페이지 데이터 수정 from
	
	/* 목록 페이지 이동 버튼 */
	$("#list_btn").on("click", function(e){
		form.find("#diarybno").remove();
		form.attr("action", "/diaryBoard/list");
		form.submit();
	});
	
	/* 수정 하기 버튼 */
	$("#modify_btn").on("click", function(e){
		mForm.submit();
	});
	
	/* 취소 버튼 */
	$("#cancel_btn").on("click", function(e){
		form.attr("action", "/diaryBoard/get");
		form.submit();
	});	
	
	/* 삭제 버튼 */
	$("#delete_btn").on("click", function(e){
		form.attr("action", "/diaryBoard/delete");	
		form.attr("method", "post");	
		form.submit();	
	});
	
	
</script>
</body>
<%@include file="../includes/footer.jsp" %>