<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/sweetAlertCustom/sweetAlertCustom.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/nice-select.css">

<div class="gap no-gap">
	<c:set value="등록" var="name"/>
	<c:if test="${status eq 'u' }">
		<c:set value="수정" var="name"/>
	</c:if>
    <div class="inner-bg">
        <div class="element-title">
            <h2>굿즈샵 공지사항 ${name }</h2>
        </div>
        <div class="add-prod-from">
            <form method="post" action="/goods/notice/insert.do" id="goodsNoticeForm" enctype="multipart/form-data">
                <c:if test="${status eq 'u' }">
                	<input type="hidden" name="bfNo" value="${goodsNotice.bfNo }">
                </c:if>
                <div class="row row-addproduct">
                
                    <div class="col-md-8">
                        <div class="addproduct-title">
                            <span>제목</span>
                        </div>
                        <input type="text" id="bfTitle" name="bfTitle" value="${goodsNotice.bfTitle }">
                    </div>
                    
                     <div class="col-md-8">
                        <div class="addproduct-title">
                            <span>내용</span>
                        </div>
                        <textarea id="bfContent" name="bfContent" style="height:700px">${goodsNotice.bfContent }</textarea>
                    </div>
                             
                    <div class="col-md-8">
                        <div class="tag-box">
                            <div class="tag-checkbox" style="margin-top: 20px">
                                <span>배너 공개 여부</span>
                                <c:if test="${status eq 'u' }">
	                                <input type="checkbox" id="bfDisplay" name="bfDisplay" value="Y" <c:if test="${goodsNotice.bfDisplay eq 'Y'}">checked</c:if>/>
                                </c:if>
                                <c:if test="${status ne 'u' }">
                                	<input type="checkbox" id="bfDisplay" name="bfDisplay" value="Y" />
                                </c:if>

                            </div>
                        </div>
                    </div>

					<!-- 공지사항 메인 이미지 -->
                    <div class="col-md-8">
                        <div class="addproduct-title">
                            <span>공지사항 메인 이미지</span>
                        </div>
                        <label class="fileContainer"> <span>찾아보기</span>
                            <input type="file" id="goodsNoticeThumb" name="goodsNoticeThumb" />
                        </label>
                        <div class="prodthumimg-box">
               				<img id=thumimg src="${goodsNotice.baSavepath }" alt="" >
               			</div>
                    </div> 

                    <div class="col-md-8">
                        <div class="buttonz addpro_buttonz">
                            <button type="button" id="addBtn" value="${name }">${name }</button>
                            <c:if test="${status ne 'u' }">
                           		<button type="button" id="listBtn">목록</button>
                            </c:if>
                            <c:if test="${status eq 'u' }">
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

<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function () {
		CKEDITOR.replace("bfContent", {
			filebrowserUploadUrl : '/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'
		});
		
		var file = null;
		
		var addBtn = $("#addBtn");
		var goodsNoticeThumb = $("#goodsNoticeThumb");
		var goodsNoticeForm = $("#goodsNoticeForm");
		var cancelBtn = $("#cancelBtn");
		var listBtn = $("#listBtn");
		
		listBtn.on("click", function () {
			location.href = "/goods/notice/list.do";
		});
		
		cancelBtn.on("click", function () {
			location.href = "/goods/notice/list.do";	
		});
		
		if (addBtn.val() == "등록") {
			$(".prodthumimg-box").css("display", "none");
			goodsNoticeThumb.on("change", function (event) {
				$(".prodthumimg-box").css("display", "block");
			});
		}

		goodsNoticeThumb.on("change", function (event) {
			file = event.target.files[0];
			
			if(isimgFile(file)){
				var reader = new FileReader();
				reader.onload = function (e) {
					$("#thumimg").attr("src", e.target.result);
				}
				reader.readAsDataURL(file);
			}else {
				Swal.fire(
				  '이미지 파일만 등록 가능합니다.',
				  '',
				  'warning'
				)
			}
		});
		
		addBtn.on("click", function () {
			
			var bfTitle = $("#bfTitle").val();						//제목
			var bfContent = CKEDITOR.instances.bfContent.getData();	//내용
			var goodsNoticeThumb = $("#goodsNoticeThumb").val();	//대표 이미지
			

			if (bfTitle == null || bfTitle == "") {
				Swal.fire(
				  '제목을 입력해주세요.',
				  '',
				  'warning'
				)
				$("#bfTitle").focus();
				return false;
			}
			
			if (bfContent == null || bfContent == "") {
				Swal.fire(
				  '내용을 입력해주세요.',
				  '',
				  'warning'
				)
				$("#bfContent").focus();
				return false;
			}
			
			var thumbnailFilePath = $("#thumimg").attr("src");
			if (!thumbnailFilePath || thumbnailFilePath === "") {
				Swal.fire(
				  '공지사항 대표이미지를 등록해주세요.',
				  '',
				  'warning'
				)
			    return false;
			}
			
			if ($(this).val() == "수정") {
				goodsNoticeForm.attr("action", "/goods/notice/update.do");
			}
			goodsNoticeForm.submit();
		});
		
		function isimgFile(file) {
			var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.
			return ($.inArray(ext,["jpg","jpeg","png", "gif"]) === -1) ? false : true;
		}
		
	});
</script>
