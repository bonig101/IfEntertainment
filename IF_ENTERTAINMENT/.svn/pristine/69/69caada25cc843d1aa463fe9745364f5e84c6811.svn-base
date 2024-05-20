<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>

.qTitle {
    margin-top: 10px;
    margin-bottom: 30px;
}

/* 라디오 버튼 및 체크박스 숨기기 */
input[type="radio"],
input[type="checkbox"] {
    display: none;
}

/* 사용자 정의 라디오 버튼 및 체크박스 디자인 */
input[type="radio"] + label,
input[type="checkbox"] + label {
    display: inline-block;
    width: 20px;
    height: 20px;
    border: 2px solid #707070;
    border-radius: 30%;
    position: relative;
    text-align: center;
    line-height: 30px;
}

/* 라디오 버튼 및 체크박스가 선택됐을 때의 스타일 */
input[type="radio"]:checked + label::after,
input[type="checkbox"]:checked + label::after {
    content: '\2713'; /* ✔ */
    font-size: 15px; /* 선택된 상태에서의 크기 */
    line-height: 20px; /* 선택된 상태에서의 높이 */
    text-align: center;
    color: #707070; /* 선택된 상태에서의 색상 */
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}

.options {
	display: flex;
}

.op_label {
	margin-right: 10px;
}
.dupl {
	margin-left: 20px;
	color: gray;
	font-size: 14px;
}
.fa.fa-gear:before {
    position: relative;
    left: 1470px;
    top: 40px;
    content: "\f013";
    cursor: pointer;
    font-size: 30px;
}
.fa-gear {
    color: #707070; /* 아이콘의 초기 색상을 설정합니다. */
    transition: color 0.3s ease; /* 호버 효과를 부드럽게 만듭니다. */
}

.fa-gear:hover {
    color: #a876e8; /* 호버 상태에서 아이콘의 색상을 변경합니다. */
}
.basicInfo {
	display: flex;
}


/* 셀렉트 박스 스타일 */
select {
    margin-top: -7px;
    margin-bottom: 20px;
    font-family: inherit;
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    background-color: #f4f8ff;
    border: 1px solid #eaeaea;
    padding: 8px 12px;
    border-radius: 5px;
    width: 214px;
    font-size: 13px;
    color: #333333;
    cursor: pointer;
    outline: none;
    height: 37px;
    position: relative;
}

/* 셀렉트 박스 드롭다운 스타일 */
select option {
	font-family: inherit;
    background-color: #f4f8ff;
    color: #333333;
}

#upload-span{
	display: block;	
}

/* 데이트피커 */
.datepicker {
    font-family: inherit;
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    background-color: #f4f8ff;
    border: 1px solid #eaeaea;
    padding: 12px;
    border-radius: 5px;
    width: calc(50% - 6px); 
    font-size: 14px;
    color: #333333;
    cursor: pointer;
    outline: none;
    height: 50px;
    position: relative;
}

#rows div, #surveyQuestion div {
	margin-bottom: 20px;
}

.dateForm {
	display: flex;
	flex-direction: column;
}

#surveyFormTitle {
	margin-bottom: 55px;
}
#surveyFormDisplay{
	margin-top: 50px;
}

.lis:first-child {
	padding-top: 20px;
    border-top: 1px solid #dfdfdf;
}

#sfTitle{
	width: 1135px;
}

#rows {
	padding: 35px;
}
#thumimg {
	width: 500px;
}
#op_label {
	left: 15px;
    bottom: -18px;
}

#modiFormBtn, #delFormBtn {
    background-color: #A874DD;
    left: 1350px;
    top: 35px;
    position: relative;
    width: 75px;
    height: 40px;
    border-radius: 30px;
    border: 1px solid lightgray;
    color: white;
/*     display: none; */
}

.modiQuestion{
	position: relative;
    bottom: -30px;
    left: 1340px;
    font-size: 20px;
}

.modiQuestionBtn{
	position: relative;
    bottom: -30px;
    left: 1405px;
    font-size: 20px;
	display: none;
}

.messages {
	position: relative;
	top: 500px;
	left: 1000px;
}

#formBtns {
	display: none;
}


</style>

