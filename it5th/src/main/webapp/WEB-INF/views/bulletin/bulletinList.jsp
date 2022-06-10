<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<style>

li {
	
	list-style: none;
	
}

</style>

<div class="">
	<h1>Board List</h1>
</div>

<div>
	<form method="get" class="purposeForm" action="/bulletin/bulletinList">
	<div class="btn-group" role="group">
    <button type="submit" class="btn btn-sm btn-outline-primary purposeBtn" data-oper="all">
    ALL
    </button>
    <button type="submit" class="btn btn-sm btn-outline-primary purposeBtn" data-oper="qna">
    Q&A
    </button>
    <button type="submit" class="btn btn-sm btn-outline-primary purposeBtn" data-oper="free">
    FREE
    </button>
  </div>  
		<input type="hidden" name="pagePurpose" /> 
		<input type="hidden"
			name="pageNum" value="${pageMaker.cri.pageNum }" /> 
			<input
			type="hidden" name="amount" value="${pageMaker.cri.amount }" />
	</form>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
    <button class="btn btn-sm btn-outline-primary" type="button" id="regBtn">NEW</button>
  </div>
	
</div>

<!-- lists of board contents -->
<table class="table table-hover">
	<thead class="thead-light">
		<tr>
			<th scope="col">Bno.</th>
			<th scope="col">Tag</th>
			<th class="col-1" scope="col"></th>
			<th scope="col">TITLE</th>
			<th scope="col">HIT</th>
			<th scope="col">WRITER</th>
			<th scope="col">REGDATE</th>
		</tr>
	</thead>
	<tbody>
		
			<c:forEach items="${list }" var="board">
			<tr>
				<td><c:out value="${board.bno }" /></td>
				<td><c:choose>
						<c:when test="${board.purpose eq 'Q' }">
											Q&A
										</c:when>
						<c:otherwise>
											FREE
										</c:otherwise>
					</c:choose></td>
				
					<c:choose>
						<c:when test="${board.secret eq 'yes' }">
					<td>					
						<img class="secretIcon" src="/resources/img/lock_02.png" />
					</td>					
					<!-- 비밀글의 경우 클릭시 작성자와 로그인 유저의 정보가 일치하는지 체크 -->
					<td><a style="color:black;" id="privateContent" href="<c:out value='${board.bno }' />"
						name="<c:out value='${board.writer }' />"> 비밀글입니다.</a>
						<c:if test="${board.replyCnt > 0 }">
									<b>[<c:out value="${board.replyCnt }" />]</b>
								</c:if>
						<c:if test="${board.totalRec > 0 }">
							<b style="color:blue;">[<c:out value="${board.totalRec }" />]</b>
						</c:if>
						<c:if test="${board.totalRec < 0 }">
							<b style="color:red;">[<c:out value="${board.totalRec }" />]</b>
						</c:if>
					</td>
					</c:when>					
				<c:otherwise>
					<td></td>
					<td><a style="color:black;" class="moveDetails"
						href="<c:out value='${board.bno }' />"> <c:out
								value="${board.title }" /></a> 
								<c:if test="${board.replyCnt > 0 }">
									<b>[<c:out value="${board.replyCnt }" />]</b>
								</c:if>
						<c:if test="${board.totalRec > 0 }">
							<b style="color:blue;">[<c:out value="${board.totalRec }" />]</b>
						</c:if>
						<c:if test="${board.totalRec < 0 }">
							<b style="color:red;">[<c:out value="${board.totalRec }" />]</b>
						</c:if>						
					</td>
					</c:otherwise>
					</c:choose>
					
					<td><c:out value="${board.hit }" /></td>				
				<td><c:out value="${board.writer }" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${board.regDate }" /></td>
		</tr>
			</c:forEach>
	</tbody>
</table>
<!-- /.lists of board contents -->


