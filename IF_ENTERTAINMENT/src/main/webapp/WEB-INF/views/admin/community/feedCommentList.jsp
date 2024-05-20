<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
.pagingArea {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>

<div class="gap inner-bg">
  <div class="table-styles">
  
  <div class="little-heading">
  	<h2 style="margin-bottom: 30px; font-family: 'GmarketSansMedium';">🔖 댓글리스트</h2>
  </div>
  
  	<div class="gap listbar-container">
    <div class="discount-copon list-bar">
      <div class="row">
        <div class="col-md-4">
			<form method="post" id="searchForm">
			    <input type="hidden" name="page" id="page"/>
			    <div class="searchform-box" style="display: flex; justify-content: flex-end; align-items: center;">
			        <select name="searchType" class="nice-select">
			            <option value="content" ${searchType eq 'content' ? 'selected' : ''}>내용</option>
			        </select>
			        
			        <input type="text" name="searchWord" value="${searchWord}" placeholder="검색" style="padding: 9px 20px;">
			        
			        <button type="submit">검색</button>
			    </div>
			</form>

        </div>
        <div class="col-md-3" style="display: flex;">
        	<form id="deleteForm">
	        	<button type="submit" style="width: 150px">선택항목 삭제하기</button>
	        	<input type="hidden" name="selectedFeedIds" id="selectedFeedIds"/>
        	</form>
        </div>
      </div>
    </div>
  </div>
    
    <div class="widget">
      <table class="prj-tbl striped table-responsive">
        <thead class="color">
           <tr class="feedTitle">
             <th><i class="all-slct"></i></th>
             <th><em>댓글 번호</em></th>
             <th><em>유저닉네임</em></th>
             <th><em>피드타입</em></th>
             <th><em>멤버십여부</em></th>
             <th><em>내용</em></th>
             <th><em>아티스트</em></th>
             <th><em>등록일</em></th>
             <th><em>상태</em></th>
           </tr>
        </thead>
        <tbody>
        <c:set value="${pagingVO.dataList }" var="commentList"/>
        <c:choose>
        	<c:when test="${empty  commentList}">
        		<tr>
        			<td colspan="10">리스트가 존재하지 않습니다.</td>
        		</tr>
        	</c:when>
        	<c:otherwise>
        		<c:forEach items="${commentList }" var="comment">
        			<tr class="feedList" data-fcNo="${comment.fcNo }">
			            <td><input type="checkbox" class="selectFeed" value="${comment.fcNo }"/></td>
			            <td><a href="/community/feed/admin/feedCommentListDetail.do?fcNo=${comment.fcNo}">${comment.fcNo}</a></td>
			            <td><span>${comment.mnNickName }</span></td>
			            <td>
						    <c:choose>
						        <c:when test="${comment.feedType == 1}">
						            <span>팬</span>
						        </c:when>
						        <c:when test="${comment.feedType == 2}">
						            <span>아티스트</span>
						        </c:when>
						        <c:otherwise>
						            <span>알 수 없음</span>
						        </c:otherwise>
						    </c:choose>
						</td>
			            <td>
						    <c:choose>
						        <c:when test="${comment.feedMembership == 0}">
						            <span>전체멤버</span>
						        </c:when>
						        <c:when test="${comment.feedMembership == 1}">
						            <span>멤버십전용</span>
						        </c:when>
						        <c:otherwise>
						            <span>알 수 없음</span>
						        </c:otherwise>
						    </c:choose>
						</td>
			            <td><span>${comment.fcContent }</span></td>
			            <td><span>${comment.agId }</span></td>
			            <td><span><fmt:formatDate value="${comment.fcRegdate }" pattern="yyyy-MM-dd hh:mm"/></span></td>
			            
			            <td><span><a href="#" class="delete"><i class="icon-trash"></i></a></span></td>
			          </tr>
        		</c:forEach>
        	</c:otherwise>
        </c:choose>
        </tbody> 
      </table>
    </div>
    
    <div class="card-footer feed-footer clearfix pagingArea" id="pagingArea">
		${pagingVO.pagingHTML }
	</div>

  </div>
</div>
<script type="text/javascript">
$(function(){
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	var feedList = $(".feedList");

	$('.all-slct').on("click", function() {
	    var isChecked = $(this).prop("checked"); 
	    $(".selectFeed").prop("checked", isChecked);
	});

	$('.sngl-slct').on("click",function(){
		$(this).toggleClass('active');
	});
	
	$(".delete").on("click", function() {
	    var fcNo = $(this).closest("tr").data("fcno"); 
	    console.log("fcno", fcNo);
	    $.ajax({
	        type: "POST",
	        url: "/community/feed/comment/delete.do", 
	        contentType: "application/json", 
	        data: JSON.stringify({ fcNo: fcNo }), 
	        success: function(response) {
	        	Swal.fire({
	        		  icon: "success",
	        		  title: "삭제가 완료되었습니다!",
	        		  showConfirmButton: false,
	        		  timer: 1500
	        		});
	        	setTimeout(function() {
	                window.location.href = "/community/feed/admin/comList.do";
	            }, 2000); 
	        },
	        error: function(xhr, status, error) {
	            console.error(xhr.responseText);
	        }
	    });
	});

	



    $("#deleteForm").submit(function(event){
        event.preventDefault();
        var selectedFeedIds = [];
        $(".selectFeed:checked").each(function(){
            selectedFeedIds.push($(this).val());
        });
        $("#selectedFeedIds").val(selectedFeedIds.join(","));
        deleteForm.unbind('submit').submit();
    });
	

});

</script>
