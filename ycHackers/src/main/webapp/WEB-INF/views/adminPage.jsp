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
<title>admin page</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"/>
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
<!--custom style-->
<link rel="stylesheet" href="style/admin.css"/>
</head>
<body>

<div class="adminNavContainer">
	<ul class="nav navbar flex-column adminNav">
		<li class="nav-item">
			<a class="nav-link" href="infoBoardManage" id="infoBoardManage">안내사항관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="userGrade" id="userGrade" >회원등급관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">페이지 정보</a>
		</li>
	</ul>
</div>
<div id="adminContainer" class="adminContainer">
	<div class="infoPreviewContainer">
		<table class="infoPreviewTable">
			<thead>
				<tr>
					<th>글 번호</th>
					<th>제목(조회수)</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>{dto.infoNum}</td>
					<td>
						<a href="inforAdminView?infoNum={dto.infonum}">
							{dto.infoTitle} ({dto.infoStep})
						</a>
					</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a href="inforAdminView?infoNum=3">안내사항3</a></td>					</tr>
				<tr>
					<td>2</td>
					<td><a href="inforAdminView?infoNum=2">안내사항2</a></td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="inforAdminView?infoNum=1">안내사항1</a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="dashBoardPreviewContainer">
		<div>
			<a href="#">이번달 가입자 수/{dto.joinNum}</a>
		</div>
		<div>
			<a href="#">이번달 예약자 수/{dto.resNum}</a>
		</div>
		<div>
			<a href="#">이번달 신고 수/{dto.reportNum}</a>
		</div>
		<div>
			<a href="#">이번달 신고 처리 수/{dto.resultNum}</a>
		</div>
	</div>
	<div class="etcContainer">
		<div class="serviceChangeContainer">
			<a id="serviceChange" class="serviceBtn btn btn-block btn-outline-success">서비스이용약관 변경</a>
		</div>
		<div class="individualInfoContainer">
			<a id="individualInfoChange" class="serviceBtn btn btn-block btn-outline-info">개인정보처리방침 변경</a>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$("#userGrade").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : $("#userGrade").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#adminContainer").html(data);//mainRagion이 아닌 adminContainer
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	});
	$("#infoBoardManage").click(function(event){
		event.preventDefault();
		$.ajax({
			url:$("#infoBoardManage").attr("href"),	
			type : "get",
			data : "",
			success : function(data) {
				$("#adminContainer").html(data);
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