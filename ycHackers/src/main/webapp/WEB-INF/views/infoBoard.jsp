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
<title>안내 게시판</title>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--font awesome icon 5.7-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- custom style sheet -->
<link rel="stylesheet" href="style/infoBoardList.css"/>
<!-- pagination -->
<script src="js/jquery.twbsPagination.js"></script>

</head>
<body>

<div id="infoBoardPage">
	<div id="infoBoardNav">
		<h3 id="infoBoardTitle">안내드립니다</h3>
		<a id="allBtn" class="infoBoardNav btn btn-outline-dark" href="#">전체목록</a>
		<a id="infoBtn" class="infoBoardNav btn btn-outline-success" href="#">공지사항</a>
		<a id="resultBtn" class="infoBoardNav btn btn-outline-danger" href="#">신고처리</a>
		<a id="eventBtn" class="infoBoardNav btn btn-outline-info" href="#">이벤트</a>
	</div>
	<div id="infoBoardContainer">
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
								${infoDto.infoTitle}(${infoDto.infoIndent})
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
	</div>
	<!-- pagination -->
	<nav aria-label="page navigation">
		<ul class="pagination justify-content-center" id="infoPagination"></ul>
	</nav>
</div>	
<script>
//pagination 구현
$(function(){
	
	//twbsPagination(): 외부의 js파일을 적용시킴
	const listSize=Math.ceil(<c:out value="${listSize}"></c:out>/10);
	window.pagObj = $("#infoPagination").twbsPagination({
		totalPages: listSize, //총 페이지 수
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
					purl = "infoBoardPageList?pageNo=" + pageNo;//기능 값을 제외하고는 pagenumber지정
				}
				else if(pageNo == "Next") {
					pageA = $("li.active > a");//.active를 지닌 li의 a element
					pageNo = pageA.text();
					pageNo1 = parseInt(pageNo);//페이지 번호를 계산해 변경하기위해 int로 형변환
					pageNo2 = pageNo1 + 1;
					purl = "infoBoardPageList?pageNo=" + pageNo2;
				}
				else if(pageNo == "Previous") {
					pageA = $("li.active > a");//.active를 지닌 li의 a element
					pageNo = pageA.text();
					pageNo1 = parseInt(pageNo);//페이지 번호를 계산해 변경하기위해 int로 형변환
					pageNo2 = pageNo1 - 1;
					purl = "infoBoardPageList?pageNo=" + pageNo2;
				}
				else if(pageNo == "First") {
					pageNo2 = 1;
					purl = "infoBoardPageList?pageNo=" + pageNo2;
				}
				else if(pageNo == "Last") {
					pageNo2 = listSize;
					purl = "infoBoardPageList?pageNo=" + pageNo2;
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
						$("#infoBoardContainer").html(data);
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
	
	let activeBtn = document.querySelector("#infoPagination .page-item.active a");
	//activeBtn.
});
</script>
<script>
	var allBtn=document.querySelector("#allBtn");
	var infoBtn=document.querySelector("#infoBtn");
	var resultBtn=document.querySelector("#resultBtn");
	var eventBtn=document.querySelector("#eventBtn");

	var infoTitle=document.querySelector("#infoBoardTitle");
	allBtn.addEventListener("click",(e)=>{
		e.preventDefault();
		infoTitle.innerHTML="안내드립니다";
		$("#infoTable tr").filter(function(){
			$(this).toggle($(this).text().toLowerCase().indexOf("*#") > -1);
		});
	});
	infoBtn.addEventListener("click",(e)=>{
		e.preventDefault();
		infoTitle.innerHTML="공 지 사 항";
		$("#infoTable tr").filter(function(){
			$(this).toggle($(this).text().toLowerCase().indexOf("*#info") > -1);
		});
	});
	resultBtn.addEventListener("click",(e)=>{
		e.preventDefault();
		infoTitle.innerHTML="신 고 처 리";
		$("#infoTable tr").filter(function(){
			$(this).toggle($(this).text().toLowerCase().indexOf("*#result") > -1);
		});
	});
	eventBtn.addEventListener("click",(e)=>{
		e.preventDefault();
		infoTitle.innerHTML="이 벤 트";
		$("#infoTable tr").filter(function(){
			$(this).toggle($(this).text().toLowerCase().indexOf("*#event") > -1);
		});
	});
</script>
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