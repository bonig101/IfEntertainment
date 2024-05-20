<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>IF ENTERTAINMENT-admin</title>
<meta id="_csrf" name="_csrf" content=${_csrf.token }>
<meta id="_csrf_header" name="_csrf_header" content=${_csrf.headerName }>
<link rel="icon" type="image/png" href="images/fav.png">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/line-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/perfect-scrollbar.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/jquery.datepicker.min.css">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/datepicker/jquery.timepicker.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/color.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/responsive.css">
<!-- 폰트어썸 CDN -->
<script src="https://kit.fontawesome.com/1cc7793b32.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath }/resources/js1/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js1/jquery-ui.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/nice-select.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script><!-- 스위트 알러트 -->
<%--    <script src="${pageContext.request.contextPath }/resources/js1/datepicker/jquery.timepicker.min.js"></script> --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.userId" var="idInfo"/>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/alam/jsAlam.js" defer="defer"></script>
</sec:authorize>

<script type="text/javascript">
$(function(){
	var userId = "${idInfo}";
	
	let ws = connection("ws://localhost/notiserver/" + userId);

	$(document).ready(function() {

		ws.onopen = function() {
			// 서버에 접속을 하였을 경우 별도의 이벤트 처리가 필요할경우 작성한다.
		};
		
		ws.onmessage = function(message) {
			// 수신된 메시지를 받아서 처리 하는 영역
			console.log("message", message);
		};
		
		ws.onerror = function(message) {
			// 서버에서 에러 메시지가 반환이 되었을경우 처리..
		};
		
	});

	/**
	 * 웹 소캣 connection 연결부
	 */
	function connection(url) {
		if ('WebSocket' in window) {
			return new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			return new MozWebSocket(url);
		} else {
			Console.log('Error: WebSocket is not supported by this browser.');
			return null;
		}
	}
	 
	/**
	 * 페이지를 벗어 났을때 웹소켓 닫기..
	 */
	window.onbeforeunload = function() {
		ws.close();
	};
});
</script>

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
}

 /* 관리자 로딩 화면 전체 사용안할 시 활성화 */
 #loader-wrapper {
 	display: none;
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
	<!-- Start Page Loading -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<div class="panel-layout">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<div class="main-page">
						<!-- 사이드 바 영역 -->
						<tiles:insertAttribute name="aside" />

						<!-- 헤더 영역 -->
						<tiles:insertAttribute name="header" />

						<div class="main-content">
							<div class="responsive-header">
								<div class="logo-area">
									<ul class="notify-area">
										<li>
											<div class="nav-icon3">
												<span></span> <span></span> <span></span> <span></span>
											</div>
										</li>
									</ul>

									<div class="user-head">
										<div class="admin">
											<span>YISOO723</span>
											<div class="admin-avatar">
												<i class="online"></i>
											</div>
										</div>
										<div class="drop setting">
											<span class="drop-head">stifen Doe <i>30 days
													trial</i></span>
											<ul class="drop-meta">
												<li><a href="#" title=""><i
														class="fa fa-eyedropper"></i>Edit Profile</a></li>
												<li><a href="#" title=""><i
														class="fa fa-envelope-o"></i>My Inbox</a></li>
												<li><a href="#" title=""><i class="fa fa-adjust"></i>task</a>
												</li>
												<li><a href="#" title=""><i class="fa fa-calendar"></i>Calender</a>
												</li>
												<li><a href="#" title=""><i
														class="fa fa-align-right"></i>Balance Report</a></li>
											</ul>
											<span class="drop-bottom"><a href="#" title=""><i
													class="fa fa-sign-out"></i>log Out</a>
											</span>
										</div>
									</div>
									<ul class="seting-area">
										<li class="langages"><a href="#" title="">관리할 카테고리</a> <i
											class="fa-solid fa-caret-down"></i>
											<ul class="drop language">
												<!-- <li class="lang-selected"><a href=""><i class="fa fa-check"></i> Eng</a></li> -->
												<li><a href="">엔터테인먼트</a></li>
												<li><a href="">커뮤니티</a></li>
												<li><a href="">굿즈샵</a></li>
											</ul></li>
										<li class="setting-panel"><a href="#" title="">사이트
												바로가기<i class="fa-duotone fa-square-up-right"></i>
										</a></li>
									</ul>
								</div>
							</div>
							<!-- responsive header -->
							<div class="panel-body">
								<div class="content-area">
									<div class="sub-bar">
										<!-- <div class="sub-title">
											<h4>Dashboard:</h4>
											<span>Welcome To web Admin Panel!</span>
										</div> -->
<!-- 										<ul class="bread-crumb"> -->
<!-- 											<li><a href="#" title="">Home</a></li> -->
<!-- 											<li>Dashbord</li> -->
<!-- 										</ul> -->
									</div>

									<!-- 콘텐츠 영역 -->
									<tiles:insertAttribute name="content" />

								</div>
								<!-- 푸터 영역 -->
								<tiles:insertAttribute name="footer" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!--  풀캘린더때문에 주석처리했으니 필요하신분은 각자 가져다 쓰시면됩니다. -->
<%-- 	<script src="${pageContext.request.contextPath }/resources/js1/bootstrap.min.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath }/resources/js1/perfect-scrollbar.jquery.min.js"></script> --%>
	<script src="${pageContext.request.contextPath }/resources/js1/owl.carousel.min.js"></script>
<%-- 	<script src="${pageContext.request.contextPath }/resources/js1/chart.min.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath }/resources/js1/echart.min.js"></script> --%>
	<script src="${pageContext.request.contextPath }/resources/js1/jquery.sparkline.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js1/sparkline.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js1/custom.js"></script>
	<!-- scripts -->
	<script src="${pageContext.request.contextPath }/resources/js1/custom2.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js1/jvectormap.js"></script>
	<!-- jvactor map -->
	<script src="${pageContext.request.contextPath }/resources/js1/nice-select.js"></script>
<script>
var header = "";
var token = "";
$(function(){
	// 시큐리티 적용 시, header 키 값과 토큰을 설정 
	// (동적 페이지마다 전역변수로 설정된 header, token을 가져다 쓸 수 있다)
	header = $("meta[name='_csrf_header']").attr("content");
	token = $("meta[name='_csrf']").attr("content");
	
	// 최초 1회만 로딩화면을 띄우고 다음부턴 띄우지 않음
	setTimeout(() => {
		$("#loader-wrapper").css("display", "none")
	}, 3000);
});
</script>

</body>

</html>