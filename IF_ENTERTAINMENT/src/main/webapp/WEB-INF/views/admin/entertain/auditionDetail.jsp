<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="gap no-gap">
	<div class="inner-bg">
		<div class="element-title">
			<h4>오디션 상세보기</h4>
		</div>
		<div class="add-prod-from">
			<div class="row" style="width: 100%;">
				<div class="con_view_box" style="width: 100%;">
					<div class="widget-title" style="width: 100%;">
						<h3>${auditionBoardVO.bfTitle }</h3>
						<br /> <span class="c_writer" style="padding-left: 0px;">작성자
							${auditionBoardVO.bfWriter }</span> <span class="c_date">작성일 <fmt:formatDate
								value="${auditionBoardVO.bfRegdate }" pattern="yyyy-MM-dd HH:mm" /></span>
						<span class="c_date">삭제 ${auditionBoardVO.bfDelyn }</span>
					</div>
					<div class="widget-peding">${auditionBoardVO.bfContent }</div>
				</div>
				<div class="col-md-12">
					<div class="buttonz">
						<button type="button" id="listBtn">목록</button>
						<button type="button" id="updateBtn">수정</button>
						<button type="button" id="deleteBtn">삭제</button>
					</div>
				</div>
				<form action="/entertain/audition/admin/delete.do" id="delForm"
					method="post">
					<input type="hidden" name="bfNo" value="${auditionBoardVO.bfNo }" />
					<sec:csrfInput />
				</form>
			</div>
		</div>
	</div>
</div>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	$(function() {

		var delForm = $("#delForm");
		var listBtn = $("#listBtn");
		var updateBtn = $("#updateBtn");
		var deleteBtn = $("#deleteBtn");

		listBtn.on("click", function() {
			location.href = "/entertain/audition/admin/scheduleList.do";
		});

		updateBtn.on("click", function() {
			delForm.attr("method", "get");
			delForm.attr("action", "/entertain/audition/admin/update.do");
			delForm.submit();
		});

		deleteBtn.on("click", function() {
			Swal.fire({
		        title: '글을 삭제하시겠습니까?', 
		        text: "삭제하시면 다시 복구시킬 수 없습니다.", 
		        icon: 'warning', 
		        showCancelButton: true, // 취소 버튼 보이도록 설정
		        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
		        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
		        confirmButtonText: '삭제', // 삭제 버튼 텍스트 설정
		        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
		    }).then((result) => {
		        setTimeout(() => {
		            Swal.close(); // 일정 시간 후 SweetAlert2 경고창 닫기
		        }, 2000); // 2000ms(2초) 후에 경고창 닫기
		        if (result.isConfirmed) { 
		        	// 삭제 버튼을 눌렀을 때
		            Swal.fire( 
		                '게시물 삭제 성공!', 
		                '', 
		                'success' 
		            )
		        setTimeout(() => {
					delForm.submit();
				}, 2001); 
		            
		        } else if (result.dismiss === Swal.DismissReason.cancel) { // 취소 버튼을 눌렀을 때
		            // "취소" 버튼을 눌렀을 때
		            Swal.fire( 
		                '작업이 취소되었습니다.', 
		                '', 
		                'info' 
		            )
		        }
		});
		});

	});
	
</script>