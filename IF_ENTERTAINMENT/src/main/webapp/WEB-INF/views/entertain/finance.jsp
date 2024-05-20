<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
#downBtn {
	border: none;
	background-color: #1fd1f9;;
	background-image: linear-gradient(315deg, #1fd1f9 0%, #b621fe 74%);
	color: #fff;
	padding: 7px 25px;
	border-radius: 5px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	cursor: pointer;
	transition: background-color 0.3s, box-shadow 0.3s;
	margin-bottom: 23px;
}

#downBtn:hover:after {
	position: absolute;
  content: " ";
  z-index: -1;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
   background-color: #1fd1f9;
background-image: linear-gradient(315deg, #1fd1f9 0%, #b621fe 74%);
  transition: all 0.3s ease;
}

#downBtn:hover {
	background: transparent;
	box-shadow: 4px 4px 6px 0 rgba(255, 255, 255, .5), -4px -4px 6px 0
		rgba(116, 125, 136, .2), inset -4px -4px 6px 0 rgba(255, 255, 255, .5),
		inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
	color: #fff;
	background-color: #1fd1f9;;
	background-image: linear-gradient(315deg, #1fd1f9 0%, #b621fe 74%);
}

#downBtn:hover:after {
	-webkit-transform: scale(2) rotate(180deg);
  transform: scale(2) rotate(180deg);
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
}

</style>

</head>
<body>

<h3 style="margin-bottom:20px;">📈 If ent 재무정보</h3>

<form action="excelUp.do" method="post" id="uploadForm" enctype="multipart/form-data" style="text-align: right;">
		<div id="result"></div>
		<input type="button" id="downBtn" value="재무재표 다운로드 받기">
</form>

<div style="text-align: left; display: inline-block; width: 50%;">재무상태표</div>
<div style="text-align: right; display: inline-block; width: 49%;">💵단위 : 억원</div>


   <table class="table table-striped">
        <tr>
            <th>연도</th>
            <c:forEach var="item" items="${list}">
                <th>${item.fiYear}</th>
            </c:forEach>
        </tr>
        <tr>
            <td>자산총계</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiAsset}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>유동자산</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiCasset}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>비유동자산</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiNasset}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>부채총계</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiLiabilities}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>유동부채</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiCliabilities}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>비유동부채</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiNliabilities}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>자본총계</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiTotalcapital}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>지배기업주주지분</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiPcse}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>자본금</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiCapital}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>주식발행초과금</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiSis}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>기타자본</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiOthercapital}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>기타포괄손익누계액</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiAoci}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>이익잉여금</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiRe}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>비지배지분</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiNci}</td>
            </c:forEach>
        </tr>
    </table>
    </div>
    
    
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