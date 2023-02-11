<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
<div>
	<form action="resDelete" method="post" id="resDeleteFrm">
		<div class="form-group text-center text-info threeDEffect">
			<label for="resNum">회원번호</label>
			<input type="text" id="resNum" name="resNum" value="${resDto.resNum}" style="width:500px;" readonly>
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resName">이름</label>
			<input type="text" id="resName" name="resName" value="${resDto.resName}" style="width:500px;" readonly>
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resBirth">생년월일</label>
			<input type="date" id="resBirth" name="resBirth" value="${resDto.resBirth}" style="width:500px;" readonly>
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resPhone">연락처</label>
			<input type="text" id="resPhone" name="resPhone" value="${resDto.resPhone}" style="width:500px;" readonly>
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resDate">예약날짜</label>
			<input type="date" id="resDate" name="resDate" value="${resDto.resDate}" style="width:500px;" readonly>
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resTime">예약시간</label>
			<input type="text" id="resTime" name="resTime" value="${resDto.resTime}" style="width:500px;" readonly>
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resMember">인원</label>
			<input type="text" id="resMember" name="resMember" value="${resDto.resMember}" style="width:500px;" readonly>
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="payments">결제</label>
			<input type="text" id="payMents" name="payMents" value="${resDto.payMents}" style="width:500px;" readonly>
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="cafePhone">카페번호</label>
			<input type="text" id="cafePhone" name="cafePhone" value="${resDto.cafePhone}" style="width:500px;" readonly>
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resComments">요청사항</label>
			<input type="text" id="resComments" name="resComments" value="${resDto.resComments}" style="width:500px;" readonly>
		</div>

		<div style="text-align:center;">
			<a type="submit" class="btn btn-danger" id="deleteBtn" href="myResInfoView?resNum=${resDto.resNum}">취소하기</a>
			<a class="btn btn-warning">이전으로</a>
		</div>
	</form>
</div>

<script>
$(document).ready(function(){
	$("#deleteBtn").click(function(event){
		event.preventDefault();
		let thisE = $(event.target);
		$.ajax({
			url:thisE.attr("href"),
			type:"get",
			success : function(data) {
				alert("예약 취소 되었습니다.");
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("error");
			}
		});
	});
});
</script>
</body>
</html>