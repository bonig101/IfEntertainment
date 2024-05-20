<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/sweetAlertCustom/sweetAlertCustom.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
.orderdetailBtn {
	cursor: pointer ;
	font-weight: 700;
	text-decoration: underline !important;
	font-size: 14px;
}
.cpBtn {
	cursor: pointer;
	font-weight: 700;
	border: 1px solid #eee;
	padding: 10px 20px;
}
.cpBtn:hover {
	background: #cbcfd4;
}
/* .prodTitle th {
	padding: 15px !important;
}
.prodTitle th:nth-child(5) {
	width: 70px;
} */
#cancelTable td {
	padding: 5px 10px 5px 10px;
} 
#cancelTable td:nth-child(1) {
	padding-left: 20px;
}
</style>
<div class="gap inner-bg">
    <div class="table-styles">
        <div class="little-heading">
            <h2 style="margin-bottom: 30px; font-family: 'GmarketSansMedium';">📦 배송
            <c:choose>
            	<c:when test="${status eq 'c' }">
            	후
            	</c:when>
            	<c:otherwise>
            	전
            	</c:otherwise>
            </c:choose> 
             주문 내역</h2>
        </div>
        <div class="gap listbar-container">
            <div class="discount-copon list-bar">
                <div class="row">
                    <div class="col-md-4" style="margin-right: 20px;">
                        <form method="post" id="searchForm">
                            <input type="hidden" name="page" id="page" />
                            <div class="searchform-box" style="display: flex">
                                <select class="nice-select" style="width: 135px; height: 53px;">
                                    <option value="orderNo" <c:if test="${searchType eq 'orderNo' }">selected</c:if>
                                        >주문번호
                                    </option>
                                    <option value="userId" <c:if test="${searchType eq 'userId' }">selected</c:if>
                                        >주문자아이디
                                    </option>
                                </select>

                                <input type="text" name="searchWord" value="${searchWord }" placeholder="검색">

                                <button type="submit">검색</button>
                            </div>
                            <sec:csrfInput/>
                        </form>
                    </div>
                    <div class="col-md-3" style="display: flex; max-width: 13%; margin-right: 20px;">
			            <form id="deliveryForm" method="post" action="/goods/order/deliverycheckUpdate.do">
			            	<c:choose>
				            	<c:when test="${status eq 'c' }">
				            		<input type="hidden" name="orderDelivery" value="N">
				            		<span id="orderafterConfirm">
                                     	<button class="barBtn" style="width: 150px">선택항목 배송 전 처리</button>
                               		</span>
				            	</c:when>
				            	<c:otherwise>
				            		<input type="hidden" name="orderDelivery" value="Y">
					            	<span id="orderConfirm">
                                     	<button class="barBtn" style="width: 150px">선택항목 배송 처리</button>
                               		</span>
				            	</c:otherwise>
				            </c:choose> 
				            <sec:csrfInput/>
			            </form>
			        </div>
                </div>
            </div>
        </div>
        
        <div class="widget">
        	<div class="totalCount" style="margin-top: 20px; height: 40px;">
        	<c:choose>
        		<c:when test="${status eq 'c' }">
	        		<span style="font-weight: 600; color: red; padding: 20px 0px 10px 20px;">총 주문 건 : ${pagingVO.totalRecord }</span>
        		</c:when>
        		<c:otherwise>
        			<span style="font-weight: 600; color: red; padding: 20px 0px 10px 20px;">총 주문 건 : ${pagingVO.totalRecord }</span>
        		</c:otherwise>
        	</c:choose>
        	</div>
            <table class="prj-tbl striped table-responsive">
                <thead class="color">
                    <tr class="prodTitle">
                    	<th><i class="all-slct"></i></th>
                        <th><em>번호</em></th>
                        <th><em>이미지</em></th>
                        <th><em>제품명</em></th>
                        <th><em>수량</em></th>
                        <th><em>가격(원)</em></th>
                        <th><em>총주문액(원)</em></th>
                        <th><em>주문아이디</em></th>
                        <th><em>결제방법</em></th>
                        <th><em>주문일자</em></th>
                        <th><em>상태</em></th>
                    </tr>
                </thead>
                <tbody id="cancelTable">
                    <c:set value="${pagingVO.dataList }" var="deliveryList" />
                    <c:choose>
                        <c:when test="${empty deliveryList}">
                            <tr>
                                <td colspan="12">상품 리스트가 존재하지 않습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${deliveryList }" var="delivery" varStatus="vs1">
                                <c:forEach items="${delivery.orderDetailList }" var="deliveryDetail" varStatus="vs2">
                                    <tr class="cancelList">
                                        <c:if test="${vs2.index eq 0 }">
	                                    	<td rowspan="${fn:length(delivery.orderDetailList) }"><i class="sngl-slct" data-index="${vs1.index}"></i></td>
                                            <td rowspan="${fn:length(delivery.orderDetailList) }"> 
                                                <a class="orderdetailBtn" data-index="${vs1.index}">${delivery.orderNo }</a>
                                            </td>
                                        </c:if>

                                        <td>
                                            <img alt="" src="${deliveryDetail.goodsThumbnail }" style="width:40px;">
                                        </td>
                                        <td style="text-align: left">
                                            <a class="goodsBtn" data-prodNo="${deliveryDetail.goodsNo }">
                                                <span>${deliveryDetail.goodsName }</span>
                                            </a>
                                        </td>
                                        <td><span><fmt:formatNumber value="${deliveryDetail.odQuantity }" pattern="#,###"/></span></td>
                                        <td><span><fmt:formatNumber value="${deliveryDetail.odTotalprice }" pattern="#,###"/></span></td>

                                        <c:if test="${vs2.index eq 0 }">
                                            <td rowspan="${fn:length(delivery.orderDetailList) }">
                                                <span><fmt:formatNumber value="${delivery.orderTotalprice}" pattern="#,###"/></span></td>
                                            <td rowspan="${fn:length(delivery.orderDetailList) }">
                                                <span>${delivery.userId }</span>
                                            </td>
                                            <td rowspan="${fn:length(delivery.orderDetailList) }">
                                                <span>${delivery.orderPay }</span>
                                            </td>
                                            <td rowspan="${fn:length(delivery.orderDetailList) }">
                                                <fmt:parseDate value="${delivery.orderDate}" var="orderDate"
                                                    pattern="yyyy-MM-dd" />
                                                <span>
                                                    <fmt:formatDate value="${orderDate}" pattern="yyyy-MM-dd" />
                                                </span>
                                            </td>
                                            <td rowspan="${fn:length(delivery.orderDetailList) }">
                                            	<c:choose>
									            	<c:when test="${status eq 'c' }">
									            		
									            		<span>
	                                                    	<a type="button" class="cpBtn" data-index="${vs1.index}">배송 전 처리</a>
	                                              		</span>
									            	</c:when>
									            	<c:otherwise>
										            	<span>
	                                                    	<a type="button" class="cpBtn" data-index="${vs1.index}">배송 처리</a>
	                                              		</span>
									            	</c:otherwise>
									            </c:choose> 
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
        <div class="card-footer prod-footer clearfix" id="pagingArea">
            ${pagingVO.pagingHTML }
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath }/resources/js1/bootstrap.min.js"></script>
<script>
$(function () {
	var orderNos = [];
	var snglSlct = $(".sngl-slct");
	
	snglSlct.on("click", function () {
		$(this).toggleClass('active'); 
		
		var index = $(this).data("index");
		var orderNo = $(".orderdetailBtn").eq(index).text();
		
	    if (orderNos.indexOf(orderNo) === -1) {
	        // 중복된 값이 없는 경우에만 배열에 추가
	        orderNos.push(orderNo);
	    } else {
	        // 중복된 값이 있는 경우, 해당 값 삭제
	        orderNos = orderNos.filter(function(value) {
	            return value !== orderNo;
	        });
	    }		
		console.log("현재 orderNos 배열 : ", orderNos);
	});
	
	var deliveryForm = $("#deliveryForm");
	var barBtn = $(".barBtn");
	
	barBtn.on("click", function (event) {
		event.preventDefault();
		var buttonText = $(this).text();
		
		if (buttonText == "선택항목 배송 처리") {
			console.log($("#orderNos").val(orderNos));
			Swal.fire({
		        title: '선택항목을 배송처리하시겠습니까?', 
		        text: " ", 
		        icon: 'warning', 
		        showCancelButton: true, // 취소 버튼 보이도록 설정
		        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
		        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
		        confirmButtonText: '배송 처리', // 삭제 버튼 텍스트 설정
		        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
		    }).then((result) => {
		        setTimeout(() => {
		            Swal.close(); // 일정 시간 후 SweetAlert2 경고창 닫기
		        }, 2000); // 2000ms(2초) 후에 경고창 닫기
		        if (result.isConfirmed) { 
		        	// 삭제 버튼을 눌렀을 때
		   			for (var i = 0; i < orderNos.length; i++) {
						$("#orderConfirm").append('<input type="hidden" name="orderNos" value="' + orderNos[i] + '">');
					}
					deliveryForm.submit();
		            Swal.fire( 
		                '배송처리 성공!', 
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
		}else{
			Swal.fire({
		        title: '선택항목을 배송 전 처리하시겠습니까?', 
		        text: " ", 
		        icon: 'warning', 
		        showCancelButton: true, // 취소 버튼 보이도록 설정
		        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
		        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
		        confirmButtonText: '배송 전 처리', // 삭제 버튼 텍스트 설정
		        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
		    }).then((result) => {
		        setTimeout(() => {
		            Swal.close(); // 일정 시간 후 SweetAlert2 경고창 닫기
		        }, 2000); // 2000ms(2초) 후에 경고창 닫기
		        if (result.isConfirmed) { 
		        	// 삭제 버튼을 눌렀을 때
		   			for (var i = 0; i < orderNos.length; i++) {
						$("#orderafterConfirm").append('<input type="hidden" name="orderNos" value="' + orderNos[i] + '">');
					}
					deliveryForm.submit();
		            Swal.fire( 
		                '배송 전 처리 성공!', 
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
		}	
	});

	
	var cpBtn = $(".cpBtn");

	cpBtn.on("click", function () {
		if (cpBtn.eq(0).text() == "배송 처리") {
			Swal.fire({
	            title: '배송 완료 처리 하시겠습니까?',
	            text: " ",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '배송처리 하기',
	            cancelButtonText: '취소'
	        }).then((result) => {
	        	if (result.isConfirmed) {
	        		var index = $(this).data("index");
	        		var orderNo = $(".orderdetailBtn").eq(index).text();

	                $.ajax({
	                    url: "/goods/order/deliveryUpdate.do",
	                    method: 'POST',
	                    data : {orderNo : orderNo, orderDelivery : 'Y'},
	                    beforeSend: function(xhr){
	                    	xhr.setRequestHeader(header, token);
	                    },
	                    success: function(data) {
	                        Swal.fire(
	                            '배송처리 완료!',
	                            '성공적으로 배송처리 되었습니다.',
	                            'success'
	                        ).then(() => {
	                        	location.href = "/goods/order/adminDeliveryBeforeList.do";
	                        	
	                        });
	                    },
	                    error: function(xhr, status, error) {
	                        Swal.fire(
	                            '처리 실패!',
	                            '처리 도중 오류가 발생했습니다.',
	                            'error'
	                        );
	                    }
	                });
	            }
	
	        });
		}else {
			Swal.fire({
	            title: '배송 전 처리 하시겠습니까?',
	            text: " ",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '배송 전 처리 하기',
	            cancelButtonText: '취소'
	        }).then((result) => {
	        	if (result.isConfirmed) {
	        		var index = $(this).data("index");
	        		var orderNo = $(".orderdetailBtn").eq(index).text();

	                $.ajax({
	                    url: "/goods/order/deliveryUpdate.do",
	                    method: 'POST',
	                    data : {orderNo : orderNo, orderDelivery : 'N'},
	                    beforeSend: function(xhr){
	                    	xhr.setRequestHeader(header, token);
	                    },
	                    success: function(data) {
	                        Swal.fire(
	                            '배송 전 처리 완료!',
	                            '성공적으로 배송 전 처리 되었습니다.',
	                            'success'
	                        ).then(() => {
	                        	location.href = "/goods/order/adminDeliveryAfterList.do";
	                        	
	                        });
	                    },
	                    error: function(xhr, status, error) {
	                        Swal.fire(
	                            '처리 실패!',
	                            '처리 도중 오류가 발생했습니다.',
	                            'error'
	                        );
	                    }
	                });
	            }
	
	        });
		}
	})
	
	var orderdetailBtn = $(".orderdetailBtn");
	
	orderdetailBtn.on("click", function () {
		var orderNo = $(this).text();
		location.href = "/goods/order/deliveryDetail.do?orderNo=" + orderNo;
	});
	
	
	//페이징 부분
	var searchForm = $("#searchForm")
	var pagingArea = $("#pagingArea");
	
	pagingArea.on("click", "a", function (event) {
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		
		if ($("#bs2").hasClass("active")) {
			searchForm.append("<input type='hidden' name='odstatus' id='odstatus' value='2'/>");
			searchForm.submit();
		}
		searchForm.submit();
	});
	
	$('.all-slct').on("click",function(){
		$(this).toggleClass('active');
	    $(".sngl-slct").toggleClass('active'); 
	});
});
</script>