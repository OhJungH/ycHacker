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
<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<h2 style="margin-top:50px"><b>스터디룸 등록</b></h2>
<form action="studyroomWrite?${_csrf.parameterName}=${_csrf.token}" id="studyroomWrite" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${user_id}">
	<div class="container" style="background-color:white; margin-top:50px; height: 300px;" >
		<div id="image_container" style="float:right; margin-right:200px;">
		 	<input type="file" id="files" name="cafeImage" style="display: none;">
		 	<img src="https://recipe1.ezmember.co.kr/img/pic_none2.gif" id="image" style="width: 200px; height: 150px;">
		</div>
		스터디룸 이름 :&nbsp;&nbsp;<input type="text" id="cafeName" style="width:250;"  name="cafeName"><br/><br/>
		<p style="float:left;">스터디룸 소개 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
			<textarea name="cafeIntro" id="cafeIntro" style="height:100px; width:350px; resize:none; float:left;" placeholder="스터디룸 소개글 작성"></textarea><br/><br/><br/><br/><br/>
		<br/>
		<p style="float:left; margin-right:20px;">주 소 :</p>
		<input type="text" id="cafeLocation" style="width:350px;" name="cafeLocation"><br/><br/>
		
		<p style="display:inline-block;">인원 :</p>
		<c:set var="men" value='<%=new String[] {"1인", "2인", "3인", "4인", "5인"}%>'/>
		<select name="cafeMember" id="cafeMember">
			<option>인원</option>
			<c:forEach var="mens" items="${men}">
				<option>${mens}</option>
			</c:forEach>
		</select><br/><br/>
		<p style="display:inline-block;">시간 :</p>
		<c:set var="time" value='<%=new String[] {"1시간","2시간","3시간","4시간","5시간"}%>'/>
		<select name="cafeTime" id="cafeTime">
			<option>시간</option>
			<c:forEach var="times" items="${time}">
				<option>${times}</option>
			</c:forEach>
		</select><br/>
		<p style="display:inline-block;">스터디룸 연락처 : </p>
		<input type="text" id="cafeTel" style="width:250px; display:inline-block;" name="cafeTel"><br/><br/>
		<p style="float:left; margin-right:20px;">금 액 :</p>
		<input type="text" id="cafePrice" style="width:350px;" name="cafePrice"><br/>
	</div>
	<div class="content" style="background-color: white; margin-top:30px; margin-right: 130px;">
		<div id="recycle" style="margin-top: 200px;">
			<div id="Item1" class="step" style="display: inline-block;">
				<button type="button" class="btn btn-black delete" style="float:right;">삭제</button>
				<p style="display: inline-block; vertical-align: top; font-size: 25px; color: Yellowgreen;" class="title">내부 사진1</p>
				<div id="Text1">
					<img src="https://recipe1.ezmember.co.kr/img/pic_none2.gif" class="imgs" style="width: 200px; height: 150px;">
					<input type="file" name="recipeImage" id="file1" class="imgFile" onchange="fileSelect(event)" style="display: none;"/><br/><br/>
				</div>
			</div>
		</div>
	</div>
	<button id="rBtn" type="button" style="margin-left:20%;">순서 추가</button>&nbsp;&nbsp;
	<br/><br/>	
	<div style="text-align:center">
		<button type="submit" class="btn btn-success" id="submit">등  록</button>&nbsp;&nbsp;
		<a id="gocafeList" href="cafeList" class="btn btn-info">목록보기</a>
		<a id="gocafeListTwo" href="recipeAllViewTwo" class="btn btn-info" style="display: none;">목록보기</a>
	</div>
