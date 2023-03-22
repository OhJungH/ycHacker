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
<title>JSP</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- custom style sheet -->
<link rel="stylesheet" href="style/myPageView.css"/>
</head>
<body>

<div class="myPageContainer" id="myPage">
	<div class="box user">
		<a class="userInfo" href="userInfoView?userNum=${userDataDto.userNum}" id="userInfo">회원정보</a>		
	</div>
	<div class="box res">
		<a class="resInfo" href="myResInfoView" id="resInfo">예약정보</a>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#userInfo").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : $("#userInfo").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	});
	$("#resInfo").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : $("#resInfo").attr("href"),
			type : "get",
			data : "",
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