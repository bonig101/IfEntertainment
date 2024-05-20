<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
}

.logo > a {
    display: inline-block;
    vertical-align: middle;
    max-width: 100%; 
    width: 100%; 
}
.alarmList > li {
	display: flex;
}
.logoimg-box {
	width: 80px !important;
}
.logoimg-box img {
	width: 100%;
}
.noti_date:before {
    background-color: #c4c4c4;
    border-radius: 50%;
    content: "";
    display: inline-block;
    height: 2px;
    margin: 10px 6px 0;
    vertical-align: top;
    width: 2px
}
.noti_noti{
	color: #a6a6a6;
}

span.status::after {
	display: none;
}
.top-area .user-img > span.status{
	display: none;
}

span.status.f-online {
    background: none !important;
}

.animation-blink {
    animation: blink 1s infinite; /* 깜빡거리는 애니메이션을 적용합니다. */
}

@keyframes blink {
    0% {
        opacity: 1;
    }
    50% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}
#Signin{
	border:none;
	background: linear-gradient(rgb(152, 22, 245) 0%, rgb(189, 22, 245) 100%);
    border-radius: 100px;
    color: #fff;
    font-size: 15px;
    font-weight: 700;
    line-height: 18px;
    margin-right: 10px;
    padding: 8px 20px 10px 22px;
    margin-left: 30px;
    
}
.chat-setting li {
	border-bottom: 1px solid #e1e8ed;
}
.lang {
	cursor: pointer;
    display: inline-block;
    /* vertical-align: middle; */
    position: relative;
    line-height: 55px;
    margin-left: 20px;
    margin-right: 20px;
}
.lang > h5 {
    display: inline-block;
    font-size: 15px;
    margin: 0;
}
.languages.active {
    opacity: 1;
    visibility: visible;
}
.lang li {
	border-bottom: 1px solid #e1e8ed;
}
.languages {
	background: #fff none repeat scroll 0 0;
    border-radius: 0 0 3px 3px;
    position: absolute;
    text-align: left;
    top: 100%;
    width: 200px;
    opacity: 0;
    visibility: hidden;
    line-height: initial;
    box-shadow: 0 10px 20px rgba(0, 0, 0, .2);
    transform: translate(-50%);
    transition: all 0.2s linear 0s;
}
.lang-ul {
	padding: 0;
	margin: 0;
} 
.languages ul>li {
	list-style: none;
}
.languages ul>li a{
	display: inline-block;
    font-size: 13px;
    padding: 10px 15px;
    text-transform: capitalize;
    width: 100%;
    background: #fff;
    position: relative;
    height: 50px;
    line-height: 35px;
}
.languages > ul li a:hover {
    background: #f1f1f1;
}
.mesg-meta > h6 {
	margin: 0;
}
.top-area {
	display: inline-block;
    text-align: right;
    vertical-align: middle;
    width: 90%;
    height: 55px;
    display: flex;
    justify-content: flex-end;
    align-items: center;
}
.topbar {
	display: flex;
	align-items: center;
}
#gocomm {
	padding-left: 10px;
	color : #07D8E2;
	font-size: 22px;
	border-left: 1px solid #e0e0e0;
	height: 30px;
} 
.user-img {
	margin-right: 20px;
}

</style>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.userId" var="idInfo"/>
</sec:authorize>	
		<div class="topbar stick">
			<div class="logo">
			<a title="" href="/goods/main.do">
				<span style="font-family: 'LOTTERIACHAB'; color: #9551fc; font-size: 20px;">
				If Goods <i class="fa-brands fa-waze"></i>
				</span>
		</a>
			</div>
			<c:choose>
				<c:when test="${empty idInfo}">
					<div class="top-area">
						<ul class="setting-area">
							<li>
								<a href="/goods/notice/userlist.do" title="공지사항">
									<span>공지사항</span>
								</a>
							</li>
							<li>
								<button id="Signin">Sign in</button>
							</li>
						</ul>
					</div>
				</c:when>
				<c:otherwise>
					<div class="top-area">
						<ul class="setting-area">
							<li>
								<a onclick="location.href='/goods/goodsCart.do'" id="cartBtn" title="장바구니">
									<span>장바구니</span>
								</a>
							</li>
							<li>
								<a href="/goods/myOrder.do" title="주문/배송">
									<span>주문/배송</span>
