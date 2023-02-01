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
<link rel="stylesheet" href="style/footer.css"/>
<link rel="stylesheet" href="style/top.css"/>
<link rel="stylesheet" href="style/myPageView.css"/>
</head>
<body>
<div class="container" style="text-align:center">
	<h1 style="color:#00CCFF;">YCHackers</h1>
</div>

<nav class="navbar navbar-expand-md">	
	<button class="navbar-toggler btn btn-block" type="button" data-toggle="collapse" data-target="#collapsiblebar">
		<span class="navbar-toggler-icon text-dark"></span>
	</button>	
	<div class="collapse navbar-collapse" id="collapsiblebar">
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
			<p class="myInfoP">
				ID: 
				<a class="myInfoLink" href="#">${userDto.userId}</a><br/>
			</p>
			<p class="myInfoP">
				등급: 
				<a class="myInfoLink" href="#">${userDto.userAuth}</a><br/>
			</p>
			<p class="myInfoP">
				<a class="myInfoLink" href="logoutView?userNum=${userDto.userNum}">로그아웃</a>
			</p>
		</div>
	</div><hr/>			
</nav>

<div class="MyPageContainer">
	<div class="Box User">
		<a class="UserInfo" href="userInfoView">회원정보</a>		
	</div>
	<div class="Box Res">
		<a class="ResInfo" href="myResInfoView">예약정보</a>
	</div>
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
<script>
$(document).ready(function(){
	
});
</script>
</body>
</html>