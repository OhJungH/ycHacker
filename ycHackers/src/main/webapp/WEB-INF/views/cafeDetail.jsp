<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
ul li {
margin-left:40px;
}
.userinfo {
 margin-top:50px; margin-left: 400px; float:left;
}
</style>

</head>
<body>

<div style="margin-left:50px; float:left;">
	<h1 style="float:left;">${cafeDetail.cafeName}</h1><h3>연 락 처${cafeDetail.cafeTel}</h3>
	  	<div id="demo" class="carousel slide" data-ride="carousel" style="width:850px; height:500px; margin-left:100px;">
	  		<div class="carousel-inner">
	  			<div class="carousel-item active">
	  				<img class="d-block w-100" src="https://images.pexels.com/photos/213399/pexels-photo-213399.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="First slide">
				</div>
	  			<div class="carousel-item">
	  				<img class="d-block w-100" src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Third slide">
				</div>
				
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				</a>
				<a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
				</a>  				
			</div>
			<br/><br/>
			<p>스터디룸 주소 : ${cafeDetail.cafeLocation}</p><br/>
			<p>이용 가능 인원 : ${cafeDetail.cafeMember}</p>
		<textarea style="margin-left:100px; margin-top:30px; resize:none; width:250px; height:200px;" readonly>${cafeDetail.cafeIntro}</textarea>
		</div>
</div>
	<div class="wrapper" style="margin-top:150px;">
		<table style="border:1px solid #333; border-top:none; border-right:none;">
			<tr>
				<th style="padding:10px;">스터디룸 선택</th>
				<th style="padding:10px;">10000원</th>
			</tr>
			<tr>
				<th style="padding:10px;">스터디룸1</th>
				<th style="padding:10px;">20000원</th>
			</tr>
			<tr>
				<th style="padding:10px;">스터디룸2</th>
				<th style="padding:10px;">30000원</th>
			</tr>
		</table>
		<a href="resFormView" id="resFormView">예약하기</a>
	</div>
<script>
$(document).ready(function(){
	$("#resFormView").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : $("#resFormView").attr("href"),
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