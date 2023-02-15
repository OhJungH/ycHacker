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
<title>infoReplyListAdmin</title>
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

<div id="replyContainer">
	<h3>${infoNum}번 글의 댓글</h3>
	<c:forEach items="${infoReplyList}" var="replyDto">
		<div class="replyBox">
			<div class="replyAuthor">
				댓글 작성자: 
				${replyDto.infoAuthor}(${replyDto.infoAuth})
			</div>
			<div class="replyDate">
				작성일시: ${replyDto.infoDate}
			</div>
			<a id="id${replyDto.infoAuthor}" href="replyDelete?infoNum=${infoDetailsUser.infoNum}&&replyNum=${replyDto.infoNum}" class="replyDelete btn btn-outline-danger">&times;</a>
			<div class="replyContent">
				${replyDto.infoContent}
			</div>

		</div>
		<hr/>
	</c:forEach>
</div>
<script>
$(document).ready(function(){
	/*reply delete*/
	$(".replyDelete").click(function(e){
		e.preventDefault();
		let thisE=$(e.target);
		let userConfirm = confirm("이 댓글을 삭제하시겠습니까?");
		if(userConfirm){
			let thisURL = thisE.attr("href");
			$.ajax({
				url:thisURL,
				type:"get",
				success:function(data){
					$("#mainRagion").html(data);
				},
				error:function(){
					alert("서버 에러");
				}
			});
		}
	});
});
</script>

</body>
</html>