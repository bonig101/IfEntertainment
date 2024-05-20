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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/company.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/resources/js1/bootstrap.min.js"></script>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.min.css"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/color.css"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css"> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/main.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/script.js"></script> --%>
</head>
<style>
.searchform-box{
	display: flex;
}	
.btn-st {
	border: none;
	margin-right: 10px;
}
#feed_state_button{
	cursor: pointer;
    border: 1px solid #eee;
    padding: 10px 20px;
    background: #fff;
    font-size: 13px;
}
#feed_state_button:hover {
	background: #cbcfd4;
}
.feed-footer {
	display: flex;
	justify-content: center;
}
table tr th:first-child, table tr td:first-child {
   	padding: 24px 5px;
}
table tbody tr td:last-child {
	    padding: 24px 5px;
}
table tr th {
	text-align: center;
}
table tbody tr td {
	text-align: center;
}

.modalReportArea {
	padding: 20px;
	max-width: 50%;
	position: relative;
	left: 5%;
    top: 5%;
}

.close {
  color: #000;
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 30px;
}

.close:hover,
.close:focus {
  text-decoration: none;
  cursor: pointer;
}

.report_modalTitle {
	text-align: center;
	padding: 30px;
}

.modalReportTitle {
	text-align: left;
}

.modalReportContent {
	text-align: left;
}

.modalReportBtn {
    text-align: center;
    padding-top: 30px;
    padding-bottom: 30px;
	
}

#reportTable {
	width: 90%;
	margin: 0 auto;
    border-top: 2px solid #000;
	border-bottom: 2px solid #000;
}

.modalReportCheck {
	display: flex;
	justify-content:flex-start;
	align-items: center;
}

.modalReportCheck input {
	margin-right: 10px;
}

.modalReportCheck label {
	margin-bottom: 0;
}

.confirmButton {
	border: none;
    font-size: 18px;
    padding: 10px 23px;
}

.feedReportFilter:focus,
.feedReportFilter:active {
	outline: none;
}
</style>
<body>
<div class="gap inner-bg">
  <div class="table-styles">
  
<!-- 	<div class="little-heading"> -->
		<h2 class="header_title top_title" style="margin-bottom: 30px; font-family: 'GmarketSansMedium';">🚨 신고 관리</h2>
<!-- 		<h4 class="top_title_icon"><i class="fa fa-chevron-right" aria-hidden="true"></i></h4> -->
<!-- 		<h4 class="top_title_end">게시물 신고 관리</h4> -->
<!-- 	</div> -->
  
  	<div class="gap listbar-container">
    <div class="discount-copon list-bar list_buttons_box">
      <div class="row">
		<div class="col-md-2" style="display: flex;">
		    <button class="filter-btn btn-st feedReportFilter" data-reportGubun="0">피드</button>
		    <button class="filter-btn btn-st feedReportFilter" data-reportGubun="1">유저</button>
		</div>
        <div class="col-md-4">
			<form method="post" id="searchForm" >
			    <input type="hidden" name="page" id="page"/>
			    <div class="searchform-box searchform_box">
			        <%-- <select name="searchType" class="mem_searchType">
			            <option value="writer" ${searchType eq 'writer' ? 'selected' : ''}>유저</option>
			        </select> --%>	
			        <input type="text" class="mem_searchWord" name="searchWord" value="${searchWord}" placeholder="아이디 검색">
			        <button type="submit" class="mem_searchBtn" style="margin-right: 30px;">검색</button>
			    </div>
			    <sec:csrfInput/>
			</form>
        </div>
<!--         <div class="col-md-2 bottons_box"> -->
<!-- <!-- 			<button class="mem_edit" name="" value="">편집</button> -->
<!--         	<form id="deleteForm" class="delRegiForm" > -->
<!-- 	        	<button type="button" class="feed_state" style="width: 180px;">처리하기</button> -->
<!-- 	        	<input type="hidden" name="selectFeedState" id="selectFeedState"/> -->
<!--         	</form> -->
<!--         </div> -->
      </div>
    </div>
  </div>
  
    <div class="widget">
      <table class="prj-tbl striped table-responsive">
        <thead class="color">
           <tr class="feedTitle">
<!--              <th width="10%"><i class="all-slct"></i></th> -->
             <th width="10%"><em>번호</em></th>
             <th width="10%"><em>피드구분</em></th>
             <th width="15%"><em>피드내용</em></th>
             <th width="15%"><em>신고 내용</em></th>
             <th width="12.5%"><em>신고한 아이디</em></th>
             <th width="15%"><em>신고사유</em></th>
             <th width="12.5%"><em>신고일</em></th>
             <th width="10%"><em>처리여부</em></th>
           </tr>
        </thead>
        <tbody>
        <c:set value="${pagingVO.dataList}" var="boardList"/>
        <c:choose>
        	<c:when test="${empty boardList}">
        		<tr>
        			<td colspan="8">회원 리스트가 존재하지 않습니다.</td>
        		</tr>
        	</c:when>
        	<c:otherwise>
        		<c:forEach items="${boardList}" var="board">
			    	<input type="hidden" class="selectFeed" value="${board.feedNo }"/>
        			<tr id="reportReal" class="feedList reportList" data-reportNo="${board.reportNo}" data-reportGubun="${board.reportGubun}">
