<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/sweetAlertCustom/sweetAlertCustom.js"></script>
<style>
.prodth th:first-child {
	padding-left: 40px !important;
}
.prodth th:last-child {
	padding-right: 40px !important;
}
</style>

<div class="gap inner-bg">
  <div class="table-styles">
  
  <div class="little-heading">
  	<h2 style="margin-bottom: 30px; font-family: 'GmarketSansMedium';">🛍️ 제품 목록</h2>
  </div>
  
  	<div class="gap listbar-container">
    <div class="discount-copon list-bar">
      <div class="row">
        <div class="col-md-4">
          <form method="post" id="searchForm">
	        <input type="hidden" name="page" id="page"/>
          	<div class="searchform-box" style="display: flex">
	          	 <select class="nice-select" style="width: 120px; height: 53px;">
		            <option value="title" <c:if test="${searchType eq 'title' }">selected</c:if>>상품명</option>
		            <option value="artist" <c:if test="${searchType eq 'artist' }">selected</c:if>>아티스트명</option>
		            <option value="category" <c:if test="${searchType eq 'category' }">selected</c:if>>카테고리</option>
	        	</select>

	            <input type="text" name="searchWord" value="${searchWord }" placeholder="검색">
		          
		        <button type="submit">검색</button>
	          </div>
	          <sec:csrfInput/>
          </form>
        </div>
        <div class="col-md-3" style="display: flex;">
        	<form id="goodsDelform" method="post" action="/goods/checkDelete.do">
        		<span class="goodsConfirm">
        			<button id="checkDelBtn" type="submit" style="width: 150px">선택항목 삭제하기</button>
        		</span>
        	<sec:csrfInput/>
        	</form>
        	<form>
        		<button type="button" id="newBtn"><i class="fa-solid fa-plus"></i>등록하기</button>
        	<sec:csrfInput/>
        	</form>
        </div>
      </div>
    </div>
  </div>
    
    <div class="widget">
      <table class="prj-tbl striped table-responsive">
        <thead class="color">
           <tr class="prodTitle prodth">
             <th><i class="all-slct"></i></th>
             <th><em>번호</em></th>
             <th><em>이미지</em></th>
             <th><em>제품명</em></th>
             <th><em>가격(원)</em></th>
             <th><em>카테고리</em></th>
             <th><em>진열여부</em></th>
             <th><em>재고</em></th>
             <th><em>등록일</em></th>
             <th><em>상태</em></th>
           </tr>
        </thead>
        <tbody class="prodTable">
        <c:set value="${pagingVO.dataList }" var="prodList"/>
        <c:choose>
        	<c:when test="${empty  prodList}">
        		<tr>
        			<td colspan="10">상품 리스트가 존재하지 않습니다.</td>
        		</tr>
        	</c:when>
        	<c:otherwise>
        		<c:forEach items="${prodList }" var="prod" varStatus="vs1">
        			<tr class="prodList" >
			            <td><i class="sngl-slct" data-index="${vs1.index}"></i></td>
			            <td><span class="goodsNo">${prod.goodsNo }</span></td>
			            <td><img alt="" src="${prod.goodsThumbnail }"  style="width:40px;"></td>
			            <%-- <td><div class="img-box"><img alt="" src="${prod.goodsThumbnail }"></div></td> --%>
			            <td style="text-align: left;"><a class="prod_update" data-prodNo="${prod.goodsNo }"><span>${prod.goodsName }</span></a></td>
			            <td><span><fmt:formatNumber value="${prod.goodsPrice }" pattern="#,###"/></span></td>
			            <td><span>${prod.goodsArtist }  >  ${prod.gcId }</span></td>
			            <c:choose>
			            	<c:when test="${prod.goodsDisplay  eq 'N'}">
			            		<td><span>진열 안함</span></td> 
			            	</c:when>
			            	<c:otherwise>
			            		<td><span>진열중</span></td> 
			            	</c:otherwise>
			            </c:choose>
			            <%-- <td><span>${prod.goodsDisplay }</span></td> --%> 
			            <td><span>${prod.goodsQuantity }</span></td>
			            <fmt:parseDate value="${prod.goodsRegdate }" var="goodsRegdate" pattern="yyyy-MM-dd" />
			            <td><span><fmt:formatDate value="${goodsRegdate}" pattern="yyyy-MM-dd" /></span></td>
						
			            
			            <td>
			            	<span>
				            	<a class="delBtn" data-goodsNo="${prod.goodsNo }">
				            		<i class="icon-trash"></i>
				            	</a>
			            	</span>
			            </td>
			          </tr>
        		</c:forEach>
        	</c:otherwise>
        </c:choose>
        </tbody> 
      </table>
      <!-- <form action="/goods/delete.do" method="post" id="delFrm">
      	<input type="hidden" name="goodsNo" id="gNo"/>
      </form> -->
    </div>
    <div class="card-footer prod-footer clearfix" id="pagingArea">
		${pagingVO.pagingHTML }
	</div>
  </div>
