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
			 	<a class="nav-link" href="#">??????</a>
			 </li>
			 <li class="nav-item">
			 	<a class="nav-link" href="#">??????</a> 
			 </li>
			 <li class="nav-item">
			 	<a class="nav-link" href="#">?????????</a>
			 </li>								
		</ul>
		<div id="myInfoBox">
        	<a class="myInfoLink" href="#">id</a><br/>
        	<a class="myInfoLink" href="#">??????</a><br/>
        	<a class="myInfoLink" href="#">????????????</a>
       	</div>
	</div>	
</nav>

<table border="1" style="width:800px;height:300px;text-align:center;margin:auto;">
	<tr>
		<th colspan="3" style="text-align:center;">????????????</th>
	</tr>
	<tr>
		<td colspan="2">ID</td>
		<td>????????????</td>
	</tr>
	<tr>
		<td colspan="3">??????</td>
	</tr>
	<tr>
		<td colspan="3">????????????</td>
	</tr>
	<tr>
		<td colspan="3">????????????(????????????)</td>
	</tr>
	<tr>
		<td colspan="3">??????</td>
	</tr>
</table>

<div style="text-align:center;margin-top:1em;">
	<button type="submit" class="btn btn-success">submit</button>
	<button type="submit" class="btn btn-info">??????????????????</button>
	<button type="submit" class="btn btn-danger">????????????</button>
</div>

<div id="footer">
    <div class="footerBox">
        <p id="footerPageName" class="footerLabel">YCHackers</p>
        <p id="footerCompany">
            <span class="footerLabel">?????????</span> (???)??????????????????
        </p>
        <p id="footerCompanyNum">
            <span class="footerLabel">???????????????</span> 000-00-00000
        </p>
        <p id="footerAddress">??????????????? ????????? ????????? 1319-4 ????????????????????? </p>
        <a class="footerLink" id="companyIntro" href="companyIntro">????????????</a>&emsp; 
        <a class="footerLink" id="termsOfService" href="termsOfService">?????????????????????</a> &emsp;
        <a class="footerLink" id="privacyPolicy" href="privacyPolicy">????????????????????????</a>
    </div>
    <div class="footerBox">
        <p>
            <span class="footerLabel">????????????</span> 000-0000-0000
        </p>
        <p>
            <span class="footerLabel">????????????</span> 000-0000-0000
        </p>
        <br/><br/>
        <p>
            <span id="footerCopy">COPYRIGHT &copy; 2022(???)?????????????????? ALL RIGHTS RESERVED</span>
        </p>
    </div>
</div>