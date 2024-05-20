<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/sweetAlertCustom/sweetAlertCustom.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
.checkBox i {
	margin-left: 20px;
}

.gicontent {
	width: 430px;
}

/* 모달 내부 */
.modal-content {
	background-color: #fefefe;
	padding: 20px;
	border: 1px solid #888;
	width: 60%;
	position: relative;
	z-index: 9999 !important;
	color: #000;
	margin-left: 26%;
    margin-top: 20%;
}

/* 닫기 버튼 */
.close {
	color: #000;
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 30px;
}

.close:hover, .close:focus {
	text-decoration: none;
	cursor: pointer;
}

.modalTitle {
	text-align: center;
	padding: 30px;
}

/* 배경 어둡게 */
.modal {
	display: none; /* 초기에는 숨겨짐 */
	position: fixed;
	z-index: 99999;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4); /* 배경 어둡게 */
}

/* 등록 및 취소 버튼 */
.model_buttons {
	text-align: center;
	padding-top: 30px;
	padding-bottom: 30px;
}

.model_buttons button {
	margin-left: 10px;
}

#artistForm {
	
}

#faqTable {
	width: 90%;
	margin: 0 auto;
	border-top: 2px solid #000;
	border-bottom: 2px solid #000;
}

#faqRegisterBtnArea {
    margin-left: 20px;
}

#faqRegisterBtn {
	border: medium none;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -ms-border-radius: 5px;
    -o-border-radius: 5px;
    border-radius: 5px;
    color: #fff;
    width: 140px;
    font-size: 14px;
    line-height: 40px;
    text-transform: uppercase;
    background: rgba(0, 0, 0, 0) linear-gradient(-135deg, #1de9b6 0%, #1dc4e9 100%) repeat scroll 0 0;
    -webkit-transition: all 0.2s linear 0s;
    -moz-transition: all 0.2s linear 0s;
    -ms-transition: all 0.2s linear 0s;
    -o-transition: all 0.2s linear 0s;
    transition: all 0.2s linear 0s;
}

table tr th:first-child, table tr td:first-child {
   	padding: 24px 5px;
}
table tbody tr td:last-child {
	    padding: 24px 5px;
}
table tr th {
	text-align: center;
}
table tbody tr td {
	text-align: center;
}
table tr th:first-child {
	padding-left: 96px;
}
td span button {
	border: none;
	background: inherit;
}
td span button:first-child {
	margin-right: 20px;
}

#faqRegisterBtn i {
	margin-right: 7px;
	margin-left: -4px;
}

#faqRegisterBtn:hover {
    background: #333;
}

.bfContent {
    border-color: #e9ecef #e9ecef #e9ecef #e9ecef;
    border-style: solid;
    border-radius: 5px;

}

#pagingArea {
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>
<div class="gap inner-bg">
	<div class="table-styles">

		<div class="little-heading">
			<h2 style="margin-bottom: 30px; font-family: 'GmarketSansMedium';">💡 FAQ</h2>
		</div>

		<div class="gap listbar-container">
			<div class="discount-copon list-bar">
				<div class="row">
					<div class="col-md-6" style="display: flex; justify-content: center; align-items: center;">
						<form method="post" id="searchForm">
							<input type="hidden" name="page" id="page" />
							<div class="searchform-box" style="display: flex">
<!-- 								<select class="nice-select"> -->
<%-- <%-- 									<option value="userid" <c:if test="${searchType eq 'userid' }">selected</c:if>>질문자 ID</option> --%>
<!-- 									<option value="content" -->
<%-- 										<c:if test="${searchType eq 'content' }">selected</c:if>>내용</option> --%>
<!-- 								</select>  -->
								<input type="text" name="searchWord" value="${searchWord }" placeholder="검색" style="padding: 9px 20px;">
								<button type="submit">검색</button>
<!-- 								<button id="testBtn" type="button">버튼</button> -->
							</div>
							<sec:csrfInput />
						</form>
						<div id="faqRegisterBtnArea">
							<button id="faqRegisterBtn" value="faqRegister">
								<i class="fa fa-plus" aria-hidden="true"></i>등록하기
							</button>
						</div>
					</div>
					<!-- 등록 모달 시작 -->
					<div id="faqRegister" class="modal">
						<div class="modal-content">
							<span class="close">&times;</span>
							<h2 class="modalTitle">faq등록</h2>
							<form id=faqForm method="post" action="/goods/faq/admin/faqInsert.do">
								<table id="faqTable">
									<tr>
										<td width="15%">
											<label for="bfTitle" style="color: #000;">제목 </label>
										</td>
										<td colspan="3">
											<input type="text" id="bfTitle" name="bfTitle" value="${faq.bfTitle }">
										</td>
									</tr>
									<tr>
										<td width="15%">
											<label for="bfContent" style="color: #000;">내용</label>
										</td>
										<td colspan="3"> 
											<textarea cols="61" rows="10" id="bfContent" class="bfContent" name="bfContent">${faq.bfContent}</textarea>
										</td>
									</tr>
								</table>
								<!-- 등록 취소 버튼 -->
								<div class="model_buttons">
									<button type="button" class="register">등록</button>
									<button type="button" class="cancel">취소</button>
								</div>
								<sec:csrfInput />
							</form>

						</div>
					</div>
					<!-- 등록 모달 끝 -->
					
				</div>
			</div>
		</div>
	</div>
