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
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<title>공지사항 입력</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
<link rel="stylesheet" href="style/infoBoardWriteForm.css"/>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
	<sec:authentication property="principal.authorities" var="user_authority"/>
</sec:authorize>
<h3 class="title">안내사항 작성하기</h3>
<hr/>
<div id="infoWritePrecautions">
<h5>작성시 주의사항</h5>
	<p>1. 안내사항의 게시판 종류를 선택해주세요.</p>
	<p>2. 제목을 적어주세요.</p>
	<p>3. 내용은 이해하기 쉽게 여러 미디어와 함께 적어주세요.</p>
	<p>4. 바로 게시할지 아니면 저장만 해두고 나중에 게시할지 선택해주세요. </p>
	<p>5. 모든 내용이 정확하게 들어갔는지 확인한 뒤 체크박스를 눌러주세요. </p>
	<p>6. 점검이 끝났다면 내용을 저장/게시해주세요. </p>
</div>
<div id="infoWriteContainer">
	<form id="infoWriteFrm" name="infoWriteFrm" action="infoWrite" method="post" enctype="multipart/form-data">
		<input name="${_csrf.parameterName}" value="${_csrf.token}" type="hidden">
		<input type="hidden" name="infoNum" value=0/>
		<p>
			<i class="fa-play fas"></i>
			게시판 분류
		</p>
		<div class="form-check-inline infoType">
			<label for="infoType1" class="form-check-label">
				<input id="infoType1" name="infoType" value="info" type="radio" class="form-check-input"/>
				<span id="infoType1Span">공지사항</span>
			</label>
		</div>
		<div class="form-check-inline infoType">
			<label for="infoType2" class="form-check-label">
				<input id="infoType2" name="infoType" value="result" type="radio" class="form-check-input" />
				<span id="infoType2Span">신고처리</span>
			</label>
		</div>
		<div class="form-check-inline infoType">
			<label for="infoType3" class="form-check-label">
				<input id="infoType3" name="infoType" value="event" type="radio" class="form-check-input"/>
				<span id="infoType3Span">이벤트</span>
			</label>
		</div>
		<input type="hidden" name="infoAuthor" value="${user_id}"/>
		<input type="hidden" name="infoAuth" value="${user_authority}"/>
		<div class="form-group">
			<label for="infoTitle">
				<i class="fa-play fas"></i>
				제목
			</label>
			<input id="infoTitle" name="infoTitle" type="text" class="form-control" required/>
		</div>
		<!-- content input(display none) -->
		<div class="form-group d-none">
			<textarea class="form-control ck-content" id="infoContent" name="infoContent" required></textarea> 
		</div>
		<!-- info content preview -->
		<div class="contentPreviewContainer">
			<p class="previewLabel">
				<i class="fa-play fas"></i>내용
			</p>
			<div id="toolbar-container"></div>
			<div id="infoEditor" class="ck-content"></div>
		</div>
		<button id="editSub" type="submit" value="ckedit" style="visibility:hidden;">edit</button>
		<p>
			<i class="fa-play fas"></i>
			바로 게시하시겠습니까?
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
		<input type="checkbox" id="submitCheck" required/>
		<label for="submitCheck">
			모든 내용을 확인했습니다.
		</label>
		<p id="validateM">저장하지 않고 페이지를 벗어나면 작성한 내용이 사라집니다!!</p>
		<!-- validation button(CK editor > validation > submit) -->
		<button id="editBtn" class="btn btn-outline-warning" type="button">저장/게시하겠습니다.</button>
		<!-- invisible button -->
		<button id="checkBtn" class="d-none" type="submit"></button>
		<button id="submitBtn" class="d-none" type="submit"></button>
	</form>
</div>

<!-- custom script files -->
<script src="js/infoBoardWRadioStyle.js"></script>
<script src="js/infoBoardWValidation.js"></script>
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
	//submit
	$("#infoWriteFrm").submit(function(e){
		e.preventDefault();
		$.ajax({
			url:$("#infoWriteFrm").attr("action"),
			type:"post",
			data:$("#infoWriteFrm").serialize(),
			success : function(data) {
				console.log(data);
				$("#adminContainer").html(data);
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
		setTimeout(function(){
			$("#checkBtn").trigger("click");
		},1000);
	}

	document.querySelector("#editBtn").addEventListener("click",beforeSub);

	//submit할때 confirm
	let fCon=false;
	document.getElementById("checkBtn").addEventListener("click",(e)=>{
		e.preventDefault();
		if(validateData()){
			fCon=confirm("입력내용을 저장하시겠습니까?");
		}else{
			alert("내용을 다시 확인해주세요");
			return false;
		}
		if(document.querySelector("input[id=submitCheck]:checked")==null||document.querySelector("input[id=submitCheck]:checked")==""){
			alert("내용을 확인하고 체크박스를 눌러주세요.");
			return false;
		}
		
		console.log("fCon: "+fCon);
		if(fCon){
			console.log("ajax: infoWriteFrm.submitBtn");
//			document.cookie = "SameSite=None; Secure";
			//여기에 ajax처리
			document.querySelector("#submitBtn").click();
		}else{
			console.log("사용자가 제출을 거부");
			document.querySelector("#validateM").innerHTML="제출을 거부했습니다.";
		}


	});

});
</script>

</body>
</html>