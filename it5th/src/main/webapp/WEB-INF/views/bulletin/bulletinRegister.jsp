<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %>


<div class="">
	<h1 class="">Board Register</h1>
</div>

<div class="">
			<div class="">board register</div>
			<div class="">
			<!-- register form -->
				<form action="/bulletin/bulletinRegister" method="post" 
					class="registerForm" enctype="multipart/form-data">
					
					
					<!-- Information for paging processing -->
					<input type="hidden" name="pageNum" 
						value="<c:out value='${pageMaker.cri.PageNum }' />" />
					<input type="hidden" name="amount" 
						value="<c:out value='${pageMaker.cri.amount }' />" />
					<input type="hidden" name="pagePurpose" 
						value="<c:out value='${pageMaker.cri.pagePurpose }' />" />
						
					<!-- Remain search information -->
					<input type="hidden" name="searchType" 
						value="<c:out value='${pageMaker.cri.searchType }' />" />
					<input type="hidden" name="keyword" 
						value="<c:out value='${pageMaker.cri.keyword }' />" />
					
										
					<div class="btn-group btn-sm">
					  <select name="purpose" class="purposeBox form-select">
					    <option value="N">=====</option>
							<option value="Q">Q&A</option>
							<option value="F">FREE</option>		
					  </select>
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text boardTitle" id="basic-addon1">TITLE</span>
					  <input type="text" class="form-control boardTitle" name="title" />
					</div>
					
					<div class="form-check form-switch">
					  <input class="form-check-input" type="checkbox" role="switch" class="secretBox" name="secret" id="flexSwitchCheckDefault" value="yes">
					  <label class="form-check-label" for="flexSwitchCheckDefault">비밀글</label>
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text boardTitle" id="basic-addon1">WRITER</span>
					  <input type="text" class="form-control boardTitle boardWriter" name="writer" 
					  	value="<c:out value='${member.userId }' />" readonly />
					</div>
					<div class="input-group">
					  <span class="input-group-text">CONTENT</span>
					  <textarea class="form-control boardContent" name="content" aria-label="CONTENT"></textarea>
					</div>					
					<div class="">
						<label>FILE UPLOAD</label>
					</div>
					<div class="input-group uploadDiv">
					  <input type="file" class="form-control" name="attachFile" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload" multiple />
					  <button class="btn btn-sm btn-outline-secondary uploadBtn" type="button" onclick="fileUpload();" id="inputGroupFileAddon04">UPLOAD</button>
					</div>				
					
					<div id="uploadResult">
							<!-- view upload files -->
					</div>
					
					<hr />
					<button type="button" class="btn btn-sm btn-outline-warning registerBtn">SUBMIT</button>
					<button type="button" class="btn btn-sm btn-outline-warning listBtn">LIST</button>
				</form>
					<!-- upload button 이 폼 안에 있으면 이벤트가 한번만 발생하고 그 뒤로는
						아무 이벤트도 발생하지 않거나 submit 이벤트가 발생하는 에러가 발생
						
						+ form 안에 버튼이 있을 경우 default type 은 submit 가 됨 주의!
						
						해결: 폼 밖으로 버튼을 빼니 해결됨
						
						파이널: <input> tag 등 데이터를 같이 전달하는 tag 가 있을 경우 
						처음은 지정한 이벤트로 작동하지만 두번째부터 submit 이벤트로 작동함
						-->
									
			<!-- /.register form -->
	</div>
</div>

