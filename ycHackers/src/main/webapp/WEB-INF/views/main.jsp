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
<title>main</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--font awesome icon 5.7-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CKEditor API -->
<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/decoupled-document/ckeditor.js"></script> 
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<!-- custom style sheet -->
<link rel="stylesheet" href="style/footer.css"/>
<link rel="stylesheet" href="style/top.css"/>
<link rel="stylesheet" href="style/main.css"/>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
	<sec:authentication property="principal.authorities" var="user_authority"/>
</sec:authorize>
<nav class="navbar navbar-expand-sm mainNav">
	<button class="navbar-toggler btn btn-block" type="button" data-toggle="collapse" data-target="#collapsiblebar">
		<span class="navbar-toggler-icon text-dark"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsiblebar">
		<ul class=" nav justify-content-center">
			<li class="nav-item">
				<a class="nav-link" href="home">home</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown">
					????????????
				</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="infoBoard" id="infoBoard">????????????</a>
					<a class="dropdown-item" href="helpPage" id="helpInfo">?????????</a>
				</div>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="cafeList" id="cafeList">??????</a>
			</li>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				<li class="nav-item">
					<a class="nav-link" href="admin" id="admin">?????????</a>
				</li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_MANAGER')">
				<li class="nav-item">
					<a class="nav-link" href="studyroomwrite" id="studyroomwrite">???????????? ??????</a>
				</li>
			</sec:authorize>
		</ul>
		<p class="mainLogo">
			YCHackers
		</p>
		<div id="myInfoBox">
			<p class="myInfoP">
				ID: 
				<a id="myInfoLink" class="myInfoLink" href="myPageView">${userDto.userId}</a><br/>
			</p>
			<p class="myInfoP">
				??????: 
				<span class="myInfoLink">${userDto.userAuth}</span><br/>
			</p>
			<p class="myInfoP">
				<a class="myInfoLink" href="logoutView?userNum=${userDto.userNum}">????????????</a>
			</p>
		</div>
	</div><hr/>
</nav>


<section>
	<div id="mainRagion">
		<div style="text-align: center;">
			<h3>????????????</h3>
		</div>
		<table class="table table-hover mainTBL">
			<thead>
				<tr>
					<th>??????</th>
					<th>??????</th>
					<th>?????????</th>
					<th>?????????</th>
					<th>?????????</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${infoListMain}" var="infoDto">
					<tr>
						<td>
							<c:choose>
								<c:when test="${infoDto.infoType  eq 'info'}">
									<span class="badge badge-info">????????????</span><br/>
								</c:when>
								<c:when test="${infoDto.infoType eq 'result'}">
									<span class="badge badge-danger">????????????</span><br/>
								</c:when>
								<c:when test="${infoDto.infoType eq 'event'}">
									<span class="badge badge-success">?????????</span><br/>
								</c:when>
							</c:choose>
						</td>
							<td>
							<a class="infoDetailsUser" href="infoDetailsUser?infoNum=${infoDto.infoNum}">${infoDto.infoTitle}(${infoDto.infoIndent})</a>
						</td>
						<td>${infoDto.infoAuthor}</td>
						<td>${infoDto.infoDate}</td>
						<td>${infoDto.infoHit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr/>
		<div style="text-align: center;">
			<h3>TOP 10</h3>
		</div>
		<table class="table table-hover mainTBL">
			<thead>
				<tr>
					<th>??????</th>
					<th>????????????</th>
					<th>??????</th>
					<th>??????</th>
					<th>??????</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>
						<a href="#">testCafe</a>
					</td>
					<td>??????</td>
					<td>3???</td>
					<td>4</td>
				</tr>
			</tbody>
		</table>
	</div>
</section>
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
<script>
$(document).ready(function(){
	$("#cafeList").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : "cafeList?location=cafeLocation",
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("???????????????.");
			}
		});
	});
	$("#infoBoard").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : $("#infoBoard").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("???????????????.");
			}
		});
	});

	$("#admin").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : $("#admin").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("???????????????.");
			}
		});
	});
	$("#studyroomwrite").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : $("#studyroomwrite").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("???????????????.");
			}
		});
	});
	$(".infoDetailsUser").click(function(e){
		e.preventDefault();
		let thisE = $(e.target);
		$.ajax({
			url : thisE.attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("???????????????.");
			}
		});
	});
	$(".infoModifyBtn").click(function(e){
		e.preventDefault();
		let thisE = $(e.target);
		$.ajax({
			url:thisE.attr("href"),
			type:"get",
			success : function(data) {
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("???????????????.");
			}
		});
	});
	$("#myInfoLink").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : $("#myInfoLink").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("???????????????.");
			}
		});
	});
	
});
</script>

</body>
</html>