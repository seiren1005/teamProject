<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>

<style>

.modifyPageForm span {
	
	text-align: center;
	display: inline-block;
	
}

</style>

<div class="">
	<div class="">
		<h1 class="">Update board</h1>
	</div>
</div>

<div class="">
	<form role="form" action="/bulletin/bulletinModify" method="post">
	
		<!-- hidden input tag -->
		<input type="hidden" name="pageNum"	value="<c:out value='${cri.pageNum }' />" />
		<input type="hidden" name="amount" value="<c:out value='${cri.amount }' />" />
		<input type="hidden" name="pagePurpose" value="<c:out value='${cri.pagePurpose }' />" />
	
		<input type="hidden" name="searchType" value="<c:out value='${cri.searchType }' />" />
		<input type="hidden" name="keyword" value="<c:out value='${cri.keyword }' />" />
		<!-- /.hidden input tag -->
	
		<hr>
	
		
		<div class="modifyPageForm">
			<input type="hidden" name='secret' value="<c:out value='${board.secret }' />" />
				<div class="input-group mb-3 menu">
				  <span class="input-group-text col-2" id="basic-addon1">no.</span>
				  <input type="text" class="form-control border border-4" name="bno" id="back-bno" 
						value="<c:out value='${board.bno }' />" data-bs-toggle="tooltip" data-bs-placement="top" title="unmodifiable"
						readonly />
				</div>
				<div class="input-group mb-3 ">
				  <span class="input-group-text col-2" id="basic-addon1">TITLE</span>
				  <input type="text" class="form-control boardTitle" name="title" value="<c:out value='${board.title }' />" />
				</div>
				<div class="input-group mb-3">
					  <span class="input-group-text col-2" id="basic-addon1">WRITER</span>
					  <input type="text" class="form-control border border-4" name="writer" 
						value="<c:out value='${board.writer }' />" data-bs-toggle="tooltip" data-bs-placement="top" title="unmodifiable"
						readonly = />
					</div>
				<div class="input-group mb-3">
				  <span class="input-group-text col-2">CONTENT</span>
				  <textarea class="form-control boardContent" name="content" aria-label="CONTENT" rows="10"><c:out value='${board.content }' /></textarea>
				</div>
				<div class="input-group mb-3">
					  <span class="input-group-text col-2" id="basic-addon1">REGDATE</span>
					  <input type="text" class="form-control border border-4" name="regDate" 
						value="<fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' 
						value='${board.regDate }' />" data-bs-toggle="tooltip" data-bs-placement="top" title="unmodifiable"
						readonly />
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text col-2" id="basic-addon1">MODDATE</span>
					  <input type="text" class="form-control border border-4" name="modDate" 
						value="<fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' 
						value='${board.regDate }' />" data-bs-toggle="tooltip" data-bs-placement="top" title="unmodifiable"
						readonly />
					</div>
				</div>
		
		<div class="">
						<label>FILE UPLOAD</label>
					</div>
					<div class="input-group uploadDiv">
					  <input type="file" class="form-control" name="attachFile" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload" multiple />
					  <button class="btn btn-outline-secondary uploadBtn" type="button" onclick="fileUpload();" id="inputGroupFileAddon04">UPLOAD</button>
					</div>
		<div id="uploadResult">
			<ul>
				<!-- view previous upload files -->
			</ul>
		</div>
	
		<button type="button" data-oper="update" class="btn btn-outline-warning submitBtn">UPDATE</button>
		<button type="button" data-oper="delete" class="btn btn-outline-warning submitBtn">DELETE</button>
		<button type="button" data-oper="get" class="btn btn-outline-warning submitBtn">GO BACK</button>
		<button type="button" data-oper="list" class="btn btn-outline-warning submitBtn">LIST</button>
		
	</form>
</div>