<script type="text/javascript">
	
	var userid = '${member.userId }'
		
	/* 로그인 여부 판단 */
	$(document).ready(function() {
		
		if(userid == '' || userid == null) {
			// 로그인한 상태가 아니면 login 페이지로 보내기
			alert("You need to login!!");
			location.href = "/bulletin/login";
							
		}
		
	});
	/* /.로그인 여부 판단 */
	
	
	$(document).ready(function() {
				
		let infoValue;
		
	/* 업로드 파일 삭제 */
	$("#uploadResult").on("click", "span", function(e){				
		//삭제 대상 파일
		let targetFile = $(this).data("file");
		
		//삭제 대상 파일의 타입
		let type = $(this).data("type");
		
		$.ajax({
			url: '/deleteFile',
			type: 'POST',
			data : {fileName:targetFile, type:type},
			dataType : 'text',
			success : function(result){
				alert(result);
				
			}
			
		})
		
		// span 의 x 를 눌렀을 때 file 이면 li 태그 제거
		if(type == "file") {
			
			$(this).closest("li").remove();
			
		}
		
		// span 의 x 를 눌렀을 때 image 이면 class="col" 인 div 태그 제거
		if(type == "image") {
			
			$(this).parents("div[class='card']").remove();
			
		}
				
	})	
	/* /.업로드 파일 삭제 */

	
		var registerForm = $(".registerForm");
			
		$(".registerBtn").on("click", function(e) {
			
			e.preventDefault();
						
			// console.log(registerForm.find(".purposeBox").val());
			
			if(registerForm.find(".purposeBox").val() == "N") {
				
				alert("Please choose purpose of board.");
				return false;
				
			}
			
		registerForm.submit();

		}); // end $(".registerBtn").on()
		
		
		// list 화면으로 돌아가기
		$(".listBtn").on("click", function() {
			
			self.location = "/bulletin/bulletinList";
							
		})
		
					
	}); // end $(document).ready()
	
	
	/* $(document).ready() 안에서 on("click") 이벤트로 function 을
		실행할 경우 이벤트가 한 번만 실행되고 그 뒤로는 이벤트가 실행되지 않았음
		-> $(document).ready() 밖에 function 을 선언하고 실행은 해당 tag 내에
			onclick 속성을 주어서 function 을 실행하니 해결 */
	function fileUpload() {
		
		console.log("clicked");
		
		//e.preventDefault();
		
		// form tag 없이 form 보내기
		let formData = new FormData();
		
		// input tag 가져오기
		let file = $("input[name='attachFile']");
		let files = file[0].files;
		
		if (files.length > 0) {
								
			// formData 에 파일 추가
			for(let i = 0; i < files.length; i++) {
				// 파일 검사 중에 false 가 나오면 파일 업로드 중단
				if(checkFile(files[i].name, files[i].size) == false) {
					
					return false;
					
				}
								
				formData.append("uploadFile", files[i]);
				
			}
			
			
			/* File upload and initialize input tag */
			$.ajax({
				url: "/uploadAjaxAction",
				processData: false,
				// 데이터 속성이 query string 으로 변경되지 않게 false
				contentType: false,
				// contentType: false -> multipart
				data: formData,
				type: "POST",
				success: function(result) {
					
					alert(result);
					
					// li tag 추가
					showUploadFile(result);
					
					// 요청 보내고 성공하면 input tag initialize
					// 밸류창 비우기
					$(".uploadDiv").html(cloneObj.html());
					
				}
			
			})
			
		} else {
			
			alert("Please select files!!");
			
		}
		
		
	}
	
	// 파일 확장자 제한
	let regex = new RegExp("(.*?)\(exe|sh|zip|alz)$");
	
	let maxSize = 5242880; // 파일 크기 5 mb 로 제한
	
	/* inpect files */
	function checkFile(fileName, fileSize) {
		// 파일 크기 검사
		if(fileSize > maxSize) {
			
			alert("파일 최대 크기 초과");
			return false;
			
		}
		
		// 파일 확장자 검사 ( 정규식과 파일 이름이 일치하는 패턴이면 false)
		if(regex.test(fileName)) {
			
			alert("해당 종류의 파일은 업로드 불가");
			return false;
			
		}
		
		return true;
		
	}		
	
	
	/* upload file and show */				
	var cloneObj = $(".uploadDiv").clone();
	
	var uploadResult = $("#uploadResult");
	
		
function showUploadFile(uploadArr) {			
	
	let uploadHtml = "";			
	
	// 업로드 파일
	for(let i = 0; i < uploadArr.length; i++) {
		
		if(uploadArr[i].imageChecker == "false") {
			// 이미지 파일이 아님
			// li tag 앞에 파일 아이콘
			let fileCallPath = encodeURIComponent("/" + uploadArr[i].uuid
					+ "_" + uploadArr[i].fileName);
			
			uploadHtml += 	"<div class='card' style='width: 5rem;''>";				
			uploadHtml +=			"<span data-file=\'" + fileCallPath + "\' data-type='file'>"
			uploadHtml +=		  	" x </span>"
			uploadHtml +=			"<img src='/resources/img/file_icon2.png' class='card-img-top' data-bs-toggle='popover' title='"
			uploadHtml += 			uploadArr[i].fileName + " data-bs-content='And here\'s some amazing content. It's very engaging. Right?'>";
			uploadHtml +=			"<input type='hidden' name='fileName' value='" + uploadArr[i].fileName + "' />"
			uploadHtml +=			"<input type='hidden' name='uuid' value='" + uploadArr[i].uuid + "' />"
			uploadHtml +=			"<input type='hidden' name='imageChecker' value='" + uploadArr[i].imageChecker + "' />"
			uploadHtml +=		"</div>"
								
		} else {
			// 이미지 파일
			// use thumbnail image
			let fileCallPath = encodeURIComponent("/s_" + uploadArr[i].uuid
					+ "_" + uploadArr[i].fileName);
			
			let originPath = uploadArr[i].uuid + "_" + uploadArr[i].fileName;
			
			originPath = originPath.replace(new RegExp(/\\/g), "/");
						
			uploadHtml += 	"<div class='card' style='width: 5rem;''>";				
			uploadHtml +=			"<span data-file=\'" + fileCallPath + "\' data-type='file'>"
			uploadHtml +=		  	" x </span>"
			uploadHtml +=			"<img src='/display?fileName=" + fileCallPath + "' class='card-img-top' data-bs-toggle='popover' title='"
				uploadHtml += 			uploadArr[i].fileName + " data-bs-content='And here\'s some amazing content. It's very engaging. Right?'>";
			uploadHtml +=			"<input type='hidden' name='fileName' value='" + uploadArr[i].fileName + "' />"
			uploadHtml +=			"<input type='hidden' name='uuid' value='" + uploadArr[i].uuid + "' />"
			uploadHtml +=			"<input type='hidden' name='imageChecker' value='" + uploadArr[i].imageChecker + "' />"
			uploadHtml +=		"</div>"
			
		}
		
	}
	
	console.log(uploadHtml)
					
	uploadResult.append(uploadHtml);
	
} // end function showUploadFile()
	
</script>

<script type="text/javascript" src="/resources/js/app.js"></script>


<%@ include file="../includes/footer.jsp" %>
