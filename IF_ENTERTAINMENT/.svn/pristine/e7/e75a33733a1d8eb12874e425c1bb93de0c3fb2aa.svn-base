<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta id="_csrf" name="_csrf" content=${_csrf.token }>
<meta id="_csrf_header" name="_csrf_header" content=${_csrf.headerName }>
<title>LOGIN PAGE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="icon" type="image/png" href="images/fav.png">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/color.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/responsive.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style type="text/css">
@font-face {
    font-family: 'LOTTERIACHAB';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/LOTTERIACHAB.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
	font-family: 'GmarketSansMedium', sans-serif;
	display: flex;
  	justify-content: center;
  	align-items: center;
  	min-height: 100vh;
  	background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%); /* 그라데이션 배경색 */
  	width: 100%;
  	overflow: hidden;
}
.ring {
  	position: relative;
  	width: 500px;
  	height: 500px;
  	display: flex;
  	justify-content: center;
  	align-items: center;
}
.ring i {
  	position: absolute;
	  inset: 0;
  	border: 2px solid black;
  	transition: 0.5s;
}
.ring i:nth-child(1) {
	  border-radius: 38% 62% 63% 37% / 41% 44% 56% 59%;
  	animation: animate 6s linear infinite;
}
.ring i:nth-child(2) {
	  border-radius: 41% 44% 56% 59%/38% 62% 63% 37%;
  	animation: animate 4s linear infinite;
}
.ring i:nth-child(3) {
	border-radius: 41% 44% 56% 59%/38% 62% 63% 37%;
  	animation: animate2 10s linear infinite;
}
.ring:hover i {
	border: 6px solid var(--clr);
  	filter: drop-shadow(0 0 20px var(--clr));
}
@keyframes animate {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
@keyframes animate2 {
  0% {
    transform: rotate(360deg);
  }
  100% {
    transform: rotate(0deg);
  }
}
.login {
	position: absolute;
  	width: 300px;
    height: 100%;
  	display: flex;
  	justify-content: center;
  	align-items: center;
  	flex-direction: column;
  	gap: 20px;
}
.login h2 {
  	font-size: 2em;
  	color: black;
}
.login .inputBx {
  	position: relative;
  	width: 100%;
  	margin-bottom: 15px;
}
.login .inputBx input {
  	position: relative;
  	width: 100%;
  	padding: 12px 20px;
  	background: transparent;
  	border: 2px solid black;
  	border-radius: 40px;
  	font-size: 1.2em;
  	color: black;
  	box-shadow: none;
  	outline: none;
}
.login .inputBx input[type="button"] {
	width: 100%;
  	background: #0078FF;
  	background: linear-gradient(45deg, #FF357A, #FFF172);
  	border: none;
  	cursor: pointer;
}
.login .inputBx input::placeholder {
  	color: rgba(107, 102, 102, 0.75);
}
.login .links {
 	position: relative;
  	width: 100%;
  	display: flex;
  	align-items: center;
  	justify-content: space-between;
  	padding: 0 20px;
}
.login .links a {
  	color: black;
  	text-decoration: none;
}

/* 체크박스 커스텀 */
.custom-checkbox {
	position: relative;
	left: 5px;
    display: inline-block;
    cursor: pointer;
}

.custom-checkbox input[type="checkbox"] {
    display: none;
}

.custom-checkbox label {
    position: relative;
    padding-left: 25px;
    cursor: pointer;
    font-size: 16px;
    color: #000;
}

.custom-checkbox label:before {
    content: "";
    position: absolute;
    left: 0;
    top: 50%;
    transform: translateY(-50%);
    width: 18px;
    height: 18px;
    border: 2px solid #6552de;
    border-radius: 3px;
    background-color: #fff;
}

.custom-checkbox input[type="checkbox"]:checked + label:before {
    content: "\2713";
    font-size: 16px;
    font-weight: bolder;
    color: #6552de;
    text-align: center;
    line-height: 18px;
    background-color: #fff;
    border: 2px solid #6552de;
}

.custom-checkbox input[type="checkbox"]:checked + label:hover:before {
    background-color: #45a049; /* 호버 시 배경색 변경 */
    border-color: #45a049; /* 호버 시 테두리 색 변경 */
    color: white; /* 호버 시 체크 마크 색상 변경 */
}

#idError, #pwError {
	margin-top: 3px;
	position: relative;
	left: 10px;
}

.button-container {
  position: fixed;
  left: 50%;
  bottom: 100px; /* 버튼과 화면 하단 간의 간격을 조절할 수 있습니다. */
  transform: translateX(-50%);
}

</style>
</head>
<c:if test="${not empty message }">
	<script type="text/javascript">
	$(function(){
		Swal.fire({
			  icon: "success",
			  title: "${message}",
			  showConfirmButton: false,
			  timer: 1500
		});
	});
	<c:remove var="message" scope="request"/>
	<c:remove var="message" scope="session"/>
	</script>
</c:if>
<body>
	<div class="ring">
	  <i style="--clr:#9400D3;"></i>
	  <i style="--clr:#FF00FF;"></i>
	  <i style="--clr:#00FFFF;"></i>
	  <div class="login">
	   <h2 style="font-family: 'GmarketSansMedium';"><a href="/community/main.do">IF ENTERTAIN</a></h2>

	    <form action="/login" method="post" id="signForm">
			<input type="hidden" value="${param.flag}" name="flag" id="flag">
		    <div class="inputBx">
		      <input type="text" id="userId" name="username" placeholder="아이디">
		      <div class="errorMessage" id="idError"></div>
		    </div>
		    <div class="inputBx">
		      <input type="password" id="userPw" name="password" placeholder="비밀번호">
		      <div class="errorMessage" id="pwError"></div>
		    </div>
		    <div class="custom-checkbox">
		    	<input type="checkbox" id="remember" name="remember-me">
		    	<label for="remember">내 정보저장 </label>
	    	</div> 
		    <div class="inputBx">
		      <input type="button" id="signinBtn" value="로그인">
		    </div>
		    <sec:csrfInput/>
		</form>
	    <div class="links">
	      <a href="/idfind.do">아이디/비밀번호 찾기</a>
<!-- 	      <a href="/pwfind.do">비밀번호찾기</a> -->
	      <a href="/signup.do">회원가입</a>
	    </div>
	  </div>
	</div>
	
	<div class="button-container">
  <button id="adminBtn">관리자 테스트</button>
  <button id="userBtn">사용자 테스트</button>
</div>

<!--ring div ends here-->
</body>
<script src="${pageContext.request.contextPath }/resources/js1/jquery.js"></script>
<script src="${pageContext.request.contextPath }/resources/js1/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js1/custom.js"></script>
<script>
var header = "";
var token = "";

$(function(){
	
	var adminBtn = $("#adminBtn");
	var userBtn = $("#userBtn");
	
	userBtn.on("click", function(){
		$("#userId").val("rkskekfk123");
		$("#userPw").val("Rkskekfk123");
	});
	
	adminBtn.on("click", function(){
		$("#userId").val("zeze161027");
		$("#userPw").val("qwerQ1234");
	});
	
	
	
	
	// 시큐리티 헤더, 토큰 설정
	header = $("meta[name='_csrf_header']").attr("content");
	token = $("meta[name='_csrf']").attr("content");
	
	var signinBtn = $("#signinBtn");
	var signForm = $("#signForm");
	
	signinBtn.on("click", function(){
		$("#idError").text("");
		$("#pwError").text("");
		
		var id = $("#userId").val();
		var pw = $("#userPw").val();
		
		if(id == null || id == ""){
			$("#idError").text("아이디를 입력해주세요!").css("color", "red");
			return false;
		}
		
		if(id.length > 12){
			$("#idError").text("아이디는 최대 12자까지 입력 가능합니다!").css("color", "red");
			return false;
		}
		
		if(pw == null || pw == ""){
			$("#pwError").text("비밀번호를 입력해주세요!").css("color", "red");
			return false;
		}
		
		if(pw.length > 12){
			$("#pwError").text("비밀번호는 최대 12자까지 입력 가능합니다!").css("color", "red");
			return false;
		}
		
		signForm.submit();
	});
	
    // Enter 키 눌렀을 때
    $("#userId, #userPw").keypress(function(event){
        if(event.which == 13){
            $("#signinBtn").click(); // 로그인 버튼 클릭
        }
    });
	
	
});

</script>
</html>