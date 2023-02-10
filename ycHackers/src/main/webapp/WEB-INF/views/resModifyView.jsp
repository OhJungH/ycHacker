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
<title>JSP</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- custom style -->
<link rel="stylesheet" href="style/top.css"/>
<link rel="stylesheet" href="style/footer.css"/>
</head>
<body>

<div class="resModifyContainer" id="resModifyContainer">
	<form action="resModify" method="post" id="resModify">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
			<input type="date" id="resDate" name="resDate" value="${resDto.resDate}" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resTime">예약시간</label>
			<input type="text" id="resTime" name="resTime" value="${resDto.resTime}" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resMember">인원</label>
			<input type="text" id="resMember" name="resMember" value="${resDto.resMember}" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="payments">결제</label>
			<input type="text" id="payMents" name="payMents" value="${resDto.payMents}" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="cafePhone">카페번호</label>
			<input type="text" id="cafePhone" name="cafePhone" value="${resDto.cafePhone}" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resComments">요청사항</label>
			<input type="text" id="resComments" name="resComments" value="${resDto.resComments}"  style="width:500px;">
		</div>
		
		<div class="buttonBox" style="text-align:center;">
			<button type="submit" class="btn btn-primary">예약변경</button>
			<a class="btn btn-info" href="myResInfoView" id="backBtn">이전으로</a>
		</div>
	</form>
</div>

<script>
$(document).ready(function(){
	$("#resModify").submit(function(event){
		event.preventDefault();
		$.ajax({//document.querySelector("#resModify");
			url : $("#resModify").attr("action"),
			type : "post",
			data : $("#resModify").serialize(),	
			success : function(data) {
				alert("예약 변경 되었습니다.");
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