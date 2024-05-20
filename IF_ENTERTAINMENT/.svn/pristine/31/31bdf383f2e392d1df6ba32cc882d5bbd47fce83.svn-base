<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="excelUp.do" method="post" id="uploadForm" enctype="multipart/form-data">
		<div id="excelTable"></div>
		<input type="file" name="upFile" id="upFile" accept=".xls, .xlsx" value="재무재표 업로드 하기">
		<div id="result"></div>
		<input type="button" id="downBtn" value="재무재표 다운로드 받기">
	</form>
	
</body>
<script type="text/javascript">
$(function(){
	let upFile = $("#upFile")[0];
	var downBtn = $("#downBtn");
	
	// 여기서는 jQuery 객체인 downBtn에 직접 이벤트 리스너를 추가합니다.
	downBtn.on("click", function(){
		location.href = "/entertain/finance/home.do";
	});
	
	upFile.addEventListener("change", function(){
		let form = $("#uploadForm")[0];
		let formData = new FormData(form);
		
		formData.append("upFile", upFile.files[0]);
		
		$.ajax({
			type : "post",
			url : "/entertain/finance/insert.do",
			processData : false,
			contentType : false,
			cache : false,
			data : formData,
			success : function(response){
				console.log(response.dataList);
				if (response.status === "success") {
					Swal.fire({
						icon: "success",
						title: "업로드가 완료되었습니다.",
						showConfirmButton: false,
						timer: 1500
					});
				} else {
					alert("파일 업로드 실패");
				}		
			},
			error: function (xhr, status, error) {
		        console.error(xhr.responseText);
		        alert("파일 업로드 실패");
		    }
		});
	});
});

</script>
</html>