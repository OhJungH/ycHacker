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
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!-- custom style -->
<link rel="stylesheet" href="style/footer.css"/>
<link rel="stylesheet" href="style/top.css"/>
<!-- pagination -->
<script src="js/jquery.twbsPagination.js"></script>
</head>
<body>

<div class="myResInfoContainer">
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>연락처</th>
				<th>예약날짜</th>
				<th>예약시간</th>
				<th>인원</th>
				<th>결제</th>
				<th>카페번호</th>
				<th>요청사항</th>
				<th>예약변경</th>
				<th>예약취소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${myResInfo1}" var="resDto">	
				<tr>
					<td>${resDto.resNum}</td>
					<td>${resDto.resName}</td>
					<td>${resDto.resBirth}</td>
					<td>${resDto.resPhone}</td>
					<td>${resDto.resDate}</td>
					<td>${resDto.resTime}</td>
					<td>${resDto.resMember}</td>
					<td>${resDto.payMents}</td>
					<td>${resDto.cafePhone}</td>
					<td>${resDto.resComments}</td>
					<td><a class="btn btn-primary fa fa-exchange-alt" href="resModifyView?resNum=${resDto.resNum}"></a></td>
					<td><a class="btn btn-danger fa fa-trash" href="resCancelView?resNum=${resDto.resNum}"></a></td>
				</tr>			
			</c:forEach>
		</tbody>		
	</table>			
</div>
<!-- 
	1. ajax처리가 안되어있음
	2. 앵커 엘리먼트의 href가 특정되지 않습니다.
	3. 앵커엘리먼트의 객체를 구별할 id나 class가 없습니다. 
 -->
</body>
</html>