<!-- 									<i class="fa-solid fa-caret-down"></i> -->
								</a>
								<div class="dropdowns">
									<ul class="drops-menu">
										<li>
											<div>
												<div class="mesg-meta">
													<h6><a href="/goods/myOrder.do" title="주문내역">주문내역</a></h6>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="mesg-meta">
													<h6><a href="/goods/order/issuelist.do" title="교환/취소내역">교환/취소내역</a></h6>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="mesg-meta">
													<h6><a href="/goods/address/manage.do" title="배송주소">배송 주소 관리</a></h6>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<a onclick="javascript:location.href='/goods/notice/userlist.do'" title="공지사항">
									<span>공지사항</span>
								</a>
							</li>
							<li>
								<a href="#" title="Messages">
									<span>샵 고객센터</span>
									<i class="fa-solid fa-caret-down"></i>
								</a>
								<div class="dropdowns">
									<ul class="drops-menu">
										<li>
											<div>
												<div class="mesg-meta">
													<h6><a href="/goods/faq/userList.do" title="">자주 묻는 질문</a></h6>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="mesg-meta">
													<h6><a href="/goods/inquiry/userlist.do" title="">1:1 문의</a></h6>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</li>
							<%-- <li>
								<a href="#" title="Languages">
									<i><svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 24 24"
											fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-globe">
											<circle cx="12" cy="12" r="10"></circle>
											<line x1="2" y1="12" x2="22" y2="12"></line>
											<path
												d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z">
											</path>
										</svg>
									</i>
									<span>한국어</span>
									<i class="fa-solid fa-caret-down"></i>
								</a>
								<div class="dropdowns languages">
									<div data-gutter="10" class="row">
										<div class="col-md-3">
											<ul class="dropdown-meganav-select-list-lang">
												<li class="active">
													<a href="#">
														<img title="Image Title" alt="Image Alternative text"
															src="images/flags/US.png">English(US)
													</a>
												</li>
												<li class="active">
													<a href="#">
														<img title="Image Title" alt="Image Alternative text"
															src="images/flags/KOR.png">한국어
													</a>
												</li>
												<li>
													<a href="#">
														<img title="Image Title" alt="Image Alternative text"
															src="images/flags/JP.png">日本語
													</a>
												</li>
												<li>
													<a href="#">
														<img title="Image Title" alt="Image Alternative text"
															src="images/flags/CN.png">简体中文
													</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</li> --%>
							<li>
								<a class="notiBtn" href="/goods/myOrder.do" title="알림">
									<i class="fa fa-bell" style="margin-right: 10px; color: #9551fc; aria-hidden=true; font-size:19px" ></i>
									<em class="goodsnoti"></em>
								</a>
								<div class="dropdowns" style="width: 350px; left: -200px">
									<ul class="drops-menu alarmList">
									</ul>
								</div>
							</li>
						</ul>
						<div class="user-img">
							<h5 style="color: #9551fc">${idInfo }</h5>
							<span class="status f-online"></span>
							<div class="user-setting">
								<ul class="chat-setting">
									<li>
										<a href="#" title="" style="height: 50px; line-height: 35px;">
											<span class="f-online">내 정보 수정</span>
										</a>
									</li>
									<li>
										<a href="#" title="" style="height: 50px; line-height: 35px;">
											<span class="f-online">멤버십</span>
										</a>
									</li>
									<li>
										<a href="#" title="" style="height: 50px; line-height: 35px;">
											<span class="f-online">컬렉션</span>
										</a>
									</li>
									<li>
										<a href="#" title="" id="logoutBtn" style="height: 50px; line-height: 35px;">
											<!-- <i class="ti-power-off" style="margin-right: 8px"></i> -->
											로그아웃
										</a>
										<form action="/logout" method="post" id="logoutForm">
											<input type="hidden" name="outFlag" id="outFlag" value="g">
											<sec:csrfInput/>
										</form>
									</li>
								</ul>
							</div>
						</div>
						<!-- <div class="lang">
							<h5 style="color: #9551fc">
								<a href="#" title="Languages">
									<span>한국어</span>
									<i class="fa-solid fa-caret-down"></i>
								</a>
							</h5>
							<div class="dropdowns languages" style="padding: 0;">
								<ul class="lang-ul">
									<li>
										<a href="#">
											English(US)
										</a>
									</li>
									<li>
										<a href="#">
											한국어
										</a>
									</li>
									<li>
										<a href="#">
											日本語
										</a>
									</li>
									<li>
										<a href="#">
											简体中文
										</a>
									</li>
								</ul>
							</div>
						</div> -->
						<div id="gocomm" >
							<a href="/community/main.do" style="color : #07D8E2;">
								<i class="fa-brands fa-rocketchat" style="padding-top: 5px;"></i>
							</a>
						</div>
					</div>
			</c:otherwise>
		</c:choose>
			</div><!-- topbar -->

		
