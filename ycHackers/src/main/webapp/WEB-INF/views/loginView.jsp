<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>
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
<title>login page</title>
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
<link rel="stylesheet" href="style/loginView.css"/>
<link rel="stylesheet" href="style/footer.css"/>
</head>
<body>

<div id="loginContainer">
	<h1 class="display-1">Log In</h1><br/><br/>
	<form action="login" method="post" id="loginFrm">
		<div class="input-group">
			<input class="loginControl form-control" name="userId" type="email"  placeholder="abcd@efg.hij" required/>
		</div>
		<div class="input-group">
			<input class="loginControl form-control" name="userPw" type="password" required/>
			<div class="input-group-append">
				<button class="btn btn-outline-success" type="submit">?????????</button>
			</div>
		</div>
		<a href="joinViewHome" class="loginHelp" >?????? ????????? ????????????????</a>
		<a href="findInfo" class="loginHelp" >?????????/??????????????? ????????? ?????????????</a> 
		<a href="home" class="loginHelp" >
			????????????<i class="fa fa-arrow-alt-circle-left"></i>
		</a>&emsp;
		<div class="custom-control custom-switch">
			<input type="checkbox" class="custom-control-input" id="rememberMe" checked/>
			<label class="custom-control-label" for="rememberMe">
				remember me?
			</label>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	<a id="klog" href="${kakao_url}">
		<img class="socialLoginIcon rounded-circle" alt="kakaoBtn" src="https://cs.kakao.com/img/cskakaocom/pc/thumb/thumb_kakaotalk.png"/>
	</a>
	<a id="nlog" href="${naver_url}">
		<img class="socialLoginIcon rounded-circle" alt="naverBtn" src="https://play-lh.googleusercontent.com/Kbu0747Cx3rpzHcSbtM1zDriGFG74zVbtkPmVnOKpmLCS59l7IuKD5M3MKbaq_nEaZM=w240-h480-rw"/>
	</a>
	<a id="glog" href="${google_url}">
		<img class="socialLoginIcon rounded-circle" alt="googleBtn" src="https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1=w240-h480-rw"/>
	</a>
	<a id="flog" href="{facebook_url}">
		<img class="socialLoginIcon rounded-circle" alt="metaBtn" src="https://logosandtypes.com/wp-content/uploads/2022/03/metaverse.svg"/>
	</a>
</div>
<div id="footer">
	<div class="footerBox">
		<p id="footerPageName" class="footerLabel">YCHackers</p>
		<p id="footerCompany">
			<span class="footerLabel">?????????</span> (???)??????????????????
		</p>
		<p id="footerCompanyNum">
			<span class="footerLabel">???????????????</span> 000-00-00000
		</p>
		<p id="footerAddress">??????????????? ????????? ????????? 1319-4 ????????????????????? </p>
		<a class="footerLink" id="companyIntro" href="companyIntro">????????????</a>&emsp; 
		<a class="footerLink" id="termsOfService" href="termsOfService">?????????????????????</a> &emsp;
		<a class="footerLink" id="privacyPolicy" href="privacyPolicy">????????????????????????</a>
	</div>
	<div class="footerBox">
		<p>
			<span class="footerLabel">????????????</span> 000-0000-0000
		</p>
		<p>
 			<span class="footerLabel">????????????</span> 000-0000-0000
		</p><br/><br/>
		<p>
			<span id="footerCopy">COPYRIGHT &copy; 2022(???)?????????????????? ALL RIGHTS RESERVED</span>
		</p>
	</div>
</div>

<script>
<c:choose>
	<c:when test="${not empty log}">
		$("#loginfo").text("welcome");
	</c:when>
	<c:when test="${not empty logout}">
		$("#skillTitle").text("log out ??????");
		$("#skillDetails").text("spring security??? ?????? ????????????????????????. HttpSession??? rememberMe ????????? ???????????? ????????? ????????? ??????????????????.");
		$("#loginfo").text("log out ??????");
	</c:when>
	<c:when test="${not empty error}">
		$("#loginfo").text("welcome");
	</c:when>
	<c:otherwise>
		$("#loginfo").text("information");
	</c:otherwise>
</c:choose>
</script>
<script type="text/javascript">
/*facebook ???????????? ?????????...
function getUserData() {
	/* FB.api('/me', function(response) {
        document.getElementById('response').innerHTML = 'Hello ' + response.name;
        console.log(response);
    }); 
*/
/* facebook ???????????? ?????????...
    FB.api('/me', {fields: 'name,email'}, function(response) {
        var facebookname = response.name;
        window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/hansub_project/home?facebookname="+facebookname);
});
function metaLogin(){
	//load the JavaScript SDK
	(function(d, s, id){
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) {return;}
	    js = d.createElement(s); js.id = id;
	    js.src = "//connect.facebook.com/ko_KR/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
}
$(document).ready(function(){
	$("#flog").click(function(e){
		e.preventDefault();
		//already login facebook check
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
		window.fbAsyncInit = function() {
			FB.init({
				appId      : '2368003246689982',
				cookie     : true,
				xfbml      : true,
				version    : 'v15.0'
			});
			FB.AppEvents.logPageView();   
		};
		metaLogin();
	    //do the login
	    	FB.login(function(response) {
	        	if (response.authResponse) {
	            	access_token = response.authResponse.accessToken; //get access token
	            	user_id = response.authResponse.userID; //get FB UID
	            	console.log('access_token = '+access_token);
	            	console.log('user_id = '+user_id);
	            	//user just authorized your app
	            	//document.getElementById('loginBtn').style.display = 'none';
	            	getUserData();
	        	}
	    	},
	    	{scope: 'email,public_profile,user_birthday',return_scopes: true});
	});
});
*/
</script>

</body>
</html>