<script type="text/javascript">

	var userid = '${userId }'
	
	/* ????????? ?????? ?????? */
	$(document).ready(function() {
		
		if((userid == '' || userid == null) || userid != '${board.writer }') {
			// ???????????? ????????? ????????? login ???????????? ?????????
			alert("You need to login!!");
			location.href = "/bulletin/login";
							
		}
		
	});
	/* /.????????? ?????? ?????? */
	
	var uploadResult = $("#uploadResult ul");
	
	$(document).ready(function() {
		// ?????? submit ???????????? ?????? ??? ????????? ?????? ????????? ??????
		
		let formObj = $("form");
		
		//?????? ?????? ??????
		let targetFile = new Array();
		//?????? ?????? ????????? ??????
		let type = new Array();
		
		
		showUploadFile();
		
		
		// Add event to button
		$(".submitBtn").on("click", function(e) {
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			// click event ??? ????????? ????????? data-oper ?????? ????????????
			
			if (operation === "update") {
				// ?????? action ?????????				
				
				if(targetFile.length > 0) {
					
					$.ajax({
						url: '/deleteFile',
						type: 'POST',
						traditional: true, // ajax ?????? ????????? ??????!
						data : {fileName:targetFile, type:type},
						dataType : 'text',
						success : function(result){
							alert(result);
							
						}
						
					})
					
				}	
		
		formObj.attr("action", "/bulletin/bulletinModify").attr("method", "post");
								
			} else if (operation === "delete") {
				
				if(confirm("Really want to delete this content?")) {
					
					formObj.attr("action", "/bulletin/bulletinDelete");
					// ?????? action ?????? ??? action attribute ?????? 
					
				} else {
					
					formObj.attr("action", "/bulletin/bulletinModify").attr("method", "get");
					
				}				
				
			} else if (operation === "get") {
				
				var back_bno = $("#back-bno").val();
				
				// url ??? ???????????? ??????
				$(location).attr("href", "/bulletin/bulletinGet?bno=" + back_bno);
				return;
				
			} else if (operation === "list") {
				// ????????? ?????? ???
				formObj.attr("action", "/bulletin/bulletinList").attr("method", "get");
				
				// page processing
				var pageNumTag = $("input[name='pageNum']").clone();
				// tag ????????? ??????
				var amountTag = $("input[name='amount']").clone();
				
				var searchTypeTag = $("input[name='searchType']").clone();
				
				var keywordTag = $("input[name='keyword']").clone();
				
				var pagePurposeTag = $("input[name='pagePurpose']").clone();
				
				formObj.empty();
				// formObj ?????? ?????? ?????????
				
				// ?????? ?????? ???????????? page ?????? ?????? input tag ??? ??????
				formObj.append(pageNumTag).append(amountTag)
					.append(searchTypeTag)
					.append(keywordTag)
					.append(pagePurposeTag)
					
			}
			
			// submit
			formObj.submit();
						
		});		
			
		
		/* ????????? ?????? ?????? */				
		$("#uploadResult").on("click", "span", function(e){				
		
		targetFile.push($(this).data("file"));
		type.push($(this).data("type"));
						
		$(this).closest("li").remove();
		
						
		})
		/* /.????????? ?????? ?????? */	
		
		
	}); // end $(document).ready	
	
	
	function fileUpload() {
		
		console.log("clicked")
		
		// form tag ?????? form ?????????
		let formData = new FormData();
		
		// input tag ????????????
		let file = $("input[name='attachFile']");
		let files = file[0].files;
							
		if(files.length > 0) {
			// input tag ?????? ????????? ????????? ??????
			// formData ??? ?????? ??????
			for(let i = 0; i < files.length; i++) {
				// ?????? ?????? ?????? false ??? ????????? ?????? ????????? ??????
				if(checkFile(files[i].name, files[i].size) == false) {
					
					return false;
					
				}
				
				formData.append("uploadFile", files[i]);
				console.log("test2");
				
			}
			
			
			/* File upload and initialize input tag */
			$.ajax({
				url: "/uploadAjaxAction",
				processData: false,
				// ????????? ????????? query string ?????? ???????????? ?????? false
				contentType: false,
				// contentType: false -> multipart
				data: formData,
				type: "POST",
				success: function(result) {
					
					alert(result);
					
					// li tag ??????
					showUploadFileNew(result);
					
					// ?????? ????????? ???????????? input tag initialize
					$(".uploadDiv").html(cloneObj.html());
					
				}
			
			})
			
			/* /.File upload and initialize input tag */
			
		} else {
			
			alert("Please select files!!");
			
		}
		
					
	} // end $("#uploadBtn").on()
	
	
	
	/* inpect files */
	// ?????? ????????? ??????
		let regex = new RegExp("(.*?)\(exe|sh|zip|alz)$");
		
		let maxSize = 5242880; // ?????? ?????? 5 mb ??? ??????
		
		function checkFile(fileName, fileSize) {
			// ?????? ?????? ??????
			if(fileSize > maxSize) {
				
				alert("?????? ?????? ?????? ??????");
				return false;
				
			}
			
			// ?????? ????????? ?????? ( ???????????? ?????? ????????? ???????????? ???????????? false)
			if(regex.test(fileName)) {
				
				alert("?????? ????????? ????????? ????????? ??????");
				return false;
				
			}
			
			return true;
			
		}	
	
	
	
	function showUploadFile() {		
		
		let nameArr = '${fvo.fileName}';
		let uuidArr = '${fvo.uuid}';		
		let checkArr = '${fvo.imageChecker}';
		
		let uploadHtml = "";			
		
		// ????????? ?????? ?????? ??? li tag ??? ???
		if (nameArr == '') {
					
	} else {

		nameArr = nameArr.split("/");			
		uuidArr = uuidArr.split("/");			
		checkArr = checkArr.split("/");
		
		// ????????? ?????? ?????? ??? li tag ??? ???
		for(let i = 0; i < nameArr.length; i++) {
										
			if(checkArr[i] == "false") {
				// ????????? ????????? ??????
				// li tag ?????? ?????? ?????????
				let fileCallPath = encodeURIComponent("/" + uuidArr[i].uuid
						+ "_" + nameArr[i].fileName);
				
				uploadHtml += "<li class='uploadLi'>"
					+ "<img src='/resources/img/file_icon.png' width='20px'>"
					+ nameArr[i]
					+ "<span data-file=\'" + fileCallPath + "\' data-type='file'>"
					+ " x </span>"
					+ "<input type='hidden' name='fileName' value='" + nameArr[i] + "' />"
					+ "<input type='hidden' name='uuid' value='" + uuidArr[i] + "' />"
					+ "<input type='hidden' name='imageChecker' value='" + checkArr[i] + "' />"
					+ "</li>";
									
			} else {
				// ????????? ??????
				// thumbnail ????????? ??????
				let fileCallPath = encodeURIComponent("/s_" + uuidArr[i]
						+ "_" + nameArr[i]);
				
				let originPath = uuidArr[i] + "_" + nameArr[i];
				
				originPath = originPath.replace(new RegExp(/\\/g), "/");
				
				uploadHtml += "<li class='uploadLi'>"
						+ nameArr[i]
						+ "<img src='/display?fileName=" + fileCallPath + "'>"
						+ "<span data-file=\'" + fileCallPath + "\' data-type='image'>"
						+ " x </span>"
						+ "<input type='hidden' name='fileName' value='" + nameArr[i] + "' />"
						+ "<input type='hidden' name='uuid' value='" + uuidArr[i] + "' />"
						+ "<input type='hidden' name='imageChecker' value='" + checkArr[i] + "' />"
						+ "</li>";
				
			}
							
		}
		
	}
					
		uploadResult.append(uploadHtml);
		
	} // end function showUploadFile()
	
	/* /.show files attaced */
	
	
	/* upload file and show */		
		var cloneObj = $(".uploadDiv").clone();
		
	function showUploadFileNew(uploadArr) {			
			
			let uploadHtml = "";			
			
			// ????????? ?????? ?????? ??? li tag ??? ???
			for(let i = 0; i < uploadArr.length; i++) {
				
				if(uploadArr[i].imageChecker == "false") {
					// ????????? ????????? ??????
					// li tag ?????? ?????? ?????????
					let fileCallPath = encodeURIComponent("/" + uploadArr[i].uuid
							+ "_" + uploadArr[i].fileName);
					
					uploadHtml += "<li class='uploadLi'>"
						+ "<img src='/resources/img/file_icon.png' width='20px'>"
						+ uploadArr[i].fileName
						+ "<span data-file=\'" + fileCallPath + "\' data-type='file'>"
						+ " x </span>"
						+ "<input type='hidden' name='fileName' value='" + uploadArr[i].fileName + "' />"
						+ "<input type='hidden' name='uuid' value='" + uploadArr[i].uuid + "' />"
						+ "<input type='hidden' name='imageChecker' value='" + uploadArr[i].imageChecker + "' />"
						+ "</li>";
										
				} else {
					// ????????? ??????
					// thumbnail ????????? ??????
					let fileCallPath = encodeURIComponent("/s_" + uploadArr[i].uuid
							+ "_" + uploadArr[i].fileName);
					
					let originPath = uploadArr[i].uuid + "_" + uploadArr[i].fileName;
					
					originPath = originPath.replace(new RegExp(/\\/g), "/");
					
					uploadHtml += "<li class='uploadLi'>"
							+ uploadArr[i].fileName
							+ "<img src='/display?fileName=" + fileCallPath + "'>"
							+ "<span data-file=\'" + fileCallPath + "\' data-type='image'>"
							+ " x </span>"
							+ "<input type='hidden' name='fileName' value='" + uploadArr[i].fileName + "' />"
							+ "<input type='hidden' name='uuid' value='" + uploadArr[i].uuid + "' />"
							+ "<input type='hidden' name='imageChecker' value='" + uploadArr[i].imageChecker + "' />"
							+ "</li>";
					
				}
								
			}
						
			uploadResult.append(uploadHtml);
			
		} // end function showUploadFile()
		
	
</script>


<%@ include file="../includes/footer.jsp" %>
