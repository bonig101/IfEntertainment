<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
.image-container {
    display: flex;
    justify-content: center;
    align-items: center; 
    height: 100px; 
}
.cartIn {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center; /* 전체 요소를 수평 중앙으로 정렬 */
}

.cartIn .manual-adjust {
  height: 36px; /* 입력 필드 높이 조정 */
  text-align: center;
  border: 1px solid #ccc;
  border-radius: 20px; /* 입력 필드의 모서리를 둥글게 */
  margin: 0 8px; /* 버튼과의 여백 조정 */
}

.decrease-quantity, .increase-quantity {
  background-color: #007bff; /* 더 세련된 파란색으로 변경 */
  border: none;
  color: white;
  padding: 6px 12px; /* 패딩을 줄여서 전체 크기를 줄임 */
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px; /* 글꼴 크기 소폭 조정 */
  border-radius: 20px; /* 버튼 모서리를 둥글게 */
  box-shadow: 0 2px 4px rgba(0,0,0,0.2); /* 버튼에 그림자 효과 추가 */
  cursor: pointer;
  transition-duration: 0.2s;
}

.decrease-quantity:hover, .increase-quantity:hover {
  background-color: #0056b3; /* 호버 시 더 짙은 파d란색으로 변경 */
}
.foreachTr{
	vertical-align: middle;
}
.proceed {
    text-align: center; 
    font-size: 20px; 
    margin-top: 45px; 
}

</style>
  <link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"> 
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.min.css">
<%--   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css"> --%>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/color.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css">
</head>
<body>


<div class="col-lg-12">
								<div class="central-meta-bo">
									<h4 class="create-post" style="border-bottom: none; font-size: 20px;">장바구니</h4>
									<div class="cart-sec">
										<table class="table table-responsive">
											<tr>
												<th colspan="2">상품명</th>
												<th>가격</th>
												<th>수량</th>
												<th>총 가격</th>
											</tr>
											<c:forEach var="list" items="${list }">
											<tr class="">
											<td style="vertical-align: middle; border-right: none; left: 117px;" >
											<a href="#" title="" class="delete-cart"><i class="ti-close"></i></a>
													<div class="cart-avatar">
														<div class="image-container">
														    <img src="${list.cartThumbnail}" style="width: 80px; height: 80px;"  alt="">
														</div>
													</div>
											</td>
											
												<td style="vertical-align: middle; border-left: none;"  >
													<input type="hidden" class="userNo" name="userNo" value="${list.userNo }">
													<input type="hidden" class="goodsNo" name="goodsNo" value="${list.goodsNo }">
													<input type="hidden" class="goodsQuantity" name="goodsQuantity" value="${list.goodsQuantity }">
													<input type="hidden" class="gcId" name="gcId" data-gcid="${list.gcId}" value="${list.gcId}">
													<div class="cart-meta" >
														<span>${list.cartName }</span>
													</div>
												</td >
												<td style="vertical-align: middle;">
													<span class="cart-prices"> 
														<ins>
															<span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol"></span><fmt:formatNumber value="${list.cartPrice }" pattern="#,###"/></span>원
														</ins> 
													</span>
												</td>
												<td style="vertical-align: middle;">
													     <div class="cartIn">
												                    <button class="decrease-quantity" data-gcid="${list.gcId}">-</button>
												                    <input type="text" class="manual-adjust" value="${list.cartQuantity}" data-price="${list.cartPrice}" data-goodsno="${list.goodsNo}" data-userno="${list.userNo}"/>
												                    <button class="increase-quantity" data-gcid="${list.gcId}">+</button>
												            </div>
												        </td>
												        <td style="vertical-align: middle;">
												            <span class="total-price">${list.cartQuantity * list.cartPrice}</span>
												            
												        </td>
											</tr>
											</c:forEach>
										</table>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="amount-area">
												
												<!-- 총합계를 표시할 부분 -->
										<div class="total-area">
										    <ul>
										        <li>
										            <span>장바구니 소계:</span>
										            <i id="cartSubtotal">$0.00</i>
										        </li>
										        <li>
										            <span>배송비:</span>
										            <i>무료</i>
										        </li>
										        <li class="order-total">
										            <span>총 주문 금액:</span>
										            <i id="orderTotal">$0.00</i>
										        </li>
										    </ul>
										</div>

											</div>
										</div>
										<div class="col-lg-6">
											<div class="proceed" >
												<a href="/goods/goodsPurchase.do" title="" class="main-btn">구매하기</a>
												<a href="/goods/main.do" title="" class="main-btn">굿즈샵홈</a>
											</div>
										</div>
									</div>
								</div>
							</div>
