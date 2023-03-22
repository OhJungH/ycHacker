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
<!-- custom style sheet-->
<link rel="stylesheet" href="style/footer.css"/>
<link rel="stylesheet" href="style/top.css"/>
</head>
<body>
<table border="1" style="width:800px;height:300px;text-align:center;margin:auto;">
	<tr>		
		<th colspan="3">
			회원번호 : <input type="text" id="userNum" name="userNum" value="${userDataDto.userNum}">
		</th> 
	</tr>
	<tr>		
		<td colspan="2">
			ID : <input type="text" id="userId" name="userId" value="${userDataDto.userId}">
		</td>
		<td>
			회원등급 : <input type="text" id="userAuth" name="userAuth" value="${userDataDto.userAuth}">
		</td>
	</tr>
	<tr>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="3">
			생년월일 : <input type="text" id="userBirth" name="userBirth" value="${userDataDto.userBirth}">
		</td>
	</tr>
	<tr>
		<td colspan="3">
			지역코드(우편번호) : <input type="text" id="userLocation" name="userLocation" value="${userDataDto.userLocation}">
		</td>
	</tr>
	<tr>
		<td colspan="3">
			성별 : <input type="text" id="userGender" name="userGender" value="${userDataDto.userGender}">
		</td>
	</tr>
</table>

<div style="text-align:center;margin-top:1em;">
	<button type="submit" class="btn btn-success">submit</button>
	<button type="submit" class="btn btn-danger">회원탈퇴</button>
</div>
