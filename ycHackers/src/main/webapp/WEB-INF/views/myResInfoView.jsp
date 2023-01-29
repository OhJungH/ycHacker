<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!-- custom style -->
<link rel="stylesheet" href="style/footer.css"/>
<link rel="stylesheet" href="style/top.css"/>
<!-- pagination -->
<script src="js/jquery.twbsPagination.js"></script>
</head>
<body>
<div class="container" style="text-align:center">
	<h1 style="color:#00CCFF;">YCHackers</h1>
</div>

<nav class="navbar navbar-expand-md" style="margin-bottom: 1em">
	<button class="navbar-toggler btn btn-block" type="button" data-toggle="collapse" data-target="#collapsiblebar">
		<span class="navbar-toggler-icon text-dark"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">		
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="home"> 
			 		<i class="fas fa-home" style="font-size:30px;color:white;"></i>
			 	</a>
			</li>			
			 <li class="nav-item">
			 	<a class="nav-link" href="info">안내</a>
			 </li>
			 <li class="nav-item">
			 	<a class="nav-link" href="search">검색</a> 
			 </li>
			 <li class="nav-item">
			 	<a class="nav-link" href="manager">관리자</a>
			 </li>						
		</ul>
		<div id="myInfoBox">
	        <a class="myInfoLink" href="#">id</a><br/>
	        <a class="myInfoLink" href="#">등급</a><br/>
	        <a class="myInfoLink" href="#">로그아웃</a>
       	</div>
	</div>	
</nav>

<div class="myResInfoContainer">
	<form action="myResInfo" method="post">
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
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	
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
						<td><a class="btn btn-primary fa fa-exchange-alt" href="resModifyView"></a></td>
						<td><a class="btn btn-danger fa fa-trash" href="resCancelView"></a></td>
					</tr>			
				</c:forEach>
			</tbody>		
		</table>			
	</form>
</div>

<div id="footer">
    <div class="footerBox">
        <p id="footerPageName" class="footerLabel">YCHackers</p>
        <p id="footerCompany">
            <span class="footerLabel">회사명</span> (사)양천구해커스
        </p>
        <p id="footerCompanyNum">
            <span class="footerLabel">사업자번호</span> 000-00-00000
        </p>
        <p id="footerAddress">서울특별시 양천구 신정동 1319-4 양천중앙도서관 </p>
        <a class="footerLink" id="companyIntro" href="companyIntro">회사소개</a>&emsp; 
        <a class="footerLink" id="termsOfService" href="termsOfService">서비스이용약관</a> &emsp;
        <a class="footerLink" id="privacyPolicy" href="privacyPolicy">개인정보처리방침</a>
    </div>
    <div class="footerBox">
        <p>
            <span class="footerLabel">등록문의</span> 000-0000-0000
        </p>
        <p>
            <span class="footerLabel">기타문의</span> 000-0000-0000
        </p>
        <br/><br/>
        <p>
            <span id="footerCopy">COPYRIGHT &copy; 2022(주)양천구해커스 ALL RIGHTS RESERVED</span>
        </p>
    </div>
</div>

<!-- pagenation -->
<nav aria-label="page navigation">
	<ul class="pagination justify-content-center" id="pagination"></ul>
</nav>

<script>
//pagination
$(document).ready(function(){
	//twbsPagination(): 외부의 js파일을 적용시킴
	window.pagObj = $("#pagination").twbsPagination({
		totalPages: ${infoBoardList}.size, //총 페이지 수
		visiblePages: 10, //한 화면에서 볼수있는 페이지 수
		onPageClick: function(event, page){//페이지 이동 클릭하면 발생시킬 기능
			console.info(page + ' (from options)');
			$(".page-link").on("click",function(event){
			///page-link: bootstrap4에서 사용하는 페이지 이동링크(a element)의 class
				event.preventDefault();
				let peo = $(event.target);//이벤트 발생 대상
				let pageNo = peo.text();//page number
				let purl;
				let pageA;
				let pageNo1;
				let pageNo2;
				if(pageNo != "First" && pageNo !="Previous" && pageNo != "Next" && pageNo != "Last"){
					purl = "myResInfoPList?pageNo=" + pageNo;//기능 값을 제외하고는 pagenumber지정
				}
				else if(pageNo == "Next") {
					pageA = $("li.active > a");//.active를 지닌 li의 a element
					pageNo = pageA.text();
					pageNo1 = parseInt(pageNo);//페이지 번호를 계산해 변경하기위해 int로 형변환
					pageNo2 = pageNo1 + 1;
					purl = "myResInfoPList?pageNo=" + pageNo2;
				}
				else if(pageNo == "Previous") {
					pageA = $("li.active > a");//.active를 지닌 li의 a element
					pageNo = pageA.text();
					pageNo1 = parseInt(pageNo);//페이지 번호를 계산해 변경하기위해 int로 형변환
					pageNo2 = pageNo1 - 1;
					purl = "myResInfoPList?pageNo=" + pageNo2;
				}
				else if(pageNo == "First") {
					pageNo2 = 1;
					purl = "myResInfoPList?pageNo=" + pageNo2;
				}
				else if(pageNo == "Last") {
					pageNo2 = 35;//마지막 페이지는 어떻게?
					purl = "myResInfoPList?pageNo=" + pageNo2;
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
						$(".myResInfoContainer").html(data);
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