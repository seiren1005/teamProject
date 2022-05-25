<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>


<div class="">
	<div class="">
		<h1 class="">Board</h1>
	</div>
</div>

<div class="">
	<div class="">
		<div class="">
			<div class="">Board2</div>
			
			<div class="">
				<div class="">
					<label>Bno.	</label>
					<input class="" name="bno" 
						value="<c:out value='${board.bno }' />" 
						readonly />
				</div>
				<div class="">
					<label>TITLE</label>
					<input class="" name="title" 
						value="<c:out value='${board.title }' />" 
						readonly />
				</div>
				<div class="">
					<label>CONTENT</label>
					<textarea class="" name="content"
						rows="3" readonly >
						<c:out value='${board.bno }' />
					</textarea>
				</div>
				<div class="">
					<label>WRITER</label>
					<input class="" name="writer" 
						value="<c:out value='${board.writer }' />" 
						readonly />
				</div>
				
				<!-- Button for locating to modify.jsp -->
				<button data-oper="update" class="">MODIFY</button>
				
				<!-- Button for going back to list.jsp -->
				<button data-oper="list" class="">LIST</button>
				
				<!-- Hidden information -->
				<form id="operForm" action="/bulletin/bulletinModify" method="get">
					<input type="hidden" id="bno" name="bno" 
						value="<c:out value='${board.bno }' />" />
					
					<!-- Information for paging processing -->
					<input type="hidden" name="pageNum" 
						value="<c:out value='${cri.pageNum }' />" />
					<input type="hidden" name="amount" 
						value="<c:out value='${cri.amount }' />" />
					<input type="hidden" name="purpose" 
						value="<c:out value='${cri.purpose }' />" />
						
					<!-- Ramain search information -->
					<input type="hidden" name="searchType" 
						value="<c:out value='${cri.searchType }' />" />
					<input type="hidden" name="keyword" 
						value="<c:out value='${cri.keyword }' />" />
		
					<input type="hidden" name="boardPurpose" 
						value="<c:out value='${board.purpose }' />" />	
					
				</form>
				<!-- /.Hidden information -->					
				
			</div>
		</div>
	</div>
</div>

<!-- Reply lists in board -->
<div class="">
	<div class="">
		<div class="">
		
		<div class="">
			<!-- icon tag -->
			<i class=""></i>REPLY			
		</div>
			<!-- Register reply form -->
			<div class="replyForm">
				<i class=""></i>
				<input class="reply_replyer" name="replyer"
					placeholder="replyer" /> <br>
				<textarea class="" rows="3" name="reply" 
					placeholder="New reply!" ></textarea>		
				<button id="registerReplyBtn" type="button" class="">REGISTER</button>
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
		
		</div>
	</div>
</div>
<!-- /.Reply lists in board -->


<!-- Add javascript tag and source for reply -->
<script type="text/javascript" src="/resources/js/app.js"></script>

<script type="text/javascript">
	
	/* function for reply */
	var replyUL = $(".chat");
	var updateRno = -1;
	// console.log("updateRno 0: " + updateRno);
	
	
	$(document).ready(function() {
		
		var bnoValue = '<c:out value="${board.bno}" />';
		
		// console.log("bno " + bnoValue);
		
		showList(1);
		
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
					
					// exist reply
					for (let i = 0; i < list.length; i++) {
						
						comments += "<li class='replyLiTag' data-rno='" + list[i].rno + "'>";
						
						console.log("i: " + list[i].adotion);
						
						if(list[i].adoption != null) {
					
							comments += "<div class='replyDiv adopted'>";
							
						} else {
							
							comments += "<div class='replyDiv'>";
							
						}
						
						comments += "<div class=''>";
						comments += list[i].rno;
						comments += ". <strong class='replyReplyerInfo'>" + list[i].replyer + "</strong>";
						comments += "<small class=''>";
						comments += replyService.displayTime(list[i].replyRegDate);
						comments += "</small></div>";
						
						if(list[i].rno != updateRno) {
							
							comments += "<p class=''>" + list[i].reply + "</p></div>";
							comments += "<div class='btnDiv'>"
							comments += "<button id='updateReplyFormBtn' type='button' class='" + i + "'>UPDATE</button>"
							comments += "<button id='deleteReplyBtn' type='button' class=''>REMOVE</button>"
							
							
							
							if($("input[name='boardPurpose']").val() == "Q") {
								
								if (checkValue != 1) {
									
									comments += "<button id='selectReplyBtn' class='" + list[i].rno + "'>SELECT</button></li>"
									// comments += "<button id='cancelSelectBtn' class=''>CANCEL</button></li>"
									
								}
								
							}
							
								
						} else {
							
							comments += "<textarea class='' rows='3' name='reply' placeholder='New reply!'>";
							comments += list[i].reply + "</textarea></div>";
							comments += "<div class='btnDiv'>"
							comments += "<button id='updateReplyBtn' type='button' class='" + list[i].rno + "'>UPDATE</button>"
							comments += "<button id='cancelBtn' type='button' class=''>CANCEL</button>";
							updateRno = -1;
							
						}											

						comments += "</div></li>";
						comments += "<hr>";
						
						// console.log("updateRno 1: " + updateRno);
													
					}
					
					/* /.댓글 리스트 (리스트 보기 + 수정) */
					
					replyUL.html(comments);
					showReplyPage(replyCnt);
					
				} // end function(replyCnt, list)
				
			) // end replyService.getReplyList()
			
		} // end function showList()
		
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
		let pageHtml = "<ul class=''>";
		
		// prev 보이기 여부
		if (prev) {
			
			pageHtml += "<li class=''>";
			pageHtml += "<a class='' href='" + (startNum - 1) + "'>";
			pageHtml += "PREV</a></li>";
			
		}
		
		// 페이지 넘버 버튼
		for(let i = startNum; i <= endNum; i++) {
			// active: 현재 클릭한 페이지 번호
			let active = pageNum == i ? "active" : "";
			pageHtml += "<li class='" + active + "'>";
			pageHtml += "<a class='' href='" + i + "'>";
			pageHtml += i + "</a></li>";			
			
		}
		
		// NEXT 버튼 활성화
		if(next) {
			
			pageHtml += "<li class=''>";
			pageHtml += "<a class='' href='" + (endNum + 1) + "'>";
			pageHtml += "NEXT</a></li>";
			
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
		
		var reply = {
				reply: formInputReply.val(),
				replyer: formInputReplyer.val(),
				bno: bnoValue
		};
		
		console.log("get: " + reply);
		
		replyService.add(reply, function(result) {
			
			alert(result);
			replyForm.find("input").val("");
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
		
		updateRno = $(this).attr("class");
		
		// console.log("updateRno 2: " + updateRno);
		
		showList(pageNum);
		
	});
	
	
		replyUL.on("click", "#updateReplyBtn", function(e) {
		// 댓글 수정
		
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
			
			});		
			
		}
		
		
		
	});
	
	/* /.Delete a reply */
	
	
	/* event delegation */
	// 동적으로 생성된 태그에는 직접 이벤트를 달아줄 수 없음
	// 상위나 형제 tag 에 달아주고 나중에 이벤트 대상을 변경
	
	replyPageFooter.on("click", "li a", function(e)	{
		// remove a tag event
		e.preventDefault();
		
		let target = $(this).attr("href");
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
	
	
	
	}); // end ready(function())
	
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
