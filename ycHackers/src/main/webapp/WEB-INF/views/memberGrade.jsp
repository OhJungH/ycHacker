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
<style>
th {
text-align: center;
}
</style>
</head>
<body>
<div class="container" style="margin-top:50px;">
<div style="float:left; border-right:medium solid black; margin-left: 30px;margin-right: 100px;" >
	<ul class="nav flex-column" style="line-height:100px;">
		<li class="nav-item">
			<a class="nav-link" href="#" style="color:black;">안내사항관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#" style="color:black;">회원등급관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#" style="color:black;">페이지 정보</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#" style="color:black;">logout</a>
		</li>
	</ul>
</div>
<div>
<h2>회원 리스트</h2>
<input type="text" placeholder="회원검색" style="width: 600px; margin:0;float:left;">
<button type="submit" style="height:30px;">검색</button><br><br><br>

</div>
<div class="table">
<table border="1" style="width:800px;">
	<thead>
	<tr>
		<th><button type="button">전체 선택</button></th>
		<th>이름/아이디/등급</th>
		<th>가입일</th>
		<th>관리</th>
	</tr>
	</thead>
	<tr>
		<th><input type="checkbox" value="1"></th>
		<th>홍길동/아이디/회원</th>
		<th>2022.12.28</th>
		<th><button type="button" class="btn btn-primary">수정</button>
		<button type="button" class="btn btn-success">삭제</button>
		</th>
	</tr>
	<tr>
		<th><input type="checkbox" value="2"></th>
		<th>가나다/아이디/회원</th>
		<th>2022.12.28</th>
		<th><button type="button" class="btn btn-primary">수정</button>
		<button type="button" class="btn btn-success">삭제</button>
		</th>
	</tr>
</table>
</div>
</div>
 
</body>

</html>