</div>



<div class="widget">
	<table class="prj-tbl striped table-responsive">
		<thead class="color">
			<tr class="prodTitle">
<!-- 				<th class="checkBox"><i class="all-slct"></i></th> -->
				<th><em>번호</em></th>
				<th><em>제목</em></th>
				<th><em>내용</em></th>
				<th><em>작성자</em></th>
				<th><em>상태</em></th>
			</tr>
		</thead>
		<tbody>
			<c:set value="${pagingVO.dataList }" var="faqList" />
			<c:choose>
				<c:when test="${empty faqList}">
					<tr>
						<td colspan="6">faq 리스트가 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${faqList }" var="faq">
						<tr class="prodList" data-idx="${faq.bfNo}">
<!-- 							<td width="1%"><i class="sngl-slct"></i></td> -->
							<td width="10%" class="detail"><span>${faq.bfNo}</span></td>
							<td width="25%" class="detail" style="text-align: inherit; padding-left: 7%;"><span>${faq.bfTitle}</span></td>
							<td width="45%" class="detail"> <span class="gicontent" style="text-align: left; padding-left: 7%;">${faq.bfContent}</span> </td>
							<td width="10%" class="detail" align="center"><span>${faq.userId}</span></td>
							<td width="10%" style="padding-right: 10px;">
								<span>
									<button id="modify" class="modify">
										<i class="fa fa-pencil" aria-hidden="true"></i>
									</button>
									<button id="delete">
										<i class="icon-trash"></i>
									</button>
								</span>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<div class="card-footer prod-footer clearfix" id="pagingArea">
	${pagingVO.pagingHTML }
</div>


<!-- 수정모달시작 -->
<div class="modal fade" id="inputModal" tabindex="-1" aria-labelledby="inputModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-di">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="inputModalLabel">faq 수정하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body mb">
				<div class="form-group inquiry">
					<div class="inq">
						<label for="bfTitle">제목 &nbsp</label> 
						<input type="text" id="bfTitle" name="bfTitle" value="${faq.bfTitle }">
					</div>
					<div class="inq inq_con">
						<div>
							<label for="bfContent">내용 &nbsp</label>
							<input type="text" id="bfContent" name="bfContent" value="${faq.bfContent }">
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer mf">
				<button id="modify" type="button" class="btn btn-primary">수정</button>
				<button id="cancelBtn" type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 수정모달 끝 -->


<script
	src="${pageContext.request.contextPath }/resources/js1/bootstrap.min.js"></script>
