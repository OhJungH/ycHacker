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

</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<h2 style="margin-top:50px"><b>스터디룸 등록</b></h2>
<form action="studyroomwrite?${_csrf.parameterName}=${_csrf.token}" id="studyroomwrite" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${user_id}">
	<div class="container" style="background-color:white; margin-top:50px; height: 300px;" >
		<div id="image_container" style="float:right; margin-right:200px;">
		 	<input type="file" id="files" name="cafeImage" style="display: none;">
		 	<img src="https://recipe1.ezmember.co.kr/img/pic_none2.gif" id="image" style="width: 200px; height: 150px;">
		</div>
		스터디룸 이름 :&nbsp;&nbsp;<input type="text" id="title" style="width:250;" placeholder="예)양천 스터디룸" name="cafeName"><br/><br/>
		<p style="float:left;">스터디룸 소개 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
			<textarea name="cafeIntro" id="cafeIntro" style="height:100px; width:350px; resize:none; float:left;" placeholder="스터디룸 소개글 작성"></textarea><br/><br/><br/><br/><br/>
	</div>
	<div class="content" style="background-color: white; margin-top: 20px;  margin-right: 130px;">
		<div id="recycle">
			<div id="Item1" class="step" style="display: inline-block;">
				<button type="button" class="btn btn-black delete" style="float:right;">삭제</button>
				<p style="display: inline-block; vertical-align: top; font-size: 25px; color: Yellowgreen;" class="title">내부 사진</p>
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
		<a id="goStudyroomAllView" href="cafeList" class="btn btn-info">목록보기</a>
		<a id="goStudyroomAllViewTwo" href="StudyroomAllViewTwo" class="btn btn-info" style="display: none;">목록보기</a>
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
		} else if($("#title").val() == "") {
			alert("제목을 적어주세요.");
			return false;
		} else if($("#title").val().length < 2 || $("#title").val().length > 100) {
			alert("제목을 2~100자 이내로 적어주세요");
			return false;
		} else if($("#recipeIntro").val() == "") {
			alert("요리소개를 적어주세요.");
			return false;
		} else if($("#recipeType").val() == "종류별") {
			alert("종류를 설정해주세요");
			return false;
		} else if($("#recipeStyle").val() == "상황별") {
			alert("상황을 설정해주세요");
			return false;
		} else if($("#recipePeople").val() == "인원") {
			alert("인원을 설정해주세요");
			return false;
		} else if($("#recipeTime").val() == "시간") {
			alert("시간을 설정해주세요");
			return false;
		}
		let steps = document.getElementsByClassName("step").length;
		let recipeContent = document.getElementsByClassName("recipeContent");
		let imgFile = document.getElementsByClassName("imgFile");
		for(let i=0; i<steps; i++) {
			if(recipeContent[i].value == "") {
				alert("요리방법을 적어주세요.");
				return false;
			} else if(imgFile[i].value == "") {
				alert("요리방법의 이미지를 넣어주세요.");
				return false;
			}
		}
		return true;
	});
	
	$("#studyroomwrite").submit(function(event) {
		let form = new FormData($('#studyroomwrite')[0]);
		event.preventDefault();
		$.ajax({
			url : $("#studyroomwrite").attr("action"),
			type : $("#studyroomwrite").attr("method"),
			data : form,
			processData : false,
			contentType : false,
			success : function(data) {
				if(data.search("write-success") > -1) {
					alert("레시피를 작성했습니다.");
					$("#goStudyroomAllView").trigger("click");
				} else {
					alert("레시피를 작성하지 못했습니다.");
				}
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	});
	
	$("#goStudyroomAllView").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : "goStudyroomAllView",
			type : "get",
			data : formData,
			success : function(data) {
				$("#body").html(data);
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	});
	
	$(document).on("click", "button.delete", function(event) {
		let steps = document.getElementsByClassName("step").length;
		if(steps < 2) {
			alert("내부 사진은 1개 이상 필요합니다.");
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
			title.next().find("textarea").attr("id", (i+1));
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