<!-- search option and search -->
<div>
    <form id="searchForm" action="/bulletin/bulletinList" method="get">
      <div class="input-group mb-3">
        <div class="input-group-prepend">

          <select class="btn btn-outlin-secondary dropdown-toggle" name="searchType">
            <option class="searchOption" value="T" <c:out value="${pageMaker.cri.searchType eq 'T' ? 
          'selected' : '' }" /> >Title
            </option>
            <option class="searchOption" value="C" <c:out value="${pageMaker.cri.searchType eq 'C' ? 
          'selected' : '' }" /> >Content
            </option>
            <option class="searchOption" value="W" <c:out value="${pageMaker.cri.searchType eq 'W' ?
          'selected' : '' }" /> >Writer
            </option>
            <option class="searchOption" value="TC" <c:out value="${pageMaker.cri.searchType eq 'TC' ? 
          'selected' : '' }" /> >T+C
            </option>
            <option class="searchOption" value="TW" <c:out value="${pageMaker.cri.searchType eq 'TW' ? 
          'selected' : '' }" /> >T+W
            </option>
            <option class="searchOption" value="CW" <c:out value="${pageMaker.cri.searchType eq 'CW' ? 
          'selected' : '' }" /> >C+W
            </option>
            <option class="searchOption" value="TCW" <c:out value="${pageMaker.cri.searchType eq 'CW' ? 
          'selected' : '' }" /> >T+C+W
            </option>
          </select>

          <!-- page info -->
          <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
          <input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
          <input type="hidden" name="pagePurpose" value="${pageMaker.cri.pagePurpose }" />

        </div>
        <input type="text" class="form-control" name="keyword"
          value="<c:out value='${pageMaker.cri.keyword }' />" />
          <button class="btn btn-sm btn-outline-secondary" id="button-addon2">SEARCH</button>
      </div>
    </form>
  </div>
<!-- /.search option and search -->


<!-- Transport page date -->
<form id="actionForm" action="/bulletin/bulletinList" method="get">

	<input type="hidden" name="pageNum"
		value="<c:out 
								value='${pageMaker.cri.pageNum }' />" /> <input
		type="hidden" name="amount"
		value="<c:out 
								value='${pageMaker.cri.amount }' />" /> <input
		type="hidden" name="searchType"
		value="<c:out 
								value='${pageMaker.cri.searchType }' />" /> <input
		type="hidden" name="keyword"
		value="<c:out 
								value='${pageMaker.cri.keyword }' />" /> <input
		type="hidden" name="pagePurpose"
		value="<c:out 
								value='${pageMaker.cri.pagePurpose }' />" />
		<input type="hidden" name="btnNumberPrv" />
</form>
<!-- /.Transport page date -->


<!-- Page number button -->
  
 <nav aria-label="Page navigation example">
    <ul class="pagination">
    
    <!-- prev button -->
      <c:if test="${pageMaker.prev }">
        <li class="paginate_button page-item previous">
		      <a class="page-link" href="${pageMaker.startPage-1 }">
		      	<span aria-hidden="true">&laquo;</span></a>
		    </li>
      </c:if>

  <!-- page number -->
  <c:forEach var="num" 
  begin="${pageMaker.startPage }"
  end="${pageMaker.endPage }">
   <li class="paginate_button page-item page-num"><a class="page-link" href="${num }">${num }</a></li>
</c:forEach>

<!-- next button -->
<c:if test="${pageMaker.next }">
    <li class="paginate_button next page-item">
    	<a class="page-link" href="${pageMaker.endPage+1 }">
		    <span aria-hidden="true">&raquo;</span></a>
    </li>
  </c:if>							
</ul>
    </nav>
<!-- /.Page number button -->


<script type="text/javascript">

