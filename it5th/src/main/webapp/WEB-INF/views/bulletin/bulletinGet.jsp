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
				  <textarea class='form-control' name='content' id='exampleFormControlTextarea1' rows='10'><c:out value='${board.content }' /></textarea>
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
				<c:if test='${userId eq board.writer }'>
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
			<!-- ???????????? ???????????? writer ??? id??? ??????, ??????????????? ?????? ?????? guest -->
				<c:choose>
					<c:when test="${userId != '' && userId != null}">
						<input type="text" class="form-control" name="replyer" placeholder='${userId }' aria-label="Replyer" value="<c:out value='${userId }' />" readonly />
					</c:when>
					<c:otherwise>
						<input type="text" class="form-control" name="replyer" placeholder="guest" aria-label="Replyer" value="<c:out value='guest' />" readonly />
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
style="height: 40vh;">
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
        <a href="#" id="img-download"><h5 class="modal-title" id="exampleModalLabel" data-bs-toggle="tooltip" data-bs-placement="right" title="file download"></h5></a>
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
	
	// ?????? ????????? ?????? ????????? ???????????? ?????? ??????
	// ?????? ????????? ????????? -1 ??? init
	var updateRno = -1;
	// console.log("updateRno 0: " + updateRno);
	
	// ????????????
	var updateTno = -1;
	
	// ???????????? ???????????? id
	var userid = '${userId }'
	
	console.log(userid)
		
			
	$(document).ready(function() {
		
		var bnoValue = '<c:out value="${board.bno}" />';
		var uploadResult = $("#uploadResult ul");
		
		// upload file name, path (String)
		let nameArr = '${fvo.fileName}';
		let uuidArr = '${fvo.uuid}';		
		let checkArr = '${fvo.imageChecker}';
		
		// split method ??? ????????? ?????? '/' ??? ???????????? ????????? ????????? ?????? (Array)
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
					// page ??? ????????? page ????????? ????????? 1 ???
				},
				function(replyCnt, list, checkValue) {
					// success ??? callback ????????? replyCnt, list ?????????
					// checkValue: qna ??????????????? ????????? ??????????????? ??????
					console.log("replyCnt: " + replyCnt);
					console.log("list: " + list);
					console.log("get.jsp checkValue: " + checkValue)
					
					// ????????? ????????? -1 ??? ?????? ????????? ???????????? ??????
					if(page == -1) {
						
						pageNum = Math.ceil(replyCnt/10.0);
						showList(pageNum);
						return;
						// ????????? ???????????? ???????????? function ??????
						
					}
					
					var comments = "";
					
					if (list == null || list.length == 0) {
						// ???????????? ?????? X -> html ?????? ?????? ?????? ??????
						replyUL.html(comments);
						return;
						// exit function
					}

					// jquery ??? Model (spring ????????? ?????? ??????) ??? ?????? ??? 
					// ????????????
					// <c:forEach items="????????????{board}" var="board">		
					//		?????? ????????? ???????????? ??? ??????
					// </c:forEach>
									
					
					/* ?????? ????????? (????????? ?????? + ??????) */					
					// ???????????? ?????? ????????? ??????
					for (let i = 0; i < list.length; i++) {
							// ??????????????? ???????????? ????????? ???????????? ????????? ??? i ????????? rno ?????? ??????
							comments += "<li class='replyLiTag' data-rno='" + list[i].rno + "' name='" + i + "'>";
							
							if(list[i].adoption != "null") {
								// if adopted reply (????????? ????????? ??????)
								
								// apply border effect				
								comments += "<div class='replyDiv border border-warning border-5'>";
								
							} else {
								// ????????? ????????? ????????????								
								comments += "<div class='replyDiv'>";
								
							}
							
							comments += "<div class=''>";
							comments += "<strong class='replyReplyerInfo'>" + list[i].replyer + "</strong>";
							comments += "<small class=''>";
							comments += replyService.displayTime(list[i].replyRegDate);
							comments += "</small></div>";
							
							// ??????????????? update ????????? ?????? ????????? ?????? ?????? ??????
							if(list[i].rno != updateRno) {
								
								comments += "<p class=''>" + list[i].reply + "</p></div>";

								if(list[i].replyer == userid) {
									
									comments += "<div class='btnDiv'>"
									comments += "<button type='button' class='btn btn-sm btn-outline-primary updateReplyFormBtn' name='" + list[i].rno + "'>UPDATE</button>"
									comments += "<button type='button' class='btn btn-sm btn-outline-primary deleteReplyBtn'>REMOVE</button>"
									
								}
																
								// ???????????? ????????? ????????? ????????? ?????? ??????
								if((userid != '' && userid != null) && list[i].replyer != userid) {
							
									// qna ?????????????????? ????????? ????????? ?????? ??????
									if ('${board.purpose}' == "Q" && list[i].adoption != "adopted") {
										
										comments += "<div>";
										// ???????????? ?????????
										comments += "<button id='selectReplyBtn' class='btn btn-sm btn-outline-primary' name='" + list[i].rno + "'>SELECT</button>"
										// comments += "<button id='cancelSelectBtn' class=''>CANCEL</button></li>"
										
									}
									
									comments += "<button type='button' class='btn btn-sm btn-outline-primary toReplyRegBtn offCanvasShow' name='" + list[i].rno + "' data-bs-toggle='offcanvas' data-bs-target='#offcanvasBottom' aria-controls='offcanvasBottom'>REPLY</button>"
									comments += "</div>"
									
								}
									
							} else {
								// ????????????????????? update ????????? ?????? ??????
								
								comments += "<div class='form-floating'>"
								comments += "<textarea class='form-control' name='reply' id='exampleFormControlTextarea1' rows='2'>";
								  
								comments += list[i].reply + "</textarea>"
								comments += "</div>";
								comments += "<div class='btnDiv'>"
								comments += "<button type='button' class='btn btn-sm btn-outline-primary updateReplyBtn' value='" + list[i].rno + "'>UPDATE</button>"
								comments += "<button type='button' class='btn btn-sm btn-outline-primary cancelBtn'>CANCEL</button>";
								
								// updateRno ?????????
								updateRno = -1;
								
							}											

							comments += "</div>"
							
							if(list[i].gorder == 0) {
								// ???????????? ?????? ??????
																						
								comments += "</li>";
								
							} else {
								// ???????????? ??????
															
								//comments += "<a href='#' class='offCanvasShow' data-bs-toggle='offcanvas' data-bs-target='#offcanvasBottom' aria-controls='offcanvasBottom'>" + list[i].gorder + "?????? ??????</a>";
								comments += "<div class='accordion accordion-flush' id='accordionFlushExample'>";
								comments += 	"<div class='accordion-item'>";									
								comments += 		"<h2 class='accordion-header' id='flush-heading" + i +"'>";
								comments += 			"<button class='accordion-button collapsed accordionShow' type='button' data-bs-toggle='collapse' data-bs-target='#flush-collapse" + i + "' aria-expanded='false' aria-controls='flush-collapse" + i + "' style='padding: 5px;'>";
								comments += 					list[i].gorder + "?????? ??????";
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
					/* /.?????? ????????? (????????? ?????? + ??????) */
				
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
		
		// ??? ???????????? ?????????
		let prev = startNum != 1; // 1 ??? ????????? true
		
		// ????????? ?????? ????????? ???????????? ???????????? (????????? ?????????)
		// next ??? default ??? false ???
		let next = false;
		
		// ????????? ????????? ?????? ?????? ????????? ?????? ?????? ????????????
		// ?????? ??????
		if (endNum * 10 >= replyCnt) {
			
			endNum = Math.ceil(replyCnt / 10.0);
			
		}
		
		// endNum ??? ?????? ???????????? ????????? ?????? ????????? ??????
		if (endNum * 10 < replyCnt) {
			
			next = true;
			
		} 
		
		// ?????? ????????? html ?????? ??????
		let pageHtml = "<ul class='pagination pull-right'>";
		//?????? ???????????? ???????????? prev ?????? ?????????
		if(prev){
			pageHtml += "<li class='page-item'>";
			pageHtml += "<a class='page-link' href='" + (startNum - 1) + "'>";
			pageHtml += "Prev</a></li>";
			
		}
		// ????????? ?????? ?????? ?????????
		for(let i = startNum; i<=endNum ; i++){
			//active : ?????? ????????? ?????? ??????
			
			let active = pageNum == i  ? "active" : "";
			pageHtml += "<li class='page-item " + active + "'><a class='page-link' href='"+i+"'>"+i+ "</a></li>" ;

		}
		
		
		//?????? ???????????? ???????????? (10??? ??????) next ?????? ?????????
		if(next){
			pageHtml += "<li class='page-item'>";
			pageHtml += "<a class='page-link' href='" + (endNum + 1) + "'>";
			pageHtml += "Next</a></li>";
		}
		
		pageHtml += "</ul>";
		
		// html ?????? ??????
		replyPageFooter.html(pageHtml);		
		
	}; // end showReplyPage(replyCnt)

	/* /.Add page button for reply */


	// replyForm div ????????????
	var replyForm = $(".replyForm");
	
	// name ????????? reply ??? input
	var formInputReply = replyForm.find("textarea[name='reply']");
	var formInputReplyer = replyForm.find("input[name='replyer']");
	
	
	// register reply
	$("#registerReplyBtn").on("click", function(e) {
		// ????????? ?????? bno ???????????? reply ?????? ????????? 
		// ?????? ?????? ?????? ??????
		
		// ????????? data
		var reply = {
				reply: formInputReply.val(),
				replyer: formInputReplyer.val(),
				bno: bnoValue
		};
		
		console.log(reply);
		
		// app.js ??? ????????? add (register) method ??????
		replyService.add(reply, function(result) {
			
			alert(result);
			//replyForm.find("input").val("");
			
			// textarea ?????? ?????????
			replyForm.find("textarea[name='reply']").val("");
			
			showList(-1);
			
		});
		
	}); // end register reply
	
	
	/* update reply */
		
	// update ?????? ????????? updateForm ????????????
	// event delegation
	replyUL.on("click", ".updateReplyFormBtn", function(e) {
		// ????????? ???????????? ????????? #updateReplyFormBtn tag ??? 
		// ????????? ?????? ??????
		
		updateRno = $(this).attr("name");
		
		console.log("updateRno 2: " + updateRno);
		
		showList(pageNum);
		
	});
	
	
		replyUL.on("click", ".updateReplyBtn", function(e) {
		// ?????? ??????
		
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
	replyUL.on("click", ".cancelBtn", function(e) {
		
		showList(pageNum);
		
	});
	
	/* /.cancelation to update a reply */
	
		
	/* Delete a reply */
	replyUL.on("click", ".deleteReplyBtn", function(e) {
		
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
	// ???????????? ????????? ???????????? ?????? ???????????? ????????? ??? ??????
	// ????????? ?????? tag ??? ???????????? ????????? ????????? ????????? ??????
	
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
			// ????????? ?????? ?????? ??? li tag ??? ???
			for(let i = 0; i < nameArr.length; i++) {
											
				if(checkArr[i] == "false") {
					// ????????? ????????? ??????
					// li tag ?????? ?????? ?????????
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
					// ????????? ??????
					// thumbnail ????????? ??????
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
			
			if(userid != '' && userid != null) {
				
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
				
			} else {
				
				if(confirm("You need to login. Do you want to move to login page?")) {
					// yes -> ????????? ????????? ??????
					location.href = "/bulletin/login";
				
				}	
				
			}
			
			
			
		
	});
	/* /.recommendation button */
	
	// for accordion pagination
	var targetrno = 0;
	var divId = '';
	
	// image ????????? ????????? ?????? ????????? ?????? ????????? ?????? ????????????
			$("#uploadResult").on("click", ".img-modal", function() {
				
				// ????????? ????????? uuid ??? + filename
				let iname = $(this).attr("name");
				let filePath = encodeURI(uuidArr[iname] + "_" + nameArr[iname]);
				
				//let body = document.getElementsByClassName('origin-img');
				document.querySelector("#exampleModalLabel").innerText = nameArr[iname];
				
				// ???????????? ????????? ???????????? ????????? ???????????? ????????? ????????? ?????????
				if(userid != '' && userid != null) {
					
					$("#img-download").attr("href", "/download?fileName=" + filePath);
									
				} else {
					
					$("#img-download").attr("onclick", "loginChecker();");
					
				}
				
				let body = document.querySelector('.modal-body')
				body.innerHTML = "<img src='/display?fileName=" + filePath + "' class='container'>";
				
			});
			
			
			// ????????? ?????? ??? ????????? ????????? ????????????
			$("#uploadResult").on("click", ".fileDownload", function() {
				
				// ????????? ????????? uuid ??? + filename
				let iname = $(this).attr("name");
				let filePath = encodeURI(uuidArr[iname] + "_" + nameArr[iname]);
				
				// ???????????? ????????? ???????????? ????????? ???????????? ????????? ????????? ?????????
				if(userid != '' && userid != null) {
					
					$(".fileDownload").attr("href", "/download?fileName=" + filePath);
									
				} else {
					
					$(".fileDownload").attr("onclick", "loginChecker();");
					
				}
				
			});
			
			
			/* reply to reply */
			replyUL.on("click", ".offCanvasShow", function(e) {
			
				e.preventDefault();
								
				// button ??? ?????? ????????? ????????? ????????? ?????? ???????????????								
				var clickedReply = "";
				var rno = $(this).parents(".replyLiTag").data("rno");
				console.log(rno)
				/* ????????? ?????? ???????????? */
				replyService.get(rno, function(result) {
					
					clickedReply += "<li class='replyLiTag' data-rno='" + result.rno + "'>"
					
					if(result.adoption != "null") {
						
						clickedReply += "<div class='replyDiv border border-warning border-5'>";
						
					} else {
						
						clickedReply += "<div class='replyDiv'>";
												
					}
					clickedReply += "<div class=''>";
					clickedReply += "<strong class='replyReplyerInfo'>" + result.replyer + "</strong>";
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
						
						if((userid != '' && userid != null) && result.replyer != userid) {
							
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
						
						// updateRno ?????????
						updateRno = -1;
						
					}											

					clickedReply += "</div>"
					
					if(result.gorder == 0) {
						// ???????????? ?????? ??????
																				
						clickedReply += "</li>";
						
					} else {
						// ???????????? ??????
													
						//clickedReply += "<a href='#' class='accordionShow' data-bs-toggle='offcanvas' data-bs-target='#offcanvasBottom' aria-controls='offcanvasBottom'>" + result.gorder + "?????? ??????</a>";
						clickedReply += "</li>";
						
					}
					clickedReply += "<hr>";
					
					// console.log("updateRno 1: " + updateRno);
				
					$(".offcanvas-title").html(clickedReply);
			});
				
				
				// ????????? ?????? ???
				var forms = "";
							
				forms += "<div class='toReplyForm'>";
				forms += 	"<div class='input-group-sm mb-3'>";

				forms +=    "<input type='hidden' name='gno' value=" + $(this).parents(".replyLiTag").data("rno") + " />";
				//???????????? ???????????? writer ??? id??? ??????, ??????????????? ?????? ?????? guest
				if('${userId != "" && userId != null}') {
					// ???????????? ??????
					forms += 		"<input type='text' class='form-control' name='replyer' placeholder='" + userid + "' aria-label='Replyer' value=" + userid + " readonly />";
										
				} else {
					// ????????? ?????? ?????? ??????
					forms += 		"<input type='text' class='form-control' name='replyer' placeholder='guest' aria-label='Replyer' value='guest' readonly />";
					
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
				
				// ????????? ?????? ??? ????????????
				$(".offcanvas-middle").html(forms);
				/* /.show under reply */												
				
			}) // end on("click", "#replyToReplyBtn")
			/* /.reply to reply */
			
			
			/* ???????????? reply button ?????? */	
						
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
				
				// ????????? data
				var reply = {
						reply: formInputToReply.val(),
						replyer: formInputToReplyer.val(),
						bno: bnoValue,
						rno: formInputGno.val()
				};
				
				console.log("get: ");
				console.log(reply)
				
				// app.js ??? ????????? add (register) method ??????
				replyService.addToReply(reply, function(result) {
					
					alert(result);
					//replyForm.find("input").val("");
					
					// textarea ?????? ?????????
					toReplyForm.find("textarea[name='reply']").val("");	
					
					location.reload();
					
				});
				
			}); 
	// end register reply
			/* /.???????????? reply button ?????? */
			
			
			/* ????????? ?????? using accordion */
			replyUL.on("click", ".accordionShow", function () {
			  
				// ????????? ????????? ?????? tag ??? class="replyLiTag" ??? ????????? data-rno ?????? ??????
			  rno = $(this).parents(".replyLiTag").data("rno");
				
				// ????????? ???????????? data-bs-target ????????? ????????? ?????????
				// ???????????? index 1 ?????? ????????? ???????????? ?????? 
			  divId = $(this).attr("data-bs-target").substring(1);
			  
				accordionHandler(rno, divId)
			  
			  
			}) // end replyUL.on("click", ".accordionShow", function () {})
			/* /.????????? ?????? using accordion */	
			
			
			/* accordion function */
			function accordionHandler(rno, divId) {
			replyService.getToReply(rno, function(list) {
			    
			    console.log("=================================");
			    console.log("===========toReplyList===========")
			    console.log(list)
			    console.log("=================================")
			    
			    var comments = "";
			    
			    for (let i = 0; i < list.length; i++) {
			      // ??????????????? ???????????? ????????? ???????????? ????????? ??? i ????????? tno ?????? ??????
			      comments += "<li class='toreplyLiTag' data-tno='" + list[i].tno + "'>";						
			      comments += "<div class='replyDiv'>";			      
			      comments += "<div class=''>";
			      comments += "<strong class='replyReplyerInfo'>" + list[i].replyer + "</strong>";
			      comments += "<small class=''>";
			      comments += replyService.displayTime(list[i].replyRegDate);
			      comments += "</small></div>";
			      
			      // ??????????????? update ????????? ?????? ????????? ?????? ?????? ??????
			      if(list[i].tno != updateTno) {
			        
			        comments += "<p class=''>" + list[i].reply + "</p></div>";

			        if(list[i].replyer == userid) {
			          
			          comments += "<div class='btnDiv'>";
			          comments += "<button type='button' class='btn btn-sm btn-outline-primary tUpdateFormBtn' name='" + list[i].tno + "'>UPDATE</button>";
			          comments += "<button type='button' class='btn btn-sm btn-outline-primary tDeleteBtn'>REMOVE</button>";
			          comments += "</div>"
			          
			        }
			          
			      } else {
			        // ????????????????????? update ????????? ?????? ??????
			        
			        comments += "<div class='form-floating'>"
			        comments += "<textarea class='form-control' name='reply' id='exampleFormControlTextarea1' rows='2'>";
			          
			        comments += list[i].reply + "</textarea>"
			        comments += "</div>";
			        comments += "<div class='btnDiv'>"
			        comments += "<button type='button' class='btn btn-sm btn-outline-primary tUpdateBtn' name='" + list[i].rno + "'>UPDATE</button>"
			        comments += "<button type='button' class='btn btn-sm btn-outline-primary tCancelBtn'>CANCEL</button>";
			        
			        // updateTno ?????????
			        updateTno = -1;
			        
			      }											

			      comments += "</div>"
			      
			      if(list[i].gorder == 0) {
			        // ???????????? ?????? ??????
			                                    
			        comments += "</li>";
			        
			      } else {
			        // ???????????? ??????
			                      
			        //comments += "<a href='#' class='accordionShow'>" + list[i].gorder + "?????? ??????</a>";								
			        comments += "</li>";
			        
			      }
			      comments += "<hr>";
			      
			      // console.log("updateRno 1: " + updateRno);
			  }
			  
			    // id ??? divId ??? div??? ????????? div ??? html ??? comments ??????
			    $("div[id='" + divId + "'] > div").html(comments);

			}); // end getToReply(function () {});
			
			} // end function accordionHandler() {}
			/* /.accordion function */
			
			
			
			/* ????????? ????????? ?????? ?????? */
			// update function
			replyUL.on("click", ".tUpdateFormBtn", function() {
				// ???????????? ???????????? ????????? ?????? ????????? ???????????? tno ?????? ??????
				updateTno = $(this).attr("name");
				
				accordionHandler(rno, divId);
				
			})
			
			replyUL.on("click", ".tUpdateBtn", function() {
				
				var reply = {
					tno: $(this).parents(".toreplyLiTag").data("tno"),
					reply: $(this).parents(".toreplyLiTag").find("textarea").val(),
					replyer: $(this).parents(".toreplyLiTag").find("strong").text()					
				}
				
				console.log(reply)						
				
			replyService.tUpdate(reply, function(result) {
				
				alert(result);
				
				accordionHandler(rno, divId);
				//replyForm.find("input").val("");
				
				})				
				
			}) // end replyUL.on("click", ".tUpdateBtn", function() {})
			
			
			// cancel button click
			replyUL.on("click", ".tDeleteBtn", function() {
				
				accordionHandler(rno, divId);
				
			})
			
			
			// delete button click
			replyUL.on("click", ".tDeleteBtn", function() {
				
				let tno = $(this).parents(".toreplyLiTag").data("tno");
				console.log("delete tno: " + tno);
				
				if(confirm("Do you really want to delete a reply?")) {
					
					replyService.tRemove(tno, function(result) {
					
					alert(result);
					
					showList(pageNum);
					
					})
				}
				
			})
						
			/* ????????? ????????? ?????? ?????? */
			

			
			
	}) // end ready(function())
	
	
	// ??? ????????? ????????? ???????????? ????????? ????????? ???????????? ???????????? ??????
	function loginChecker() {
		
		if(confirm("You need to login!! Would you want to move to login page?")) {
			
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
