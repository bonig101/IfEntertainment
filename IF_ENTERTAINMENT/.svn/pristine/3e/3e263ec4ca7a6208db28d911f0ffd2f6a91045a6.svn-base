<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<div class="central-meta" style="min-height: 600px;">
	<span class="create-post user_goodsnotice">공지사항
		<!-- <a title="" href="#">Full Month</a> -->
	</span>
	<div class="notice-detail">
		<table class="board-view-1s mgT40">
			<colgroup>
				<col style="width:80%;">
				<col style="width:20%;">
			</colgroup>
			<tbody>
				<tr>
					<td>
						<strong class="FG01">일반 </strong>
						<span class="tit">${goodsNotice.bfTitle }</span>
					</td>
					<fmt:parseDate value="${goodsNotice.bfRegdate }" var="bfRegdate" pattern="yyyy-MM-dd" />
					<td class="data"><fmt:formatDate value="${bfRegdate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td class="textus" colspan="2">
						<div class="contEditor">
								${goodsNotice.bfContent }
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="goList">
			<a href="" class="main-btn create-pst order-cancelBtn">목록</a>
		</div>
	</div> 
</div>




<script type="text/javascript">
	$(function () {
		var listBtn = $(".order-cancelBtn");
		listBtn.on("click", function () {
			location.href = "/goods/notice/userlist.do";
		})
		
		var pagingArea = $("#pagingArea");
		
		pagingArea.on("click", "a", function (event) {
			event.preventDefault();
			var pageNo = $(this).data("page");
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});
	})
</script>