</form>
<script>
$(document).ready(function() {
	
	$("#image").click(function() {
		$("#files").trigger("click");
	});
	
	document.getElementById("files").onchange = function () {
	    var reader = new FileReader();
	
	    reader.onload = function (e) {
	        document.getElementById("image").src = e.target.result;
	    };
	
	    reader.readAsDataURL(this.files[0]);
	};

 	$("#rBtn").click(function() {
 		let steps = document.getElementsByClassName("step").length+1;
		let newDiv = document.createElement("div");
		newDiv.setAttribute("id", "Item"+steps);
		newDiv.setAttribute("class", "step");
		newDiv.setAttribute("style", "display: inline-block");
		newDiv.innerHTML = 
			  "<button type='button' class='btn btn-black delete' style='float:right;'>삭제</button>"
			+ "<p style='display:inline-block; vertical-align:top; font-size:25px; color:Yellowgreen;' class='title'>내부 사진"+steps+"</p>&nbsp;"
			+ "<div id='Text"+steps+"'>"
			+ "<img src='https://recipe1.ezmember.co.kr/img/pic_none2.gif' class='imgs' style='width: 200px; height: 150px;'>"
			+ "<input type='file' name='recipeImage' id='file"+steps+"' class='imgFile' onchange='fileSelect(event)' style='display: none;'/><br/><br/>"
			+ "</div>";
		$("#recycle").append(newDiv);
	});
	$(document).on("click", "img.imgs", function(event) {
		let imgFiles = $(event.target).next();
		imgFiles.trigger("click");
	});
	
	$("#submit").on("click", function() {
		if($("#files").val() == "") {
			alert("대표 이미지를 넣어주세요.");
			return false;
		} else if($("#cafeName").val() == "") {
			alert("스터디룸 이름을 적어주세요.");
			return false;
		} else if($("#cafeName").val().length < 2 || $("#cafeName").val().length > 100) {
			alert("스터디룸 이름을 2~100자 이내로 적어주세요");
			return false;
		} else if($("#cafeIntro").val() == "") {
			alert("스터디룸 소개를 적어주세요.");
			return false;
		} else if($("#cafeLocation").val() == "") {
			alert("스터디룸 주소를 적어주세요.");
			return false;
		} else if($("#cafeTel").val() == "") {
			alert("스터디룸 연락처를 적어주세요.");
			return false;
		} else if($("#cafePrice").val() == "") {
			alert("스터디룸 금액을 적어주세요.");
			return false;
		} else if($("#cafeMember").val() == "인원") {
			alert("인원을 설정해주세요");
			return false;
		} else if($("#cafeTime").val() == "시간") {
			alert("시간을 설정해주세요");
			return false;
		}
		let steps = document.getElementsByClassName("step").length;
		let imgFile = document.getElementsByClassName("imgFile");
		for(let i=0; i<steps; i++) {
			if (imgFile[i].value == "") {
				alert("내부 사진의 이미지를 넣어주세요.");
				return false;
			}
		}
		return true;
	});
	
	$("#studyroomWrite").submit(function(event) {
		let form = new FormData($('#studyroomWrite')[0]);
		event.preventDefault();
		$.ajax({
			url : $("#studyroomWrite").attr("action"),
			type : $("#studyroomWrite").attr("method"),
			data : form,
			processData : false,
			contentType : false,
			success : function(data) {
				if(data.search("write-success") > -1) {
					alert("스터디룸을 작성했습니다.");
					$("#gocafeList").trigger("click");
				} else {
					alert("스터디룸을 작성하지 못했습니다.");
				}
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	});
	
	$("#gocafeList").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : $("#cafeList").attr("href"),
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
	
	$(document).on("click", "button.delete", function(event) {
		let steps = document.getElementsByClassName("step").length;
		if(steps < 2) {
			alert("내부 사진은	 1개 이상 필요합니다.");
			return;
		}
		let recycle = $(event.target).parent();
		recycle.remove();
		
		steps = document.getElementsByClassName("step").length;
		for(let i=0; i<steps; i++) {
			$("div.step").eq(i).attr("id", "Item"+(i+1));
			let title = $("p.title").eq(i);
			title.text("내부사진"+(i+1));
			title.next().attr("id", "Text"+(i+1));
			title.next().find("input").attr("id", "file"+(i+1));
		}
	});
});
function fileSelect(event) {
	let reader = new FileReader();
	let img = $(event.target).prev();
	let id = $(event.target).attr("id")-1;
	
	reader.onload = function(event) {
		img.attr("src", event.target.result);
	};
	reader.readAsDataURL(event.target.files[0]);
}

</script>
</body>
</html>