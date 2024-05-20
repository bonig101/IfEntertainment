<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<meta id="_csrf" name="_csrf" content=${_csrf.token }>
<meta id="_csrf_header" name="_csrf_header" content=${_csrf.headerName }>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css">
<head>
    <meta charset="UTF-8">
     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Load jQuery UI -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Check Modal</title>
    <!-- Bootstrap CSS -->
</head>
<body>

<!-- 비밀번호 확인 모달 -->
<div class="modal" id="passwordModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h5 class="modal-title">비밀번호 확인</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 모달 바디 -->
            <div class="modal-body">
                <!-- 비밀번호 확인 폼 -->
                <form id="pwCheckForm">
                <input type="hidden" id="userNo" name="userNo" data-userno="${loginUser }">
                    <div class="form-group">
                        <label for="pwCheck">비밀번호:</label>
                        <input type="password" class="form-control" name= "userPw" id="userPw" placeholder="비밀번호를 입력하세요">
                    </div>
                   <sec:csrfInput/>
                </form>
            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="pwButton">확인</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
var header = "";
var token = ""; 
header = $("meta[name='_csrf_header']").attr("content");
token = $("meta[name='_csrf']").attr("content");
	

		var pwCheckForm=$("#pwCheckForm");
		var pwButton =$("#pwButton");
		pwButton.on("click",function(){
		var userNo = document.querySelector('#userNo').getAttribute('data-userno');
		var userPw =$("#userPw").val();
		console.log("userNo",userNo);
		console.log("userPw",userPw);
		$.ajax({
			type : 'post',
			url : '/community/pwMyCheck.do',
			beforeSend: function(xhr){	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/json",
	        data: JSON.stringify({ userNo : userNo , userPw: userPw }),
	        success: function(response) {
	            alert('비밀번호 일치.');
	            window.location.href = '/community/mypage/list.do';
	            
	        },
	        error: function(xhr, status, error) {
                if(xhr.status === 404) {
                    alert('비밀번호 불일치');
                } else {
                    console.error(error);
                    alert('서버 오류가 발생하였습니다.');
                }
            }
	    });
	});
		
		
});
	
	
</script>