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
<!-- custom style sheet -->
<link rel="stylesheet" href="style/infoBoardList.css"/>
</head>
<body>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>분류</th>
					<th>글 제목</th>
					<th>작성자</th>
					<th>게시일</th>
					<th class="d-none"></th>
				</tr>
			</thead>
			<tbody id="infoTable">
				<c:forEach items="${infoList}" var="infoDto">
					<tr>
						<td>
							<c:choose>
								<c:when test="${infoDto.infoType  eq 'info'}">
									<span class="badge badge-info">공지사항</span>
								</c:when>
								<c:when test="${infoDto.infoType eq 'result'}">
									<span class="badge badge-danger">신고처리</span>
								</c:when>								
								<c:when test="${infoDto.infoType eq 'event'}">
									<span class="badge badge-success">이벤트</span>
								</c:when>
							</c:choose>
						</td>
						<td>
							<a class="infoDetailsUser" href="infoDetailsUser?infoNum=${infoDto.infoNum}">
								${infoDto.infoTitle} (${infoDto.infoIndent})
							</a>
						</td>
						<td>${infoDto.infoAuth}</td>
						<td>${infoDto.infoDate}</td>
						<td class=d-none>
							<c:choose>
								<c:when test="${infoDto.infoType  eq 'info'}">
									*#info
								</c:when>
								<c:when test="${infoDto.infoType eq 'result'}">
									*#result
								</c:when>								
								<c:when test="${infoDto.infoType eq 'event'}">
									*#event
								</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
<script>
$(document).ready(function(){
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
				alert("에러입니다.");
			}
		});
	});
});
</script>

</body>
</html>