<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
.pitnik-title {
	margin-top: 40x;
	margin-bottom: 40px;
	text-align: center;
}

.page-createbox .row>div {
	margin-bottom: 20px;
	padding: 0 70px;
}
</style>

<div class="col-lg-12">
	<div class="pitnik-title">
		<h1>🙋 1:1 문의하기 작성</h1>
		<p>※ 상담사에게 폭언, 욕설 등을 하지 말아 주세요. 답변을 받지 못하거나 사전안내 없이 삭제될 수 있습니다.</p>
	</div>
	<div class="central-meta">
		<span class="create-post">문의하기</span>
		<div class="page-createbox">
			<form method="post" class="c-form" action="/goods/inquiry/insert.do"
				id="goodsInquiryForm">
				<div class="row">
					<div class="col-lg-12">
						<div class="title1">문의유형</div>
						<select class="form-control" id="giType" name="giType"
							style="width: 100%;">
							<option value="" ${goodsInquiry.giType == '' ? 'selected' : ''}>문의
								유형을 선택하세요</option>
							<option value="상품"
								${goodsInquiry.giType == '상품' ? 'selected' : ''}>상품</option>
							<option value="결제"
								${goodsInquiry.giType == '결제' ? 'selected' : ''}>결제</option>
							<option value="배송"
								${goodsInquiry.giType == '배송' ? 'selected' : ''}>배송</option>
							<option value="기타문의사항"
								${goodsInquiry.giType == '기타문의사항' ? 'selected' : ''}>기타문의사항</option>
						</select>
					</div>
					<div class="col-lg-12">
						<div class="title1">제목</div>
						<div class="social-name">
							<input type="text" id="giTitle" name="giTitle"
								value="${goodsInquiry.giTitle }" placeholder="문의 제목을 입력해주세요 ! ">
						</div>
					</div>
					<div class="col-lg-12">
						<div class="title1">문의내용</div>
						<textarea rows="5px" id="giContent" name="giContent"
							placeholder="문의하실 내용을 입력해주세요 !">${goodsInquiry.giContent }</textarea>
					</div>
					<div class="col-lg-12" style="margin-top: 30px;">
						<button class="main-btn" type="button" id="addBtn">등록</button>
						<button class="main-btn3" type="button" id="cancelBtn">취소</button>
					</div>
				</div>
				<sec:csrfInput/>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		var goodsInquiryForm = $("#goodsInquiryForm");
		var addBtn = $("#addBtn");
		var cancelBtn = $("#cancelBtn");

		addBtn.on("click", function() {
			var type = $("#giType").val(); 
			var title = $("#giTitle").val();
			var content = $("#giContent").val();

			if (type == null || type == "") {
				Swal.fire({
		            icon: 'error',
		            title: '문의유형을 선택해주세요'
		        });
				$("#giType").focus();
				return false;
			}
			
			if (title == null || title == "") {
				Swal.fire({
		            icon: 'error',
		            title: '제목을 입력해주세요!'
		        });
				$("#giTitle").focus();
				return false;
			}
			
			if (content == null || content == "") {
				Swal.fire({
		            icon: 'error',
		            title: '내용을 입력해주세요!'
		        });
				$("#giContent").focus();
				return false;
			}

			Swal.fire({
			    icon: 'success',
			    title: '문의가 성공적으로 등록되었습니다!',
			    showConfirmButton: true // 확인 버튼을 표시합니다.
			}).then(function(result) {
			    if (result.isConfirmed) {
			        // 확인 버튼을 클릭하면 폼을 서브밋합니다.
			        goodsInquiryForm.submit();
			    }
			});
		});

		cancelBtn.on("click", function () {
			swal(
				"등록을 취소 하시겠습니까?", 
				"작성중인 문의 내용은 저장되지 않습니다.", 
				'등록 취소',
				'계속 작성',
				"/goods/inquiry/userlist.do"
			);
		});

	});
	
	function swal(title, text, confirmMsg, cancelMsg, requestUrl){
	    // 경고창 띄우기
	    Swal.fire({
	        title: title, 
	        text: text, 
	        icon: 'warning', 
	        showCancelButton: true, // 취소 버튼 보이도록 설정
	        confirmButtonColor: '#d33', // 삭제 버튼 색상 설정
	        cancelButtonColor: '#3085d6', // 취소 버튼 색상 설정
	        confirmButtonText: confirmMsg, // 삭제 버튼 텍스트 설정
	        cancelButtonText: cancelMsg // 취소 버튼 텍스트 설정
	    }).then((result) => {
	        setTimeout(() => {
	            Swal.close(); // 일정 시간 후 SweetAlert2 경고창 닫기
	        }, 20000); // 2000ms(2초) 후에 경고창 닫기
	        if (result.isConfirmed) { 
	        	// 삭제 버튼을 눌렀을 때
	        	location.href = requestUrl;
	        } 
	    });
	}	
</script>