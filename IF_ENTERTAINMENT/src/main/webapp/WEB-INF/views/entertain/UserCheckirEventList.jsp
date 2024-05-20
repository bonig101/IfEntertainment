<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
.container-bottom-margin {
   margin-bottom: 30px;
}
.central-meta:hover {
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 호버 시 그림자 효과 추가 */
    transition: box-shadow 0.3s ease; /* 호버 효과에 부드러운 전환 효과 추가 */
}

</style>
</head>
<body>
<h3>📣 IR 행사일정</h3>
<div class="container">
    <div class="row merged20">
        <c:set value="${pagingVO.dataList }" var="UserCheckirEventList" />
        <c:choose>
            <c:when test="${empty UserCheckirEventList }">
                <div class="col-lg-6 col-md-6">조회한 게시물이 없습니다 !!!!!</div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${UserCheckirEventList }" var="irEvent" varStatus="loop">
                    <div class="col-lg-6 col-md-6" style="padding: 5px;">
                        <div class="central-meta" data-bfNo="${irEvent.bfNo }"
                        style="margin-bottom: 0;">
                            <div class="blog-post">
                                <div class="friend-info">
                                    <div class="post-meta" style="margin-top: 0;">
                                        <div class="description">
                                            <h5>
                                                <a href="/entertain/ir/userdetail.do?bfNo=${irEvent.bfNo }" title=""> ${irEvent.bfTitle } </a>
                                            </h5>
                                            <div class="date">
                                                <span>일정 &emsp;${irEvent.irSchedule }</span>
                                            </div>
                                            <div class="place">
                                                <span>장소 &emsp;${irEvent.irPlace }</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${loop.index % 2 == 1}">
                        <div class="w-100"></div>
                    </c:if>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="container-bottom-margin">
</div>

<div class="card-footer prod-footer clearfix" id="pagingArea" style="display: flex; justify-content: center;" >
		<form method="post" id="irPagingForm">
			<input type="hidden" name="page" id="page" />
		</form>
		${pagingVO.pagingHTML }
</div>

	<script type="text/javascript">
		$(function() {
			var irPagingForm = $("#irPagingForm");
			var pagingArea = $("#pagingArea");

			pagingArea.on("click", "a", function(event) {
				event.preventDefault();
				var pageNo = $(this).data("page");
				irPagingForm.find("#page").val(pageNo);
				irPagingForm.submit();
			});
		});
	</script>
</body>
</html>