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
<link rel="stylesheet" href="html/Reservation.html"/>
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
	<form action="Res" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resNum">회원번호</label>
			<input type="text" id="resNum" name="resNum" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resName">이름</label>
			<input type="text" id="resName" name="resName" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resBirth">생년월일</label>
			<input type="date" id="resBirth" name="resBirth" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resPhone">연락처</label>
			<input type="text" id="resPhone" name="resPhone" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resDate">예약날짜</label>
			<input type="date" id="resDate" name="resDate" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resTime">예약시간</label>
			<input type="text" id="resTime" name="resTime" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resMember">인원</label>
			<input type="text" id="resMember" name="resMember" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="payments">결제</label>
			<input type="text" id="payments" name="payments" style="width:500px;">
		</div>
		<div class="form-group text-center text-info threeDEffect">
			<label for="resComments">요청사항</label>
			<input type="text" id="resComments" name="resComments" style="width:500px;">
		</div>
		<div class="container" style="text-align:center;">
			<button type="submit" class="btn btn-success">예약하기</button>
			<button type="submit" class="btn btn-danger">취소하기</button>
		</div>
	</form>
</div>
<div id="footer">
    <div class="footerBox">
        <p id="footerPageName" class="footerLabel">YCHackers</p>
        <p id="footerCompany">
            <span class="footerLabel">회사명</span> (사)양천구해커스
        </p>
        <p id="footerCompanyNum">
            <span class="footerLabel">사업자번호</span> 000-00-00000
        </p>
        <p id="footerAddress">서울특별시 양천구 신정동 1319-4 양천중앙도서관 </p>
        <a class="footerLink" id="companyIntro" href="companyIntro">회사소개</a>&emsp; 
        <a class="footerLink" id="termsOfService" href="termsOfService">서비스이용약관</a> &emsp;
        <a class="footerLink" id="privacyPolicy" href="privacyPolicy">개인정보처리방침</a>
    </div>
    <div class="footerBox">
        <p>
            <span class="footerLabel">등록문의</span> 000-0000-0000
        </p>
        <p>
            <span class="footerLabel">기타문의</span> 000-0000-0000
        </p>
        <br/><br/>
        <p>
            <span id="footerCopy">COPYRIGHT &copy; 2022(주)양천구해커스 ALL RIGHTS RESERVED</span>
        </p>
    </div>
</div>
</body>
</html>