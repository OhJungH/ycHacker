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
<!--custom style-->
    <link rel="stylesheet" href="css/loginView.css"/>
    <link rel="stylesheet" href="css/footer.css"/>
</head>
<body>
<div id="loginContainer">
        <h1 class="display-1">Log In</h1><br/><br/>
        <form action="login" method="post" id="loginFrm">
            <div class="input-group">
                <input class="loginControl form-control" type="email"  placeholder="abcd@efg.hij" required/>
            </div>
            <div class="input-group">
                <input class="loginControl form-control" type="password"/>
                <div class="input-group-append">
                    <button class="btn btn-outline-success" type="submit">로그인</button>
                </div>
            </div>
            <a href="joinView" class="loginHelp" id="joinView">아직 회원이 아니신가요?</a>
            <a href="findInfo" class="loginHelp" id="findInfo">아이디/비밀번호가 기억이 안나나요?</a> &emsp;
            <div class="custom-control custom-switch">
                <input type="checkbox" class="custom-control-input" id="rememberMe" checked/>
                <label class="custom-control-label" for="rememberMe">
                    remember me?
                </label>
            </div>
        </form>
        <a href="#">
            <img class="socialLoginIcon rounded-circle" alt="kakaoBtn" src="https://cs.kakao.com/img/cskakaocom/pc/thumb/thumb_kakaotalk.png"/>
        </a>
        <a href="#">
            <img class="socialLoginIcon rounded-circle" alt="naverBtn" src="https://play-lh.googleusercontent.com/Kbu0747Cx3rpzHcSbtM1zDriGFG74zVbtkPmVnOKpmLCS59l7IuKD5M3MKbaq_nEaZM=w240-h480-rw"/>
        </a>
        <a href="#">
            <img class="socialLoginIcon rounded-circle" alt="googleBtn" src="https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1=w240-h480-rw"/>
        </a>
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
                0847<span id="footerCopy">COPYRIGHT &copy; 2022(주)양천구해커스 ALL RIGHTS RESERVED</span>
            </p>
        </div>
    </div>
</body>
</html>