<script type="text/javascript">
$(function () {
	
	$('.lang').on('click', function() {
		$('.languages').toggleClass("active");
	});
	
	//세션의 userId
	var userId = "${idInfo}";
	
	var Signin = $("#Signin");
	
	Signin.on("click", function () {
		location.href = "/signin.do?flag=g";
	});
	
	$.ajax({
		url : "/socket/selectAlarm.do?userId=" + userId,
		type : "get",
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function (res) {
			var html = "";
			if (res.length > 0) {
				$(".goodsnoti").css("opacity", "1");
				
				for (var i = 0; i < res.length; i++) {
					
					var notiNo = res[i].notiNo;
					var agIcon = res[i].agIcon;
					if (agIcon == null) {
						agIcon = "/resources/iflogo/iflogo_3.png";
					}
					var notiUrl = res[i].notiUrl;
					var notiContent = res[i].notiContent;
					var notiSender = res[i].notiSender;
					if (notiSender == 'admin001') {
						notiSender = 'IF담당자';
					}
					var Date = res[i].notiDate.toString();;
					var spaceIndex = Date.indexOf(" ");
					var notiDate = Date.substring(0, spaceIndex);
					var notiCnfrm = res[i].notiCnfrm;
					
					html += '<li class="alramli" data-notino="'+notiNo+'">';
					html += '	<div class="logoimg-box">';
					html += '		<img alt="" src="'+agIcon+'">';
					html += '	</div>';
					html += '	<div class="notiInfo">';
					html += '		<div class="mesg-meta" style="width: 100%;">';
					html += '			<h6><a href="'+notiUrl+'">'+notiContent+'</a></h6>';
					html += '			<div class="noti_noti">';
					html += '				<a href="'+notiUrl+'">';
					html += '					<span>'+notiSender+'</span><span class="noti_date">'+notiDate+'</span>';
					html += '				</a>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '</li>';
				}
				
				
			}else {
				
				html += '<li class="nonList">';
				html += '	<div class="notiInfo">';
				html += '		<h6>알림이 없습니다.</h6>';
				html += '	</div>';
				html += '</li>';
			}
			$(".alarmList").html(html);
		}
	});
	
	$(".alarmList").on("click", ".alramli", function () {
		var notiNo = $(this).data("notino");
		
		$.ajax({
			url : "/socket/updateReadAlarm.do?notiNo=" + notiNo,
			type : "post",
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function (res) {
				console.log(res);
			}
		});
	});
	
	var notiBtn = $(".notiBtn");
	
	notiBtn.on("click", function () {
		$(".goodsnoti").removeClass("animation-blink");
	});
	
	var logoutBtn = $("#logoutBtn"); 	// 로그아웃 버튼
	var logoutForm = $("#logoutForm");	// 로그아웃 폼
	
	logoutBtn.on("click", function(event){
		event.preventDefault();
	    Swal.fire({
	        title: '로그아웃 하시겠습니까?', 
	        text: "", 
	        icon: 'info', 
	        showCancelButton: true, // 취소 버튼 보이도록 설정
	        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
	        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
	        confirmButtonText: '로그아웃', // 삭제 버튼 텍스트 설정
	        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
	    }).then((result) => {
	        if (result.isConfirmed) { 
	        	logoutForm.submit();
	        }
		});
	});
	
});
</script>