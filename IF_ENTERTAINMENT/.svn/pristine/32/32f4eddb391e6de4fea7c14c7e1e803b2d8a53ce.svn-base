<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">

h2 {
	margin-bottom: 30px;
}

#audiRegisterBtnArea {
	margin-left: 20px;
}

#insertBtn {
	border: medium none;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -ms-border-radius: 5px;
    -o-border-radius: 5px;
    border-radius: 5px;
    color: #fff;
    width: 140px;
    font-size: 14px;
    line-height: 40px;
    text-transform: uppercase;
    background: rgba(0, 0, 0, 0) linear-gradient(-135deg, #1de9b6 0%, #1dc4e9 100%) repeat scroll 0 0;
    -webkit-transition: all 0.2s linear 0s;
    -moz-transition: all 0.2s linear 0s;
    -ms-transition: all 0.2s linear 0s;
    -o-transition: all 0.2s linear 0s;
    transition: all 0.2s linear 0s;
}

#insertBtn i {
	margin-right: 7px;
	margin-left: -4px;
}

#insertBtn:hover {
    background: #333;
}

td span button {
    border: none;
    background: inherit;
}

#pagingArea {
    display: flex;
    justify-content: center;
    align-items: center;
}

.prodList td {
	text-align: left;
}

</style>
</head>
<body>
<div class="gap inner-bg">
	<div class="table-styles">
	
		<div class="little-heading">
			<h2 style="font-family: 'GmarketSansMedium';">💌 오디션일정확인</h2>
		</div>
		
		<div class="gap listbar-container">
			<div class="discount-copon list-bar">
				<div class="row">
					<div class="col-lg-6" style="display: flex; justify-content: center; align-items: center;">
						<form method="post" id="searchForm">
							<input type="hidden" name="page" id="page"/>
							
							<input type="text" name="searchType" value="${searchType }" style="display: none;">
							
							<input type="text" name="searchWord" value="${searchWord }" placeholder="제목으로 검색" style="padding: 9px 20px;">
							<button type="submit">검색</button>
							<sec:csrfInput/>
						</form>
						<div id="audiRegisterBtnArea">
							<button type="button" id="insertBtn">
								<i class="fa fa-plus" aria-hidden="true"></i>오디션 작성
							</button>
						</div>
							
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	
	<div class="widget">
			<table class="prj-tbl striped table-responsive">
				<thead class="color" style="width: inherit;">
					<tr class="prodTitle" align="center">
						<th width="10%" style="padding-left: 50px;"><em>번호</em></th>
						<th width="70%"><em>제목</em></th>
						<th width="20%"><em>등록일</em></th>
					</tr>
				</thead>
				<tbody>
					<c:set value="${pagingVO.dataList }" var="auditionList"/>
					<c:choose>
						<c:when test="${empty auditionList }">
							<tr>
								<td colspan="3"> 조회하신 게시글이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${auditionList }" var="audition">
								<tr class="prodList">
									<td style="text-align: center; padding-left: 50px;" >${audition.bfNo }</td>
									<td align="left" style="padding: 0 10%;">
										<a href="/entertain/audition/admin/detail.do?bfNo=${audition.bfNo }" title="">
											${audition.bfTitle }
										</a>
									</td>
									<td align="center">
									<fmt:formatDate value="${audition.bfRegdate }" pattern="yyyy-MM-dd hh:mm"/>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
	</div>
	<div class="card-footer clearfix" id="pagingArea">
		${pagingVO.pagingHTML }
	</div>

<script type="text/javascript">
$(function(){
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	var searchIcon = $("#searchIcon");
	var insertBtn = $("#insertBtn");
	
	insertBtn.on("click", function() {
		location.href = "/entertain/audition/admin/form.do";
	});
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
});
</script>
</body>
</html>