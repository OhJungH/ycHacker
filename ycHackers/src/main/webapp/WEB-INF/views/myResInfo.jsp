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
<!-- custom style -->
<link rel="stylesheet" href="html/MyResInfo">
</head>
<body>
<div class="container" style="text-align:center">
	<h1 style="color:#00CCFF;">YCHackers</h1>
</div>

<nav class="navbar navbar-expand-md" style="margin-bottom: 1em">
	<button class="navbar-toggler btn btn-block" type="button" data-toggle="collapse" data-target="#collapsiblebar">
		<span class="navbar-toggler-icon text-dark"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">		
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="home"> 
			 		<i class="fas fa-home" style="font-size:30px;color:white;"></i>
			 	</a>
			</li>			
			 <li class="nav-item">
			 	<a class="nav-link" href="info">안내</a>
			 </li>
			 <li class="nav-item">
			 	<a class="nav-link" href="search">검색</a> 
			 </li>
			 <li class="nav-item">
			 	<a class="nav-link" href="manager">관리자</a>
			 </li>						
		</ul>
		<div id="myInfoBox">
	        <a class="myInfoLink" href="#">id</a><br/>
	        <a class="myInfoLink" href="#">등급</a><br/>
	        <a class="myInfoLink" href="#">로그아웃</a>
       	</div>
	</div>	
</nav>
<div>
	<form action="myResInfo" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resName">이름</label>
			<input type="text" id="resName" name="resName" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resNum">예약번호</label>
			<input type="text" id="resNum" name="resNum" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="cafePhone">전화번호</label>
			<input type="text" id="cafePhone" name="cafePhone" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resDate">예약날짜</label>
			<input type="date" id="resDate" name="resDate" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resTime">예약시간</label>
			<input type="text" id="resTime" name="resTime" style="width:500px;">
		</div>
	</form>
</div>

</body>
</html>