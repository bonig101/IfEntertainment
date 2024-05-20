<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
.accordion{
	display: flex;
  		flex-direction: column;
  		align-items: stretch;
}
.card {
	height:100%;
	margin-top: 5px;
	margin-bottom: 5px;
	border:none;
}

.irRegDate{
	display: inline-block;
	font-size: small;
	padding-bottom: 10px;
}
.irFile {
	padding: 10px 10px 10px 5px;
	margin-left: 26px;
}
.irFileList{
	padding: 10px;
	margin-bottom: 30px;
}
.central-meta{
	height: auto;
}
    
.card-header {
  background: none;
}

.page-link {
    position: relative;
    display: block;
    padding: .5rem .75rem;
    margin-left: -1px;
    line-height: 1.25;
    color: #007bff;
    background-color: #fff;
    border: none;
}

.pagination > li a {
    background: none; 
    color: #525165;
    display: inline-block;
    font-size: 14px;
    height: 35px;
    line-height: 35px;
    text-align: center;
    transition: all 0.2s linear 0s;
    width: 35px;
    border-radius: 4px;
}

.page-item.active .page-link {
    z-index: 3;
    color: black;
    background-color: transparent;
    border-color: none;
}

.pagination > li a:hover {
background: none;
color: #525165;
}

</style>
<div class="faq-area">
	<h3>📑 IR 자료실</h3>
	<div class="accordion" id="accordion">
		<form method="post" id="searchForm">
			<input type="hidden" name="page" id="page"/>
		<sec:csrfInput />
		</form>
	
		<c:set value="${pagingVO.dataList }" var="irFileList" />
		<c:choose>
			<c:when test="${empty irFileList }">
				<h4>자료가 조회되지 않습니다</h4>
			</c:when>
			<c:otherwise>
				<c:forEach items="${irFileList}" var="irFile" varStatus="status">
					<div>
					    <div class="card">
					        <div class="card-header" style="background-color: transparent;">
					            <h5 class="mb-0">
					                <button value="btn-${irFile.bfNo }" class="btn btn-link collapsed" type="button" data-toggle="collapse" 
					                        data-target="#collapse${status.index}" aria-expanded="false" aria-controls="collapse${status.index}">
					                    ${irFile.bfTitle}
					                </button>
					            </h5>
					        </div>
					        <div id="collapse${status.index}" class="collapse" aria-labelledby="heading${status.index}" data-parent="#accordion">
					            <div class="card-body irFile">
					                <div class="irRegDate">
					                	<fmt:formatDate value="${irFile.bfRegdate}" pattern="yyyy-MM-dd" />
					                </div>
					                <div class="irFileList">
<!-- 					                    <div> -->
<%-- 					                        <c:forEach items="${irFile.attachFileList }" var="af"> --%>
<%-- 					                        	<c:if test="${not empty af }"> --%>
<%-- 						                        	<div><i class="far fa-file-alt"></i> ${af.baName }</div> --%>
<%-- 						                        </c:if> --%>
<%-- 					                        </c:forEach> --%>
<!-- 					                    </div> -->
					                </div>
					                <span>
					                    ${irFile.bfTitle} 자료입니다.
					                </span>
					            </div>
					        </div>
					    </div>
				    </div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<div class="card-footer prod-footer clearfix" id="pagingArea" style="display: flex; justify-content: center;" >
			${pagingVO.pagingHTML }
		</div>
		
	</div>
</div>
<script>
$(function(){
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	var accordion = $(".accordion");
	var irFileList = $(".irFileList");
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	// 리스트를 클릭했을 때 pk에 해당하는 게실에 첨부된 파일을 동적으로 가져온다.
	accordion.on("click", "[type=button]", function(){
		
		let html = "";
		
		console.log("button id : " , $(this).val());
		var bfNo = $(this).val().split("-")[1];
		
		$.ajax({
			url: "/entertain/irFile/getAttach.do?bfNo=" + bfNo, 
			type: "get",
			success: function(data){
				console.log("data : ", data);
				console.log("data length : " , data.length);
				console.log("data savepath1 : " , data[0].baSavepath);
				console.log("data savepath2 : " , data[1].baSavepath);
				
				for(var i = 0; i < data.length; i++){
					html += '<div>'
					html += '	<a href="/entertain/irFile/downloadFile?fileName=' + data[i].baName + '&savedName=' + data[i].baSavepath + '">';
					html +=	'		<i class="far fa-file-alt"></i> ' ;
					html +=			data[i].baName;
					html += '	</a>';
					html += '</div>';
				}
				irFileList.html(html);
			}
		
			
		});
		
	});
	
	
});
</script>







