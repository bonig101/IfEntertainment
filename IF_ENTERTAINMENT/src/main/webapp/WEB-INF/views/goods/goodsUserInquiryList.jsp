<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
    .btn.btn-link > span {
        color: white;
        font-size: 12px;
        position: absolute;
        right: 20px;
        top: 13px;
    }

    .gradient-badge {
        background: #9551fc;
    }
</style>

<section>
	<div class="gap">
		<div class="container">
			<div class="row" id="page-contents">

				<div class="col-lg-12">

					<div class="pitnik-title">
						<h1>🙋 1:1 문의하기</h1>
						<p>
							굿즈샵 관련 문의사항이 있으시면 밑 버튼을 클릭하여 문의해 주세요. <br /> 저희는 항상 여러분의 의견에 귀
							기울이고 도와드리겠습니다.
						</p>
					</div>

					<div class="faq-area">
						<h4>📌 자주묻는 질문</h4>
						<p>자주묻는 질문에 원하는 답변이 없을 땐 1:1문의하기를 이용해주세요</p>
						<div class="accordion" id="accordion">
							<div class="card">
								<div class="card-header" id="headingOne">
									<h5 class="mb-0">
										<button class="btn btn-link" type="button"
											data-toggle="collapse" data-target="#collapseOne"
											aria-expanded="false" aria-controls="collapseOne">
												굿즈샵 구매 관련</button>
									</h5>
								</div>
								<div id="collapseOne" class="collapse"
									aria-labelledby="headingOne" data-parent="#accordion">
									<div class="card-body">
										먼저, 굿즈샵 구매는 각 이프엔터테인먼트 회원이 되시면 구매하실 수 있습니다. <a href="/signup.do"
											title="">회원가입 하러가기</a>
										<ol>
											<li>특정 상품은 멤버쉽을 구매하신 분들만 구매할 수 있습니다.</li>
											<li>특정 상품은 1인당 구매 한도가 있습니다.</li>
										</ol>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="headingTwo">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" type="button"
											data-toggle="collapse" data-target="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo">
											이프엔터테인먼트 회원 탈퇴 방법과 유의사항에 대해서 안내드립니다.</button>
									</h5>
								</div>
								<div id="collapseTwo" class="collapse"
									aria-labelledby="headingTwo" data-parent="#accordion">
									<div class="card-body">이프엔터테인먼트의 회원 탈퇴는 아티스트 커뮤니티 탈퇴와
										서비스(굿즈샵)탈퇴가 있습니다. 탈퇴하기는 마이페이지에 있습니다.</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="headingThree">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" type="button"
											data-toggle="collapse" data-target="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree">
											환불 및 교환에 대한 자주 묻는 질문</button>
									</h5>
								</div>
								<div id="collapseThree" class="collapse"
									aria-labelledby="headingThree" data-parent="#accordion">
									<div class="card-body">상품에 문제가 있는 경우 7일 이내 환불 및 교환이 가능합니다. 자세한 내용은 아래 채널로 문의 해주세요.</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="headingfour">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" type="button"
											data-toggle="collapse" data-target="#collapsefour"
											aria-expanded="false" aria-controls="collapsefour">
											멤버십 가입 시 성별을 잘못 선택했는데, 공연 관람이 가능할까요?</button>
									</h5>
								</div>
								<div id="collapsefour" class="collapse"
									aria-labelledby="headingfour" data-parent="#accordion">
									<div class="card-body">고객님의 성별 정보는 선택 사항이므로 공연 관람 가능 여부와
										무관합니다.</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="headingfive">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" type="button"
											data-toggle="collapse" data-target="#collapsefive"
											aria-expanded="false" aria-controls="collapsefive">
											할인 및 이벤트 문의</button>
									</h5>
								</div>
								<div id="collapsefive" class="collapse"
									aria-labelledby="headingfive" data-parent="#accordion">
									<div class="card-body">현재 진행중인 이벤트 및 할인 정보는 메인 페이지의 이벤트 코너에서 확인이 가능합니다.<a href="/goods/main.do"
											title="">굿즈샵 바로가기</a> </div>
								</div>
							</div>
							<div class="col-lg-12">
								<form id="myForm" class="c-form mng-page" method="post"
									action="">
									<button type="button" class="main-btn3"
										id="goodsShopBtn">굿즈샵 돌아가기</button>
									<button type="button" class="main-btn" id="inquiryBtn">1:1
										문의하기</button>
								</form>
							</div>
						</div>
					</div>
					<h4>📌 나의 문의내역</h4>
					<div class="accordion" id="accordion1">
						<c:set value="${pagingVO.dataList }" var="InquiryUserList" />
						<c:choose>
							<c:when test="${empty InquiryUserList}">
								<div class="card">
									<div class="card-header" id="headingZero">
										<h5 class="mb-0">
											<button class="btn btn-link" type="button"
												data-toggle="collapse" data-target="#collapseZero"
												aria-expanded="true" aria-controls="collapseZero">
												문의 내역이 존재하지 않습니다.</button>
										</h5>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${InquiryUserList}" var="goodsInquiry"
									varStatus="loop">
									<c:if test="${goodsInquiry.userNo eq loginUser}">
									<div class="card">
										<div class="card-header" id="heading${loop.index}">
											<h5 class="mb-0">
												<button class="btn btn-link collapsed" type="button"
													data-toggle="collapse" data-target="#collapse${loop.index}"
													aria-expanded="false" aria-controls="collapse${loop.index}">
													${goodsInquiry.giTitle} <span
														class="badge ${goodsInquiry.giReply != null ? 'badge-success gradient-badge' : 'badge-danger'}">
														${goodsInquiry.giReply != null ? '답변 완료' : '미답변'} </span>
												</button>
											</h5>
										</div>
										<div id="collapse${loop.index}" class="collapse"
											aria-labelledby="heading${loop.index}"
											data-parent="#accordion1">
											<div class="card-body">
												<p>번호: ${goodsInquiry.giNo}</p>
												<p>제목: ${goodsInquiry.giTitle}</p>
												<p>문의유형: ${goodsInquiry.giType}</p>
												<p>등록일: ${goodsInquiry.giRegdate}</p>
												<p>답변일: ${goodsInquiry.giAnsdate}</p>
												<p>답변내용: ${goodsInquiry.giReply}</p>
											</div>
										</div>
									</div>
									 </c:if>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="card-footer prod-footer clearfix" id="pagingArea">
						<form method="post" id="searchForm">
							<input type="hidden" name="page" id="page" />
						</form>
						${pagingVO.pagingHTML }
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
    $(function () {
        var pagingArea = $("#pagingArea");
        var searchForm = $("#searchForm"); // searchForm 변수를 정의

        pagingArea.on("click", "a", function (event) {
            event.preventDefault();
            var pageNo = $(this).data("page");
            searchForm.find("#page").val(pageNo);
            searchForm.submit();
        });

    });

    $(document).ready(function(){
        $('#accordion1').collapse({
            toggle: false // 기본적으로 닫힌 상태로 시작
        });
    });
    
    document.getElementById("inquiryBtn").addEventListener("click", function() {
        window.location.href = "http://localhost/goods/inquiry/form.do";
    });
    
    document.getElementById("goodsShopBtn").addEventListener("click", function() {
        window.location.href = "http://localhost/goods/main.do";
    });
    
</script>
