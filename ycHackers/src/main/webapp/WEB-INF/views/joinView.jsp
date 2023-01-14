<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<title>joinView</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" />
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<!--custom Style-->
    <link rel="stylesheet" href="style/joinView.css"/>
    <link rel="stylesheet" href="style/footer.css"/>
</head>
<body>

<div id="joinPageBackground">
	<div id="joinFormContainer">
		<h3 class="text-center">회원가입</h3>
		<h5 id="joinResert" class="text-center text-danger">...</h5>
		<form action="join" method="post" id="joinFrm">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="form-group">
				<label for="userId">E-mail</label>
				<input id="userId" name="userId" type="email" class="form-control" placeholder="email 주소를 적어주세요."pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" required/>
			</div>
			<div class="form-group">
				<label for="userPw">비밀번호</label>
				<input id="userPw" name="userPw" type="password" class="form-control" placeholder="대문자, 소문자, 특수문자, 8자 이상" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{8,16}$" required/>
			</div>
			<div class="form-group">
				<label for="pwValid">비밀번호 확인</label>
				<input id="pwValid" class="form-control" type="password" onChange="pwV" placeholder="한번 더 입력해주세요." pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{8,16}$" required/>
			</div>
			<input type="hidden" name="userAuth" value="."/>
			<div class="form-group">
				<label for="userName">이름</label>
				<input id="userName" name="userName" type="text" class="form-control" placeholder="한글 이름을 입력해주세요." pattern="[가-힣]{2,10}" required/>
			</div>
			<div class="form-group">
				<label for="userPhone">전화번호</label>
				<input id="userPhone" name="userPhone" type="text" class="form-control" placeholder="000-0000-0000" pattern="(010)-\d{3,4}-\d{4}" required/>
			</div>
			<div class="form-group">
				<label for="userBirth">생년월일</label>
				<input id="userBirth" name="userBirth" type="date" class="form-control"	pattern="\d{4}-[1-12]{2}-[1-31]{2}" onchange="birthValid" required/>
			</div>
			<div class="form-group">
				<label for="userLocation">내 지역</label>
				<input id="userLocation" name="userLocation" type="text" placeholder="우편번호를 적어주세요." pattern="\d{5}" class="form-control" placeholder="data.go.kr API 적용"/>
			</div>
			<div class="form-group">
				<label for="userGender">성별</label>
				<select class="form-control" id="userGender" name="userGender">
					<option>선택해주세요.</option>
					<option value="1">남성</option>
					<option value="2">여성</option>
				</select>
			</div>
			<button type="submit" class="btn btn-outline-success">회원가입</button> &emsp;
			<button type="reset" class="btn btn-outline-danger">취 소</button> &emsp;
			<a href="logView" class="btn btn-outline-primary">계정이 있어요</a>&emsp;
			<a href="home" class="btn btn-outline-secondary">home으로</a>
		</form>
	</div>
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
		</p><br/><br/>
		<p>
			1553<span id="footerCopy">COPYRIGHT &copy; 2022(주)양천구해커스 ALL RIGHTS RESERVED</span>
		</p>
	</div>
</div>
<script>
document.querySelectorAll("input").forEach(input => {
	input.addEventListener("invalid",()=>{
		document.forms[0].classList.add("was_validated");
	});
});

const pw = document.querySelector("#userPw");
const pwValid = document.querySelector("#pwValid");
let validM="";
let pwConp=false;
function pwV(){
	if(pw.value!=pwValid.value){
		document.querySelector("#pwValid").classList.add("was_validated");
		pwConp=false;
		validM="비밀번호가 일치하지않습니다. "
	}else{
		document.querySelector("#pwValid").classList.remove("was_validated");
		pwConp=true;
	}
}
/* 생일 검증 필요
const birth = document.querySelector("#userBirth");
const birthDate = birth.value;
const currDate = new Date();
let dateB = false;
if(473040000000 < currDate-birthDate){
	dateB=true;
	validM="15세 이하는 가입할 수 없습니다. "
}
if(0 < currDate-birthDate){
	dateB=true;
	validM="현재보다 이후의 날짜는 입력할 수 없습니다.";
}

function birthValid(){
	if(dateB){
		alert(dateM);
		pwConp=false;
	}
}
*/
$(document).ready(function(){
	$("#joinFrm").submit(function(e){
		e.preventDefault();
		if(pwConp){
			$.ajax({
				url:$("#joinFrm").attr("action"),
				type:"post",
				data:$("#joinFrm").serialize(),
				success:function(data){
					if(data.search("join-success")> -1){
						$("#joinResert").text("가입성공. 3초 후 로그인 화면으로 이동합니다.");
						$("#joinResert").focus();
						setTimeout(function(){
							window.location.href="loginView";
						},3000);
					}
					else{
						$("#joinResert").text("가입실패. 중복된 Email입니다.");
						$("#joinResert").focus();
					}
				},
				error:function(){
					alert("505 서버오류");
				}
			});	
		}
		else{
			alert(validM);
			return false;
		}
	});
});
</script>
</body>
</html>