<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<title>infoModifyView</title>
<!--jquery 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>-->
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--font awesome icon 5.7-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- custom style sheet -->
<link rel="stylesheet" href="style/infoModifyView.css"/>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
	<sec:authentication property="principal.authorities" var="user_authority"/>
</sec:authorize>
<div id="infoModifyViewContainer">
	<div id="infoModify" class="infoModifyBlock">
		<form id="infoModifyFrm" name="infoModifyFrm" action="infoModify" method="post">
			<input type="hidden" name="csrf" value=""/>
			<input type="hidden" name="infoNum" value="${infoModifyDto.infoNum}"/>
			<input type="hidden" name="infoUpdateDate" value="Date()"/><!--javascript today()-->
			<!-- table: infoNum, 이전 작성자(Author)와 권한(Auth), 최근 수정일(UpdateDate), 조회수(infoHit) -->
			<div class="form-group">
				<label for="infoAuthor">변경될 작성자</label>
				<input class="form-control" id="infoAuthor" name="infoAuthor" type="text" readonly value="${user_id}"/>
				<label for="infoAuth">권한</label>
				<input class="form-control" id="infoAuth" name="infoAuth" type="text" readonly value="${user_authority}"/>
			</div>
			<div class="form-group">
				<label for="infoTitle">제목</label>
				<input class="form-control" id="infoTitle" name="infoTitle" type="text" value="${infoModifyDto.infoTitle}"/>
			</div>
			<!-- content input(display none) -->
			<div class="d-none">
				<textarea class="ck-content" id="infoContent" name="infoContent" required></textarea> 
			</div>
			<!-- info content preview -->
			<div class="contentPreviewContainer">
				<p class="previewLabel">내용</p>
				<div id="toolbar-container"></div>
				<div id="infoEditor" class="ck-content">${infoModifyDto.infoTitle}</div>
			</div>
			<button id="editSub" type="submit" value="ckedit" style="visibility:hidden;">edit</button>
			<div>
				<p>
					게시여부
				</p>
				<div id="infoCon1" class="infoCon form-check-inline">
					<label for="infoCondition1" class="form-check-label">
						<input id="infoCondition1" name="infoCondition" value="display" type="radio" class="form-check-input"/>
						네. 바로 게시하겠습니다.
					</label>
				</div>
				<div id="infoCon2" class="infoCon form-check-inline">
					<label for="infoCondition2" class="form-check-label">
						<input id="infoCondition2" name="infoCondition" value="display-none" type="radio" class="form-check-input"/>
						아니요. 저장만하겠습니다.
					</label>
				</div><hr/>
			</div>
			<div>
				<input type="checkbox" id="submitCheck" required/>
				<label for="submitCheck">
					모든 내용을 확인했습니다.
				</label>
				<p id="validateM">저장하지 않고 페이지를 벗어나면 작성한 내용이 사라집니다!!</p>
			</div>
			<!-- invisible button -->
			<button id="checkBtn" class="d-none" type="submit"></button>
			<!-- button -->
			<button id="previewBtn" class="btn btn-outline-success">미리보기</button>
			<!-- save button(CK editor > validation > submit) -->
			<button id="editBtn" class="btn btn-outline-warning" type="button">저장/게시하겠습니다.</button>
			<a id="deleteBtn" class="btn btn-danger" href="infoDelete?infoNum=${infoModifyDto.infoNum}">삭제하기</a>
		</form>
	</div>