</div>

<script>
$(function () {
	var goodsNos = [];
	var prodList = $(".prodList");
	var delFrm = $("#delFrm");
	var prod_update = $(".prod_update");
	var delBtn = $(".delBtn");
	var searchForm = $("#searchForm")
	
	prod_update.on("click", function () {
	    var prodNo = $(this).data("prodno"); 
	    location.href = "/goods/update.do?goodsNo=" + prodNo;
	});
	
	var snglSlct = $(".sngl-slct");
	
	snglSlct.on("click", function () {
		$(this).toggleClass('active'); 
		
		var index = $(this).data("index");
		var goodsNo = $(".goodsNo").eq(index).text();
		
	    if (goodsNos.indexOf(goodsNo) === -1) {
	        // 중복된 값이 없는 경우에만 배열에 추가
	        goodsNos.push(goodsNo);
	    } else {
	        // 중복된 값이 있는 경우, 해당 값 삭제
	        goodsNos = goodsNos.filter(function(value) {
	        	return value !== goodsNo;
	        });
	    }		
		console.log("현재 goodsNos 배열 : ", goodsNos);
	});
	
	var checkDelBtn = $("#checkDelBtn");
	
	checkDelBtn.on("click", function (event) {
		event.preventDefault();
		Swal.fire({
	        title: '선택 상품을 삭제하시겠습니까?', 
	        text: " ", 
	        icon: 'warning', 
	        showCancelButton: true, // 취소 버튼 보이도록 설정
	        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
	        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
	        confirmButtonText: '삭제하기', // 삭제 버튼 텍스트 설정
	        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
	    }).then((result) => {
	        setTimeout(() => {
	            Swal.close(); // 일정 시간 후 SweetAlert2 경고창 닫기
	        }, 2000); // 2000ms(2초) 후에 경고창 닫기
	        if (result.isConfirmed) { 
	        	// 삭제 버튼을 눌렀을 때
	   			for (var i = 0; i < goodsNos.length; i++) {
					$(".goodsConfirm").append('<input type="hidden" name="goodsNos" value="' + goodsNos[i] + '">');
				}
	   			goodsDelform.submit();
	            Swal.fire( 
	                '상품이 삭제되었습니다!', 
	                '', 
	                'success' 
	            )
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
	

	$('.all-slct').on("click",function(){
		$(this).toggleClass('active');
	    $(".sngl-slct").toggleClass('active'); 
	});
	
	
	
	var newBtn = $("#newBtn");
	var pagingArea = $("#pagingArea");
	
	pagingArea.on("click", "a", function (event) {
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	newBtn.on("click", function () {
		location.href = "/goods/form.do";
	});
	
	delBtn.on("click", function (event) {
		event.preventDefault();
		Swal.fire({
            title: '상품을 정말로 삭제하시겠습니까?',
            text: "삭제 시 복구할 수 없습니다!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예, 삭제합니다',
            cancelButtonText: '취소'
        }).then((result) => {
        	var goodsNo = $(this).data("goodsno");
				//delFrm.find("#gNo").val(goodsNo);
				//delFrm.submit();
        	
            if (result.isConfirmed) {
                $.ajax({
                    url: "/goods/delete.do?goodsNo="+ goodsNo,
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
                        	window.location.href = "/goods/list.do";
                        	
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