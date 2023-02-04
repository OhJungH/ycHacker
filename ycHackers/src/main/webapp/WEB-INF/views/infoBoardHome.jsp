<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<title>information at home</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" />
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<!--custom Style-->
    <link rel="stylesheet" href="style/home.css"/>
    <link rel="stylesheet" href="style/footer.css"/>
    <link rel="stylesheet" href="style/infoBoardHome.css"/>
</head>
<body>

<div id="homeInfoContainer">
    <a class="btn btn-block" id="homeBar" href="home">홈으로</a>
    <div class="homeTitle">
            <h1>안 내 사 항</h1><hr style="margin: 0;">
			<p style="color: chocolate;font-size: 0.8rem;">
				로그인을해야 댓글을 사용할 수 있습니다.
			</p>
    </div>
	<div class="card-columns infoCardDeck">
		<c:forEach items="${infoHomeList}" var="dto">
			<div class="card infoCard introCard${dto.infoType}">
				<div class="card-body text-center infoCardBody">
					<c:choose>
						<c:when test="${dto.infoType  eq 'info'}">
							<span class="badge badge-info">공지사항</span><br/>
						</c:when>
						<c:when test="${dto.infoType eq 'result'}">
							<span class="badge badge-danger">신고처리</span><br/>
						</c:when>
						<c:when test="${dto.infoType eq 'event'}">
							<span class="badge badge-success">이벤트</span><br/>
						</c:when>
					</c:choose>
					<h4 class="d-inline">${dto.infoNum}. ${dto.infoTitle}(${dto.infoIndent})</h4><br/>
					<span class="card-text">조회수(${dto.infoHit})</span><br/>
					<a href="infoDetailsHome?infoNum=${dto.infoNum}" class="infoDetails card-link stretched-link">내용보기</a>				
				</div>	
			</div>
		</c:forEach>
	</div>
</div>
<div id="footer">
	<div class="footerBox">
	<p id="footerPageName" class="footerLabel">YCHackers</p>
	<p id="footerCompany">
		<span class="footerLabel">회사명</span> (사)양천구해커스
	</p>
	<p id="footerCompanyNum">
		<span class="footerLabel">사업자번호</span> 000-00-00000
	</p>
	<p id="footerAddress">서울특별시 양천구 신정동 1319-4 양천중앙도서관 </p>
		<a class="footerLink" id="companyIntro" href="companyIntro">회사소개</a>&emsp; 
		<a class="footerLink" id="termsOfService" href="termsOfService">서비스이용약관</a> &emsp;
		<a class="footerLink" id="privacyPolicy" href="privacyPolicy">개인정보처리방침</a>
	</div>
	<div class="footerBox">
		<p>
			<span class="footerLabel">등록문의</span> 000-0000-0000
		</p>
		<p>
			<span class="footerLabel">기타문의</span> 000-0000-0000
		</p><br/><br/>
		<p>
			1553<span id="footerCopy">COPYRIGHT &copy; 2022(주)양천구해커스 ALL RIGHTS RESERVED</span>
		</p>
	</div>
</div>
<button id="infoModalBtn" type="button" class="d-none" data-toggle="modal" data-target="#infoModal"></button>
<!-- 공지게시판 modal-->
<div class="modal" id="infoModal">
    <div id="infoModalDialog" class="modal-dialog modal-dialog-scrollable modal-xl">
        <div id="infoModalContent" class="modal-content">
		</div>
	</div>
</div>

<!-- CK editor module -->
<script type="module">	
 DecoupledEditor
    .create(document.querySelector('#ckeditor'),{    	    	
    	language: 'ko',	       	    	
    	ckfinder: {
	   		uploadUrl: 'ckedit' 		
	   	},
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
	const infoBtn=document.querySelector("#infoModalBtn");
	$(".infoDetails").click(function(e){
		e.preventDefault();
		let thisE = $(e.target);
		let url = thisE.attr("href");
		
		$.ajax({
			url:url,
			type:"get",
			success: function(data){
				$("#infoModalContent").html(data);
				infoBtn.click();
			}
		});
	});
});
</script>
</body>
</html>