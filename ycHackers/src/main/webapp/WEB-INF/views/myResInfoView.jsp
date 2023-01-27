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
<!-- custom style -->
<link rel="stylesheet" href="style/footer.css"/>
<link rel="stylesheet" href="style/top.css"/>
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
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>연락처</th>
					<th>예약날짜</th>
					<th>예약시간</th>
					<th>인원</th>
					<th>결제</th>
					<th>카페번호</th>
					<th>요청사항</th>
					<th>예약변경</th>
					<th>예약취소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${myResInfo1}" var="ResDto">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	
					<tr>
						<td>${ResDto.resNum}</td>
						<td>${ResDto.resName}</td>
						<td>${ResDto.resBirth}</td>
						<td>${ResDto.resPhone}</td>
						<td>${ResDto.resDate}</td>
						<td>${ResDto.resTime}</td>
						<td>${ResDto.resMember}</td>
						<td>${ResDto.payMents}</td>
						<td>${ResDto.cafePhone}</td>
						<td>${ResDto.resComments}</td>
						<td><button class="btn btn-primary">예약변경</button></td>
						<td><button class="btn btn-danger">예약취소</button></td>
					</tr>			
				</c:forEach>
			</tbody>		
		</table>			
	</form>
</div>

</body>
</html>