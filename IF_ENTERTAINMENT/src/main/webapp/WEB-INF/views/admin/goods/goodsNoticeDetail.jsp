<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/sweetAlertCustom/sweetAlertCustom.js"></script>

<div class="gap inner-bg">
  <div class="table-styles">
  
  <div class="little-heading detail_gubun">
  	<i class="fa-solid fa-chevron-right"></i>
  	<h5 style="margin-bottom: 30px;">굿즈 공지사항 상세</h5>
  </div>
  
  	<div class="product-details">
	  <div class="gap no-gap">
	    <div class="single-post-detail paddlr130 detail-area">
	   		<h1>${goodsNotice.bfTitle }</h1>
	   		<div class="goodsNoti">
		   		<p>${goodsNotice.bfRegdate }</p>
		   		<span>${goodsNotice.userName }</span>
	   		</div>
	   		<hr>
	   		<div class="goodsNotice_content">
		    ${goodsNotice.bfContent }
		    </div>
		    <hr>
		    <div class="thumb-box">
		    	<h4>메인 썸네일 이미지</h4>
			    <div class="product-detail-thumb" style="width: 500px">
		   			<img src="${goodsNotice.baSavepath}" alt="">
		   		</div>
		    </div>
	    </div>
	    
	    
	    <div class="col-md-12">
            <div class="buttonz addpro_buttonz">
                <button type="button" id="updateBtn">수정</button>
            	<button type="button" id="listBtn">목록</button>
               	<button type="button" id="delBtn" data-bfNo="${goodsNotice.bfNo }">삭제</button>
               	<%-- <form action="/goods/notice/delete.do" method="post" id="delForm">
					<input type="hidden" name="bfNo" value="${goodsNotice.bfNo }" />
					<sec:csrfInput/>
				</form> --%>
            </div>
        </div>
	  </div>
	</div>
  </div>
</div>

<script>
$(function () {
	var updateBtn = $("#updateBtn")
	var listBtn = $("#listBtn");
	var delBtn = $("#delBtn");
	var delForm = $("#delForm");
	
	updateBtn.on("click", function () {
		location.href = "/goods/notice/update.do?bfNo="+${goodsNotice.bfNo};
	});
	
	listBtn.on("click", function () {
		location.href = "/goods/notice/list.do";
	});
	
	delBtn.on("click", function () {
		Swal.fire({
            title: '공지사항을 정말 삭제 하시겠습니까?',
            text: "삭제 시 복구할 수 없습니다!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예, 삭제합니다',
            cancelButtonText: '취소'
        }).then((result) => {
        	var bfNo = $(this).data("bfno");
			//delFrm.find("#gNo").val(goodsNo);
			//delFrm.submit();
        	
            if (result.isConfirmed) {
                $.ajax({
                    url: "/goods/notice/delete.do?bfNo="+ bfNo,
                    method: 'POST',
                    beforeSend: function(xhr){
                    	xhr.setRequestHeader(header, token);
                    },
                    success: function(data) {
                        Swal.fire(
                            '삭제 완료!',
                            '항목이 성공적으로 삭제되었습니다.',
                            'success'
                        ).then(() => {
                        	window.location.href = "/goods/notice/list.do";
                        	
                        });
                    },
                    error: function(xhr, status, error) {
                        Swal.fire(
                            '삭제 실패!',
                            '삭제하는 도중 오류가 발생했습니다.',
                            'error'
                        );
                    }
                });
            }
        });
	});
	
	
});
</script>