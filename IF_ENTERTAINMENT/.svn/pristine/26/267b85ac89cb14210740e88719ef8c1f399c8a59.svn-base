<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/sweetAlertCustom/sweetAlertCustom.js"></script>
<style>
.aactive {
		background:#9551fc;
		color: #fff !important;
	}
.totalcount {
	position: relative !important;
	display:inline-block;
	width: 20px !important;
	height: 25px !important;
	color: #9551fc;
	line-height: 38px;
	text-align: right;
}
</style>

<div class="central-meta OrderIssue">
	<form id="pageForm" method="post">
	    <input type="hidden" name="page" id="page"/>
	    <sec:csrfInput/>
	</form>
	<h1 class="create-post">취소/교환내역</h1>
	
	<div class="forum-warper">
		<div class="central-meta">
			<div class="title-block">
				<div class="row">
					<div class="col-lg-6" style="display: flex; align-items: center;">
						<div class="align-left">
							<h5>취소/교환 기간 :</h5>
						</div>
						<div class="align-left">
							<ul class="nave-area orderdate-area">
								<li><a class="o1 one" href="#" title="">1개월</a></li>
								<li><a class="o1 three" href="#" title="">3개월</a></li>
								<li><a class="o1 six" href="#" title="">6개월</a></li>
								<li><a class="o1 twelve" href="#" title="">12개월</a></li>
							</ul>
						</div>
					</div> 
					<div class="col-lg-6" style="display: flex; align-items: center; justify-content: flex-end;">
						<div class="align-left">
							<h6 style="width: 100px; text-align: right;">총 <span class="totalcount"></span>건</h6>
						</div>
					</div>
				</div>
			</div>
		</div><!-- title block -->
	</div>
	
	<div class="cart-sec">
		<table class="table table-responsive OrderIssue-table">
			<tr>
				<th>주문일자</th>
				<th>상품</th>
				<th>총 수량</th>
				<th>총 결제금액(원)</th>
				<th>상태</th>
			</tr>
			<c:set value="${pagingVO.dataList }" var="myIssueList" />
			<c:choose>
				<c:when test="${empty myIssueList }">
					<tr>
						<td colspan="5">교환/취소 내역이 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${myIssueList }" var="myIssue">
						<tr class="tr_content">
							<td class="orderno-box">
								<span><fmt:formatDate value="${myIssue.orderDate}" pattern="yyyy-MM-dd" /></span><br>
								<span class="order_no">${myIssue.orderNo }</span>
								<span class="woocommerce-Price-amount amount">
									<a class="detail" data-orderNo="${myIssue.orderNo }">상세보기</a>
								</span>
							</td>
							<td>
								<div class="cart-avatar issu-imgbox goods" data-goodsNo="${myIssue.goodsNo}">
									<img src="${myIssue.goodsThumbnail }" alt="">
								</div>
								<div class="cart-meta issue-pro-con goods" data-goodsNo="${myIssue.goodsNo}">
									<span class="issue-pro-artist">${myIssue.goodsArtist }</span>
									<span class="issue-pro-title">${myIssue.goodsName }</span>
									<c:if test="${myIssue.orderCount > 1}">
										<span class="issue-pro-quan">외 ${myIssue.orderCount -1} 건</span>
									</c:if>
								</div>
							</td>
							<td>
								<span class="cart-prices"> 
									<ins>
										<span class="woocommerce-Price-amount amount"> ${myIssue.odTotal}</span>
									</ins> 
								</span>
							</td>
							<td>
								<span class="cart-prices"> 
									<ins>
										<span class="woocommerce-Price-amount amount"><fmt:formatNumber value="${myIssue.orderTotalprice }" pattern="#,###"/></span>
									</ins> 
								</span>
							</td>
							<td class="orderdetail_issueBtn">
								<c:choose>
									<c:when test="${myIssue.guiType eq '1' }">
										<div class="Btn_box">
											<span style="font-weight: 600">취소 완료</span>
											<span  class="IssueDate" style="font-size: 12px">처리일시 <br><fmt:formatDate value="${myIssue.guiDate}" pattern="yyyy-MM-dd" /></span>
											<!-- <a href="#" title="" class="main-btn create-pst order-cancelBtn ocBtn">상세보기</a> -->
										</div>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${myIssue.guiType eq '2' }">
												<div class="Btn_box">
													<span style="font-size: 12px">신청일시 <br><fmt:formatDate value="${myIssue.guiDate}" pattern="yyyy-MM-dd" /></span>
													<span class="orderIssue_changestatus">교환 처리 중</span>
												</div>
											</c:when>
											<c:otherwise>
												<div class="Btn_box">
													<span>교환 완료</span>
												</div>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<%-- <div class="card-footer prod-footer clearfix" id="pagingArea">
			${pagingVO.pagingHTML }
		</div> --%>
	</div>
