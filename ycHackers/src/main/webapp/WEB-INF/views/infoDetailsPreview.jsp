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
<title>공지글 표시 </title>
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
<link rel="stylesheet" href="style/infoDetailsPreview.css"/>
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
			<textarea id="infoReplyInput" class="form-control" name="infoContent" rows="5" cols="20" placeholder="댓글 입력" readonly></textarea>
		</div>
		<button type="button" id="replyBtn" class="btn btn-secondary btn-block">유저들이 보는 페이지 형식입니다</button>
	</form>
	<a id="infoModifylink" class="btn btn-block btn-warning" href="infoModifyView?infoNum=${infoDetailsUser.infoNum}">수정/삭제하기</a>
</div>            

<script>
$(document).ready(function(){
	$("#infoModifylink").click(function(e){
		e.preventDefault();
		let thisE = $(e.target);
		$.ajax({
			url:thisE.attr("href"),
			type:"get",
			success : function(data) {
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	});

});
</script>
</body>
</html>