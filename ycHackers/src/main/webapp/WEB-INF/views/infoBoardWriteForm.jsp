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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	<form id="infoWriteFrm" name="infoWriteFrm" action="infowRite?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<div>
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
			<input type="hidden" name="infoAuthor" value="${username}"/>
			<div class="form-group">
				<label for="infoTitle">
					<i class="fa-play fas"></i>
					제목
				</label>
				<input id="infoTitle" name="infoTitle" type="text" class="form-control" required/>
			</div>
			<div class="form-group">
				<label for="infoContent">
					<i class="fa-play fas"></i>
					내용
				</label>
				<textarea class="form-control ck-content" id="infoContent" name="infoContent"></textarea> 
			</div>
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
		</div>
		<p id="validateM"></p>
		<button id="checkBtn" class="btn btn-outline-warning btn-block" type="button">저장/게시하겠습니다.</button>
		<button id="submitBtn" class="d-none" type="submit"></button>
	</form>
</div>

<!-- custom script files -->
<script src="js/infoBoardWRadioStyle.js"></script>
<script src="js/infoBoardWValidation.js"></script>

<script>    
//내용에 CKEditor => jsp에서	

//submit할때 confirm
let fCon=true;
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
	if(fCon){
		console.log("ajax: infoWriteFrm.submitBtn");//여기에 ajax처리(submitBtn으로
	}else{
		console.log("사용자가 제출을 거부");
		document.querySelector("#validateM").innerHTML="제출을 거부했습니다.";
	}
});
</script>

</body>
</html>