</div>

<!-- 모달시작 -->
<div class="modal fade cancelmodal" id="inputModal" tabindex="-1" aria-labelledby="inputModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-di">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="inputModalLabel">취소사유를 작성해주세요.</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mb">
		    	<div class="form-group odcancel-form">
			       <div class="inq">
			            <label>사유 선택  :&nbsp</label>
			            <select name="guiReason" id="guiReason" class="selectpicker" style="width: 120px" >
	                      	<option value="">카테고리 선택</option>
			                <option value="simple">단순 변심</option>
			                <option value="Payment">결제수단 변경</option>
			                <option value="mistake">주문 착오</option>
			                <option value="other">기타</option>
		                </select>
			        </div>
			        <hr>
		            <div>
		                <label for="inputText">상세 사유 :</label>
				        <textarea id="guiDetail" name="guiDetail" 
				        class="form-control canceltext" placeholder="텍스트를 입력하세요" style="height: 200px;"></textarea>
		            </div>
	    		</div>
			</div>
            <div class="modal-footer mf">
                <button id="cancelBtn" type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button id="ansBtn" type="button" class="btn btn-primary">주문 취소하기</button>
            </div>
        </div>
    </div>
</div>
<!-- 모달 끝 -->

<script src="${pageContext.request.contextPath }/resources/js1/nice-select.js"></script>
<script type="text/javascript">
	$(function () {
		
		$(".totalcount").text($(".tr_content").length);
		
		var orderarea = $(".orderdate-area");
		
		orderarea.on("click", ".o1", function () {
		    orderarea.find(".o1").removeClass("aactive");
		    $(this).addClass("aactive");
		    
		    $(".tr_content").show();

		    var today = new Date(); // 현재 날짜 정보를 가져옵니다.
		    var startDate = new Date(); // 시작일

		    // 현재 날짜 정보 가져오기
		    var year = today.getFullYear(); // 연도
		    var month = today.getMonth(); // 월
		    var date = today.getDate(); // 일

		    if (date) { // 만약 일 정보가 있다면
		        let todayDate = today.getDate();
		        if (date != todayDate) {
		            if (month == 0) year -= 1; // 만약 이번 달이 1월이면 작년으로 변경
		            month = (month + 11) % 12; // 이전 달로 변경
		            date = new Date(year, month, 0).getDate(); // 해당 달의 마지막 날짜를 반환하여 date 변수에 저장
		        }
		    }
		    
		    if ($(this).hasClass("one")) { // 만약 클릭한 요소에 one 클래스가 있다면
		        startDate.setMonth(today.getMonth() - 1); // 시작일을 한 달 전으로 설정
		    } else if ($(this).hasClass("three")) { // 만약 클릭한 요소에 three 클래스가 있다면
		        startDate.setMonth(today.getMonth() - 3); // 시작일을 세 달 전으로 설정
		    } else if ($(this).hasClass("six")) { // 만약 클릭한 요소에 six 클래스가 있다면
		        startDate.setMonth(today.getMonth() - 6); // 시작일을 여섯 달 전으로 설정
		    } else if ($(this).hasClass("twelve")) { // 만약 클릭한 요소에 twelve 클래스가 있다면
		        startDate.setFullYear(today.getFullYear() - 1); // 시작일을 일 년 전으로 설정
		    }
		    console.log("startDate : ", startDate);
		    
			console.log("@@@", $(".tr_content").eq(0).find(".IssueDate").html());
			
			var visibleRowCount = 0;
			$(".tr_content").each(function(idx, item){
				var listDate = $(item).find(".IssueDate").html().replace("<br>", "").replace("처리일시", "");
				console.log(listDate);
				var listParseDate = new Date(listDate);
				if(listParseDate < startDate){
					$(this).hide();
				}
				if(listParseDate >= startDate){ // startDate보다 크거나 같은 경우만 처리
			        visibleRowCount++; // hide되지 않은 요소의 수 증가
			    }
			});
			console.log("hide되지 않은 tr의 갯수:", visibleRowCount);
			$(".totalcount").text(visibleRowCount);
		});
		
		
		
		var pagingArea = $("#pagingArea");
		var pageForm = $("#pageForm");
		pagingArea.on("click", "a", function (event) {
			event.preventDefault();
			var pageNo = $(this).data("page");
			console.log("pageNo", pageNo);
			pageForm.find("#page").val(pageNo);
			pageForm.submit();
		});
		
		var detail = $(".detail");
		
		detail.on("click", function () {
			var orderNo = $(this).data('orderno');
			location.href = "/goods/myOrderDetail.do?orderNo=" + orderNo;
		});
		
		var goods = $(".goods");
		
		goods.on("click", function () {
			var goodsNo = $(this).data('goodsno');
			location.href = "/goods/shopDetail.do?goodsNo=" + goodsNo;
		});
		
		var ocBtn = $(".ocBtn");
		var ansBtn = $("#ansBtn");
		
		ocBtn.on("click", function (event) {
			event.preventDefault();
			
			Swal.fire({
	            title: '상품 주문을 취소하시겠습니까?',
	            text: "취소시 모든제품이 취소 됩니다.",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '예, 취소합니다',
	            cancelButtonText: '취소'
	        }).then((result) => {
	        	
	            if (result.isConfirmed) {
	            	modal.modal('show'); // 모달 열기
	            	
	            	ansBtn.on("click", function () {
						
			        	var orderNo = detail.data("orderno");
			        	var guiReason = $("#guiReason").val();
			        	var guiDetail = $("#guiDetail").val();
			        	
			        	console.log("orderNo 값 : ", orderNo);
			        	console.log("guiReason 값 : ", guiReason);
			        	console.log("guiDetail 값 : ", guiDetail);
			        	
			        	var data = {
			        			orderNo : orderNo,
			        			guiReason : guiReason,
			        			guiType : 1, //주문취소 상태값 
			        			guiDetail : guiDetail
			        	}
			        	
			        	$.ajax({
			        		type : "post",
			        		url : "/goods/order/orderCancel.do",
			        		data : JSON.stringify(data),
			        		contentType : "application/json;charset=utf-8",
			        		beforeSend: function(xhr){
			        			xhr.setRequestHeader(header, token);
			        		},
			        		success : function (res) {
								console.log(res);
								if (res == "OK") {
									Swal.fire({
									  icon: "success",
									  title: "주문취소가 완료되었습니다.",
									  showConfirmButton: false,
									  timer: 1500
									});
								}
								modal.modal("hide");
								setInterval(() => {
									location.reload(true);
								}, 1501);
							}
			        	});
					});

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
		
		var modal = $("#inputModal"); 
		
		modal.on('show.bs.modal', function () {     
	         var modal = $(this);
	         modal.appendTo('body');
	    });
	});
</script>