<%-- 			            <td id="feedNo"><input type="checkbox" class="selectFeed" value="${board.feedNo }"/></td> --%>
			            <td id="reportNo"><span>${board.reportNo}</span></td>
			            <td><span>${board.reportGubun == 0 ? '게시글' : board.reportGubun == 1 ? '유저' : '알 수 없음'}</span></td>
			            <td class="reportfeedContent" data-content="${board.feedContent}"><span class="reportContent"></span></td>
			            <td><span>${board.reportReason}</span></td>
			            <td><span>${board.userId}</span></td>
			            <td style="font-size: 13px;">
				            <c:choose>
		                        <c:when test="${board.reportType eq '1'}">
		                           	 부적절한 닉네임
		                        </c:when>
		                        <c:when test="${board.reportType eq '2'}">
		                            	선정/폭력성
		                        </c:when>
		                        <c:when test="${board.reportType eq '3'}">
		                           	 스팸/광고/도배글
		                        </c:when>
		                        <c:otherwise>
		                            	기타
		                        </c:otherwise>
		                    </c:choose>
			            </td>
			            <td><span><fmt:formatDate value="${board.reportDate}" pattern="yyyy-MM-dd"/></span></td>
			            <td>
<!-- 			            	<span id="feed_state"> -->
								<input type="button" class="feed_state_button" id="feed_state_button" value="처리하기"/>
<!-- 			            	</span> -->
			            </td>
			          </tr>
        		</c:forEach>
        	</c:otherwise>
        </c:choose>
        </tbody> 
      </table>
    </div>
    
    <div class="card-footer feed-footer clearfix" id="pagingArea">
		${pagingVO.pagingHTML}
	</div>

	<!--   modal 시작 -->
	<div id="myModal" class="modal_box">
	    <div class="modal_content modalReportArea">
	        <span class="modal_close_btn">&times;</span>
	        <h2 class="report_modalTitle">처리하기</h2>
	        <form id="modalForm" method="post">
	            <table id="reportTable">
	                <tr>
	                    <td width="20%" class="modalReportTitle">게시물내용</td>
	                    <td id="modal_feedContent" class="modalReportContent"></td>
	                </tr>
	                <tr>
	                    <td width="20%" class="modalReportTitle">신고사유</td>
	                    <td id="modal_reportType" class="modalReportContent"></td>
	                </tr>
	                <tr>
	                    <td width="20%" class="modalReportTitle">신고내용</td>
	                    <td id="modal_reportReason" class="modalReportContent"></td>
	                </tr>
	                <tr>
	                    <td width="20%" class="modalReportTitle">신고일</td>
	                    <td id="modal_reportDate" class="modalReportContent"></td>
	                </tr>
	                <tr>
	                    <td width="20%" class="modalReportTitle">처리</td>
	                    <td class="modalReportContent modalReportCheck">
<!-- 	                        <select name="reportChecked" id="reportChecked"> -->
<!-- 	                            <option>선택</option> -->
<!-- 	                            <option value="singo" id="userReport">유저정지</option> -->
<!-- 	                            <option value="sakje" id="feedRemove">게시글 삭제</option> -->
<!-- 	                        </select> -->
							
							<input type="checkbox" name="reportChecked" value="userReport" id="userReport">
    						<label for="userReport">유저정지</label>
    						<input type="checkbox" name="reportChecked" value="feedRemove" id="feedRemove">
    						<label for="feedRemove">게시글 삭제</label>
	                    </td>
	                </tr>
	            </table>
	            <div class="modalReportBtn">
		            <input type="button" id="confirmButton" class="confirmButton btn-st" value="확인">
	            </div>
	            <sec:csrfInput/>
	        </form>
	    </div>
	</div>
<!--   modal 끝 -->
  </div>
</div>
<script type="text/javascript">
//모든 .reportfeedContent 요소 선택
var tdElements = document.querySelectorAll(".reportfeedContent");

tdElements.forEach(function(tdElement) {
    var content = tdElement.getAttribute("data-content");

    var spanElement = tdElement.querySelector(".reportContent");

    if (content && content.length > 10) {
        spanElement.innerText = content.substr(0, 10) + "...";
    } else {
        spanElement.innerText = content;
    }
});

