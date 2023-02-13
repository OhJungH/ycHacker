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
	<!--db저장과 함께 javascript로 바로 띄우기-->
	<form id="infoReply" action="infoReply" method="post">
		<div class="form-group">
			<label for="infoReplyInput">${user_id}</label>
			<textarea name="infoContent" id="infoReplyInput" maxlength="600" class="form-control" placeholder="댓글은 10분마다 한건씩, 최대 500자까지만 입력할 수 있습니다."></textarea>
		</div>
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
		<input name="infoAuthor" type="hidden" id="userID" value="<c:out value='${user_id}'/>" />
		<input name="infoAuth" type="hidden" value="<c:out value='${user_authority}'/>" />
		<input name="infoTitle" type="hidden" value="*#reply:${infoDetailsUser.infoNum}"/>
		<input name="infoGroup" type="hidden" value="${infoDetailsUser.infoNum}" />
		<button type="submit" id="submitBtn" class="d-none"></button>
	</form>
	<a id="replyBtn" href="infoReplyTerm" class="btn btn-outline-dark btn-block">
		<span id="buttnTxt">댓글 달기</span>
	</a>
	<hr/>
	<div id="replyContainer"></div>
</div>  
<!-- submit -->
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
//입력한 시간 중 10분이내 기록이 있으면 사용불가 기능
$(document).ready(function(){
	$("#replyBtn").click(function(e){
		e.preventDefault();
		let url = "infoReplyTerm?infoAuthor=";
		let query = $("#userID").val();
		url+=query;
		console.log("url check: "+url);
		
		$.ajax({
			url:url,
			type:"get",
			success:function(data){
				if(data.search("dataIsNull") > -1){
					console.log("10분 내 기록 없음.");
					setTimeout(()=>{
						$("#submitBtn").click();
					},1500);
				}
				else { 
					//Recently Objects Within 10 Minutes
					let reply = new Date(data);
					let countdown;
					function time(){
						countdown= setInterval(termCheck,1000);
						$("#buttnTxt").text("댓글 달기");
					}
					time();
				}
				function termCheck(){
					let now = new Date();
					let timeCount=new Date(now-before);
					let mm=timeCount.getMinutes();
					let ss=timeCount.getSeconds();
					if(mm>=10){
						$("#buttnTxt").text("댓글 달기");
						clearInterval(countdown);
					}
					else if(mm<10){
						mm=String(9-mm).padStart(2,"0");
						ss=String(59-ss).padStart(2,"0");
						if(ss=="00")console.log("waiting time: "+mm+":"+ss);
						if(ss=="00"&&mm=="00")console.log("end of waiting time: "+mm+":"+ss);
						$("#buttnTxt").text("남은 시간: "+mm+":"+ss);
					}
				}
			},
			error:function(){
				alert("서버 에러");	
			}
		});
	});
});


</script>
</body>
</html>