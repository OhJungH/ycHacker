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
<title>Insert</title>
<!--jquery 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>-->
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--custom style-->
<link rel="stylesheet" href="style/adminManage.css"/>
</head>
<body>

<table id="infoListTbl" class="table table-border">
	<thead>
		<tr>
			<th>no</th>
			<th>제목</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>조회</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${infoBoardList}" var="infoDto">
			<tr class="${infoDto.infoType}">
				<td>${infoDto.infoNum}</td>
				<td>
					<a class="infoModifyBtn" href="infoModifyView?infoNum=${infoDto.infoNum}">
						${infoDto.infoTitle} (${infoDto.infoIndent})
					</a>
				</td>
				<td>${infoDto.infoDate}</td>
				<td>
					${infoDto.infoAuthor}
					(${infoDto.infoAuth})
				</td>
				<td class="${infoDto.infoCondition}">${infoDto.infoHit}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>