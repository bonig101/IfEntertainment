<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<div class="gap no-gap">
    <div class="inner-bg">
        <div class="element-title">
            <h2>등록</h2>
        </div>
        <div class="add-prod-from">
            <form action="/community/feed/upload.do" method="post" id="feedForm" enctype="multipart/form-data">
                <div class="row row-addproduct">
                     <div class="col-md-8">
                        <div class="addproduct-title">
                            <span>내용</span>
                        </div>
                        <input type="text" id="feedContent" name="feedContent">
                    </div>

                    <div class="col-md-8">
                        <div class="addproduct-title">
                            <span></span>
                        </div>
                        <label class="fileContainer"> 
                        	<span><i class="fa-solid fa-plus"></i></span>
                            <input type="file" id="feedFile" name="feedFile" />
                        </label>
                    </div>

                    <div class="col-md-8">
                        <div class="buttonz">
                            <button type="button" id="addBtn">등록하기</button>
                            <button type="button" id="listBtn">목록</button>
                            <button type="button" id="cancelBtn">등록취소</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function () {
	
	var feedForm = $("#feedForm");

	var listBtn = $("#listBtn");
	var addBtn = $("#addBtn");
	var cancelBtn = $("#cancelBtn");
	
	addBtn.on("click", function () {
		var feedFile = $("#feedFile")[0].files[0];
		var feedContent = $("#feedContent").val();
		if(feedContent == null || feedContent == ""){
			Swal.fire(
					  '내용이 입력되지 않았습니다.',
					  '',
					  'warning'
			)
			$("#feedContent").focus();
			return false;
		}

		if (feedFile == null || feedFile == null) {
		    alert('파일을 선택해주세요.');
		    return false;
		}
		
		
		feedForm.submit();
		
	});
	
// 	listBtn.on("click", function () {
	
// 	});
	
// 	cancelBtn.on("click", function () {
		
// 	});
	
 });
</script>