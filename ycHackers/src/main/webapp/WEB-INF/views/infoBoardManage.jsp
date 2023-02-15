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
<title>admin page</title>
<!--jquery
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 -->
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
<link rel="stylesheet" href="style/adminManage.css"/>
<!-- pagination -->
<script src="js/jquery.twbsPagination.js"></script>
</head>
<body>

<div class="infoManagerContainer">
	<h3 class="title">안내 게시판 관리 페이지</h3>
	<hr/>
	<button id="infoBoardWriteForm" type="button" class="btn btn-outline-success btn-block">
		<i class="fas fa-pen"></i>
		글 쓰기
	</button>
	<p style="color:red;font-size:50%;">아래에서 링크를 누르면 수정페이지로 이동합니다.</p>
	<div class="infoManagerTableContainer">
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
	</div>
</div>
<!-- pagination -->
<nav aria-label="page navigation">
		<ul class="pagination justify-content-center" id="pagination"></ul>
</nav>

<script>
$(document).ready(function() {
	$("#infoBoardWriteForm").click(function(event){
		event.preventDefault();
		$.ajax({
			url: "infoBoardWriteForm",
			type: "get",
			success : function(data) {
				$("#adminContainer").html(data);
			},
			error : function() {
				alert("에러입니다.");
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
				alert("에러입니다.");
			}
		});
	});
});
</script>
<script>
//pagination 구현
$(function(){
	//twbsPagination(): 외부의 js파일을 적용시킴
	window.pagObj = $("#pagination").twbsPagination({
		totalPages: Math.floor(<c:out value="${listSize}"></c:out>/10)+1, //총 페이지 수
		visiblePages: 10, //한 화면에서 볼수있는 페이지 수
		onPageClick: function(event, page){//페이지 이동 클릭하면 발생시킬 기능
			console.info(page + ' (from options)');
			$(".page-link").on("click",function(event){
			//page-link: bootstrap4에서 사용하는 페이지 이동링크(a element)의 class
				event.preventDefault();
				let peo = $(event.target);//이벤트 발생 대상
				let pageNo = peo.text();//page number
				let purl;
				let pageA;
				let pageNo1;
				let pageNo2;
				if(pageNo != "First" && pageNo !="Previous" && pageNo != "Next" && pageNo != "Last"){
					purl = "infoPList?pageNo=" + pageNo;//기능 값을 제외하고는 pagenumber지정
				}
				else if(pageNo == "Next") {
					pageA = $("li.active > a");//.active를 지닌 li의 a element
					pageNo = pageA.text();
					pageNo1 = parseInt(pageNo);//페이지 번호를 계산해 변경하기위해 int로 형변환
					pageNo2 = pageNo1 + 1;
					purl = "infoPList?pageNo=" + pageNo2;
				}
				else if(pageNo == "Previous") {
					pageA = $("li.active > a");//.active를 지닌 li의 a element
					pageNo = pageA.text();
					pageNo1 = parseInt(pageNo);//페이지 번호를 계산해 변경하기위해 int로 형변환
					pageNo2 = pageNo1 - 1;
					purl = "infoPList?pageNo=" + pageNo2;
				}
				else if(pageNo == "First") {
					pageNo2 = 1;
					purl = "infoPList?pageNo=" + pageNo2;
				}
				else if(pageNo == "Last") {
					pageNo2 = Math.floor(<c:out value="${listSize}"></c:out>/10)+1;//마지막 페이지는 어떻게?
					purl = "infoPList?pageNo=" + pageNo2;
				}
				else {
					return;
				}//if-else
				$.ajax({//ajax로 처리
					url: purl,
					type: "get",
					data: "",
					success: function(data){
						console.log("게시판의" + pageNo + "페이지 입니다.");
						$("#infoManagerTableContainer").html(data);
					},
					error: function(){
						alert("pagination 에러입니다.");
					}
				});//ajax
			});//on("click")
		}//onPageClick
	})//twbsPagination(chaining을 위해 ;를 제외)
	.on("page", function(event,page){//twbsPagination에 chaining
		console.info(page + ' (from event listening)');
	});//on("page")
});
</script>
</body>
</html>