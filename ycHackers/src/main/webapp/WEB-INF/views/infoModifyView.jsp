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
	<div id="infoModify">
		<table id="infoModifyDataTBL" class="table">
			<!-- table: infoNum, 이전 작성자(Author)와 권한(Auth), 최근 수정일(UpdateDate), 조회수(infoHit) -->
			<thead>
				<tr>
					<th colspan="4">수정 전 내용</th>
					<th colspan="2">
						<a id="infoReplyAdmin" href="infoReplyAdmin?infoNum=${infoModifyDto.infoNum}" class="btn btn-outline-success btn-block">
							댓글확인
						</a>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="modifyHead">글 번호</td><td class="modifyData">${infoModifyDto.infoNum}</td>
					<td class="modifyHead">게시자</td><td class="modifyData">${infoModifyDto.infoAuthor}</td>
					<td class="modifyHead">권한</td><td class="modifyData">${infoModifyDto.infoAuth}</td>
				</tr>
				<tr class="rowF">
					<td colspan="2" class="modifyHead">최근 수정일</td><td colspan="2" class="modifyData">${infoModifyDto.infoUpdateDate}</td>
					<td class="modifyHead">조회수</td><td class="modifyData">${infoModifyDto.infoHit}</td>
				</tr>
			</tbody>
		</table>
		<form id="infoModifyFrm" name="infoModifyFrm" action="infoModify?infoNum=${infoModifyDto.infoNum}">
			<!--none-display input-->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input id="infoNum" type="hidden" name="infoNum" value="${infoModifyDto.infoNum}"/>
			<input id="infoType" type="hidden" name="infoType" value="${infoModifyDto.infoType}"/>
			<input  id="infoTempCondition" type="hidden" value="${infoModifyDto.infoCondition}"/>
			<div class="form-group inlineForm">
				<label for="infoAuthor">변경될 작성자</label>
				<input class="form-control" id="infoAuthor" name="infoAuthor" type="text" readonly value="${user_id}"/>
			</div>
			<div class="form-group inlineForm">
				<label for="infoAuth">권한</label>
				<input class="form-control" id="infoAuth" name="infoAuth" type="text" readonly value="${user_authority}"/>
			</div>
			<div class="form-group">
				<label for="infoUpdateDate">수정날짜</label>
				<input class="form-control" id="infoUpdateDate" type="date" name="infoUpdateDate"/>
				<!--javascript today()-->
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
				<div id="infoEditor" class="ck-content">${infoModifyDto.infoContent}</div>
			</div>
			<button id="editSub" type="submit" value="ckedit" style="visibility:hidden;">edit</button>
			<!--게시여부 체크-->
			<div>
				<p>게시여부</p>
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
			<div id="finalCheck">
				<input type="checkbox" id="submitCheck" required/>
				<label for="submitCheck">
					모든 내용을 확인했습니다.
				</label>
				<p id="validateM">저장하지 않고 페이지를 벗어나면 작성한 내용이 사라집니다!!</p>
			</div>
			<!-- invisible button -->
			<button id="checkBtn" class="d-none" type="button"></button>
			<button id="infoModifyBtn" class="d-none" type="submit"></button>
			<!-- visible button group -->
			<div id="frmBtnGroup" class="btn-group">
				<button id="previewBtn" class="frmBtn btn btn-outline-success">미리보기</button>
				<!-- save button(CK editor > validation > submit) -->
				<button id="editBtn" class="frmBtn btn btn-outline-warning" type="button">저장/게시하겠습니다.</button>
				<a id="deleteBtn" class="frmBtn btn btn-danger" href="infoDelete?infoNum=${infoModifyDto.infoNum}">삭제하기</a>
			</div>
		</form>
	</div>
</div>
<!-- preview modal-->
<button id="infoModalBtn" type="button" class="d-none" data-toggle="modal" data-target="#infoModal"></button>
<div class="modal" id="infoModal">
	<div id="infoModalDialog" class="modal-dialog modal-dialog-scrollable modal-xl">
		<div id="infoModalContent" class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<span id="modalName">미리보기</span>
					<button style="margin-left:2rem;" type="button" class="btn btn-dark" data-dismiss="modal">
						close
					</button>
				</h5>
			</div>
			<div class="modal-body">
				<!-- 미리보기 -->
				<div id="infoModifyPreview">
					<div id="infoDetails" class="infoBox ${infoModifyDto.infoType}B">
						<div id="infoTypeP"></div>
						<div id="infoNumP" class="infoSpace"></div>
						<div id="infoDateP" class="infoSpace"></div>
						<div id="infoAuthorP" class="infoSpace"></div>
						<div id="infoTitleP" class="infoSpace"></div>
						<div id="infoContentP" class="infoSpace"></div>
						<hr/>
						<form id="infoReply" action="infoBoardReply">
							<div class="form-group">
								<label for="infoReplyInput">[방문자 계정]</label>
								<textarea id="infoReplyInput" class="form-control" name="infoContent" placeholder="댓글 입력" readonly></textarea>
							</div>
							<button type="button" id="replyBtn" class="btn btn-outline-dark btn-block">댓글 입력</button>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-dark btn-block" data-dismiss="modal">
							close
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- custom script files -->
<script src="js/infoBoardMRadioStyle.js"></script>
<script src="js/infoBoardMValidation.js"></script>
<script>    
var updateDate=document.querySelector("#infoUpdateDate");
var updateDay;
function todayUpdate(){
	let today = new Date();
	const yyyy=String(today.getFullYear());
	const mm=String(today.getMonth()+1).padStart(2,"0");
	const dd=String(today.getDate()).padStart(2,"0");
	updateDay=yyyy+"-"+mm+"-"+dd;
	updateDate.value=updateDay;
}
function infoBoardCondition(){
	let condition=document.querySelector("#infoTempCondition").value;
	if(condition==="display"){
		document.querySelector("input[id='infoCondition1']").click();
	}
	else if(condition==="display-none"){
		document.querySelector("input[id='infoCondition2']").click();
	}
}
todayUpdate();
infoBoardCondition();

