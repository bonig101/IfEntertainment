<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath }/resources/js/main.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="keywords" content="" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/color.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css">
<link rel="icon" href="${pageContext.request.contextPath }/resources/images/fav.png" type="image/png" sizes="16x16">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<title>회원정보 수정하기</title>
<meta id="_csrf" name="_csrf" content=${_csrf.token }>
<meta id="_csrf_header" name="_csrf_header" content=${_csrf.headerName }>
	

<style type="text/css">
.gap.signin .bg-image {
    height: 100%;
}

.gap.signin:before {
    z-index: 0;
    height: 100%;
}

@font-face {
	font-family: 'LOTTERIACHAB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/LOTTERIACHAB.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'GmarketSansMedium', sans-serif;
}

.medium-opacity:before {
	-webkit-opacity: .3;
	-moz-opacity: .3;
	-ms-opacity: .3;
	-o-opacity: .3;
	opacity: .3;
}

.radio {
	display: flex;
	flex-direction: row;
}

.frame {
	width: 90%;
	margin: 40px auto;
	text-align: center;
}

.custom-btn {
	width: 130px;
	height: 40px;
	color: #fff;
	border-radius: 5px;
	padding: 10px 25px;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	outline: none;
}

.btn-16 {
	border: none;
}

.btn-16:after {
	position: absolute;
	content: "";
	width: 0;
	height: 100%;
	top: 0;
	left: 0;
	direction: rtl;
	z-index: -1;
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px #0002, 4px 4px 5px 0px #0001;
	transition: all 0.3s ease;
}

.btn-16:hover {
	color: #fff;
	background: #6f42c1;
}

.btn-16:hover:after {
	left: auto;
	right: 0;
	width: 100%;
	border-radius: 7px;
}

.btn-16:active {
	top: 2px;
}

