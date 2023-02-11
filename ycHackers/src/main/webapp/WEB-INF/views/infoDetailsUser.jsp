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
	<sec:authentication property="principal.authorities" var="user_authority"/>
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
	<form id="infoReply" action="infoBoardReply">
		<div class="form-group">
			<label for="infoReplyInput">${user_id}</label>
			<textarea id="infoReplyInput" maxlength="600" class="form-control" name="infoContent" placeholder="댓글은 10분마다 한건씩, 최대 500자까지만 입력할 수 있습니다."></textarea>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="infoAuthor" id="userID"value="<c:out value='${user_id}'/>" />
		<input type="hidden" name="infoAuth" value="<c:out value='${user_authority}'/>" />
		<input type="hidden" name="infoTitle" value="*#reply:${infoDetailsUser.infoNum}"/>
		<input type="hidden" name="infoGroup" value="${infoDetailsUser.infoNum}"/>
		<button type="submit" id="submitBtn" class="d-none"></button>
		<button type="button" id="replyBtn" class="btn btn-outline-dark btn-block">댓글</button>
	</form><!--db저장과 함께 javascript로 바로 띄우기-->
	<hr/>
	<div id="replyContainer"></div>
</div>  
<!-- reply data -->
<script>
//num:nextVal, type: reply, condition: -10, date: now()
$(document).ready(function(){
	$("#infoReply").submit(function(e){
		e.preventDefault();
		$.ajax({
			url:$("#infoReply").attr("action"),
			type:"post",
			data:$("#infoReply").serialize(),
			success:function(data){
				$("#mainRagion").html(data);
			},
			error:function(){
				alert("서버 에러");
			}
		});
	});
});
</script>

<!-- reply -->          
<script>
document.querySelector("#replyBtn").addEventListener("click",(e)=>{
	e.preventDefault();
	//입력한 시간 중 10분이내 기록이 있으면 사용불가 기능
	let userId=document.getElementById("userID").value;
	let replyTermURL="infoReplyTerm?infoAuthor="+userID;
	setTimeout(()=>{
		$.ajax({
			url: replyTermURL,
			type:"post",
			success:function(data){
				if(data.contain("dataIsNull")){
					//10분 입력 제한 확인 후 처리  
					let replyContent=document.getElementById("infoReplyInput");
					if(replyContent==null){
						alert("입력할 내용이 없습니다.");
						return false;
					}
					else if(replyContent==""||replyContent==" "||replyContent=="  "||replyContent=="   "){
						alert("입력할 내용이 없습니다.");
						return false;
					}
					else{
						document.querySelector("#submitBtn").click();
					}
				}
				else{
					alert("10분이내에 다시 댓글을 입력할 수 없습니다. 마지막입력시간: ");
					return false;
				}
			},
			error: function(){
				alert("서버 에러");
				return false;
			}
		});
	}, 0);
});
</script>
</body>
</html>