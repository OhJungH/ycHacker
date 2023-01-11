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
table {
border-spacing : 10px;
border-collapse : separate;
}
td {
	border : none;
	}
</style>
</head>
<body>
<div class="container" style="margin-top:50px;">
<div style="float:left; border-right:medium solid black; margin-left: 30px;margin-right: 100px;" >
	<ul class="nav flex-column" style="line-height:100px;">
		<li class="nav-item">
			<a class="nav-link" href="#" style="color:black;">안내사항관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#" style="color:black;">회원등급관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#" style="color:black;">페이지 정보</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#" style="color:black;">logout</a>
		</li>
	</ul>
</div>
<div class="container">

	<table border="1" style="margin-bottom:50px;">
		<tr>
			<td style="width:30px;">1.</td>
			<td><a href="infor1">안내사항1</a></td>
		</tr>
		<tr>
			<td style="width:30px;">2.</td>
			<td><a href="infor2">안내사항2</a></td>
		</tr>
		<tr>
			<td style="width:30px;">3.</td>
			<td><a href="infor3">안내사항3</a></td>
		</tr>
		<tr>
			<td style="width:30px;">4.</td>
			<td><a href="infor4">안내사항4</a></td>
		</tr>
	</table>
	<table border="1" >
		<tr>
			<td style="width:150px;">이번달 가입자 수/</td>
			<td style="width:150px;">이번달 예약자 수/</td>
			<td style="width:150px;">신고 수/</td>
		</tr>
		<tr>
			<td style="width:180px;">jstl로 가입자 수 가져오기</td>
			<td style="width:180px;">jstl로 예약자 수 가져오기</td>
			<td style="width:180px;">jstl로 신고수 수 가져오기</td>
		</tr>
	</table>
	</div><br><br><br>
	<table>
	<tr>
		<td><iframe src="text/rule.html" style="width:100%; height:150px;"></iframe></td>
	</tr>
	<tr>
		<td><iframe src="text/privacy.html" style="width:100%; height:150px;"></iframe></td>
	</tr>
	</table>
</div>
</body>
</html>