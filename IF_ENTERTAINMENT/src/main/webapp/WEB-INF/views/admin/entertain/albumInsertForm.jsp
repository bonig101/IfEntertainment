<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



<style>
#trackContainer {
    display: flex; /* Flexbox를 사용하여 아이템들을 가로로 나열 */
    align-items: center; /* 아이템들을 세로 중앙에 위치시킴 */
    flex-wrap: wrap; /* 필요시 아이템들을 다음 줄로 넘김 */
}

#trackContainer input {
    margin-right: 10px; /* 인풋 창 사이의 간격 */
    width: 200px; /* 인풋 창의 너비 */
}

</style>

<div class="gap no-gap">
    <c:set value="등록" var="name"/>
    <c:if test="${status eq 'u' }">
        <c:set value="수정" var="name"/>
    </c:if>
    <div class="inner-bg">
        <div class="element-title">
            <h2>앨범등록 - ${agId }</h2>
        </div>
        <div class="add-prod-from">
            <form method="get" action="/entertain/artist/profile/insert.do" id="artistForm" enctype="multipart/form-data">
                <c:if test="${status eq 'u' }">
                    <input type="hidden" name="goodsNo" value="">
                </c:if>
                <div class="row row-addproduct">
                    <!-- 왼쪽 섹션 시작 -->
                    <div class="col-md-4">
                        <div class="addproduct-title">
                            <span>앨범명</span>
                        </div>
                        <input type="text" id="alName" name="alName" value="">
                        <input type="hidden" id="agId" name="agId" value="${agId }">
                        
                        <div class="addproduct-title">
                            <span>유튜브 URL</span>
                        </div>
                        <input type="text" id="alUrl" name="alUrl" value="">
                <div class="addproduct-title">
						    <span>발매일</span>
						</div>
						<div class="alDate">
						    <fmt:parseDate value="${artist.agDate}" pattern="yyyy-MM-dd" var="parsedDate" />
						    <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" var="formattedDate"/>
						</div>
						<input type="text" id="alDate" name="alDate" placeholder="${formattedDate}" value="${formattedDate}" pattern="\d{4}-\d{2}-\d{2}">


                        
                        <div class="addproduct-title">
                            <span>앨범소개</span>
                        </div>
                        <textarea class="form-control" id="alIntro" name="alIntro">${artist.agIntro }</textarea>
                        <div class="addproduct-title">
                            <span>앨범 사진</span>
                        </div>
                        <label class="fileContainer"> <span>찾아보기</span>
                            <input type="file" id="alTempPhoto" name="alTempPhoto" />
                        </label>
                      <div class="prodthumimg-box">
					    <c:choose>
					        <c:when test="${fn:contains(artist.agProfile, 'http')}">
					            <img id="thumimg" src="${artist.agProfile}" alt="" class="profile-img">
					        </c:when>
					        <c:otherwise>
					            <img id="thumimg" src="${pageContext.request.contextPath}/resources/upload/group/${artist.agProfile}" alt="" class="profile-img">
					        </c:otherwise>
					    </c:choose>
					</div>
					                        
                        
                        <div class="proddetailimg-box">
                            <img id="detailimg" alt="" src="">
                        </div>
                    </div>
                    <!-- 왼쪽 섹션 끝 -->
                    
                    <!-- 오른쪽 섹션 시작  -->
                    <div class="col-md-4">
								<div id="trackNameContainer" class="addproduct-title">
								<span>수록곡 입력</span>
								    <input type="text" id="name" name="trackName[]" class="form-control mb-2" value="" placeholder="대표곡명을 입력하세요" style="marginTop : 20px;">
								</div>
							<button type="button" id="addMemberBtn">트랙 추가하기</button>
							<div id="inputsContainer"></div>
           		     </div>
                    <!-- 오른쪽 섹션 끝 -->
                
                
                <!-- 버튼 섹션 시작 -->
                <div class="buttonz">
                    <button type="button" id="addBtn" value="${name}">등록하기</button>
                     <button type="button" id="listBtn">목록</button>
                </div>
                <!-- 버튼 섹션 끝 -->
                <sec:csrfInput/>
            </form>
        </div>
    </div>
</div>

<script>
document.getElementById('addMemberBtn').addEventListener('click', function() {
    var newInputDiv = document.createElement('div');
    newInputDiv.className = "input-group mb-2";

    var newInput = document.createElement('input');
    newInput.setAttribute('type', 'text');
    newInput.setAttribute('name', 'trackName[]');
    newInput.setAttribute('placeholder', '곡명을 입력하세요');
    newInput.className = "form-control";

    var closeBtn = document.createElement('div');
    closeBtn.className = "input-group-append";
    var closeButtonHtml = document.createElement('button');
    closeButtonHtml.className = "btn btn-outline-secondary";
    closeButtonHtml.type = "button";
    closeButtonHtml.innerHTML = "&times;"; 
    closeButtonHtml.style.fontSize = "20px"; 
    closeButtonHtml.style.color = "red"; 
    closeButtonHtml.onclick = function() {
        newInputDiv.remove();
    };

    closeBtn.appendChild(closeButtonHtml);
    newInputDiv.appendChild(newInput);
    newInputDiv.appendChild(closeBtn);

    var inputsContainer = document.getElementById('inputsContainer');
    inputsContainer.appendChild(newInputDiv);
});
</script>

<script>
$('#addBtn').click(function(e) {
    e.preventDefault();

    var agId = $('#agId').val(); // agId의 값을 가져옵니다. val() 함수를 사용하여 실제 값을 추출합니다.

    var formData = new FormData($('#artistForm')[0]); // 폼의 ID를 사용하여 FormData 객체를 생성

    for (var pair of formData.entries()) {
        console.log(pair[0] + ', ' + pair[1]);
    }
    
    $.ajax({
        url: '/entertain/artist/album/insert.do', // 서버 측 URL
        type: 'POST',
        data: formData,
        contentType: false, // 필수: contentType을 false로 설정하여 jQuery가 contentType을 설정하지 않도록 함
        processData: false, // 필수: processData를 false로 설정하여 jQuery가 데이터를 처리하지 않도록 함
        beforeSend: function(xhr){
        	xhr.setRequestHeader(header, token);
        },
        success: function(response) {
            Swal.fire(
                '등록 성공',
                '등록에 성공하였습니다.',
                'success'
            ).then((result) => {
                if (result.value) {
                    window.location.href = "/entertain/artist/profile/artistDetail.do?agId=" + agId + "#2";  
                }
            });
        }, // success 함수의 닫는 중괄호
        error: function(xhr, status, error) {
            // 오류 발생 시 실행할 코드
            console.error("에러 발생:", error);
        } // error 함수의 닫는 중괄호
    }); // ajax 호출의 닫는 중괄호
}); // click 이벤트 핸들러의 닫는 중괄호

</script>

<script>
    flatpickr("#alDate", {
        altInput: true,
        altFormat: "Y-m-d",
        dateFormat: "Y-m-d",
    });
</script>

<script>
document.getElementById('alTempPhoto').addEventListener('change', function(e) {
    // 파일이 선택되었는지 확인
    if (e.target.files && e.target.files[0]) {
        var reader = new FileReader();
        
        reader.onload = function(e) {
            // 읽은 파일의 내용(URL)을 이미지의 src 속성으로 설정
            document.getElementById('thumimg').src = e.target.result;
        };
        
        reader.readAsDataURL(e.target.files[0]);
    }
});
</script>
