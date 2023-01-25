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
<!-- custom style sheet-->
<link rel="stylesheet" href="style/footer.css"/>
<link rel="stylesheet" href="style/top.css"/>
<style>
#myInfoBox{
	padding-left: 1em;
}
</style>
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
			 	<a class="nav-link" href="#">안내</a>
			 </li>
			 <li class="nav-item">
			 	<a class="nav-link" href="#">검색</a> 
			 </li>
			 <li class="nav-item">
			 	<a class="nav-link" href="#">관리자</a>
			 </li>								
		</ul>
		<div id="myInfoBox">
        	<a class="myInfoLink" href="#">id</a><br/>
        	<a class="myInfoLink" href="#">등급</a><br/>
        	<a class="myInfoLink" href="#">로그아웃</a>
       	</div>
	</div>	
</nav>

<table border="1" style="width:800px;height:300px;text-align:center;margin:auto;">
	<tr>
		<th colspan="3" style="text-align:center;">비밀번호</th>
	</tr>
	<tr>
		<td colspan="2">ID</td>
		<td>회원등급</td>
	</tr>
	<tr>
		<td colspan="3">이름</td>
	</tr>
	<tr>
		<td colspan="3">생년월일</td>
	</tr>
	<tr>
		<td colspan="3">지역코드(우편번호)</td>
	</tr>
	<tr>
		<td colspan="3">성별</td>
	</tr>
</table>

<div style="text-align:center;margin-top:1em;">
	<button type="submit" class="btn btn-success">submit</button>
	<button type="submit" class="btn btn-info">비밀번호변경</button>
	<button type="submit" class="btn btn-danger">회원탈퇴</button>
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