$(document).ready(function(){
	/*previewBtn*/
	document.getElementById("previewBtn").addEventListener("click",(e)=>{
		e.preventDefault();

		//input data into modal
		var data;
		var dataE;
			//infoNum
		data=document.querySelector("#infoNum").value;
		document.querySelector("#infoNumP").innerHTML="no. "+data;
			//infoType
		data=document.getElementById("infoType").value;
		if(data==="info"){
			dataE="<span class='badge badge-info'>공지사항</span>";
		}
		else if(data==="result"){
			dataE='<span class="badge badge-danger">신고처리</span>'
		}
		else if(data==="event"){
			dataE='<span class="badge badge-success">이벤트</span>'
		}
		else {
			dataE="data is null";
		}
		document.getElementById("infoTypeP").innerHTML=dataE;
			//update date
		dataE="작성된 날짜: "+updateDay;
		document.querySelector("#infoDateP").innerHTML=dataE;
			//Author(authority)
		let auth=document.querySelector("#infoAuth").value;
		if(auth.includes('ROLE_ADMIN')){
			auth="페이지 운영자";
		}
		else if(auth.includes('ROLE_MANAGER')){
			auth="카페 매니저";
		}
		let author=document.querySelector("#infoAuthor").value;
		dataE="작성자: "+author+"("+auth+")";
		document.querySelector("#infoAuthorP").innerHTML=dataE;
			//title
		data=document.getElementById("infoTitle").value;
		document.getElementById("infoTitleP").innerHTML=data;
			//content
		$("#infoEditor svg").remove();
		let contentVal = $("#infoEditor").html();
		$("#infoContentP").html(contentVal);

		//info check
		let fCon=false;
		if(validateData()){//third: function-validateData
			fCon=confirm("수정한 내용을 미리보기하시겠습니까?");
		}
		else{
			alert("내용을 다시 확인해주세요");
			return false;
		}
		if(document.querySelector("input[id=submitCheck]:checked")==null||document.querySelector("input[id=submitCheck]:checked")==""){
			alert("내용을 확인하고 꼭 체크박스를 눌러주세요.");
			return false;
		}
		console.log("fCon: "+fCon);
		//final: confirm
		//check result
		if(fCon){
			console.log("ajax: infoModifyFrm.submitBtn");
			document.querySelector("#infoModalBtn").click();
		}
		else{
			console.log("사용자가 거부");
			document.querySelector("#validateM").innerHTML="미리보기를 취소했습니다.";
		}
	});
	
	/*Ajax 처리*/
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
	$("#deleteBtn").click(function(e){
		e.preventDefault();
		let deleteConfirm= confirm("삭제하면 다시 복구할 수 없습니다. 그래도 삭제하시겠습니까?");
		if(deleteConfirm){
			$.ajax({
				url:$("#deleteBtn").attr("href"),
				type: "get",
				success : function(data) {
					$("#mainRagion").html(data);
				},
				error : function() {
					alert("에러입니다.");
				}
			});
		}else{
			alert("삭제를 취소합니다.");
			return false;
		}
	});
	$("#infoReplyAdmin").click(function(e){
		e.preventDefault();
		$.ajax({
			url:$("#infoReplyAdmin").attr("href"),
			type:"get",
			success : function(data) {
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
			fCon=confirm("수정한 내용을 저장하시겠습니까?");
		}else{
			alert("내용을 다시 확인해주세요");
			return false;
		}
		if(document.querySelector("input[id=submitCheck]:checked")==null||document.querySelector("input[id=submitCheck]:checked")==""){
			alert("내용을 확인하고 체크박스를 꼭 눌러주세요.");
			return false;
		}
		
		console.log("fCon: "+fCon);//final: confirm
		if(fCon){
			console.log("infoModifyFrm.infoModal");
			document.querySelector("#infoModifyBtn").click();
		}else{
			console.log("사용자가 제출을 거부");
			document.querySelector("#validateM").innerHTML="제출을 거부했습니다.";
		}
	});
});
</script>

<!-- CK editor-->
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

</body>
</html>