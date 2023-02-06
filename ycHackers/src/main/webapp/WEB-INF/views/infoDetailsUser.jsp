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
<title>infoDetailsUser</title>
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
<!--this page-->
<link rel="stylesheet" href="style/infoDetailsUser.css"/>
</head>
<body>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<div id="infoDetails" class="infoBox ${infoDetailsUser.infoType}B">
	<div id="infoType">
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
	<div id="infoNum" class="infoSpace">no.${infoDetailsUser.infoNum}</div>
	<div id="infoDate" class="infoSpace">작성된 날짜: ${infoDetailsUser.infoUpdateDate}</div>
	<div id="infoAuthor" class="infoSpace">작성자: ${infoDetailsUser.infoAuth}(${infoDetailsUser.infoAuthor})</div>
	<div id="infoTitle" class="infoSpace">${infoDetailsUser.infoTitle}</div>
	<div id="infoContent" class="infoSpace">${infoDetailsUser.infoContent}</div>
	<hr/>
	<form id="infoReply" action="infoBoardReply?infoGroup=${infoDetailsUser.infoGroup}&&infoAuthor=${user_id}">
		<div class="form-group">
			<label for="infoReplyInput">${user_id}</label>
			<textarea id="infoReplyInput" class="form-control" name="infoContent" rows="5" cols="20" placeholder="댓글 입력"></textarea>
		</div>
		<input type="hidden" name="infoAuthor" value="${user_id}"/>
		<input type="hidden" name="infoTitle" value="${infoDetailsUser.infoNum}의 댓글"/>
		<input type="hidden" name="infoGroup" value="${infoDetailsUser.infoNum}"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<button type="submit" id="replyBtn" class="btn btn-secondary">댓글</button>
	</form><!--db저장과 함께 javascript로 바로 띄우기-->
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
</body>
</html>