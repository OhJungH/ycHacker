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

<div id="cafeContainer">
<div class="cafeSearch" style="margin-bottom:50px;">
	<form action="cafeList" method="get" id="searchFrm" name="cafeSearch">
		<input type="hidden" value="search" name="viewType">
		<div class="input-group" style="width:40%;height:50px; margin:auto;">
			<input hidden="hidden" value="cafeName" id="searchWhat" name="searchWhat">
			<input hidden="hidden" value="cafeLocation" id="location" name="chose">
			<div class="input-group-prepend d-inline">
				<div class="dropdown d-inline">
					<button type="button" class="btn btn-primary dropdown-toggle search" data-toggle="dropdown" style=" display : inline-block; height:50px;">전체검색</button>
					<div class="dropdown-menu">
						<a  class="dropdown-item search" id="totalSearch" style="display : none">전체검색</a>
						<a  class="dropdown-item search" id="location">지역</a>
						<a  class="dropdown-item search" id="people">인원</a>
					</div>
				</div>
			</div>
			<input class="form-control" id="search" name="search" type="text" style="height:50px;">
				<div class="input-group-append">
					<button class="btn btn-outline-success" type="submit" id="searchSubmit">검색</button>
				</div>
		</div>
	</form>
</div>

<div class="row mb-3" style="margin-left:250px;">
	<c:forEach items="${cafeList}" var="dto">
		<div class="container-md-4"style="height:auto; margin : 0px 150px 70px 50px; ">
			<div class="card" style="width:250px;">
				<img class="card-img-top" src="upimage/${dto.cafeImage}" alt="Card image" style="max-width:250px; height:250px;">
				<div class="card-body">
				<a href="cafeDetail?cafeName=${dto.cafeName}" class="cafeDetail pclick stretched-link" id="cafeDetail">
				${dto.cafeName}</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
</div>

<script>
$(document).ready(function() {
	$("a.search").on("click", function(event) {
		$("a.search").attr("style", "display : inline;");
		$("button.search").text($(event.target).text());
		$("#searchWhat").attr("value", $(event.target).attr("id"));
		$(event.target).attr("style", "display: none;");
	});
	$("#searchSubmit").on("click", function() {
		let search = $("search").val();
		if(search =="") {
			alert("검색어를 입력해주세요.");
			return false;
		}
		return true;
	});
	$("#searchFrm").on("submit", function(event) {
		event.preventDefault();
		$.ajax({
			url : $("#searchFrm").attr("action"),
			type : $("#searchFrm").attr("method"),
			data : $("#searchFrm").serialize(),
			success : function(data) {
				$("#mainRagion").html(data);
			},
			error : function() {
				alert("에러");
			}
		});
	});
	$(".cafeDetail").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : $("#cafeDetail").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#cafeContainer").html(data);
			},
			error : function() {
				alert("에러~");
			}
		});
	});
});
</script>
</body>
</html>