<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>

<style>

	li {
		
		list-style: none;
		
	}

</style>


<div class="">
	<h1 class="">Board</h1>
</div>

<div class="">
	<div class="">
		<c:if test="${board.purpose eq 'Q' }">
		Q&A Board
		</c:if>
		<c:if test="${board.purpose eq 'F' }">
		Free Board
		</c:if>		
	</div>
	<hr>
			
			<div class="getPageForm">
				<div class="input-group mb-3">
				  <span class="input-group-text boardBno col-2" id="basic-addon1">no.</span>
				  <input type="text" class="form-control boardTitle" name="bno" 
						value="<c:out value='${board.bno }' />" 
						readonly />
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text boardTitle col-2" id="basic-addon1">TITLE</span>
				  <input type="text" class="form-control boardTitle" name="title" value="<c:out value='${board.title }' />" 
						readonly />
				</div>
				<div class="input-group mb-3">
					  <span class="input-group-text boardTitle col-2" id="basic-addon1">WRITER</span>
					  <input type="text" class="form-control boardTitle boardWriter" name="writer" 
						value="<c:out value='${board.writer }' />" 
						readonly />
					</div>
				<div class="input-group">
				  <span class="input-group-text col-2">CONTENT</span>
				  <textarea class='form-control' name='content' id='exampleFormControlTextarea1' rows='2'><c:out value='${board.content }' /></textarea>
				</div>
				<hr>
				<div id="uploadResult">
					<ul>
						<!-- view upload files -->
					</ul>
				</div>
				
				<hr>
				
				<div>
				<!-- Button for locating to modify.jsp -->
				<c:if test='${userid eq board.writer }'>
					<button type="button" data-oper="update" class="btn btn-sm btn-outline-warning">MODIFY</button>
				</c:if>
				
				<!-- Button for going back to list.jsp -->
				<button type="button" data-oper="list" class="btn btn-sm btn-outline-warning">LIST</button>
				</div>
				
				<!-- Hidden information -->
				<form id="operForm" action="/bulletin/bulletinModify" method="get">
					<input type="hidden" id="bno" name="bno" 
						value="<c:out value='${board.bno }' />" />
					
					<!-- Information for paging processing -->
					<input type="hidden" name="pageNum" 
						value="<c:out value='${cri.pageNum }' />" />
					<input type="hidden" name="amount" 
						value="<c:out value='${cri.amount }' />" />
					<input type="hidden" name="pagePurpose" 
						value="<c:out value='${cri.pagePurpose }' />" />
						
					<!-- Reserve search information -->
					<input type="hidden" name="searchType" 
						value="<c:out value='${cri.searchType }' />" />
					<input type="hidden" name="keyword" 
						value="<c:out value='${cri.keyword }' />" />
															
				</form>
				<!-- /.Hidden information -->			
	</div>
</div>


<!-- recommendation button -->
<div class="recommendDiv">
	<button type="button" class="btn btn-sm btn-outline-primary recommendBtn good">GOOD</button>
	
	<span class="recommendCnt h1">
		<c:if test="${recommendSec.totalRec != null }">
			<c:out value="${recommendSec.totalRec }" />	
		</c:if>
		<c:if test="${recommendSec.totalRec == null }">	
			<c:out value="${recommend.totalRec }" />	
		</c:if>		
	</span>
	
	<button type="button" class="btn btn-sm btn-outline-danger recommendBtn bad">BAD</button>
</div>
<!-- /.recommendation button -->


<!-- Reply lists in board -->
<div class="">
	<div class="">
		<div class="">
		
		<div class="">
			<img src=''>REPLY			
		</div>
			<!-- Register reply form -->
			<div class="replyForm">
			<div class="input-group mb-3">
			<!-- 로그인한 사용자면 writer 에 id가 저장, 로그인하지 않을 경우 guest -->
				<c:choose>
					<c:when test="${userid == '' || userid == null}">
						<input type="text" class="form-control" name="replyer" placeholder="guest" aria-label="Replyer" value="<c:out value='guest' />" readonly />
					</c:when>
					<c:otherwise>
						<input type="text" class="form-control" name="replyer" placeholder='${userid }' aria-label="Replyer" value="<c:out value='${userid }' />" readonly />
					</c:otherwise>
				</c:choose> 				  
			</div>
			<div class="form-floating">
			  <textarea class='form-control' name='reply' id='exampleFormControlTextarea1' rows='2'></textarea>
			</div>
				<button id="registerReplyBtn" type="button" class="btn btn-sm btn-outline-primary">REGISTER</button>
				<hr>
			</div>
			<!-- /.Register reply form -->
		
		<!-- Reply lists -->
		<div class="chat">
			<ul>
			
			</ul>
		</div>
		<!-- /.Reply lists -->
				
		<!-- Page button for reply -->
		<div class="panel-footer">
		
		</div>
		<!-- /.Page button for reply -->
		
		<!-- Button for a reply -->
		<div class="chatBtn">
			
		</div>
		<!-- /.Button for a reply -->
		
					
		<!-- offcanvas for toReply -->