.big-ad>figure {
	margin-bottom: 0;
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
	<div class="www-layout">
		<section>
			<div class="gap no-gap signin whitish medium-opacity register">
				<div class="bg-image"
					style="background-image: url(https://incheontimes.co.kr/boardImage/incheontimes/20230118/MC4wMDQ2NDQwMCAxNjczOTQwNjk5.jpg)">
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-3">
							<div class="big-ad" style="text-align: center;">
								
								<form method="post" id="userVO" enctype="multipart/form-data">
								<div class="profile-author-thumb">
									<img src="${userVO.userProfile}" alt="${pageContext.request.contextPath }" style="width: 150px; height: 150px;">
									<div class="edit-dp">
										<label class="fileContainer"> <i class="fa fa-camera"></i>
											<input type="file" id="myFile" name="myFile" data-userno="${userVO.userNo }">
										</label>
									</div>
								</div>
								<sec:csrfInput/>
								</form>
								
								
								
								<figure
									style="font-family: 'LOTTERIACHAB'; font-size: 30px; padding: 10px; color: white;">
									If entertainment
									<br/>Fan ${userVO.userName } 님
									<i class="fa-brands fa-waze"></i>
								</figure>
								<form action="/community/mypage/delete.do" id="memberOutForm" method="post">
								<input type="hidden" value="${userVO.userNo }" name="userNo">
								<sec:csrfInput/>
								</form>
								<div>
 <button class="custom-btn btn-16" id="memberOutBtn" name="memberOutBtn" value="memberDelyn">탈퇴하기</button>
 <button class="custom-btn btn-16" value="뒤로가기" onclick="goBack();">뒤로가기</button>
							</div>
							
							</div>

						</div>
						<div class="col-lg-9">
							<div class="reg-from" style="margin-top: 100px; margin-bottom: 100px;">
								<span>🛠️회원정보 수정하기</span>
								<p>회원님의 소중한 정보를 안전하게 관리하세요 ❗</p>

								<form class="c-form" method="post" id="myPageForm"
								action="/community/mypage/update.do">
								<input type="hidden" value="${userVO.userNo }" name="userNo">
									<div class="row merged10">
										<div class="col-lg-6 col-md-6 col-sm-6">
											<label>🆔 아이디  </label>
											<input class="mb-2" type="text"  value="${userVO.userId }"
												readonly
												placeholder="ID">
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6">
											<label>👑 이름</label>
											<input class="mb-2" type="text" value="${userVO.userName }"
												readonly
												placeholder="Name">
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12">
										<span><br></span>
										</div>
										
										<div class="col-lg-6 col-md-6 col-sm-6">
											<label>🔐 새 비밀번호</label>
										<input class="mb-2" type="password" id="userPw" name="userPw" 
											placeholder="변경할 비밀번호를 입력해주세요" value="">
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6">
											<label>🔐 새 비밀번호 확인</label>
											<input class="mb-2" type="password" id="userPw1" name="userPw1"
												placeholder="변경할 비밀번호를 한번 더 입력해주세요" value="">
											<div class="myPwCheck"></div>
										</div>
										
										<div id="message"></div>
										
										<div class="col-lg-12 col-md-12 col-sm-12">
										<span><br></span>
										</div>
										
										<div class="col-lg-2 col-md-2 col-sm-2">
												<label>👫 성별</label>
												<input class="mb-2" type="text"
												readonly
												value="${userVO.memberGender }">
										</div>
										
										<div class="col-lg-4 col-md-4 col-sm-4">
											<label>📅 생년월일</label>
											<input class="mb-2" type="text"
												readonly
												value="${userVO.memberBirth }">
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6">
											<label>📱 전화번호</label>
											<input class="mb-2" type="text"
												readonly
												value="${userVO.memberTelno }">
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12">
										<span><br></span>
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12">
										<span><br></span>
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12">
											<label>💌 이메일</label>
											<input class="mb-2" type="text"
												readonly
												value="${userVO.memberEmail }">
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12">
										<span><br></span>
										</div>
										
										<div class="col-lg-2 col-md-2 col-sm-2">
											<label>📫 우편번호</label>
											<input class="mb-2"
												readonly 
												value="${userVO.memberPostcode }">
										</div>
										<div class="col-lg-5 col-md-5 col-sm-5">
											<label>🚩 주소</label>
											<input class="mb-2"
												readonly 
												value="${userVO.memberAddress1 }">
										</div>
										<div class="col-lg-5 col-md-5 col-sm-5">
											<label>상세주소</label>
											<input class="mb-2"
												readonly
												value="${userVO.memberAddress2 }">
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12">
										<span><br></span>
										</div>
										
										<div class="col-lg-5 col-md-5 col-sm-5">
											<div class="gender mb-2">
												<label>💡 알림수신 여부</label>
												<div class="form-radio">
													<div class="radio" style="border: none; background: none; display: flex;">
				<label style="width: 250px;">
					<input type="radio" value="Y" id="agreeBtn" name="memberNotification" <c:if test="${userVO.memberNotification eq 'Y' }">checked</c:if>>
					<i class="check-box"></i>동의
				</label>
				
				<label>
					<input type="radio" value="N" id="disAgreeBtn" name="memberNotification" <c:if test="${userVO.memberNotification ne 'Y' }">checked</c:if>>
					<i class="check-box"></i> 비동의
				</label>
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-lg-7 col-md-7 col-sm-7">
											<div class="gender mb-2">
												<label>🚀 알림수신 채널 선택</label>
												<div class="form-radio">
													<div class="radio" style="border: none; background: none; display: flex;">
				<label>
					<input type="checkbox" id="nsAll" name="nsAll"
					<c:if test="${userVO.nsGoods eq 'Y' && userVO.nsArtist eq 'Y' && userVO.nsCompany eq 'Y' }">checked</c:if>>
					<i class="check-box"></i>전체동의
				</label>
				<label>
					<input type="checkbox" id="nsArtist" name="nsArtist" <c:if test="${userVO.nsArtist eq 'Y'}">checked</c:if>>
					<i class="check-box noti"></i>커뮤니티
				</label>
				
				<label>
					<input type="checkbox" id="nsGoods" name="nsGoods" <c:if test="${userVO.nsGoods eq 'Y'}">checked</c:if>>
					<i class="check-box noti"></i>굿즈샵
				</label>
				
				<label>
					<input type="checkbox" id="nsCompany" name="nsCompany" <c:if test="${userVO.nsCompany eq 'Y'}">checked</c:if>>
					<i class="check-box noti"></i>기업소식
				</label>
														
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12 mb-2">
											<div class="checkbox mb-1">
												<label>
													<input type="checkbox" <c:if test="${userVO.memberNotification eq 'Y'}">checked</c:if>>
													<i class="check-box"></i> 알림수신 서비스·이벤트 정보 수신에 동의합니다.
												</label>
											</div>
										</div>
										
										<div class="col-lg-8 col-md-6 mt-2">
											<span class="reg-with">Register With</span>
											<ul class="social-reg">
												<li>
												<a class="facebook" href="#" title="" data-ripple="">굿즈샵 이용</a>
												</li>
												<li>
												<a class="twitter" href="#" title="" data-ripple="">
												커뮤니티 이용</a></li>
											</ul>
										</div>
										<div class="col-lg-4 col-md-6 mt-2">
											<button type="button" id="updateBtn">회원정보 수정하기</button>
										</div>
									</div>
									<sec:csrfInput/>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>

<script type="text/javascript">
var header = "";
var token = "";
$(function(){
	// 시큐리티 적용 시, header 키 값과 토큰을 설정 
	// (동적 페이지마다 전역변수로 설정된 header, token을 가져다 쓸 수 있다)
	header = $("meta[name='_csrf_header']").attr("content");
	token = $("meta[name='_csrf']").attr("content");
	
	// 프로필 사진 변경 및 저장 
	$("#myFile").on(
			"change",
			function(event) {
				var file = event.target.files[0];
				var userNo = $(this).data("userno");
				var formData = new FormData();
				formData.append("file", file);
				formData.append("userNo", userNo);

				$.ajax({
					url : "/community/mypage/uploadAjax",
					type : "post",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					data : formData,
					dataType : "text", // 비동기 통신의 최종 결과물을 text 형식으로 받겠다고 알리고 전달되는 서버 메소드에서는 produces를 통해 텍스트 인것을 인지하고 받는다
					processData : false, // 이진 데이터로 직렬화가 되어 파일이 제대로 전송되지 않게 되는것을 막는다 (Default값은 true)
					contentType : false,
					success : function(data) {
						$("#thumbLink").attr(
								"href",
								"/community/mypage/displayFile?fileName="
										+ data);
					}
				});

				if (isimgFile(file)) { // 이미지인지를 체크하여 다른 타입은 파일을 업로드할 수 없도록 한다.
					var reader = new FileReader();
					reader.onload = function(e) {
						$("#thumimg").attr("src", e.target.result);
					}
					reader.readAsDataURL(file);
					thumbPassed = true;
				} else {
					Swal.fire({
						icon : "error",
						title : "이미지 파일만 등록가능합니다.",
						showConfirmButton : false,
						timer : 1500
					});
					thumbPassed = false;
				}

			});
	
	$("#nsAll").on("click", function() {
		console.log("@@@", $("#nsAll:checked").val());
		if ($("#nsAll:checked").val() == "on") {
			$("[name='nsGoods']").prop("checked", true);
			$("[name='nsArtist']").prop("checked", true);
			$("[name='nsCompany']").prop("checked", true);
		} else {
			$("[name='nsGoods']").prop("checked", false);
			$("[name='nsArtist']").prop("checked", false);
			$("[name='nsCompany']").prop("checked", false);
		}
	});

	var agreeBtn = $("#agreeBtn"); // 알림수신 여부 동의버튼
	var disAgreeBtn = $("#disAgreeBtn"); // 알림수신 여부 비동의버튼

	if ($("#disAgreeBtn:checked").val() == "N") {
		$("#nsAll").attr("disabled", "disabled").closest("label")
				.css("color", "lightgray");
		$("#nsGoods").attr("disabled", "disabled").closest("label")
				.css("color", "lightgray");
		$("#nsArtist").attr("disabled", "disabled")
				.closest("label").css("color", "lightgray");
		$("#nsCompany").attr("disabled", "disabled").closest(
				"label").css("color", "lightgray");
	}

	disAgreeBtn.on("click", function() {
		$("[name='nsAll']").prop("checked", false);
		$("[name='nsGoods']").prop("checked", false);
		$("[name='nsArtist']").prop("checked", false);
		$("[name='nsCompany']").prop("checked", false);
		$("#nsAll").attr("disabled", "disabled").closest("label")
				.css("color", "lightgray");
		$("#nsGoods").attr("disabled", "disabled").closest("label")
				.css("color", "lightgray");
		$("#nsArtist").attr("disabled", "disabled")
				.closest("label").css("color", "lightgray");
		$("#nsCompany").attr("disabled", "disabled").closest(
				"label").css("color", "lightgray");
	});

	agreeBtn.on("click", function() {
		$("#nsAll").removeAttr("disabled").closest("label").css(
				"color", "#757a95");
		$("#nsGoods").removeAttr("disabled").closest("label").css(
				"color", "#757a95");
		$("#nsArtist").removeAttr("disabled").closest("label").css(
				"color", "#757a95");
		$("#nsCompany").removeAttr("disabled").closest("label")
				.css("color", "#757a95");
	});
	
	// 회원탈퇴
	var memberOutBtn = $("#memberOutBtn");
	var memberOutForm = $("#memberOutForm");	
	memberOutBtn.on("click", async function(){
		/* alert("확인!"); */
		// 비동기 -> 동기로 만들어주는게 async, await 
		var memberOut = await Swal.fire({
	        title: '회원탈퇴를 진행하시겠습니까?😅',
	        text: '탈퇴를 원하실 경우 "회원탈퇴"를 입력해주세요',
	        input: 'text',
	        inputPlaceholder: '회원탈퇴',
	        cancelButtonColor: '#d33',
	        cancelButtonText: '취소',
	        showCancelButton: true,
	        confirmButtonText: '탈퇴'
	    });
		
		/* 알럿으로 확인 !
		alert("memberOut :" + memberOut.value); */
		
		if(memberOut.value != null && memberOut.value === "회원탈퇴") {
			/* alert("널아니궁회원탈툉");  */
			
			memberOutForm.submit();
			
		}else {
			return;
		}
	
	});

	// 비밀번호, 비밀번호 확인 동일 유무
	$('#userPw1').on("keyup", function(event){		
		var myPwCheck = $('.myPwCheck');
	/* 	console.log("event:", event);  정상작동 확인 ! */
		var userPw = $('#userPw').val();	// 새 비밀번호 
		var userPw1 = $('#userPw1').val();
		if(userPw == userPw1){
			myPwCheck.text("비밀번호가 일치합니다.").css("color","green");
		}else {
			myPwCheck.text("비밀번호가 일치하지않습니다.").css("color","red");
		}
	});
	
    // 수정하기 버튼 이벤트 
    var myPageForm = $('#myPageForm');	// 폼 버튼 전역선언
    var updateBtn = $('#updateBtn');	// 수정하기 버튼
    updateBtn.on("click",function(){	// 수정하기 버튼을 클릭했을 때 버튼 이벤트 발생 !!!!!!!!!
    var userPw = $('#userPw').val();	// 새 비밀번호 
    var userPw1 = $('#userPw1').val();	// 새 비밀번호 확인
   /*
   	주석한게 왜 안될까? -> db에서 Y/N으로 받아오고 알림은 on으로 가져오니깐 ! 하지만 난 체크 값이 필요하니깐 체크까지 써서 가져옴 !!!
  	기억나지 않는다면 콘솔을 찍어보장
    var agreeBtn = $('#agreeBtn').val();	
    var disAgreeBtn = $('#disAgreeBtn').val();	
    var nsAll = $('#nsAll').val();	
    var nsArtist = $('#nsArtist').val();	
    var nsGoods = $('#nsGoods').val();
    var nsCompany = $('#nsCompany').val();
    */
    var agreeBtn = $("#agreeBtn:checked").val();	// 알림수신 동의
    var disAgreeBtn = $("#disAgreeBtn:checked").val();		// 알림수신 비동의
    var nsAll = $("#nsAll:checked").val();	// 알림수신 채널 전체동의
    var nsArtist = $("#nsArtist:checked").val();	// 알림수신 커뮤니티
    var nsGoods = $("#nsGoods:checked").val();		// 알림수신 굿즈샵
    var nsCompany = $("#nsCompany:checked").val();	// 알림수신 기업소식
    	
 /* 
 	값을 한번 콘솔로 찍어보아여
 	console.log("userPw:", userPw);
    console.log("userPw1:", userPw1);
    console.log("agreeBtn:", agreeBtn);
    console.log("disAgreeBtn:", disAgreeBtn);
    console.log("nsAll:", nsAll);
    console.log("nsArtist:", nsArtist);
    console.log("nsGoods:", nsGoods);
    console.log("nsCompany:", nsCompany); */
    
    // 새 비밀번호 유효성 검사
    if(userPw == null || userPw == ""){
    	Swal.fire({
            icon: "error",
            title: "새비밀번호를 입력해주세요",
            showConfirmButton: false,
            timer: 1500
        });
    	$("#userPw").focus(); 	// 그 부분으로 커서 깜빡 돌아가는 포커스 효과 ㅎ 
    	return;
    } else {
    	if(!/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/.test(userPw)){
            Swal.fire({
                icon: "error",
                title: "비밀번호는 영문 대소문자, 숫자를 포함하여 8자 이상이어야 합니다",
                showConfirmButton: false,
                timer: 1500
            });
            $("#userPw").focus(); 
            return;  
    	}
    }
    
    // 비밀번호 확인 유효성 검사
    if(userPw1 == null || userPw1 == ""){
    	Swal.fire({
            icon: "error",
            title: "새비밀번호를 입력해주세요",
            showConfirmButton: false,
            timer: 1500
        });
    	$("#userPw1").focus(); 
    	return;
    } else {
    	if(!/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/.test(userPw1)){
            Swal.fire({
                icon: "error",
                title: "비밀번호는 영문 대소문자, 숫자를 포함하여 8자 이상이어야 합니다",
                showConfirmButton: false,
                timer: 1500
            });
            $("#userPw1").focus(); 
            return;  
    	}
    }
    
    Swal.fire({
        icon: "success",
        title: "회원정보 수정이 완료되었습니다!",
        showConfirmButton: false,
        timer: 1500
    });
    
    // 알림 ! 은 넘어오니깐 스윗알럿이 먼저 시작되고 바로 폼이 서브밋되서 수정완료 슝슝
    setTimeout(() => {
	    myPageForm.submit();
	}, 1501);
    
    });
	
});

function goBack(){
	location.href="/community/main.do";
}

	//임시 파일로 썸네일 이미지 만들기
	function getThumbnailName(fileName) {
		var front = fileName.substr(0, 12); // /2024/03/06/ 폴더 
		var end = fileName.substr(12); // 뒤 파일명

		console.log("front : " + front);
		console.log("end : " + end);

		return front + "s_" + end;
	}

	// 파일의 타입을 리턴해준다.
	function isimgFile(file) {
		var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.
		return ($.inArray(ext, [ "jpg", "jpeg", "png", "gif" ]) === -1) ? false
				: true;
	}

	document.getElementById("myFile").onchange = function(event) {
		var file = event.target.files[0];
		var reader = new FileReader();

		if (isimgFile(file)) {
			reader.onload = function() {
				var thumbnail = document
						.querySelector('.profile-author-thumb img');
				thumbnail.src = reader.result;
				Swal.fire({
					title : '프로필 사진이 변경되었습니다!',
					icon : 'success'
				});
			};
			reader.readAsDataURL(file);
		} else {
			Swal.fire({
				icon : "error",
				title : "이미지 파일만 등록가능합니다.",
				showConfirmButton : false,
				timer : 1500
			});
			thumbPassed = false;
		}
	};
</script>