<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<title>home</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" />
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<!--custom Style-->
    <link rel="stylesheet" href="style/home.css"/>
    <link rel="stylesheet" href="style/footer.css"/>
</head>
<body>

<div id="homeContainer">
        <div id="infoBox" class="homeBox">
            <a class="homeText " href="infoBoardHome">안내</a>
        </div>
        <div id="loginBox" class="homeBox"> 
            <a class="homeText" href="loginView">로그인</a>
        </div>
        <div id="joinBox"class="homeBox"> 
            <a class="homeText" href="joinViewHome">회원가입</a>
        </div>
        <div id="textBox" class="homeBox"> 
            <span class="homeText">
                YCHackers
                <i id="clock">00:00</i>
            </span>
        </div>
    </div>
    <script src="js/clock.js"></script>
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
                 1553<span id="footerCopy">COPYRIGHT &copy; 2022(주)양천구해커스 ALL RIGHTS RESERVED</span>
            </p>
        </div>
    </div>
    
<script>
$(document).ready(function(){
});
</script>
</body>
</html>