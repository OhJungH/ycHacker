<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<title>information at home</title>
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
    <link rel="stylesheet" href="style/infoBoardHome.css"/>
</head>
<body>

<div id="homeInfoContainer">
    <a class="btn btn-block" id="homeBar" href="home">홈으로</a>
    <div class="homeTitle">
            <h1>안 내 사 항</h1><hr style="margin: 0;">
			<p style="color: chocolate;font-size: 0.8rem;">
				로그인을해 댓글을 사용할 수 있습니다.
			</p>
    </div>
	<div class="card-columns infoCardDeck">
		<% 
			String infoType= "";
			if(infoType.equals("notice")){
				
			}
			else if(infoType.equals("result")){
				
			}else if(infoType.equals("event")){
				
			}else{
				
			}
			//infoType에 따라 badge, introCard class를 다르게 해야함.
			//정렬은 최근 작성부터
		%>
		<!-- 
		<c:forEach items="${infoHomeList}" var="dto">
			<div class="card infoCard introCardI">
				<div class="card-body text-center infoCardBody">
					<span class="badge badge-info">공지사항</span><br/>
					<h4 class="d-inline">1. 글 제목(29)</h4><br/>
					<span class="card-text">내용이 길면 생략됩니다.(25)</span><br/>
					<a href="infoDetails?infoNum=infonum" class="infoDetails card-link stretched-link">내용보기</a>
				</div>	
			</div>
		</c:forEach>
		 -->
		<div class="card infoCard introCardI">
			<div class="card-body text-center infoCardBody">
				<span class="badge badge-info">공지사항</span><br/>
				<h4 class="d-inline">1. 글 제목(29)</h4><br/>
				<span class="card-text">내용이 길면 생략됩니다.(25)</span><br/>
				<a href="infoDetails?infoNum=infonum" class="infoDetails card-link stretched-link">내용보기</a>
			</div>	
		</div>
		<div class="card infoCard introCardA">
			<div class="card-body text-center infoCardBody">
				<span class="badge badge-danger">신고처리</span><br/>
				<h4 class="d-inline">infoNum. infoTitle (infoIdent)</h4><br/>
				<span class="card-text">infoContent(20자)...(infoStep)</span><br/>
				<a href="infoDetails?infoNum=infonum" class="infoDetails card-link stretched-link">내용보기</a>
			</div>
		</div>
		<div class="card infoCard introCardE">
			<div class="card-body text-center infoCardBody">
				<span class="badge badge-success">이벤트</span><br/>
				<h4 class="d-inline">3. infoTitle (infoIdent)</h4><br/>
				<span class="card-text">infoContent(20자)...(infoStep)</span><br/>
				<a href="infoDetails?infoNum=infonum" class="infoDetails card-link stretched-link">내용보기</a>
			</div>
		</div>
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
		</p><br/><br/>
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