$(function(){
    var searchForm = $("#searchForm");
    var pagingArea = $("#pagingArea");
    var feedStateButton = $(".feed_state_button");
    var confirmButton = $("#confirmButton");

    pagingArea.on("click", "a", function(event){
    	event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
        
//         alert("페이징클릭!!");
    });
  	
    
 	// 모달 가져오기
    var modal = document.getElementById("myModal");

    // 닫기 버튼 가져오기
    var closeBtn = document.getElementsByClassName("modal_close_btn")[0];

    // 닫기 버튼에 이벤트 리스너 추가
    closeBtn.addEventListener("click", closeModal);

    // 모달 표시 함수
    function showModal() {
        modal.style.display = "block";
    }

    // 모달 숨기는 함수
    function closeModal() {
	    modal.style.display = "none";
	}
    
    function resetCheckbox() {
        $("#userReport").prop("checked", false); // 유저정지 체크박스 초기화
        $("#feedRemove").prop("checked", false); // 게시글 삭제 체크박스 초기화
    }

 	// "처리하기" 버튼 클릭 이벤트 처리
    $(document).on("click", ".feed_state_button", function() {
    	$(this).addClass("active");
    	    showModal();
    	
    	console.log("클릭");
    	
    	resetCheckbox();
    	
    	
    	var feedNo = $(this).closest('tr').find('td:nth-child(1)').text();
        var reportGubun = $(this).closest('tr').find('td:nth-child(2)').text();
        var feedContent = $(this).closest('tr').find('.reportfeedContent').data('content');
        var reportReason = $(this).closest('tr').find('td:nth-child(4)').text();
        var userId = $(this).closest('tr').find('td:nth-child(5)').text();
        var reportType = $(this).closest('tr').find('td:nth-child(6)').text();
        var reportDate = $(this).closest('tr').find('td:nth-child(7)').text();
        
        console.log("reportNoreportNo: ", feedNo);
        console.log("reportGubun: ", reportGubun);
        console.log("feedContent: ", feedContent);
        console.log("reportReason: ", reportReason);
        console.log("userId: ", userId);
        console.log("reportType: ", reportType);
        console.log("reportDate: ", reportDate);
        
        // 선택된 게시물의 정보를 객체로 생성
        var data = {
            feedNo : feedNo,
            reportGubun : reportGubun,
            feedContent: feedContent,
            reportReason: reportReason,
            userId : userId,
            reportType: reportType,
            reportDate: reportDate
        };
        
        console.log("datadata : ", data);
        
        // 모달에 선택된 값들을 표시
        displayModal(data);
        
    });

    // 모달에 선택된 값들을 표시하는 함수
    function displayModal(data) {
        // 모달에 선택된 값들을 채우기
        $("#modal_feedContent").text(data.feedContent);
        $("#modal_reportType").text(data.reportType);
        $("#modal_reportReason").text(data.reportReason);
        $("#modal_reportDate").text(data.reportDate);

        // 모달 표시
        showModal();
    }
    
    // 모달 체크박스
    $(".reportList").hide();

    // 페이지가 로드될 때 게시판 리스트만 보이도록 설정
    $(".reportList[data-reportGubun='0']").show(); 
    $("#userReport, label[for='userReport']").hide();
    $("#feedRemove, label[for='feedRemove']").show();

    $(".list-bar").on("click", ".filter-btn", function() {
        var reportGubun = $(this).attr("data-reportGubun");

        // 모든 리스트 숨기기
        $(".reportList").hide();

        if (reportGubun === "0") {
            $(".reportList[data-reportGubun='0']").show();
            $("#userReport, label[for='userReport']").hide();
            $("#feedRemove, label[for='feedRemove']").show();
        } else if (reportGubun === "1") {
            $(".reportList[data-reportGubun='1']").show();
            $("#feedRemove, label[for='feedRemove']").hide();
            $("#userReport, label[for='userReport']").show();
        }
    });

    // 모달 확인 버튼 클릭 이벤트 처리
    confirmButton.on("click", function() {
    	 var clickedButton = $(".feed_state_button.active");
        var feedNo =$(".selectFeed").val();
        var userReport = $("#userReport").is(":checked");
        var feedRemove = $("#feedRemove").is(":checked");
        
        var data = {
            feedNo : feedNo,
            reportChecked: userReport || feedRemove
        };
        
        console.log("clickedButton",clickedButton);
        console.log("체킁:",data);
        console.log("userReport",userReport);
        console.log("feedRemove",feedRemove);
         
        
        $.ajax ({
            type : "post",
            url : "/community/memManage/admin/feedReportList.do",
            data : JSON.stringify(data),
            contentType : "application/json; charset=utf-8",
            beforeSend: function(xhr){
            	xhr.setRequestHeader(header, token);
            },
            success : function(res) {
                console.log("성공",res);
                clickedButton.val("처리 완료");
                
            },
            error: function(xhr, status, error) {
                // 요청 실패 시 에러 처리
                console.error("게시물 상태 업데이트 실패:", error);
            }
        });
        
        closeModal();
    });
    
    $(document).on("click", ".feed_state_button", function() {
        $(this).addClass("active");
        showModal();
    });


});


</script>
</body>
</html>