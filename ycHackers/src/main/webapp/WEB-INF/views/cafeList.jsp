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
<form action="#" method="get" id="cafeSearch" name="cafeSearch">
<input type="text" placeholder="전체검색" style="width: 550px; height:50px; float:left; margin-left: 580px;">
<div>
<button type="submit" class="btn btn-success" id="searchSubmit" style="height:50px;">검색</button>
</div>
</form>
<div style="margin-top:50px; margin-left:350px; margin-bottom:50px;">
<select style="margin-right:180px;">
	<option>지역</option>
	<option>강남구</option>
	<option>강동구</option>
	<option>강북구</option>
	<option>강서구</option>
	<option>관악구</option>
	<option>광진구</option>
	<option>구로구</option>
	<option>금천구</option>
	<option>노원구</option>
	<option>도봉구</option>
	<option>동대문구</option>
	<option>동작구</option>
	<option>마포구</option>
	<option>서대문구</option>
	<option>서초구</option>
	<option>성동구</option>
	<option>성북구</option>
	<option>송파구</option>
	<option>영등포구</option>
	<option>용산구</option>
	<option>은평구</option>
	<option>종로구</option>
	<option>중구</option>
	<option>중랑구</option>
</select>
<select style="margin-right : 180px;">
	<option>인원</option>
	<option>2인실</option>
	<option>3인실</option>
	<option>4인실</option>
	<option>5인실</option>
	<option>6인실</option>
</select>날짜
<input type="date">
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