</div>
<button id="infoModalBtn" type="button" class="d-none" data-toggle="modal" data-target="#infoModal"></button>
<!-- 공지게시판 modal-->
<div class="modal" id="infoModal">
	<div id="infoModalDialog" class="modal-dialog modal-dialog-scrollable modal-xl">
		<div id="infoModalContent" class="modal-content">
        	<!-- 미리보기 -->
			<div id="infoModifyPreview" class="infoModifyBlock">
				<div id="infoDetails" class="infoBox ${infoModifyDto.infoType}B">
					<span class="bg-danger">미리보기</span>
					<div id="infoTypeP">
						<c:choose>
							<c:when test="${infoDetailsUser.infoType  eq 'info'}">
								<span class="badge badge-info">공지사항</span>
							</c:when>
							<c:when test="${infoDetailsUser.infoType eq 'result'}">
								<span class="badge badge-danger">신고처리</span>
							</c:when>
							<c:when test="${infoDetailsUser.infoType eq 'event'}">
								<span class="badge badge-success">이벤트</span>
							</c:when>
						</c:choose>
					</div>
					<div id="infoNumP" class="infoSpace">
						no.${infoModifyDto.infoNum}
					</div>
					<div id="infoDateP" class="infoSpace">
						작성된 날짜: 
					</div>
					<div id="infoAuthorP" class="infoSpace">	
						작성자: 
					</div>
				<div id="infoTitleP" class="infoSpace"></div>
				<div id="infoContentP" class="infoSpace"></div>
				<hr/>
				<form id="infoReply" action="infoBoardReply">
					<div class="form-group">
						<label for="infoReplyInput">[user_id]</label>
					<textarea id="infoReplyInput" class="form-control" name="infoContent" rows="5" cols="20" placeholder="댓글 입력" readonly></textarea>
				</div>
				<button type="button" id="replyBtn" class="btn btn-outline-dark btn-block">유저들이 보는 페이지 형식입니다</button>
			</form>
		</div>            
	</div>
        	
		</div>
	</div>
</div>
<!-- custom script files -->
<script src="js/infoBoardMRadioStyle.js"></script>
<script src="js/infoBoardMValidation.js"></script>
<!-- CK editor module -->
<script type="module">	
 DecoupledEditor
    .create( document.querySelector('#infoEditor'),{    	    	
    	language: 'ko',	       	    	
    	ckfinder: { //이미지 처리 모듈
	   		uploadUrl: 'infoCKedit' //요청경로	   		
	   	},//기능 버튼 선택
	   	toolbar: ['ckfinder', '|','imageUpload', '|', 'heading', '|', 'bold', 'italic','link', 'bulletedList',
	   		'numberedList', 'blockQuote', '|', 'undo','redo','Outdent','Indent','fontsize',
	   		'fontfamily','insertTable','alignment', '|', 'fontColor', 'fontBackgroundColor']			
    })       
    .then(function(editorD) {
    	//window.editorResize = editor;
    	const toolbarContainer = document.querySelector( '#toolbar-container' );
        toolbarContainer.appendChild( editorD.ui.view.toolbar.element );        
    });
</script>
<script>    
$(document).ready(function(){
	//submit button click
	$("#infoModifyFrm").submit(function(e){
		e.preventDefault();
		$.ajax({
			url:$("#infoModifyFrm").attr("action"),
			type:"post",
			data:$("#infoModifyFrm").serialize(),
			success : function(data) {
				console.log("저장 완료.");
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	});
	
	//button > CKeditor > validation > submit
	function beforeSub(){
		$("#infoEditor svg").remove();
		let contentVal = $("#infoEditor").html();
		$("#infoContent").html(contentVal);
		$("#infoContentP").html(contentVal);
		setTimeout(function(){
			$("#checkBtn").trigger("click");//second: checkBtn
		},1000);
	}
	//first: editBtn
	document.querySelector("#editBtn").addEventListener("click",beforeSub);

	//submit할때 confirm
	let fCon=false;
	document.getElementById("checkBtn").addEventListener("click",(e)=>{
		e.preventDefault();
		if(validateData()){//third: function-validateData
			fCon=confirm("입력내용을 저장하시겠습니까?");
		}else{
			alert("내용을 다시 확인해주세요");
			return false;
		}
		if(document.querySelector("input[id=submitCheck]:checked")==null||document.querySelector("input[id=submitCheck]:checked")==""){
			alert("내용을 확인하고 체크박스를 눌러주세요.");
			return false;
		}
		
		console.log("fCon: "+fCon);//final: confirm
		if(fCon){
			console.log("ajax: infoModifyFrm.submitBtn");
			document.querySelector("#submitBtn").click();
		}else{
			console.log("사용자가 제출을 거부");
			document.querySelector("#validateM").innerHTML="제출을 거부했습니다.";
		}
	});

});
</script>
<script>

</script>
</body>
</html>