let userid = '${member.userId }';

	$(document)
			.ready(
					function() {
						
						console.log(userid);

						var result = "<c:out value='${result }' />";
						// BoardController register() 의 리턴값

						checkAlert(result);

						/* 중복된 글 도배 금지 기능 */
						function checkAlert(result) {

							if (result == "") {

								return;

							}

							if (parseInt(result) > 0) {

								alert("게시글" + (parseInt(result))
										+ " 번이 등록되었습니다.");

							}

						}
						;
						/* /.중복된 글 도배 금지 기능 */

						/* reigster.jsp 페이지로 이동 */
						$("#regBtn").on("click", function() {
							
							if(userid != '' || userid != null) {
								
								self.location = "/bulletin/bulletinRegister";
								
							} else {
								
								if(confirm("You need to login. Do you want to move at login page?")) {
									
									location.href = "/bulletin/login";
									
								}
								
							}						

						});
						/* /.reigster.jsp 페이지로 이동 */

						/* Page processing */
						var actionForm = $("#actionForm");
						
						// add page button
						$(".paginate_button a").on(
								"click",
								function(e) {
									
									e.preventDefault();
									// 클릭한 페이지 번호가 page info 의 hidden input tag
									// 내의 pageNum 에 저장
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									
									// local storage 에 클릭한 버튼 번호 저장
									sessionStorage.setItem('num', $(this).attr("href"))
									
									// 뒤로가기 시 파라미터가 계속 추가되는 현상 수정
									actionForm.attr("action",
											"/bulletin/bulletinList");

									actionForm.submit();

								});

						/* qna and free tag */
						var purposeForm = $(".purposeForm");

						$(".purposeBtn").on(
								"click",
								function(e) {

									e.preventDefault();

									var operation = $(this).data("oper");

									//$.get("/replies")

									if (operation === "all") {

										purposeForm.find(
												"input[name='pagePurpose']").val(
												"A");

									} else if (operation === "qna") {

										purposeForm.find(
												"input[name='pagePurpose']").val(
												"Q");

									} else if (operation === "free") {

										purposeForm.find(
												"input[name='pagePurpose']").val(
												"F");

									}

									purposeForm.find("input[name='pageNum']")
											.val(1);
									purposeForm.submit();

								});

						/* /.qna and free tag */

						/* /.Page processing */

						/* add event when click title */
						$(".moveDetails")
								.on(
										"click",
										function(e) {

											e.preventDefault();

											// page info 같이 전달
											// 뒤로 가기시 파라미터 추가되는 현상 수정
											if (actionForm.find(
													"input[name='bno']").val() == null) {

												actionForm
														.append("<input type='hidden' name='bno' value='"
																+ $(this).attr(
																		"href")
																+ "' />");
												actionForm
														.attr("action",
																"/bulletin/bulletinGet");

												console.log($(this)
														.attr("href"))

											} else {
												// 뒤로가기 시 input[name='bno'] 의 값을 현재
												// 선택한 게시물의 번호로 바꿔줌
												actionForm
														.find(
																"input[name='bno']")
														.val(
																$(this).attr(
																		"href"));

											}

											console.log(actionForm.find(
													"input[name='bno']").val());

											actionForm.submit();

										});
						/* /.add event when click title */

						/* Add search event */
						var searchForm = $("#searchForm");

						$("#searchForm button")
								.on(
										"click",
										function(e) {

											e.preventDefault();

											// keyword check
											if (!searchForm.find(
													"input[name='keyword']")
													.val()) {
												// keyword 입력하지 않았을 경우
												alert("Please input keyword for search.");
												return false;

											}

											searchForm.find(
													"input[name='pageNum']")
													.val("1");

											searchForm.submit();

										});
						/* /.Add search event */
						
						
						/* 비밀글 접근 제한 */
						$("#privateContent").on("click", function(e) {
							
							e.preventDefault();
							
							if((userid != '' || userid != null) && userid == $(this).attr("name")) {
								// 로그인한 상태이면서 로그인 정보가 비밀글 작성자 정보와 일치할 경우
									
								// page info 같이 전달
								// 뒤로 가기시 파라미터 추가되는 현상 수정
								if (actionForm.find(
										"input[name='bno']").val() == null) {

									actionForm
											.append("<input type='hidden' name='bno' value='"
													+ $(this).attr(
															"href")
													+ "' />");
									actionForm
											.attr("action",
													"/bulletin/bulletinGet");

									console.log($(this)
											.attr("href"))

								} else {
									// 뒤로가기 시 input[name='bno'] 의 값을 현재
									// 선택한 게시물의 번호로 바꿔줌
									actionForm
											.find(
													"input[name='bno']")
											.val(
													$(this).attr(
															"href"));

								}

								console.log(actionForm.find(
										"input[name='bno']").val());

								actionForm.submit();
											
							} else {

								alert("Can read only writer and administrator!");
								
							}
							
						})
						
						/* 비밀글 접근 제한 */

					}); // end $(document).ready()
					

  // $(document) jquery 안에서는 session 도 local 도 값을 가져오질 못해서
  // 밖에다 선언
 
	// javascript 가 실행되면 session storage 에서 'num' 의 value 를 가져옴
	let session = sessionStorage.getItem('num') 
	let listBtn = document.getElementsByClassName("page-num")
  
	if(session == null) {
		// 페이지에 처음 들어와서 리스트의 페이지 버튼을 누른적이 없으면 session storage 에
		// 값이 없으므로 null 일 때는 1 번에 active 설정
	 
		listBtn[0].setAttribute("class", "active")
	 
 } else {
	 // 페이지 버튼을 눌러서 session 에 값이 저장되면 session 에 저장된 번호 (클릭된 번호)
	 // 의 페이지 버튼에 active 설정
	 
	 for(var i = 0; i < listBtn.length; i++) {
		 
		 if (listBtn[i].innerText == session) {
			 
			 listBtn[i].setAttribute("class", "active")
			 
		 }
		 
	 }
	 
 }
	
	
</script>


<%@ include file="../includes/footer.jsp"%>
