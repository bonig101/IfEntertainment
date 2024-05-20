<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="gap inner-bg">
	<div class="table-styles">

		<div class="little-heading">
			<h2 style="margin-bottom: 30px; font-family: 'GmarketSansMedium';">📊 IR자료실</h2>
		</div>

		<div class="gap listbar-container">
			<div class="discount-copon list-bar">
				<div class="row">
					<div class="col-md-4"></div>
					<form method="post" id="searchForm">
						<input type="hidden" name="page" id="page" />
						<sec:csrfInput />
					</form>
					<div class="col-md-3" style="display: flex;">
						<div class="buttonz">
							<button type="button" id="addBtn">
								<i class="fa-solid fa-plus"></i>자료 등록
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="widget">
			<table class="prj-tbl striped table-responsive">
				<thead class="color">
					<tr class="prodTitle">
						<th><em>번호</em></th>
						<th><em>제목</em></th>
						<th><em>작성자</em></th>
						<th><em>등록일</em></th>
					</tr>
				</thead>
				<tbody>
					<c:set value="${pagingVO.dataList }" var="irFileList" />
					<c:choose>
						<c:when test="${empty irFileList}">
							<tr>
								<td colspan="6">IR 자료실 정보가 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${irFileList }" var="irFile">
								<tr class="prodList" data-prodNo="1">
									<td class="irTds"><span>${irFile.bfNo}</span></td>
									<td class="irTds">
										<span>
											<a href="/entertain/irFile/update/${irFile.bfNo}">
												${irFile.bfTitle}
											</a>
										</span>
									</td>
									<td class="irTds"><span>${irFile.bfWriter}</span></td>
									<td class="irTds">
										<span> 
											<fmt:formatDate value="${irFile.bfRegdate}" pattern="yyyy-MM-dd" />
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
			${pagingVO.pagingHTML }</div>
	</div>
</div>

<script>
	$(function() {
		var addBtn = $("#addBtn");
		var searchForm = $("#searchForm");
		var pagingArea = $("#pagingArea");

		pagingArea.on("click", "a", function(event) {
			event.preventDefault();
			var pageNo = $(this).data("page");
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});

		addBtn.on("click", function() {
			location.href = "/entertain/irFile/insert.do";
		});

	});
</script>