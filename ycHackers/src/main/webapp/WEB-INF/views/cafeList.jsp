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
</head>
<body>

<div class="searchList">
	<form action="#" method="get" id="cafeList" name="cafeList">
	
	</form>
	<button class="btn-search"></button>
		<input type="text" placeholder="전체검색">
</div>

<div style="margin-top:50px; margin-left:350px;">
<select style="margin-right:70px;">
	<option>지역</option>
	<option>강남구</option>
	<option>강서구</option>
	<option>양천구</option>
</select>
<select>
	<option>인원</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
</select>
</div>
<div id="mainRegion" class="container mt-3">
	<div class="row mb-3" style="float:left; margin-left:-50px; margin-bottom:100px">
			<div class="col-md-4" style="height:auto;">
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px;">
				</div>
					<span style="white-space:nowrap;">스터디룸 소개글</span>
			</div>
	</div>
	<div class="row mb-3" style="float:left; margin-left:100px; margin-bottom:100px">
			<div class="col-md-4" style="height:auto;">
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px">
				</div>
					<span style="white-space:nowrap;">스터디룸 소개글</span>
			</div>
	</div>
	<div class="row mb-3">
			<div class="col-md-4" style="height:auto; margin-left:100px; margin-bottom:100px" >
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px">
				</div>
					<span style="white-space:nowrap;">스터디룸 소개글</span>
			</div>
	</div>
	<div class="row mb-3" style="float:left; margin-left:-50px; margin-bottom:100px">
			<div class="col-md-4" style="height:auto;">
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px">
				</div>
			</div>
	</div>
	<div class="row mb-3" style="float:left; margin-left:100px; margin-bottom:100px">
			<div class="col-md-4" style="height:auto;">
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px">
				</div>
			</div>
	</div>
	<div class="row mb-3">
			<div class="col-md-4" style="height:auto; margin-left:100px; margin-bottom:100px" >
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px">
				</div>
			</div>
	</div>
	<div class="row mb-3" style="float:left; margin-left:-50px; margin-bottom:100px">
			<div class="col-md-4" style="height:auto;">
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px">
				</div>
			</div>
	</div>
	<div class="row mb-3" style="float:left; margin-left:100px; margin-bottom:100px">
			<div class="col-md-4" style="height:auto;">
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px">
				</div>
			</div>
	</div>
	<div class="row mb-3">
			<div class="col-md-4" style="height:auto; margin-left:100px; margin-bottom:100px" >
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px">
				</div>
			</div>
	</div>
	<div class="row mb-3" style="float:left; margin-left:-50px; margin-bottom:100px">
			<div class="col-md-4" style="height:auto;">
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px">
				</div>
			</div>
	</div>
	<div class="row mb-3" style="float:left; margin-left:100px; margin-bottom:100px">
			<div class="col-md-4" style="height:auto;">
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px">
				</div>
			</div>
	</div>
	<div class="row mb-3">
			<div class="col-md-4" style="height:auto; margin-left:100px; margin-bottom:100px" >
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px">
				</div>
			</div>
	</div>
</div>

</body>

</html>