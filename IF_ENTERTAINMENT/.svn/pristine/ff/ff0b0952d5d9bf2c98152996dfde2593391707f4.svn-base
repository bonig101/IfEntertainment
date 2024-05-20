<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style>
.profile-cell {
    display: flex;
    justify-content: center; /* td 내에서 profile-content를 가운데 정렬 */
}
.prodTitle th:first-child {
	padding-left: 40px !important;
}
.prodTitle th:last-child {
	padding-right: 40px !important;
}
.profile-content {
    display: flex;
    align-items: center; /* 세로 중앙 정렬 */
    width: 200px; /* 적절한 크기로 조정 */
}
.profile-content form {
	margin-left: 20px;
} 
.profile-img {
    width: 70px;
    height: 70px;
   
}

.profile-id {
    white-space: nowrap; 
    text-align: left;
    flex-grow: 1; 
    display: block;
}
.right-align {
    display: flex;
    justify-content: flex-end;
}
#newBtn {
	border: medium none;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -ms-border-radius: 5px;
    -o-border-radius: 5px;
    border-radius: 5px;
    color: #fff;
    font-size: 14px;
    line-height: 40px;
    margin-right: 20px;
    margin-left: 20px;
    margin-top: 5px;
    text-transform: uppercase;
    width: 107px;
    background: rgba(0, 0, 0, 0) linear-gradient(-135deg, #1de9b6 0%, #1dc4e9 100%) repeat scroll 0 0;
    -webkit-transition: all 0.2s linear 0s;
    -moz-transition: all 0.2s linear 0s;
    -ms-transition: all 0.2s linear 0s;
    -o-transition: all 0.2s linear 0s;
    transition: all 0.2s linear 0s;
}
</style>

<div class="gap inner-bg">
  <div class="table-styles">
  
  <div class="little-heading">
  	<h2 style="margin-bottom: 30px; font-family: 'GmarketSansMedium';">🤹 아티스트 리스트</h2>
  </div>
  
  	<div class="gap listbar-container">
    <div class="discount-copon list-bar">
      <div class="row">
        <div class="col-md-4" style="display: flex;">
          <form method="post" id="searchForm" action="/entertain/artist/album/adminList.do">
	        <input type="hidden" name="page" id="page"/>
          	<div class="searchform-box" style="display: flex">
	            <input type="text" name="searchWord" value="${searchWord }" placeholder="아티스트 검색">
		        <button type="submit">검색</button>
	          </div>
	          <sec:csrfInput/>
          </form>
        	<button type="button" id="newBtn"><i class="fa-solid fa-plus"></i>등록하기</button>
        </div>
        <!-- <div class="col-md-2 right-align" style="display: flex; justify-content: space-around;">
        </div> -->
      </div>
    </div>
  </div>
    
    <div class="widget">
      <table class="prj-tbl striped table-responsive">
        <thead class="color">
           <tr class="prodTitle">
             <th><em>번호</em></th>
             <th><em>아티스트명</em></th>
             <th><em>데뷔일자</em></th>
             <th><em>그룹/솔로</em></th>
             <th><em>상태</em></th>
           </tr>
        </thead>
        <tbody>
        <c:set value="${pagingVO.dataList }" var="adminList"/>
        <c:choose>
        	<c:when test="${empty  adminList}">
        		<tr>
        			<td colspan="10">아티스트 리스트가 존재 하지 않습니다.</td>
        		</tr>
        	</c:when>
        	<c:otherwise>
		<c:forEach items="${adminList}" var="list" varStatus="status">
		    <tr class="prodList" data-prodNo="1">
		        <td>${list.agNo}</td>
		        <td class="profile-cell"> <!-- 클래스 추가 -->
		            <!-- 중앙 정렬을 위한 컨테이너 추가 -->
		           <div class="profile-content">
					    <c:choose>
					        <c:when test="${fn:contains(list.agProfile, 'http')}">
					            <img src="${list.agProfile}" alt="설명" class="profile-img">
					        </c:when>
					        <c:otherwise>
					            <img src="${pageContext.request.contextPath}/resources/upload/group/${list.agProfile}" alt="설명" class="profile-img">
					        </c:otherwise>
					    </c:choose>
					    <form action="">
					    <a href="/entertain/artist/profile/artistDetail.do?agId=${list.agId}" class="profile-id">${list.agId}</a>
					    <sec:csrfInput/>
					    </form>
					</div>
		        </td>
		        <td>
		        	<fmt:parseDate value="${list.agDate}" var="agDate" pattern="yyyy-MM-dd"/>
		          <fmt:formatDate value="${agDate}" pattern="yyyy-MM-dd" />
		          
		     
		        </td>
		        <td>
		            <span>
		                <c:choose>
		                    <c:when test="${list.artistCount > 1}">
		                    	그룹
		                    </c:when>
		                    <c:otherwise>
		                    	솔로
		                    </c:otherwise>
		                </c:choose>
		            </span>
		        </td>
		        <td><span><a href="#" class="delBtn"><i class="icon-trash"></i></a></span></td>
		    </tr>
		     <form action="/entertain/artist/profile/delete.do" method="post" id="delform">
		     	<input type="hidden" name="agId" value="${list.agId }">
		     	<sec:csrfInput/>
		       </form>
		</c:forEach>



        	</c:otherwise>
        </c:choose>
        </tbody> 
      </table>
    </div>
    
    <div class="card-footer prod-footer clearfix" id="pagingArea">
		${pagingVO.pagingHTML }
	</div>
<c:if test="${not empty message}">
    <script>
    Swal.fire({
      icon: "success",
  	  title: "${message}",
  	  showConfirmButton: false,
  	  timer: 1500
    });
    </script>
</c:if>

<c:if test="${not empty message1}">
    <script>
    Swal.fire({
      icon: "info",
  	  title: "${message1}",
  	  showConfirmButton: false,
  	  timer: 1500
    });
    </script>
</c:if>
  </div>
</div>

<script>
$(function () {
	var header = "";
	var token = "";
	header = $("meta[name='_csrf_header']").attr("content");
	token = $("meta[name='_csrf']").attr("content");
	
	
	var adminList = $(".adminList");
	var prod_update = $(".prod_update");
	var delBtn = $(".delBtn");
	var searchForm = $("#searchForm")
	
	prod_update.on("click", function () {
	    var prodNo = $(this).data("prodno"); 
	    location.href = "/goods/update.do?goodsNo=" + prodNo;
	});

	$('.all-slct').on("click",function(){
		$(this).toggleClass('active');
		
	    $(".sngl-slct").toggleClass('active'); 
	});
	
	$(".icon-trash").on("click", function() {
		deleteBoard();
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
		location.href = "/entertain/artist/profile/form.do";
	});
	
	delBtn.on("click", function () {
		if (confirm("선택한 아티스트를 삭제 하시겠습니까 ?")) {
			$("#delform").submit();
		}
	});
	
});
</script>