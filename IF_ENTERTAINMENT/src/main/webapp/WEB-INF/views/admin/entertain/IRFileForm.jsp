<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
.fileNm{
    position: relative;
	bottom: 7px;
    right: 475px;
    width: auto;
    display: inline-block;
}

.add-prod-from label {
    width: 500px;
}

</style>
<c:set value="등록" var="name"/>
<c:if test="${status eq 'u' }">
	<c:set value="수정" var="name"/>
</c:if>
<div class="gap no-gap">
    <div class="inner-bg">
        <div class="element-title">
            <h2>IR 자료 ${name }</h2>
        </div>
        <div class="add-prod-from">
            <form action="/entertain/irFile/insert.do" method="post" id="irForm" enctype="multipart/form-data">
            	<c:if test="${status eq 'u' }">
            		<input type="hidden" name="bfNo" value="${irFileVO.bfNo }" />
            		<input type="hidden" name="updateFileNos" id="updateFileNos" />
            	</c:if>
                <div class="row row-addproduct">
                    <div class="col-md-8">
                        <div class="addproduct-title">
                            <span>제목</span>
                        </div>
                        <input type="text" id="bfTitle" name="bfTitle" value="${irFileVO.bfTitle }">
<%--                         <font color="red">${errors.bfTitle }</font> --%>
                    </div>

                    <div class="col-md-8">
                        <div class="addproduct-title">
                            <span>IR PPT</span>
                        </div>
                        <div>
	                        <label class="fileContainer"> 
	                        	<span><i class="fa-solid fa-plus"></i></span>
	                            <input data-idx0="${irFileVO.attachFileList[0].baNo }" type="file" id="irPPT" name="irPPT" />
	                        </label>
                            <span id="irPPTName" class="fileNm">${irFileVO.attachFileList[0].baName }</span>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="addproduct-title">
                            <span>IR FACT Sheet</span>
                        </div>
                        <div>
	                        <label class="fileContainer"> 
	                        	<span><i class="fa-solid fa-plus"></i></span>
	                            <input data-idx1="${irFileVO.attachFileList[1].baNo }" type="file" id="irPDF" name="irPDF" />
	                        </label>
	                        <span id="irPDFName" class="fileNm">${irFileVO.attachFileList[1].baName }</span>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="buttonz">
                            <button type="button" id="addBtn">${name }</button>
                            <c:if test="${status ne 'u' }">
	                            <button type="button" id="listBtn">목록</button>
                            </c:if>
                            <c:if test="${status eq 'u' }">
                            	<button type="button" id="deletelBtn">삭제</button>
                            	<button type="button" id="cancelBtn">취소</button>
                            </c:if>
                        </div>
                    </div>
                </div>
             <sec:csrfInput/>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function () {
	
	var irForm = $("#irForm");
	var listBtn = $("#listBtn");
	var addBtn = $("#addBtn");
	var deletelBtn = $("#deletelBtn");
	var cancelBtn = $("#cancelBtn");
	
	var irPPT = $("#irPPT");
	var irPDF = $("#irPDF");
	var irPPTName = $("#irPPTName");
	var irPDFName = $("#irPDFName");
	
	var updateFileNos = []; // 수정할 파일 번호를 담을 배열 선언
	
	// 파일을 업로드 시 파일명을 가져와 업로드한 파일을 확인 할 수 있도록 한다.
	irPPT.on("change", function(event){
		var pptFileName = $(this)[0].files[0].name;
		irPPTName.text(pptFileName);
		if(addBtn.text() == '수정'){
			updateFileNos.push($(this).data("idx0"));
		}
	});
	
	irPDF.on("change", function(event){
		var pdfFileName = $(this)[0].files[0].name;
		irPDFName.text(pdfFileName);
		if(addBtn.text() == '수정'){
			updateFileNos.push($(this).data("idx1"));
		}
	});
	
	// 등록버튼을 눌렀을 때 브라우저상에서 간단한 유효성검사를 한다. 
	addBtn.on("click", function () {
		var bfTitle = $("#bfTitle").val();
		var irPPT = $("#irPPT")[0].files[0];
		var irPDF = $("#irPDF")[0].files[0];
		
		if(bfTitle == null || bfTitle == ""){
			Swal.fire(
					  '제목이 입력되지 않았습니다.',
					  '',
					  'warning'
			)
			$("#bfTitle").focus();
			return false;
		}

		if($(this).text() != "수정"){
			
			if (irPPT == null) {
			    alert('PPT 파일을 선택해주세요.');
			    return false;
			}
			
			if (irPDF == null) {
			    alert('PDF 파일을 선택해주세요.');
			    return false;
			}
			
		}
		
		if($(this).text() == "수정"){
			$("#updateFileNos").val(updateFileNos);
			irForm.attr("action", "/entertain/irFile/updateIRFile.do");
		}
		
		irForm.submit();
		
	});
	
	// 리스트 이동 이벤트
	listBtn.on("click", function () {
		swal(
				"등록을 취소 하시겠습니까?", 
				"작성중인 내용은 저장되지 않습니다.", 
				'등록 취소',
				'계속 작성',
				"/entertain/irFile/admin/IRFileList.do"
		);
	});
	
	// 취소버튼 이벤트
	cancelBtn.on("click", function () {
		swal(
				"수정을 취소 하시겠습니까?", 
				"기록중인 내용은 저장되지 않습니다.", 
				'수정 취소',
				'계속 작성',
				"/entertain/irFile/admin/IRFileList.do"
		);
	});
	
	// 삭제 버튼 이벤트
	deletelBtn.on("click", function () {
		swal(
				"게시글을 삭제 하시겠습니까?", 
				"", 
				'삭제',
				'취소',
				"/entertain/irFile/delete.do?bfNo=${bfNo}"
		);
	});
});

function swal(title, text, confirmMsg, cancelMsg, requestUrl){
    // 경고창 띄우기
    Swal.fire({
        title: title, 
        text: text, 
        icon: 'warning', 
        showCancelButton: true, // 취소 버튼 보이도록 설정
        confirmButtonColor: '#d33', // 삭제 버튼 색상 설정
        cancelButtonColor: '#3085d6', // 취소 버튼 색상 설정
        confirmButtonText: confirmMsg, // 삭제 버튼 텍스트 설정
        cancelButtonText: cancelMsg // 취소 버튼 텍스트 설정
    }).then((result) => {
        setTimeout(() => {
            Swal.close(); // 일정 시간 후 SweetAlert2 경고창 닫기
        }, 20000); // 2000ms(2초) 후에 경고창 닫기
        if (result.isConfirmed) { 
        	// 삭제 버튼을 눌렀을 때
        	location.href = requestUrl;
        } 
    });
}

</script>