<script>
	$(function() {
		var searchForm = $("#searchForm");
		var register = $(".register");
		var cancel = $(".cancel");
		
		var faqForm = $("#faqForm");
		var bfTitle = $("#bfTitle");
		var bfContent = $("#bfContent");

		$('.all-slct').on("click", function() {
			$(this).toggleClass('active');
			$(".sngl-slct").toggleClass('active');
		});

		var pagingArea = $("#pagingArea");

		pagingArea.on("click", "a", function(event) {
			event.preventDefault();
			var pageNo = $(this).data("page");
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});
		
		// 모달 열기
		$("#faqRegisterBtn").click(function() {
			$("#faqRegister").show();
		});

		// 모달 닫기 버튼 클릭 시 모달 숨김
		$(".close").click(function() {
			$("#faqRegister").hide();
		});
		
		// 등록하기 스윗알러트, submit
		register.on("click", function() {
			
			var bfTitle = $("#bfTitle").val();
			if (bfTitle == null || bfTitle == "") {
				Swal.fire(
				  '',
				  '제목을 입력해주세요.',
				  'warning'
				)
	         bfTitle.focus();
	         return;
	     	}
			
			var bfContent = $("#bfContent").val();
			if (bfContent == null || bfContent == "") {
				Swal.fire(
				  '',
				  '내용을 입력해주세요.',
				  'warning'
				)
	         bfContent.focus();
	         return;
	     	}
			
			faqForm.submit();
			
			Swal.fire({
	            icon: "success",
	            title: "성공적으로 등록되었습니다.",
	            showConfirmButton: false,
	            timer: 1500,
	        });
	    
		    setTimeout(function() {
		        window.location.href = "/goods/faq/admin/list.do";
		    }, 1500);
		});

		// 	var modify = $("#modify");

		// 	modify.on("click", function () {

		// 		if ($("#giReply").val() == null || $("#giReply").val() == "") {
		// 			Swal.fire({

		// 				  icon: "warning",
		// 				  title: "내용입력은 필수입니다.",
		// 				  showConfirmButton: false,
		// 				  timer: 1500
		// 				});
		// 			return false;

		// 		}
		// 		if (ansBtn.text() == "답변 수정") {
		// 			Swal.fire({
		// 		        title: '답변을 수정하시겠습니까?', 
		// 		        text: "", 
		// 		        icon: 'warning', 
		// 		        showCancelButton: true, // 취소 버튼 보이도록 설정
		// 		        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
		// 		        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
		// 		        confirmButtonText: '수정', // 삭제 버튼 텍스트 설정
		// 		        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
		// 		    }).then((result) => {
		// 		        setTimeout(() => {
		// 		            Swal.close(); // 일정 시간 후 SweetAlert2 경고창 닫기
		// 		        }, 2000); // 2000ms(2초) 후에 경고창 닫기
		// 		        if (result.isConfirmed) { 
		// 		        	// 삭제 버튼을 눌렀을 때
		// 		            Swal.fire( 
		// 		                '게시물 수정 성공!', 
		// 		                '', 
		// 		                'success' 
		// 		            )
		// 		            ansForm.submit();
		// 		            var InquiryData = {
		// 			        		type : "goodsInquiry",
		// 			        		userId : $(this).data("id"),
		// 			        		status : "수정",
		// 			        		giNo : $(this).data("gino")
		// 			        	}
		// 			        ws.send(JSON.stringify(InquiryData)); //서버에게전달

		// 		        } else if (result.dismiss === Swal.DismissReason.cancel) { // 취소 버튼을 눌렀을 때
		// 		            // "취소" 버튼을 눌렀을 때
		// 		            Swal.fire( 
		// 		                '작업이 취소되었습니다.', 
		// 		                '', 
		// 		                'info' 
		// 		            )
		// 		        }
		// 		    });
		// 		}else {
		// 			Swal.fire({
		// 		        title: '답변을 등록하시겠습니까?', 
		// 		        text: "", 
		// 		        icon: 'warning', 
		// 		        showCancelButton: true, // 취소 버튼 보이도록 설정
		// 		        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
		// 		        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
		// 		        confirmButtonText: '등록', // 삭제 버튼 텍스트 설정
		// 		        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
		// 		    }).then((result) => {
		// 		        setTimeout(() => {
		// 		            Swal.close(); // 일정 시간 후 SweetAlert2 경고창 닫기
		// 		        }, 2000); // 2000ms(2초) 후에 경고창 닫기
		// 		        if (result.isConfirmed) { 
		// 		        	// 삭제 버튼을 눌렀을 때
		// 		            ansForm.submit();

		// 		        	var InquiryData = {
		// 		        		type : "goodsInquiry",
		// 		        		userId : $(this).data("id"),
		// 		        		status : "등록",
		// 		        		giNo : $(this).data("gino")
		// 		        	}
		// 		        	ws.send(JSON.stringify(InquiryData)); //서버에게전달

		// 		            Swal.fire( 
		// 		                '답변이 등록되었습니다.', 
		// 		                '', 
		// 		                'success' 
		// 		            )
		// 		            ansForm.submit();
		// 		        } else if (result.dismiss === Swal.DismissReason.cancel) { // 취소 버튼을 눌렀을 때
		// 		            // "취소" 버튼을 눌렀을 때
		// 		            Swal.fire( 
		// 		                '작업이 취소되었습니다.', 
		// 		                '', 
		// 		                'info' 
		// 		            )
		// 		        }
		// 		    });
		// 		}
		// 	});
		// 	var modal = $(".modal");

		// 	$("tbody").on("click", ".modify", function (event) {
		// 	    event.preventDefault();

		// 	    // 사용자가 클릭한 행에서 필요한 데이터 추출
		// 	    var bfNo = $(this).closest("tr").data("idx");

		// 	    // AJAX 요청을 통해 수정할 데이터 가져오기
		// 	    $.ajax({
		// 	        type: "get",
		// 	        url: "/goods/inquiry/detail.do?bfNo=" + bfNo, // 수정할 데이터를 가져올 URL 지정
		// 	        beforeSend: function(xhr) {
		// 	            xhr.setRequestHeader(header, token);
		// 	        },
		// 	        success: function(data) {
		// 	            // 모달 창에 데이터 표시
		// 	            $("#inputModal input[name='bfTitle']").val(data.bfTitle); // 제목 필드에 데이터 채우기
		// 	            $("#inputModal input[name='bfContent']").val(data.bfContent); // 내용 필드에 데이터 채우기
		// 	            $("#inputModal input[name='userId']").val(data.userId); // 작성자 필드에 데이터 채우기
		// 	            $("#inputModal input[name='bfRegdate']").val(data.bfRegdate); // 작성일 필드에 데이터 채우기
		// 	            $("#inputModal #bfNo").val(data.bfNo); // 수정할 데이터의 고유번호 전달
		// 	            // 나머지 필드에 필요한 데이터 채우기

		// 	            // 모달 열기
		// 	            $("#inputModal").modal("show");
		// 	        }
		// 	    });
		// 	});

	});
</script>