<div class="col-md-12">
    <div class="widget">
   		<div class="add-prod-from">
   			<i class="fa fa-gear" id="modiForm"></i>
   			<div id="formBtns">
	   			<button id="modiFormBtn" data-sfno="${surveyFormVO.sfNo }">수정</button>
	   			<button id="delFormBtn" data-sfno="${surveyFormVO.sfNo }">삭제</button>
   			</div>
			<form id="surveyForm">
				<div class="row" id="rows">
					<div class="col-md-12" id="surveyFormTitle">
						<div style="padding: 0; margin: 0;">
							<label>제목</label>
						</div>
						<input type="text" id="sfTitle" name="sfTitle" value="${surveyFormVO.sfTitle }" class="formInfo" disabled="disabled">
					</div>
					<div class="col-md-12" style="margin-top: 45px;">
						<span id="upload-span" class="upload-image">썸네일</span> 
						<label class="fileContainer" style="width: 500px;">
							<span id="vertical">upload</span>
							<input type="file" id="sfFile" name="sfFile" class="formInfo" disabled="disabled"/>
						</label>
						<div id="thumimgBox">
<!-- 							<a href="#" target="_blank" id="thumbLink"> -->
								<img id="thumimg" src="${surveyFormVO.sfPhoto }" alt="" >
