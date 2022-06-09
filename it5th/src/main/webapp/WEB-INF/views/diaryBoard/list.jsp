<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>

<meta charset="EUC-KR">
<title>diaryBoard</title>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
        <h1>공부 일기장</h1>
         <p style="float:left;"><span>오늘 공부한 내용을 기록하고 출석체크해봐요.</span></p> 
         <a style="float:right" href="/diaryBoard/enroll" class="top_btn">공부일기쓰기</a>
<table class="table table-hover">
  		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
				<th class="updatedate_width">수정일</th>
			</tr>
		</thead>
  
  <c:forEach items="${list}" var="list">
            <tr>
                <td><c:out value="${list.diarybno}"/></td>
                <td  style="font-weight: 600;"><a class="move" href='<c:out value="${list.diarybno}"/> '>
          <!--    /diaryBoard/get?diarybno= -->   
                        <c:out value="${list.diarytitle}"/>
                    </a></td>
                <td><c:out value="${list.diarywriter}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.diaryregdate}" /></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.diaryupdateDate}"/></td>
               <!-- <td><c:out value="${list.diaryregdate}"/></td>
                <td><c:out value="${list.diaryupdateDate}"/></td>  -->
            </tr>
        </c:forEach>
		</table>
		
	<div class="search_wrap">
        <div class="search_area">
        <form id="searchForm" action="/diaryBoard/list" method="get">
        <select name="type">
                <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
                <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
                <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
            
            </select>    
            <input type="text" name="keyword" 
				value="<c:out value='${pageMaker.cri.keyword }'/>" />
							<!-- 페이지정보 포함 (hidden) -->
							<input type="hidden" name="pageNum"
								value="${pageMaker.cri.pageNum }" /> <input type="hidden"
								name="amount" value="${pageMaker.cri.amount }" />
							<button class="btn btn-default" style="border-color:black">검색</button>
						</form>
        </div>
    </div>    
		
		
		<div class="pageInfo_wrap" >
        <div class="pageInfo_area">
 			<ul id="pageInfo" class="pagination justify-content-center">
 			
 			<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>
				
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a class="page-link" href="${num}">${num}</a></li>
				</c:forEach>
				
				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageInfo_btn next"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
				</c:if>	
 			
 			
 			</ul>
        </div>
    </div>
 <form id="moveForm" method="get">
    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
       <input type="hidden" name="amount" value="${pageMaker.cri.amount }">       
         <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
         <input type="hidden" name="type" value="${pageMaker.cri.type }">
    </form>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
<script type="text/javascript">
$(Document).ready(function(){
    
    let result = '<c:out value="${result}"/>';
    checkAlert(result);    
    function checkAlert(result){        
        if(result === ''){
            return;
        } 
        if(result === "enroll success"){
            alert("등록이 완료되었습니다.");
        }

        if(result === "modify success"){
            alert("수정이 완료되었습니다.");
        }
        if(result === "delete success"){
            alert("삭제가 완료되었습니다.");
        }
 
    }    
    
});

let moveForm = $("#moveForm");

$(".move").on("click", function(e){
    e.preventDefault();
    moveForm.append("<input type='hidden' name='diarybno' value='"+$(this).attr("href")+ "'>");
 //   $(this).val($(this).attr(href).replace(/[^0-9]/g,""));
 //moveForm.append("<input type='hidden' name='diarybno' value='"+$(this).attr("href")+ "'>");
    moveForm.attr("action", "/diaryBoard/get");
    moveForm.submit();
});



$(".pagination a").on("click", function(e){

    e.preventDefault();
    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    moveForm.attr("action", "/diaryBoard/list");
    moveForm.submit();
    
});


$(".search_area button").on("click", function(e){
    e.preventDefault();
    
    let type = $(".search_area select").val();
    let keyword = $(".search_area input[name='keyword']").val();
    
    if(!type){
        alert("검색 종류를 선택하세요.");
        return false;
    }
    
    if(!keyword){
        alert("키워드를 입력하세요.");
        return false;
    }        
    
    moveForm.find("input[name='type']").val(type);
    moveForm.find("input[name='keyword']").val(keyword);
    moveForm.find("input[name='pageNum']").val(1);
    moveForm.submit();
});


</script>
</body>
<%@include file="../includes/footer.jsp" %>