<div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel"
data-bs-scroll="true"
data-bs-backdrop="false"
style="height: 60vh;">
  <div class="offcanvas-header" style='padding: 5px;'>
    <div class="offcanvas-title col-11" id="offcanvasBottomLabel" ></div>
    <button type="button" class="btn-close btn-sm text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div> 
  <div class="offcanvas-middle" style='padding: 5px;'></div>
  <div class="offcanvas-body">
  	<ul class="lower-reply"></ul>
  </div> 
  <div class="offcanvas-footer" style='padding: 5px;'></div>
</div>
<!-- /.modal for popup image -->
		
		
		</div>
	</div>
</div>
<!-- /.Reply lists using offcanvas in board -->


<!-- modal for popup image -->
<div class="modal" id="exampleModal" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <a id="img-download"><h5 class="modal-title" id="exampleModalLabel" data-bs-toggle="tooltip" data-bs-placement="top" title="file download"></h5></a>
        <button type="button" class="btn-close btn-sm" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- /.modal for popup image -->


<!-- Add javascript tag and source for reply -->
<script type="text/javascript" src="/resources/js/app.js"></script>

<script type="text/javascript">

	/* function for reply */
	var replyUL = $(".chat");
	
	// 수정 버튼을 누른 댓글을 구별하기 위한 변수
	// 혹시 겹치지 않도록 -1 로 init
	var updateRno = -1;
	// console.log("updateRno 0: " + updateRno);
	
	// 로그인한 사용자의 id
	var userid = '${userId }'
	
	console.log(userid)
		
	$(document).ready(function() {
		
		var bnoValue = '<c:out value="${board.bno}" />';
		var uploadResult = $("#uploadResult ul");
		
		// upload file name, path (String)
		let nameArr = '${fvo.fileName}';
		let uuidArr = '${fvo.uuid}';		
		let checkArr = '${fvo.imageChecker}';
		
		// split method 로 문자열 내를 '/' 로 구분해서 잘라서 배열로 저장 (Array)
		nameArr = nameArr.split("/");			
		uuidArr = uuidArr.split("/");			
		checkArr = checkArr.split("/");		
		
		// console.log("bno " + bnoValue);
		
		showList(1);
		showUploadFile();
		
		/* Dynamic reply lists */
		function showList(page)	{
			
			replyService.getList(
				{
					bno: bnoValue,
					page: page || 1
					// page 가 있으면 page 값으로 없으면 1 로
				},
				function(replyCnt, list, checkValue) {
					// success 시 callback 함수에 replyCnt, list 받아옴
					// checkValue: qna 게시판에서 댓글이 채택됐는지 여부
					console.log("replyCnt: " + replyCnt);
					console.log("list: " + list);
					console.log("get.jsp checkValue: " + checkValue)
					
					// 페이지 번호가 -1 일 경우 마지막 페이지로 이동
					if(page == -1) {
						
						pageNum = Math.ceil(replyCnt/10.0);
						showList(pageNum);
						return;
						// 마지막 페이지로 이동하고 function 종료
						
					}
					
					var comments = "";
					
					if (list == null || list.length == 0) {
						// 게시물에 댓글 X -> html 코드 조립 필요 없음
						replyUL.html(comments);
						return;
						// exit function
					}

					// jquery 로 Model (spring 데이터 전달 객체) 값 여러 개 
					// 가져오기
					// <c:forEach items="달러기호{board}" var="board">		
					//		미리 선언한 리스트에 값 저장
					// </c:forEach>
									
					
					/* 댓글 리스트 (리스트 보기 + 수정) */					
					// 동적으로 댓글 리스트 생성
					for (let i = 0; i < list.length; i++) {
							// 수정하려는 댓글인지 아닌지 판단하기 위해서 각 i 번째의 rno 값을 부여
							comments += "<li class='replyLiTag' data-rno='" + list[i].rno + "' name='" + i + "'>";
							
							if(list[i].adoption != "null") {
								// if adopted reply (채택된 댓글일 경우)
								
								// apply border effect				
								comments += "<div class='replyDiv border border-warning border-5'>";
								
							} else {
								// 채택된 댓글이 아닐경우								
								comments += "<div class='replyDiv'>";
								
							}
							
							comments += "<div class=''>";
							comments += "<strong class='replyReplyerInfo'>" + list[i].replyer + "  </strong>";
							comments += "<small class=''>";
							comments += replyService.displayTime(list[i].replyRegDate);
							comments += "</small></div>";
							
							// 수정하려고 update 버튼을 누른 댓글이 아닌 일반 댓글
							if(list[i].rno != updateRno) {
								
								comments += "<p class=''>" + list[i].reply + "</p></div>";

								if(list[i].replyer == userid) {
									
									comments += "<div class='btnDiv'>"
									comments += "<button id='updateReplyFormBtn' type='button' class='btn btn-sm btn-outline-primary' name='" + list[i].rno + "'>UPDATE</button>"
									comments += "<button id='deleteReplyBtn' type='button' class='btn btn-sm btn-outline-primary'>REMOVE</button>"
									
								}
																
								// 로그인된 상태고 자신의 댓글이 아닐 경우
								if((userid != '' || userid != null) && list[i].replyer != userid) {
							
									// qna 게시판이면서 채택된 댓글이 아닐 경우
									if ('${board.purpose}' == "Q" && checkValue != 1) {
										
										comments += "<div>";
										// 채택버튼 보이기
										comments += "<button id='selectReplyBtn' class='btn btn-sm btn-outline-primary' name='" + list[i].rno + "'>SELECT</button>"
										// comments += "<button id='cancelSelectBtn' class=''>CANCEL</button></li>"
										
									}
									
									comments += "<button type='button' class='btn btn-sm btn-outline-primary toReplyRegBtn offCanvasShow' name='" + list[i].rno + "' data-bs-toggle='offcanvas' data-bs-target='#offcanvasBottom' aria-controls='offcanvasBottom'>REPLY</button>"
									comments += "</div>"
									
								}
									
							} else {
								// 수정하기위해서 update 버튼을 누른 경우
								
								comments += "<div class='form-floating'>"
								comments += "<textarea class='form-control' name='reply' id='exampleFormControlTextarea1' rows='2'>";
								  
								comments += list[i].reply + "</textarea>"
								comments += "</div>";
								comments += "<div class='btnDiv'>"
								comments += "<button id='updateReplyBtn' type='button' class='btn btn-sm btn-outline-primary' value='" + list[i].rno + "'>UPDATE</button>"
								comments += "<button id='cancelBtn' type='button' class='btn btn-sm btn-outline-primary'>CANCEL</button>";
								
								// updateRno 초기화
								updateRno = -1;
								
							}											

							comments += "</div>"
							
							if(list[i].gorder == 0) {
								// 대댓글이 없을 경우
																						
								comments += "</li>";
								
							} else {
								// 대댓글이 존재
															
								//comments += "<a href='#' class='offCanvasShow' data-bs-toggle='offcanvas' data-bs-target='#offcanvasBottom' aria-controls='offcanvasBottom'>" + list[i].gorder + "개의 댓글</a>";
								comments += "<div class='accordion accordion-flush' id='accordionFlushExample'>";
								comments += 	"<div class='accordion-item'>";									
								comments += 		"<h2 class='accordion-header' id='flush-heading" + i +"'>";
								comments += 			"<button class='accordion-button collapsed accordionShow' type='button' data-bs-toggle='collapse' data-bs-target='#flush-collapse" + i + "' aria-expanded='false' aria-controls='flush-collapse" + i + "' style='padding: 5px;'>";
								comments += 					list[i].gorder + "개의 댓글";
								comments += 			"</button>";
								comments += 		"</h2>";
								comments += 		"<div id='flush-collapse" + i + "' class='accordion-collapse collapse' aria-labelledby='flush-heading" + i + "' data-bs-parent='#accordionFlushExample'>";
								comments += 			"<div class='accordion-body'></div>";
								comments += 		"</div>";
								comments += 	"</div>";
								comments += "</div>";
								comments += "</li>";
								
							}
							comments += "<hr>";
							
							// console.log("updateRno 1: " + updateRno);
					}
					
					replyUL.html(comments);
					showReplyPage(replyCnt);
					
				} // end function(replyCnt, list {})
					/* /.댓글 리스트 (리스트 보기 + 수정) */
				
			) // end getlist({})
			
		} // end function showList() {}
		
		/* /.Dynamic reply lists */
		
	

	/* /.function for reply */


	/* Add page button for reply */
	var replyPageFooter = $(".panel-footer");
	var pageNum = 1;
	
	function showReplyPage(replyCnt) {
		
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		
		// 앞 페이지가 있으면
		let prev = startNum != 1; // 1 이 아니면 true
		
		// 댓글은 처음 작성한 댓글부터 보이므로 (마지막 페이지)
		// next 의 default 는 false 로
		let next = false;
		
		// 마지막 페이지 포함 댓글 개수가 실제 댓글 개수보다
		// 많을 경우
		if (endNum * 10 >= replyCnt) {
			
			endNum = Math.ceil(replyCnt / 10.0);
			
		}
		
		// endNum 이 댓글 개수보다 적으면 다음 페이지 존재
		if (endNum * 10 < replyCnt) {
			
			next = true;
			
		} 
		
		// 댓글 페이지 html 코드 조립
		let pageHtml = "<ul class='pagination pull-right'>";
		//이전 페이지가 존재하면 prev 버튼 활성화
		if(prev){
			pageHtml += "<li class='page-item'>";
			pageHtml += "<a class='page-link' href='" + (startNum - 1) + "'>";
			pageHtml += "Prev</a></li>";
			
		}
		// 페이지 숫자 버튼 만들기
		for(let i = startNum; i<=endNum ; i++){
			//active : 현재 페이지 번호 표시
			
			let active = pageNum == i  ? "active" : "";
			pageHtml += "<li class='page-item " + active + "'><a class='page-link' href='"+i+"'>"+i+ "</a></li>" ;

		}
		
		
		//다음 페이지가 존재하면 (10개 단위) next 버튼 활성화
		if(next){
			pageHtml += "<li class='page-item'>";
			pageHtml += "<a class='page-link' href='" + (endNum + 1) + "'>";
			pageHtml += "Next</a></li>";
		}
		
		pageHtml += "</ul>";
		
		// html 코드 삽입
		replyPageFooter.html(pageHtml);		
		
	}; // end showReplyPage(replyCnt)

	/* /.Add page button for reply */


	// replyForm div 가져오기
	var replyForm = $(".replyForm");
	
	// name 속성이 reply 인 input
	var formInputReply = replyForm.find("textarea[name='reply']");
	var formInputReplyer = replyForm.find("input[name='replyer']");
	
	
	// register reply
	$("#registerReplyBtn").on("click", function(e) {
		// 게시글 번호 bno 가져와서 reply 객체 생성후 
		// 댓글 달기 기능 실행
		
		// 전달할 data
		var reply = {
				reply: formInputReply.val(),
				replyer: formInputReplyer.val(),
				bno: bnoValue
		};
		
		console.log(reply);
		
		// app.js 에 선언된 add (register) method 실행
		replyService.add(reply, function(result) {
			
			alert(result);
			//replyForm.find("input").val("");
			
			// textarea 태그 초기화
			replyForm.find("textarea[name='reply']").val("");
			
			showList(-1);
			
		});
		
	}); // end register reply
	
	
	/* update reply */
		
	// update 버튼 누르면 updateForm 나타내기
	// event delegation
	replyUL.on("click", "#updateReplyFormBtn", function(e) {
		// 나중에 동적으로 생기는 #updateReplyFormBtn tag 에 
		// 이벤트 대상 변경
		
		updateRno = $(this).attr("name");
		
		console.log("updateRno 2: " + updateRno);
		
		showList(pageNum);
		
	});
	
	
		replyUL.on("click", "#updateReplyBtn", function(e) {
		// 댓글 수정
		
		console.log("button clicked")
		
		// let originalReplyer = formInputReplyer.val();
		
		var reply = {
				rno: $(this).parents(".replyLiTag").data("rno"),
				reply: $(this).parents(".replyLiTag").find("textarea").val(),
				replyer: $(this).parents(".replyLiTag").find("strong").text()
		}

		//if (replyer != originalReplyer) {
			
		//	alert("Couldn't update a reply.");
		//	return;
			
		//}
		
		replyService.update(reply, function(result) {
			
			alert(result);
			
			showList(pageNum);
			replyForm.find("input").val("");
			
		});
		
		
	});
			
	/* /.update a reply */
	
	
	/* cancelation to update a reply */
	replyUL.on("click", "#cancelBtn", function(e) {
		
		showList(pageNum);
		
	});
	
	/* /.cancelation to update a reply */
	
		
	/* Delete a reply */
	replyUL.on("click", "#deleteReplyBtn", function(e) {
		
		// let originalReplyer = formInputReplyer.val();
		
		let originalReplyer = $(this).parents(".replyLiTag")
			.find("strong").text();
		
		console.log("delete replyer: " + originalReplyer)
		
		let rno = $(this).parents(".replyLiTag").data("rno");
		
		console.log("delete rno: " + rno);
		
		//if(replyer != originalReplyer) {
			
		//	alert("Couldn't delete a reply.")
		//	return;
			
		//}
				
		
		if(confirm("Do you really want to delete a reply?")) {
			
			// alert(rno + "/" + originalReplyer);
			
			replyService.remove(rno, originalReplyer, function(result) {
			
			alert(result);
			
			showList(pageNum);
			
			})	
			
		}

	
	});
	
	/* /.Delete a reply */
	
	
	/* event delegation */
	// 동적으로 생성된 태그에는 직접 이벤트를 달아줄 수 없음
	// 상위나 형제 tag 에 달아주고 나중에 이벤트 대상을 변경
	
	replyPageFooter.on("click", "li a", function(e)	{
		// remove a tag event
		e.preventDefault();
		
		let target = e.target.innerText;
		console.log("target")
		console.log(target)
		pageNum = target;
		showList(pageNum);
		
	});
	
	/* /.event delegation */
	
	
	/* Select reply as a answer of question */
	replyUL.on("click", "#selectReplyBtn", function() {
					
		// console.log("is entered?");
		
		var reply = {
				rno: $(this).parents(".replyLiTag").data("rno"),
				reply: $(this).parents(".replyLiTag").find("p").text(),
				replyer: $(this).parents(".replyLiTag").find("strong").text(),
				adoption: "adopted"
		}
		
		// console.log("reply1: " + reply)
		
		replyService.update(reply, function(result) {
			
			alert(result);			
			showList(pageNum);
			
		});
		
	});
	
	/* /.Select reply as a answer of question */
	
	
	
	/* show files attaced */	
	function showUploadFile() {			
		
		let uploadHtml = "";		
		
		if (nameArr == '') {
						
		} else {			
			// 업로드 파일 한개 당 li tag 한 개
			for(let i = 0; i < nameArr.length; i++) {
											
				if(checkArr[i] == "false") {
					// 이미지 파일이 아님
					// li tag 앞에 파일 아이콘
					let fileCallPath = encodeURIComponent("/" + uuidArr[i]
							+ "_" + nameArr[i]);
					
					uploadHtml += "<li class='uploadLi'>"
						+ "<img src='/resources/img/file_icon.png' width='20px'>"
						+ "<a href='#' class='fileDownload' name='" + i + "'>"
						+ nameArr[i] + "</a>"
						
						//+ "<button type='button' class='btn btn-primary modal-trigger' data-bs-toggle='modal' data-bs-target='#exampleModal'>"
  						//+ nameArr[i]
						//+ "</button>"
						
						+ "<span data-file=\'" + fileCallPath + "\' data-type='file'></span>"
						+ "</li>";				
					
				} else {
					// 이미지 파일
					// thumbnail 이미지 사용
					let fileCallPath = encodeURIComponent("/s_" + uuidArr[i]
							+ "_" + nameArr[i]);
					
					let originPath = uuidArr[i] + "_" + nameArr[i];
					
					originPath = originPath.replace(new RegExp(/\\/g), "/");
					
					uploadHtml += "<li class='uploadLi'>"
						//+ "<a href=\"javascript:showImage(\'" + originPath + "\')\">"
						//+ "<img src='/display?fileName=" + fileCallPath + "' data-bs-toggle='modal' data-bs-target='#exampleModal'></a>"
						+ "<img src='/display?fileName=" + fileCallPath + "' name='" + i + "' class='img-modal' data-bs-toggle='modal' data-bs-target='#exampleModal'>"
						+ "<br>"
						//+"<a href='/download?fileName=" + originPath + "'>"
						+ nameArr[i]						
						+ "<span data-file=\'" + fileCallPath + "\' data-type='image'>"
						+ "</span></li>";
					
				}
												
			}
			
		}
		
		uploadResult.append(uploadHtml);
		
	} // end function showUploadFile()
	
	/* /.show files attaced */
	
	
	/* recommendation button */
	$(".recommendBtn").on("click", function() {
			
			let lvo;
			
			if($(this).hasClass("good") == true) {
				
				console.log(userid)
				
				lvo = {
					bno: '${board.bno }',
					userid: userid,
					isLike: 'true'
						
				}
				
			}
			
			if($(this).hasClass("bad") == true) {

				console.log(userid)
				
				lvo = {
					
						bno: '${board.bno }',
						userid: userid,
						isLike: 'false'
						
				}				
				
			}
			
			var element = document.getElementsByClassName('recommendCnt');
			
			$.ajax({
				url: '/bulletin/bulletinRecommend',
				type: 'GET',
				data : lvo,
				dataType : 'text',
				success : function(result){
					
					alert(result);
					location.replace(location.href);
					
				}			
			
			});
			
		
	});
	/* /.recommendation button */
	
	
	// image 파일을 클릭시 모달 내부에 해당 파일의 정보 넣어주기
			$("#uploadResult").on("click", ".img-modal", function() {
				
				// 클릭한 파일의 uuid 값 + filename
				let iname = $(this).attr("name");
				let filePath = encodeURI(uuidArr[iname] + "_" + nameArr[iname]);
				
				//let body = document.getElementsByClassName('origin-img');
				document.querySelector("#exampleModalLabel").innerText = nameArr[iname];
				
				// 로그인한 유저면 다운로드 기능을 제공하고 아니면 경고창 띄우기
				if(userid != '' || userid != null) {
					
					$("#img-download").attr("href", "/download?fileName=" + filePath);
									
				} else {
					
					$("#img-download").attr("onclick", "loginChecker();");
					
				}
				
				let body = document.querySelector('.modal-body')
				body.innerHTML = "<img src='/display?fileName=" + filePath + "' class='container'>";
				
			});
			
			
			// 이미지 파일 외 파일명 클릭시 다운로드
			$("#uploadResult").on("click", ".fileDownload", function() {
				
				// 클릭한 파일의 uuid 값 + filename
				let iname = $(this).attr("name");
				let filePath = encodeURI(uuidArr[iname] + "_" + nameArr[iname]);
				
				// 로그인한 유저면 다운로드 기능을 제공하고 아니면 경고창 띄우기
				if(userid != '' || userid != null) {
					
					$(".fileDownload").attr("href", "/download?fileName=" + filePath);
									
				} else {
					
					$(".fileDownload").attr("onclick", "loginChecker();");
					
				}
				
			});
			
			
			/* reply to reply */
			replyUL.on("click", ".offCanvasShow", function(e) {
			
				e.preventDefault();
				var forms = "";
				
				// 대댓글 달기 폼
				forms += "<div class='toReplyForm'>";
				forms += 	"<div class='input-group-sm mb-3'>";

				//로그인한 사용자면 writer 에 id가 저장, 로그인하지 않을 경우 guest
				if('${userid == "" || userid == null}') {
					forms +=    "<input type='hidden' name='gno' value=" + $(this).parents(".replyLiTag").data("rno") + " />";
					forms += 		"<input type='text' class='form-control' name='replyer' placeholder='guest' aria-label='Replyer' value='guest' readonly />";
										
				} else {
					
					forms += 		"<input type='text' class='form-control' name='replyer' placeholder='guest' aria-label='Replyer' value=" + userid + " readonly />";
					
				}
				
				forms += 		"</div>";
				forms += 		"<div class='mb-3'>";
				forms += 			"<textarea class='form-control' name='reply' id='exampleFormControlTextarea1' rows='2'></textarea>";
				forms += 		"</div>";
				forms += 		"<button type='button' class='btn btn-sm btn-outline-primary toReplyBtn'>REGISTER</button>";
				forms += 		"<hr>";
				forms += 	"</div>";
				forms += "</div>";
				//comments += "</form>";
				
				// button 을 누른 댓글의 다음에 복사한 폼을 붙여넣기함
				$(".offcanvas-middle").html(forms);
								
				var clickedReply = "";
				var rno = $(this).parents(".replyLiTag").data("rno");
				console.log(rno)
				/* 클릭한 댓글 보여주기 */
				replyService.get(rno, function(result) {
					
					clickedReply += "<li class='replyLiTag' data-rno='" + result.rno + "'>"
					
					if(result.adoption != "null") {
						
						clickedReply += "<div class='replyDiv border border-warning border-5'>";
						
					} else {
						
						clickedReply += "<div class='replyDiv'>";
												
					}
					clickedReply += "<div class=''>";
					clickedReply += "<strong class='replyReplyerInfo'>" + result.replyer + "  </strong>";
					clickedReply += "<small class=''>";
					clickedReply += replyService.displayTime(result.replyRegDate);
					clickedReply += "</small></div>";
					
					if(result.rno != updateRno) {
						
						clickedReply += "<p class=''>" + result.reply + "</p></div>";

						if(result.replyer == userid) {
							
							clickedReply += "<div class='btnDiv'>";
							//clickedReply += "<button id='updateReplyFormBtn' type='button' class='btn btn-sm btn-outline-primary' name='" + result.rno + "'>UPDATE</button>";
							//clickedReply += "<button id='deleteReplyBtn' type='button' class='btn btn-sm btn-outline-primary'>REMOVE</button>";
							
						}
						
						if((userid != '' || userid != null) && result.replyer != userid) {
							
							if ('${board.purpose}' == "Q" && result.adoption != "null") {
								
								clickedReply += "<div class='btnDiv'>";
								//clickedReply += "<button id='selectReplyBtn' class='btn btn-sm btn-outline-primary' name='" + result.rno + "'>SELECT</button>"
								
							}
							
							//clickedReply += "<button class='btn btn-sm btn-outline-primary toReplyRegBtn offCanvasShow' name='" + result.rno + "'>REPLY</button>"
							clickedReply += "</div>"
							
						}
							
					} else {
						
						clickedReply += "<div class='form-floating'>"
						clickedReply += "<textarea class='form-control' name='reply' id='exampleFormControlTextarea1' rows='2'>";
						  
						clickedReply += result.reply + "</textarea>"
						clickedReply += "</div>";
						clickedReply += "<div class='btnDiv'>"
						//clickedReply += "<button id='updateReplyBtn' type='button' class='btn btn-sm btn-outline-primary' value='" + result.rno + "'>UPDATE</button>"
						//clickedReply += "<button id='cancelBtn' type='button' class='btn btn-sm btn-outline-primary'>CANCEL</button>";
						
						// updateRno 초기화
						updateRno = -1;
						
					}											

					clickedReply += "</div>"
					
					if(result.gorder == 0) {
						// 대댓글이 없을 경우
																				
						clickedReply += "</li>";
						
					} else {
						// 대댓글이 존재
													
						//clickedReply += "<a href='#' class='accordionShow' data-bs-toggle='offcanvas' data-bs-target='#offcanvasBottom' aria-controls='offcanvasBottom'>" + result.gorder + "개의 댓글</a>";
						clickedReply += "</li>";
						
					}
					clickedReply += "<hr>";
					
					// console.log("updateRno 1: " + updateRno);
				
					$(".offcanvas-title").html(clickedReply);
			});
				
			
				/* show under reply */				
				// 하위 댓글 보기 클릭하면 클릭한 댓글의 rno 값을 보내줌
				replyService.getToReply(rno, function(list) {
							
							console.log("=================================");
							console.log("===========toReplyList===========")
							console.log(list)
							console.log("=================================")
							
							var comments = "";
							
							for (let i = 0; i < list.length; i++) {
								// 수정하려는 댓글인지 아닌지 판단하기 위해서 각 i 번째의 rno 값을 부여
								comments += "<li class='replyLiTag' data-rno='" + list[i].rno + "'>";
								
								if(list[i].adoption != "null") {
									// if adopted reply (채택된 댓글일 경우)
									
									// apply border effect				
									comments += "<div class='replyDiv border border-warning border-5'>";
									
								} else {
									// 채택된 댓글이 아닐경우								
									comments += "<div class='replyDiv'>";
									
								}
								
								comments += "<div class=''>";
								comments += "<strong class='replyReplyerInfo'>" + list[i].replyer + "  </strong>";
								comments += "<small class=''>";
								comments += replyService.displayTime(list[i].replyRegDate);
								comments += "</small></div>";
								
								// 수정하려고 update 버튼을 누른 댓글이 아닌 일반 댓글
								if(list[i].rno != updateRno) {
									
									comments += "<p class=''>" + list[i].reply + "</p></div>";

									if(list[i].replyer == userid) {
										
										comments += "<div class='btnDiv'>";
										comments += "<button id='updateReplyFormBtn' type='button' class='btn btn-sm btn-outline-primary' name='" + list[i].rno + "'>UPDATE</button>";
										comments += "<button id='deleteReplyBtn' type='button' class='btn btn-sm btn-outline-primary'>REMOVE</button>";
										
									}
																	
									// 로그인된 상태고 자신의 댓글이 아닐 경우
									if((userid != '' || userid != null) && list[i].replyer != userid) {
								
										// qna 게시판이면서 채택된 댓글이 아닐 경우
										if ('${board.purpose}' == "Q" && list[i].adoption != "null") {
											
											comments += "<div class='btnDiv'>";
											// 채택버튼 보이기
											comments += "<button id='selectReplyBtn' class='btn btn-sm btn-outline-primary' name='" + list[i].rno + "'>SELECT</button>"
											// comments += "<button id='cancelSelectBtn' class=''>CANCEL</button></li>"
											
										}
										
										//comments += "<button class='btn btn-outline-primary toReplyRegBtn offCanvasShow' name='" + list[i].rno + "'>REPLY</button>"
										comments += "</div>"
										
									}
										
								} else {
									// 수정하기위해서 update 버튼을 누른 경우
									
									comments += "<div class='form-floating'>"
									comments += "<textarea class='form-control' name='reply' id='exampleFormControlTextarea1' rows='2'>";
									  
									comments += list[i].reply + "</textarea>"
									comments += "</div>";
									comments += "<div class='btnDiv'>"
									comments += "<button id='updateReplyBtn' type='button' class='btn btn-sm btn-outline-primary' value='" + list[i].rno + "'>UPDATE</button>"
									comments += "<button id='cancelBtn' type='button' class='btn btn-sm btn-outline-primary'>CANCEL</button>";
									
									// updateRno 초기화
									updateRno = -1;
									
								}											

								comments += "</div>"
								
								if(list[i].gorder == 0) {
									// 대댓글이 없을 경우
																							
									comments += "</li>";
									
								} else {
									// 대댓글이 존재
																
									//comments += "<a href='#' class='accordionShow'>" + list[i].gorder + "개의 댓글</a>";								
									comments += "</li>";
									
								}
								comments += "<hr>";
								
								// console.log("updateRno 1: " + updateRno);
						}
						
						$(".lower-reply").html(comments);		
					
				}); // end getToReply(function () {});
				/* /.show under reply */
								
				
			}) // end on("click", "#replyToReplyBtn")
			/* /.reply to reply */
			
			
			/* 대댓글의 reply button 기능 */	
						
			var canvasMiddle = $(".offcanvas-middle") 
			canvasMiddle.on("click", ".toReplyBtn", function(e) {
			
				var toReplyForm = $(".toReplyForm");
				
				var formInputToReply = toReplyForm.find("textarea[name='reply']");
				var formInputToReplyer = toReplyForm.find("input[name='replyer']");
				var formInputGno = toReplyForm.find("input[name='gno']");
				
				e.preventDefault();			
				
				console.log(formInputToReply.val())
				console.log(formInputToReplyer.val())
				console.log(formInputGno.val())
				
				// 전달할 data
				var reply = {
						reply: formInputToReply.val(),
						replyer: formInputToReplyer.val(),
						bno: bnoValue,
						rno: formInputGno.val()
				};
				
				console.log("get: ");
				console.log(reply)
				
				// app.js 에 선언된 add (register) method 실행
				replyService.addToReply(reply, function(result) {
					
					alert(result);
					//replyForm.find("input").val("");
					
					// textarea 태그 초기화
					toReplyForm.find("textarea[name='reply']").val("");			
					
				});
				
			}); 
	// end register reply
			/* /.대댓글의 reply button 기능 */
			
			
			/* 대댓글 보기 using accordion */
			replyUL.on("click", ".accordionShow", function () {
			  
				// 클릭한 요소의 부모 tag 중 class="replyLiTag" 인 요소의 data-rno 값을 저장
			  var rno = $(this).parents(".replyLiTag").data("rno");
				
				// 클릭한 요소에서 data-bs-target 이라는 속성을 가져옴
				// 문자열의 index 1 부터 끝까지 반환해서 저장 
			  var divId = $(this).attr("data-bs-target").substring(1);
			  
			  replyService.getToReply(rno, function(list) {
			    
			    console.log("=================================");
			    console.log("===========toReplyList===========")
			    console.log(list)
			    console.log("=================================")
			    
			    var comments = "";
			    
			    for (let i = 0; i < list.length; i++) {
			      // 수정하려는 댓글인지 아닌지 판단하기 위해서 각 i 번째의 rno 값을 부여
			      comments += "<li class='replyLiTag' data-rno='" + list[i].rno + "'>";
			      
			      if(list[i].adoption != "null") {
			        // if adopted reply (채택된 댓글일 경우)
			        
			        // apply border effect				
			        comments += "<div class='replyDiv border border-warning border-5'>";
			        
			      } else {
			        // 채택된 댓글이 아닐경우								
			        comments += "<div class='replyDiv'>";
			        
			      }
			      
			      comments += "<div class=''>";
			      comments += "<strong class='replyReplyerInfo'>" + list[i].replyer + "  </strong>";
			      comments += "<small class=''>";
			      comments += replyService.displayTime(list[i].replyRegDate);
			      comments += "</small></div>";
			      
			      // 수정하려고 update 버튼을 누른 댓글이 아닌 일반 댓글
			      if(list[i].rno != updateRno) {
			        
			        comments += "<p class=''>" + list[i].reply + "</p></div>";

			        if(list[i].replyer == userid) {
			          
			          comments += "<div class='btnDiv'>";
			          comments += "<button id='updateReplyFormBtn' type='button' class='btn btn-sm btn-outline-primary' name='" + list[i].rno + "'>UPDATE</button>";
			          comments += "<button id='deleteReplyBtn' type='button' class='btn btn-sm btn-outline-primary'>REMOVE</button>";
			          
			        }
			                        
			        // 로그인된 상태고 자신의 댓글이 아닐 경우
			        if((userid != '' || userid != null) && list[i].replyer != userid) {
			      
			          // qna 게시판이면서 채택된 댓글이 아닐 경우
			          if ('${board.purpose}' == "Q" && list[i].adoption != "null") {
			            
			            comments += "<div class='btnDiv'>";
			            // 채택버튼 보이기
			            comments += "<button id='selectReplyBtn' class='btn btn-sm btn-outline-primary' name='" + list[i].rno + "'>SELECT</button>"
			            // comments += "<button id='cancelSelectBtn' class=''>CANCEL</button></li>"
			            
			          }
			          
			          //comments += "<button class='btn btn-outline-primary toReplyRegBtn offCanvasShow' name='" + list[i].rno + "'>REPLY</button>"
			          comments += "</div>"
			          
			        }
			          
			      } else {
			        // 수정하기위해서 update 버튼을 누른 경우
			        
			        comments += "<div class='form-floating'>"
			        comments += "<textarea class='form-control' name='reply' id='exampleFormControlTextarea1' rows='2'>";
			          
			        comments += list[i].reply + "</textarea>"
			        comments += "</div>";
			        comments += "<div class='btnDiv'>"
			        comments += "<button id='updateReplyBtn' type='button' class='btn btn-sm btn-outline-primary' value='" + list[i].rno + "'>UPDATE</button>"
			        comments += "<button id='cancelBtn' type='button' class='btn btn-sm btn-outline-primary'>CANCEL</button>";
			        
			        // updateRno 초기화
			        updateRno = -1;
			        
			      }											

			      comments += "</div>"
			      
			      if(list[i].gorder == 0) {
			        // 대댓글이 없을 경우
			                                    
			        comments += "</li>";
			        
			      } else {
			        // 대댓글이 존재
			                      
			        //comments += "<a href='#' class='accordionShow'>" + list[i].gorder + "개의 댓글</a>";								
			        comments += "</li>";
			        
			      }
			      comments += "<hr>";
			      
			      // console.log("updateRno 1: " + updateRno);
			  }
			  
			    // id 가 divId 인 div의 자손인 div 의 html 에 comments 삽입
			    $("div[id='" + divId + "'] > div").html(comments);

			}); // end getToReply(function () {});
			  
			}) // end replyUL.on("click", ".accordionShow", function () {})
			/* /.대댓글 보기 using accordion */	

			
			
	}) // end ready(function())
	
	
	// 비 로그인 상태로 다운로드 클릭시 로그인 화면으로 이동할지 여부
	function loginChecker() {
		
		if(confirm("You need to login!! Would you want to move at login page?")) {
			
			location.href = "/bulletin/login";
			
		} 		
		
	}	

	
</script>

<script type="text/javascript">
	$(document).ready(function() {
		
		var operForm = $("#operForm");
		
		$("button[data-oper='update']").on("click", function() {
			operForm.submit();
		});
		
		$("button[data-oper='list']").on("click", function() {
			
			operForm.find("#bno").remove();
			operForm.attr("action", "/bulletin/bulletinList");
			operForm.submit();
						
		});
		
	}); // end $(document).ready

</script>

<!-- /.Add javascript tag and source for reply -->

<%@ include file="../includes/footer.jsp" %>