<!-- 							</a> -->
						</div>
					</div>

					<div class="col-md-6 dateForm">
						<label>시작일</label> 
						<input type="date" class="datepicker startDate" id="sfRegdate" name="sfRegdate" style="width: 500px;" class="formInfo"
						 value="<fmt:formatDate value="${surveyFormVO.sfRegdate }" pattern="yyyy-MM-dd" />" disabled="disabled"/>
						
					</div>

					<div class="col-md-6  dateForm" style="right: 129px;">
						<label>마감일</label> 
						<input type="date" class="datepicker endDate" id="sfEnddate" name="sfEnddate" style="width: 500px;" class="formInfo"
						value="<fmt:formatDate value="${surveyFormVO.sfEnddate }" pattern="yyyy-MM-dd" />" disabled="disabled"/>
					</div>

					<div class="col-md-4" id="surveyFormDisplay" style="margin-bottom: 45px;">
					    <label for="sfDisplay">팝업 등록 여부</label> 
					    
					    <input type="checkbox" class="clickHere" id="sfDisplay" name="sfDisplay" class="formInfo"
					     disabled="disabled" <c:if test="${surveyFormVO.sfDisplay eq 'Y' }">checked</c:if>/>
					    <label for="sfDisplay" class="op_label" id="op_label"></label>
					</div>
				</div>
			<sec:csrfInput/>
			</form>
		</div>
        <div class="widget-peding">
            <ul class="q-comments support">
                <c:forEach items="${surveyFormVO.surveyQuestionList}" var="question" varStatus="vs">
  			        <form class="newQuestionForm" action="/community/survey/modifyQuestion" method="post">
	                    <li class="lis">
	                    	<i class="fa fa-check modiQuestionBtn" data-qIdx="${vs.index }"></i>
	                    	<i class="fa fa-pencil modiQuestion" data-qIdx="${vs.index }"></i>
	                        <div class="comment-detail">
	                            <h4 class="qTitle">
	                            	<input type="hidden" name="sqNo" value="${question.sqNo }">
	                            	<input type="text" name="sqTitle" value="${question.sqTitle}" style="width: 500px;" disabled="disabled">  
		                            <span class="dupl">
		                            	<c:if test="${question.sqType eq 'checkbox' }">(중복선택 가능)</c:if>
		                            </span>
	                            </h4>
	                            <span>
	                            	<select name="sqType" class="sqTypes" disabled="disabled">
	                            		<option value="">유형을 선택해주세요</option>
	                            		<option value="radio" <c:if test="${question.sqType eq 'radio' }">selected</c:if>>단일선텍형</option>
	                            		<option value="checkbox" <c:if test="${question.sqType eq 'checkbox' }">selected</c:if>>복수선택형</option>
	                            	</select>
	                            </span>
	                            <c:forEach items="${question.optionList}" var="option" varStatus="stat">
	                                <p class="options">
	                                	<input type="hidden" name="sfNo" value="${surveyFormVO.sfNo }"/>
	                                	<input type="hidden" name="optionList[${stat.index }].soNo" value="${option.soNo }"/>
	                                    <input id="option_${option.soNo}" class="clickHere" type="${question.sqType}" name="srAnswer" disabled="disabled"/>
	                                    <label for="option_${option.soNo}" class="op_label"></label>
	                                    <input type="text" class="newOption" name="optionList[${stat.index }].soContent" value="${option.soContent}" disabled="disabled">
	                                </p>
	                            </c:forEach>
	                        </div>
	                    </li>
	                    <sec:csrfInput/>
          			</form>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">
	$(function(){
		
		var formBtns = $("#formBtns");
		formBtns.hide();
		
		var startDate = new Date($("#sfRegdate").val());	// 설문 시작일
		var endDate =  new Date($("#sfEnddate").val());		// 설문마감일
		
		var surveyForm = $("#surveyForm");					// 설문지 폼
		var modiForm = $("#modiForm");						// 폼 수정활성화 버튼
		var modiFormBtn = $("#modiFormBtn");				// 폼 수정버튼 
		var modiQuestion = $(".modiQuestion");				// 질문 수정활성화 버튼
		var modiQuestionBtn = $(".modiQuestionBtn");		// 질문 수정버튼
		var newQuestionForm = $(".newQuestionForm");		// 질문 수정 폼
		
		var delFormBtn = $("#delFormBtn");					// 설문 삭제 버튼
		
		// 썸네일이 변경될 때 저장될 폼데이타를 미리 생성하여 ajax로 수정하기 위한 변수 선언
		var newfile; 			
		
		var sfDisplay = $("#sfDisplay");
		// 팝업등록여부를 체크하면 현재 게시중인 팝업이 있는지를 체크 한 후 
		// 어떤 게시물을 팝업으로 띄울지 선택하라는 알림을 띄운다
		
		console.log("@@@@@@@@@ display : ",sfDisplay.val());
		
		sfDisplay.on("click", function(){
			if(sfDisplay.val() != "on"){ // 체크가 이미 되어있던 상태에서 해제하는 것은 아래 비동기 통신이 일어나지 않는다.
				$.ajax({
					url: "/community/survey/popupcheck",
					type: "get",
					beforeSend: function(xhr){
						xhr.setRequestHeader(header, token);
					},
					success: function(data){
						if(data == 'EXIST'){
							Swal.fire({
						        title: '이미 게시중인 설문이 존재합니다.', 
						        text: "기존 설문의 게시를 중단하시겠습니까?", 
						        icon: 'info', 
						        showCancelButton: true, // 취소 버튼 보이도록 설정
						        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
						        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
						        confirmButtonText: '중단', // 삭제 버튼 텍스트 설정
						        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
						    }).then((result) => {
						        if (result.isConfirmed) { 
						        	$.ajax({
						    			url : "/community/survey/finishSurveyAjax",
						    			type : "get",
						    			beforeSend: function(xhr){
						    				xhr.setRequestHeader(header, token);
						    			},
						    			success: function(data){
						    				console.log(data);
						    				if(data == "SUCCESS"){
						    					Swal.fire({
						    						icon : "success",
						    						title : "기존 설문이 마감되었습니다",
						    						showConfirmButton : false,
						    						timer : 1000
						    					});		
						    				}
						    			}
						    		});
						        } else if (result.dismiss === Swal.DismissReason.cancel) { // 취소 버튼을 눌렀을 때
						            $("#sfDisplay").prop("checked", false);
						        }
						    });
						}
					}
				});
			}
		});
		
		modiForm.on("click", function(){
			formBtns.fadeIn();
			$(this).hide();
			$(".formInfo").removeAttr("disabled");
			$("#sfFile").removeAttr("disabled");
			$("#sfRegdate").removeAttr("disabled");
			$("#sfEnddate").removeAttr("disabled");
			$("#sfDisplay").removeAttr("disabled");
			$("#modiFormBtn").css("display", "inline");
		});
		
		// 폼 수정버튼 클릭 이벤트 핸들러
		modiFormBtn.on("click", function(){
			var sfNo = $(this).data("sfno");
			var sfTitle = $("#sfTitle").val();
			var sfRegdate = $("#sfRegdate").val();
			var sfEnddate = $("#sfEnddate").val();
			var sfDisplay = $("#sfDisplay:checked").val();
			var photoIdx = $("#thumimg").prop("src").indexOf("/resources");
			var sfPhoto = $("#thumimg").prop("src").substring(photoIdx);
			
			if(sfTitle == null || sfTitle == ""){
				Swal.fire({
					icon : "error",
					title : "제목이 입력되지 않았습니다.",
					showConfirmButton : false,
					timer : 1000
				});
				return false;
			}			
			if(sfRegdate == null || sfRegdate == ""){
				Swal.fire({
					icon : "error",
					title : "시작일이 입력되지 않았습니다.",
					showConfirmButton : false,
					timer : 1000
				});
				return false;
			}			
			if(sfEnddate == null || sfEnddate == ""){
				Swal.fire({
					icon : "error",
					title : "종료일이 입력되지 않았습니다.",
					showConfirmButton : false,
					timer : 1000
				});
				return false;
			}
			
			var formDataSurvey = new FormData();
			formDataSurvey.append("sfNo", sfNo);
			formDataSurvey.append("sfTitle", sfTitle);
			if(newfile != null){
				formDataSurvey.append("sfFile", newfile);
			}
			formDataSurvey.append("sfRegdate", sfRegdate);
			formDataSurvey.append("sfEnddate", sfEnddate);
			formDataSurvey.append("sfDisplay", sfDisplay);
			formDataSurvey.append("sfPhoto", sfPhoto);
			
			$.ajax({
				url : "/community/survey/modifySurvey",
				type : "POST",
				beforeSend: function(xhr){
					xhr.setRequestHeader(header, token);
				},
				data : formDataSurvey,
				processData : false,
				contentType : false,
				success : function(data){
					console.log(data);
					if(data != null){
						Swal.fire({
							icon : "success",
							title : "수정이 완료되었습니다.",
							showConfirmButton : false,
							timer : 1500
						});
					}
					// 작업 완료후 input태그들을 다시 비활성화 시킨다.
					$(".formInfo").attr("disabled", "disabled");
					$("#sfFile").attr("disabled", "disabled");
					$("#sfRegdate").attr("disabled", "disabled");
					$("#sfEnddate").attr("disabled", "disabled");
					$("#sfDisplay").attr("disabled", "disabled");
				}
			});
			// 작업 완료 후 다시 수정버튼은 숨기고 설정버튼은 나타낸다.
			formBtns.hide();
			modiForm.fadeIn();
			
		});
		
		$(".modiQuestion").on("click", function(){
		
			// 수정버튼 클릭시 활성화 시켜준다.
			var qIdx = $(this).data("qidx");
			$(".newQuestionForm input, .newQuestionForm select").prop("disabled", true);
			// 모든 질문 수정 버튼을 숨김
	        modiQuestionBtn.hide();
			// 해당 버튼만 활성화
			$(".modiQuestionBtn").eq(qIdx).show();
			$(".newQuestionForm").eq(qIdx).find("input").removeAttr("disabled");
			$(".newQuestionForm").eq(qIdx).find("select").removeAttr("disabled");
		});
		
		// 각각의 질문을 수정할 수 있는 이벤트 핸들러
		modiQuestionBtn.on("click", function(){
		    var qIdx = $(this).data("qidx");
		    var formData = newQuestionForm.eq(qIdx).serialize(); // 질문 폼 데이터를 직렬화하여 가져옵니다.

		    $.ajax({
		        url: "/community/survey/modifyQuestion",
		        type: "POST",
		        beforeSend: function(xhr){
		        	xhr.setRequestHeader(header, token);
		        },
		        data: formData, 
		        success: function(response) {
		            console.log("response : ", response);
		            if(response != null || response != ""){
		            	var text = "";
		            	if(response.surveyQuestionList[qIdx].sqType == "checkbox"){
		            		text = "(중복선택 가능)";
		            	}
		            	$(".dupl").eq(qIdx).text(text);
		            	
			            Swal.fire({
								icon : "success",
								title : "수정이 완료되었습니다.",
								showConfirmButton : false,
								timer : 1500
						});
		            }
		        }
		    });
            // 수정이 완료된 후 다시 비활성화
            $(".newQuestionForm input, .newQuestionForm select").prop("disabled", true);
            $(this).hide();
		});
		
		// 설문지 삭제버튼 클릭 이벤트 핸들러
		delFormBtn.on("click", function(){
			var delIdx = $(this).data("sfno");
			
			Swal.fire({
		        title: '설문지를 삭제하시겠습니까?', 
		        text: "삭제된 설문은 다시 복구할 수 없습니다.", 
		        icon: 'warning', 
		        showCancelButton: true, // 취소 버튼 보이도록 설정
		        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
		        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
		        confirmButtonText: '삭제', // 삭제 버튼 텍스트 설정
		        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
		    }).then((result) => {
		        if (result.isConfirmed) { 
		        	// 삭제 버튼을 눌렀을 때
		   			location.href = "/community/survey/delete.do?sfNo=" + delIdx;
		 			
// 		            Swal.fire( 
// 		                '설문지 삭제 성공!', 
// 		                '', 
// 		                'success' 
// 		            )
		        } 
		    });
			
		});
		
		// 이미지 파일을 업로드 시 썸네일을 화면에 출력한다.
		$("#sfFile").on("change", function(event){
			newfile = event.target.files[0];
			
			// ajax를 활용하여 썸네일을 경로에 저장하여 미리보기를 볼 수 있도록 한다.
			var formData = new FormData();
			formData.append("file", newfile);
			
			$.ajax({
				url : "/community/survey/uploadAjax",
				type : "post",
				beforeSend: function(xhr){
					xhr.setRequestHeader(header, token);
				},
				data : formData,
				dataType : "text", // 비동기 통신의 최종 결과물을 text 형식으로 받겠다고 알리고 전달되는 서버 메소드에서는 produces를 통해 텍스트 인것을 인지하고 받는다
				processData : false, // 이진 데이터로 직렬화가 되어 파일이 제대로 전송되지 않게 되는것을 막는다 (Default값은 true)
				contentType : false,
				success : function(data){
					$("#thumbLink").attr("href", "/community/survey/displayFile?fileName=" + data);
				}
			});
			
			if(isimgFile(newfile)){ // 이미지인지를 체크하여 다른 타입은 파일을 업로드할 수 없도록 한다.
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#thumimg").attr("src", e.target.result);
				}
				reader.readAsDataURL(newfile);
			}else {
				Swal.fire({
					icon : "error",
					title : "이미지 파일만 등록가능합니다.",
					showConfirmButton : false,
					timer : 1500
				});
			}
		});
		
		// 임시 파일로 썸네일 이미지 만들기
		function getThumbnailName(fileName){
			var front = fileName.substr(0, 12); // /2024/03/06/ 폴더 
			var end = fileName.substr(12); // 뒤 파일명
			
			console.log("front : " + front);
			console.log("end : " + end);
			
			return front + "s_" + end;
		}
		
		// 파일의 타입을 리턴해준다.
		function isimgFile(newfile) {
			var ext = newfile.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.
			return ($.inArray(ext,["jpg","jpeg","png", "gif"]) === -1) ? false : true;
		}
		
		// 시작일을 선택했을 때 그 날짜를 저장한다
		$("#sfRegdate").on("change", function() {
			startDate = new Date($(this).val());
			console.log(startDate);
			if (startDate > endDate) {
				Swal.fire({
					icon : "error",
					title : "<div style='font-size:22px'>시작일은 마감일보다 늦을 수 없습니다.</div>",
					showConfirmButton : false,
					timer : 2000
				});
				$(this).val("");
				startDate = null;
				return false;
			} 
		});

		// 종료일을 선택했을 때 그 날짜를 시작일과 비교하여 전이라면 값 변경을 강제한다.
		$("#sfEnddate").on("change", function() {
			endDate = new Date($(this).val());
			console.log(endDate);
			if (startDate > endDate) {
				Swal.fire({
					icon : "error",
					title : "<div style='font-size:22px'>마감일은 시작일보다 빠를 수 없습니다.</div>",
					showConfirmButton : false,
					timer : 2000
				});
				$(this).val("");
				endDate = null;
				return false;
			} 
		});
	});
	// 현재 날짜를 가져온다
	var currentDate = new Date().toISOString().slice(0, 10);

	// 입력 필드에 현재 날짜를 최소 날짜로 설정
	document.getElementById("sfRegdate").setAttribute("min", currentDate);
	document.getElementById("sfEnddate").setAttribute("min", currentDate);
	
	
</script>