</body>
	<script src="${pageContext.request.contextPath }/resources/js/main.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/userincr.js"></script>
	<script src="js/script.js"></script>
	
<script type="text/javascript">
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


</script>	


<script type="text/javascript">
$(document).ready(function() {
    $('.delete-cart').click(function(event) {
        event.preventDefault();
        
        var $this = $(this); 
        var goodsNo = $this.closest('tr').find('.goodsNo').val();
        var userNo = $this.closest('tr').find('.userNo').val();

        swal.fire({
            title: "삭제하시겠습니까?",
            text: "이 작업은 되돌릴 수 없습니다",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: '예',
            cancelButtonText: '아니오',
            reverseButtons: false
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "POST",
                    url: "/goods/goodsCartDelete.do",
                    contentType: "application/json",
                    beforeSend: function(xhr){
                    	xhr.setRequestHeader(header, token);
                    },
                    data: JSON.stringify({
                        goodsNo: goodsNo,
                        userNo: userNo
                    }),
                    beforeSend: function(xhr){
                    	xhr.setRequestHeader(header, token);
                    },
                    success: function(response) {
                        swal.fire({
                            title: "삭제가 완료되었습니다!",
                            icon: "success",
                            showCancelButton: false,
                            timer : 1500
                        }).then(() => {
                            window.location.href = '/goods/goodsCart.do'; 
                        });
                    },
                    error: function(xhr, status, error) {
                        swal.fire("오류", "오류가 발생했습니다. 다시 시도해주세요.", "error");
                    }
                });
            }
        });
    }); 
}); 
</script>
<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function updateTotalsJQuery() {
    var total = 0;

    $('.total-price').each(function() {
        total += parseInt($(this).text().replace(/,/g, ''));
    });

    $('#cartSubtotal').text(numberWithCommas(total) + '원');
    $('#orderTotal').text(numberWithCommas(total) + '원');
}

$(document).ready(function() {
	
	$('.total-price').each(function() {
	        var price = parseInt($(this).text().replace(/,/g, ''));
	        $(this).text(numberWithCommas(price) + '원'); // '₩' 제거
	    });
    updateTotalsJQuery();
    
    $(document).on('click', '.decrease-quantity, .increase-quantity', function() {
        var $this = $(this);
        var $input = $(this).siblings('input.manual-adjust');
        var currentQuantity = parseInt($input.val());
        var stockQuantity = parseInt($this.closest('tr').find('.goodsQuantity').val());
        var pricePerItem = parseInt($input.data('price'));
        var goodsNo = $this.closest('tr').find('.goodsNo').val();
        var userNo = $this.closest('tr').find('.userNo').val();
        var maxPerCustomer = 5;
        var gcId = $(this).data('gcid');
		console.log("gcId??",gcId);
        
        
        if (gcId === 'MEMBERSHIP' && currentQuantity >= 1) {
            Swal.fire({
                icon: "error",
                title: "계정당 1개만 구매 가능합니다.",
                showConfirmButton: false,
                timer: 1500
            });
            return; 
        }
        
        if ($(this).hasClass('increase-quantity')) {
            if (currentQuantity < stockQuantity && currentQuantity < maxPerCustomer) {
                currentQuantity++;
            } else {
                if (currentQuantity >= stockQuantity) {
                	Swal.fire({

                		  icon: "error",
                		  title: "재고수량보다 많은 수량은 구매할 수 없습니다.",
                		  showConfirmButton: false,
                		  timer: 1500
                		});
                } else if (currentQuantity >= maxPerCustomer) {
                	Swal.fire({

                		  icon: "error",
                		  title: "1인 구매제한 갯수는 5개 입니다.",
                		  showConfirmButton: false,
                		  timer: 1500
                		});
                }
                return;
            }
        } else if ($(this).hasClass('decrease-quantity') && currentQuantity > 1) {
            currentQuantity--;
        }
        
        $input.val(currentQuantity);
        
        $input.closest('tr').find('.total-price').text(numberWithCommas(currentQuantity * pricePerItem) + '원'); // '₩' 제거
        
        updateTotalsJQuery();

        
        $.ajax({
            type: "POST",
            url: "/goods/goodsCartUpdate.do",
            contentType: "application/json",
            beforeSend: function(xhr){
            	xhr.setRequestHeader(header, token);
            },
            data: JSON.stringify({
                goodsNo: goodsNo,
                userNo: userNo,
                cartQuantity: currentQuantity
            }),
            success: function(response) {
                console.log("수량 업데이트 성공");
            },
            error: function(xhr, status, error) {
                console.log("수량 업데이트 실패");
            }
        });
    });
});
</script>

	
	
	
</html>