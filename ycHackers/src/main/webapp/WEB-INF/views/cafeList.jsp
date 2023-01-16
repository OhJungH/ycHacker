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

<form action="cafeDetail" method="get" id="cafeSearch" name="cafeSearch">
	<input type="hidden" value="search" name="viewType">
	<input hidden="hidden" value="total" id="searchWhat" name="searchWhat">
	<input hidden="hidden" value="location" id="chose" name="chose">
			<div class="dropdown">
				<div class="dropdown-menu">
					<a class="dropdown-item search" id="total" style="display:none;">전체검색</a>
					<a class="dropdown-item search" id="location">지역</a>
					<a class="dropdown-item searhc" id="people">인원</a>
				</div>
			</div>	
	<div style = "text-align: center;">
	<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" style= "width:70px; height:50px; ">제목</button>
	<input type="text" style="width: 550px; height:50px;">
		
			<button type="submit" class="btn btn-dark" id="searchSubmit" style="height:50px; ">검색</button>
		
	</div>
</form>

<div id="mainRegion" class="container mt-3">
	<div class="row mb-3" style="float:left; margin-left:-50px; margin-bottom:100px">
			<div class="col-md-4" style="height:auto;">
				<div class="card" style="width:300px;">
					<img class="card-img-top" src="upimage/${dto.rPhoto}" alt="Card image" style="max-width:280px; height:280px;">
				</div>
					<span style="white-space:nowrap;">스터디룸 소개글</span>
			</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$("#cafeDetail").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : "cafeDetail?chose=location",
			type : "get",
			data {
			viewType : "all"
			},
			success : function(data) {
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("에러");
			}
		});
	});
	$("a.search").on("click", function(event) {
		$("a.search").attr("style", "display : inline;");
		$("button.search").text($(event.target).text());
		$("#searchWhat").attr("value", $(event.target).attr("id"));
		$(event.target).attr("style". "display: none;");
	});
	$("#searchSubmit").on("click", function() {
		let search = $("serach").val();
		if(search =="") {
			alert("검색어를 입력");
			return false;
		}
		return true;
	});
	$("#cafeSearch").on("submit", function(event) {
		event.preventDefault();
		$.ajax({
			url : $("#cafeSearch").attr("action"),
			type : $("#cafeSearch").attr("method"),
			data : $("#cafeSearch").serialize(),
			success : function(data) {
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("에러");
			}
		});
	});
});
</script>
</body>
</html>