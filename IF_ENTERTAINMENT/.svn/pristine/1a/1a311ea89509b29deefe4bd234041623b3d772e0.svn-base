<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/company.css">
<meta charset="UTF-8">
<title>피드 상세</title>
<style>
/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

/* 모달 내용 스타일 */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 500px;
    height: 500px;
}

/* 모달 닫기 버튼 스타일 */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

/* 이미지 미리보기 스타일 */
.preview-image {
    width: 500px;
    height: 400px;
}
</style>
</head>
<body>
    <div class="create-post detail_title_box">
        <div class="detail_title">${feed.feedNo }</div>
        <div class="detail_Nick">${feed.mnNickName }</div>
        <div class="detail_date">
            <fmt:formatDate value="${feed.feedRegdate }" pattern="yyyy-MM-dd hh:mm"/>
        </div>
    </div>
    <div class="bottom_box">
		<div id="mediaContainer" class="about-chnl detail_content_box">
		    <!-- 수정 가능한 내용 부분 -->
		    <div id="editableContent">
		        ${feed.feedContent}
		    </div>
		    <!-- 이미지 또는 비디오 표시 -->
		</div>
        <div class="detail_bottom_line">
            <div class="detail_button">
                <div class="detail_left_btn">
                    <!-- 수정 버튼 -->
                    <a href="#" title="수정" class="main-btn btn_update" data-ripple="" onclick="openModal()">수정</a>
                    <a href="#" title="이전" class="main-btn btn_pre">
                        <i class="fa fa-chevron-left" aria-hidden="true"></i>
                    </a> 
                    <a href="#" title="다음" class="main-btn btn_next">
                        <i class="fa fa-chevron-right" aria-hidden="true"></i>
                    </a>
                </div>
                <div class="detail_right_btn">
                    <a href="/community/feed/list.do" title="목록" class="main-btn go_list" data-ripple="">목록</a>
                </div>
            </div>
        </div>
    </div>

    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
			<form id="updateForm" action="/community/feed/update.do" method="post" enctype="multipart/form-data">
			    <!-- 수정 가능한 내용 입력창 -->
			    <input type="hidden" name="feedNo" value="${feed.feedNo}">
			    <input type="file" name="feedFile" onchange="previewFile(event)">
			    <div id="filePreview"></div>
			    <textarea id="feedContent" name="feedContent" rows="10" cols="50"></textarea>
			    <button type="submit">수정</button>
			</form>
        </div>
    </div>

    <script>
    function openModal() {
        var modal = document.getElementById("myModal");
        modal.style.display = "block";
        // 수정 가능한 내용을 모달에 표시
        var content = document.getElementById("editableContent").innerText;
        document.getElementById("feedContent").value = content;
    }

    function closeModal() {
        var modal = document.getElementById("myModal");
        modal.style.display = "none";
    }

    function previewFile(event) {
        var preview = document.getElementById("filePreview");
        var file = event.target.files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            if (file.type.includes("image")) {
                // 이미지 파일인 경우
                preview.innerHTML = "<img class='preview-image' src='" + reader.result + "' alt='미리보기'>";
            } else if (file.type.includes("video")) {
                // 비디오 파일인 경우
                preview.innerHTML = "<video controls class='preview-image'><source src='" + reader.result + "' type='" + file.type + "'></video>";
            }
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.innerHTML = "";
        }
    }
    var mediaContainer = document.getElementById("mediaContainer");
    var faMime = "${feed.faMime}";

    if (faMime.includes("image")) {
        // 이미지 파일인 경우
        var image = document.createElement("img");
        image.src = "${pageContext.request.contextPath}/resources/feed/" + "${feed.faSavedname}";
        image.alt = "이미지";
        image.style.height = "300px"; // 이미지의 높이 조절
        mediaContainer.insertBefore(image, mediaContainer.firstChild);
    } else if (faMime.includes("video")) {
        // 비디오 파일인 경우
        var video = document.createElement("video");
        video.controls = true; // 비디오 컨트롤러 표시
        video.style.height = "300px"; // 비디오의 높이 조절
        var source = document.createElement("source");
        source.src = "${pageContext.request.contextPath}/resources/feed/" + "${feed.faSavedname}";
        source.type = faMime; // 비디오 파일의 MIME 타입 설정
        video.appendChild(source);
        mediaContainer.insertBefore(video, mediaContainer.firstChild);
    } else {
        // 이미지나 비디오가 아닌 경우
        console.error("지원되지 않는 파일 형식입니다.");
    }
    </script>
</body>
</html>
