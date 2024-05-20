<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<meta id="_csrf" name="_csrf" content=${_csrf.token }>
<meta id="_csrf_header" name="_csrf_header" content=${_csrf.headerName }>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css">
<style>
body {font-family: Arial;}
.swal2-container {
    z-index: 9999999999 !important;
}
.post_left {
    width: 85%;
    height: auto;
    display: flex;
    justify-content: left;
    align-items: center;
    padding-left: 20px;
    cursor: pointer;
}
.post_left img {
    width: 50px;
    height: 50px;
    margin-right: 15px;
}  
.modal-header {
      cursor: move;
  }
.post_button {
	width: 800px;
	height: 60px;
	border: 1px solid #eaeaea;
	border-radius: 50px;
	display: flex;
	justify-content: center;
	background-color: #fff;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
}
.file_btn {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
}
.file_btn .post_image {
    cursor: pointer;
}
.file_btn .post_video {
    cursor: pointer;
}
.file_btn .file_image .fil_video[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    border: 0;
}
.file_btn i {
    font-size: 25px;
}
.file_btn i:nth-child(1) {
    margin-right: 10px;
}
.file_image {
    display: none;
}
.fil_video {
    display: none;
}
/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
/*   border: 1px solid #ccc; */
  border-top: none;
}
 /* 흑백 필터 */
    .black-and-white {
        filter: grayscale(100%);
    }

    /* 뽀샤시 필터 */
    .brightness {
        filter: brightness(150%);
    }

    /* 흔들림 필터 */
    .shake {
        position: relative;
        animation: shake 0.5s;
    }

    /* 그림자톤 필터 */
    .invert {
        filter: invert(100%);
    }

    /* 세피아 필터 */
    .sepia {
        filter: sepia(100%);
    }

    /* 채도 조절 필터 */
    .saturate {
        filter: saturate(200%);
    }

    /* 흐릿한 효과 필터 */
    .blur {
        filter: blur(5px);
    }
    
/*     수정 */

.background-gradient {
	display: none;
}
	
.topArea {
    margin-top: 8%;
    width: 100%;
    border-radius: 30px;
    margin-right: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2%;
}
.topArea img {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
}

.post_left {
    width: 85%;
    height: auto;
    display: flex;
    justify-content: left;
    align-items: center;
    padding-left: 20px;
    cursor: pointer;
    object-fit: cover;
}
.post_left img {
    width: 50px;
    height: 50px;
    margin-right: 15px;
    object-fit: cover;
}
.file_btn {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 15px;
}
.file_btn .post_image {
    cursor: pointer;
    font-size: 25px;
    justify-content: center;
    align-items: center;
    display: flex;
    margin-right: 10px;
    margin-top: 10px;
}
.file_btn .post_video {
    cursor: pointer;
    font-size: 25px;
    justify-content: center;
    align-items: center;
    display: flex;
    margin-top: 10px;
}
.file_btn .file_image .fil_video[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    border: 0;
}
.file_btn i {
    font-size: 25px;
}
.file_btn i:nth-child(1) {
    margin-right: 10px;
}
.file_image {
    display: none;
}
.fil_video {
    display: none;
}

.registerArea {
	width: 100%;
	height: 100%;
	position: absolute;
    right: 1.2%;
    top: 40px;;
    width: 350px;
    height: 255px;
    border-radius: 10px;
/*     background-image: linear-gradient(90deg, rgb(218, 208, C255) 0%, rgb(193, 154, 255) 100%); */
    background-image: url("${pageContext.request.contextPath }/resources/images/myFeed_bg.jpg");
    background-position: bottom right;
    background-size: cover;
    opacity: 0.7;
    margin-top: 57px;
}

.registerBox {
	list-style: none;
	text-align: right;
	width: 100%;
    margin-top: 5%;
}

.registerNickName {
	font-weight: bold;
	font-size: 30px;
	margin-left: 25px;
}

.registerDate {
	font-weight: bolder;
	font-size: 25px;
	text-align: center;
	margin: 0 auto;
    opacity: 1;
    color: #000;
    padding-right: 3%;
}

.registerJoined {
	font-weight: bolder;
	font-size: 25px;
	text-align: center;
	margin: 0 auto;
    opacity: 1;
    color: #000;
    padding-right: 3%;
}

.tabBar {
	background: rgb(193, 154, 255);
	border-radius: 10px 10px 0 0;
	border: none;
}

.tabBar .tabMenu:hover {
	background-color: rgb(193, 154, 255);
	font-weight: bold;
}

.user figure img {
	border: none !important;
	width: 55px !important;
	height: 55px !important;
	object-fit: cover;
}

.modalPostArea {
	position: relative;
    top: 30%;
    transform: translateY(-50%);
}

.modalPostIcon {
	font-size: 25px !important;
}

.fa-image {
	margin-right: 10px !important;
}

.modalFeedWUser {
/* 	border-bottom: 1px solid #ede9e9; */
	border-top: none;
}

.modalFeedUser {
	width: 100%;
	height: 55px;;
	margin-bottom: 3%; 
}

.modalFeedBody {
	width: 100%;
	height: 100%;
}

.modalFeedIcon {
	width: 100%;
    position: absolute;
    bottom: 20px;
/*     시연용 */
/*     bottom: -17%; */
/*     bottom: 1%; */
/*     left: 3%; */
    height: 55px;
}

.feedCommentArea li {
	border-bottom: 1px solid #ede9e9;
}

.feedCommentArea li:last-child {
	border: none;
}

.feedCommentContent {
	border: none;
}

.modalArtistCommentArea {
	position: relative;
	top: 100px;
}

/* 피드 모달 시작 */

.modalFullArea {
    position: relative;
    top: 47%;
    transform: translateY(-50%) !important;
/* 	시연용 */
	max-height: 70%;
/*     max-height: 90%; */
    width: 100%;
    height: 100%;
/*     overflow: hidden; */
}

.modalFullBox {
/* 	수정*/
/* 	position: absolute; */
	width: 60%; 
	margin-right: 3%; 
	padding-right: 3%; 
/* 	border-right: 1px solid #ede9e9; */
/* 	overflow-y: auto;  */
}

.modalFullBox::after {
    content: "";
    position: absolute;
    top: 4%;
    left: 60%;
    transform: translateX(-60%);
    bottom: 0;
    width: 1px;
/*     시연용 */
	height: 870px;
/*     height: 800px; */
    background-color: #ede9e9; 
}

.modalFullBoxContent {
	width: 100%;
	height: 100%;
    max-height: 100%;
    overflow-y: auto;
}

.modalFullBody {
	width: 100%;
    overflow-y: auto;
/*     시연용 */
    max-height: 760px;
    min-height: 82%;
/*     max-height: 680px; */
/*     min-height: 82%; */
}

.modalFeedBox {
	width: 400px;
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    top: 40%;
    padding: 20px;
    border-radius: 10px;
/* 	border: 1px solid #9551fc; */
}

.modalFeedBtn {
	position: absolute;
	right: 20px;
	top: 20px;
	font-size: 35px;
}

.modalFeedsubmit {
	position: absolute;
	right: 20px;
	bottom: 20px;
	background-color: #9551fc;
	border: none;
	color: #fff;
	border-radius: 10px;
	font-weight: normal;
	width: 50px;
	height: 40px;
	padding: 12px 0;
}

.modalFeedsubmit:hover {
	font-weight: bold;
}

.modalFeedReason {
	margin-bottom: 45px;
}

.modalFeedContentBox {
	padding: 0;
}

.modalFeedContent {
	margin-bottom: 45px;
}

.modalFeedTextarea {
	margin-bottom: 45px;
}

.modalFeedWrite {
	position: absolute;
	right: 0px;
	bottom: 0px;
	width: 100px;
}

.modalCommentReportBtn {
	width: 100px;
}

.modalFeedEdit {
	position: absolute;
	right: 0px;
	bottom: 0px;
	width: 100px;
}

/* 피드 모달 끝 */

/* 피드 모달 댓글 시작 */

.modalFeedCommentArea {
	margin-bottom: 20px;
}

.modalFeedCommentTop {
	border: none;
}

.modalFeedCommentProfile {
    max-width: 100%;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: flex-start;
}

.modalFeedCommentProfile img {
	width: 35px;
	height: 35px;
}

.modalFeedCommentCon {
	margin-top: 10px;
	margin-bottom: 10px;
}

.modalFeedCommentBtns {
	display: flex;
	justify-content: flex-start;
	align-items: center;
    border-bottom: 1px solid #ede9e9;
    padding-bottom: 10px;
}

.modalFeedCommentLike {
	margin-right: 12px;
	display: flex;
	align-items: center;
}

.modalFeedCommentLikeBtn {
	margin-right: 5px;
/* 	시연용 추가 */
	font-size: 16px;
}

.modalFeedCommentDate {
	margin-bottom: 10px;
}

.feedPostForm {
	margin: 20px 0;
}

.feedPostForm label {
	margin-bottom: 20px;
}

.mediaContainer img {
    max-height: 450px;
    max-width: 300px;
    object-fit: cover;
    margin-bottom: 20px;
}

.myfeedBox li:nth-child(1) .myfeedProfile {
	margin-top: 0 !important;
	margin-bottom: 15px;
}

.myfeedBox li:last-child(1) .myfeedProfile {
	margin-bottom: 0 !important;
}

.tabcontentArea {
	border: 1px solid #ede9e9;
	border-radius: 0 0 10px 10px !important;
	margin-bottom: 20px;
	padding: 2%;
}

.tabAlbumBox {
	display: flex;
}

.tabAlbumDiv {
	margin-top: 20px;
	display: flex;
	justify-content:space-around;
	align-items: center;
}

.tabAlbum img {
	width:400px;
	height: 500px;
	border-radius: 10px;
	object-fit: cover;
}

.tab button.active {
	background-color: rgb(193, 154, 255);
}

/* 시연용 추가  css*/
.ps-container {
	overflow: visible !important;
}

.modalnick {
	margin-right: 6px;
}

.lightbox {
	width: 100%;
    height: 100vh;
    position: relative;
}

.lb-outerContainer {
	position: absolute;
    left: 50%;
    transform: translateX(-50%);
    top: 6%;
}

.lb-container .lb-image {
	max-height: 1180px;
}

.lb-container {
	margin-right: 2%;
}

.lb-data .lb-close {
	position: absolute;
    top: 8%;
    width: 40px;
    height: 40px;
    background-size: cover;
    display: none;
}

.lb-dataContainer {
	width: 0 !important;
}

.lb-data {
	width: 0 !important;
	color: transparent !important;
}

.lb-details {
	width: 0 !important;
	color: transparent !important;
}

.lb-caption {
	width: 0 !important;
	color: transparent !important;
}

.lb-number {
	width: 0 !important;
	color: transparent !important;
}

</style>
</head>
<body>
<div class="slick-slide-item topArea"  data-userno="${userNo}" data-agId="${agId}">
	<div>
	   	<img src="${pageContext.request.contextPath}${userProfile}" class="img-fluid" alt="" >
	    <span class="registerNickName">${mnNickName }</span>
    </div>
    <div class="registerArea">
	   	<div class="registerBox">
           <span class="registerDate" >${cjDate } <br> </span>
           <span class="registerJoined">JOINED</span>
	    </div>
    </div>
</div>
<c:if test="${param.userType ne '3'}">
		<%@ include file="/include/postIncludeFan.jsp" %>
	</c:if>  

	<c:if test="${param.userType eq '3' and UserInfo.userType eq '3'}">
	    <%@ include file="/include/postIncludeArtist.jsp" %>
	</c:if> 
     
<div class="tabBarArea">
	<div class="tab tabBar" >
	  <button class="tablinks tabMenu" onclick="openCity(event, 'Feed')">포스트</button>
	  <button class="tablinks tabMenu" onclick="openCity(event, 'Comment')">댓글</button>
	  <button class="tablinks tabMenu" onclick="openCity(event, 'Album(i)')">앨범(사진)</button>
	  <button class="tablinks tabMenu" onclick="openCity(event, 'Album(v)')">앨범(동영상)</button>
	</div>
	
	<div class="tabcontentArea">
	
	
		<div id="Album(i)" class="tabcontent">
		    <div class="row">
		        <c:forEach items="${myFeedList1}" var="myFeed1" varStatus="loop">
		        	<c:if test="${myFeed1.faMime.startsWith('image')}">
		                <div class="col-md-4 tabAlbumBox" >
		                	<div class="tabAlbum">
			                    <div class="tabAlbumDiv" >
			                        <a href="${pageContext.request.contextPath}/resources/feed/${myFeed1.faSavedname}" data-lightbox="image-gallery" data-title="My caption">
			                            <img src="${pageContext.request.contextPath}/resources/feed/${myFeed1.faSavedname}" alt="" >
			                        </a>
			                    </div>
		                    </div>
		                </div>
		                <c:if test="${loop.index % 3 != 2 and loop.last}">
		                    </div><div class="row">
		                </c:if>
		            </c:if>
		        </c:forEach>
		    </div>
	    </div>
	
		
		
		<div id="Album(v)" class="tabcontent">
		    <div class="row">
		        <c:forEach items="${myFeedList1}" var="myFeed1" varStatus="loop">
		            <c:if test="${myFeed1.faMime.startsWith('video')}">
		                <div class="col-md-4">
		                    <div style="margin-top: 20px;">
		                        <video width="100%" controls style="border-radius: 10px;">
		                            <source src="${pageContext.request.contextPath}/resources/feed/${myFeed1.faSavedname}" type="${myFeed1.faMime}">
		                        </video>
		                    </div>
		                </div>
		                <c:if test="${loop.index % 3 != 2 and loop.last}">
<%-- 		                <c:if test="${loop.index % 3 == 2}"> --%>
		                    </div><div class="row">
		                </c:if>
		            </c:if>
		        </c:forEach>
		    </div>
		</div>
		
		
		
		
		
		<div id="Feed" class="tabcontent">
		  <div class="">
		    <ul class="myfeedBox" style="padding: 2%;">
		      <c:forEach items="${myFeedList}" var="myFeed">
		        <li style="list-style: none; border-bottom: 1px solid #ede9e9; padding-bottom: 20px;">
		          <div class="myfeedProfile" style="margin-bottom: 20px; margin-top: 20px;">
		            <img src="${pageContext.request.contextPath}${myFeed.userProfile}" alt="" style="width: 35px; height:35px; border-radius: 50px;">
		              <a href="/community/feed/myFeed.do?userNo=${myFeed.userNo}&agId=${myFeed.agId}" title="" style="margin-left: 10px;">${myFeed.mnNickName}</a>
		          </div>
		          <div class="">
		          	<p onclick="myFeed(${myFeed.feedNo})" style="cursor: pointer;">${myFeed.feedContent}</p>
		            <div class="">
		              <span><fmt:formatDate value="${myFeed.feedRegdate}" pattern="yyyy-MM-dd hh:mm"/></span>
			          <a href="#" title="Delete" onclick="deleteFeed(${myFeed.feedNo})" style="margin-left: 1%;"><i class="fa fa-trash"></i></a>
		            </div>
		          </div>
		        </li>
		      </c:forEach>
		      <c:if test="${empty myFeedList}">
		        <p>작성된 포스트가 없습니다.</p>
		      </c:if>
		    </ul>
		  </div>
		</div>
		
		
		<div id="Comment" class="tabcontent">
		   <div class="">
		    <ul class="myfeedBox" style="padding: 2%;">
		      <c:forEach items="${myCommentList}" var="myComment">
		        <li style="list-style: none; border-bottom: 1px solid #ede9e9; padding-bottom: 20px;">
		          <div class="myfeedProfile" style="margin-bottom: 20px; margin-top: 20px;">
		            <img src="${pageContext.request.contextPath}${myComment.userProfile}" alt="" style="width: 35px; height:35px; border-radius: 50px;">
		              <a href="/community/feed/myFeed.do?userNo=${myComment.userNo}&agId=${myComment.agId}" title="" style="margin-left: 10px;">${myComment.mnNickName}</a>
		          	  
		          </div>
		          <div class="">
		            <p id="myFeedView" onclick="myFeedComment(${myComment.feedNo})" style="cursor: pointer;">${myComment.fcContent}</p>
		            <div class="">
		              <span><fmt:formatDate value="${myComment.fcRegdate}" pattern="yyyy-MM-dd hh:mm"/></span>
					  <a href="#" title="Delete" onclick="deleteComment(${myComment.fcNo})" style="margin-left: 1%;"><i class="fa fa-trash"></i></a>            
		            </div>
		          </div>
		        </li>
		      </c:forEach>
		      <c:if test="${empty myCommentList}">
		        <p>작성된 코멘트가 없습니다.</p>
		      </c:if>
		    </ul>
		  </div> 
		</div>
	</div>
</div>

<!-- 포스트 추가 -->
<div class="modal" id="myModal" data-loginuser="${loginUser }" data-usertype="${userType}" data-userno="${userNo}" data-agId="${agId}">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h4 class="modal-title">포스트 추가</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
             <!-- 모달 바디 -->
            <div class="modal-body" style="    z-index: 100;">
                <!-- 포스트 내용 입력 폼 -->
                <div>
				    <textarea id="postContent" rows="4" cols="50" max="1000" onkeyup="updateCharCount()"></textarea>
				    <div id="charCount">0/1000</div>
				</div>
				<div id="previewContainer" style="margin-bottom: 20px;">
				
				</div>
				<div class="selectFilter" hidden="">
				<select id="selectFilterBox" onchange="applyFilter()">
				    <option value="option1">필터 선택</option>
				    <option value="option2">흑백</option>
				    <option value="option3">뽀샤시</option>
				    <option value="option4">흔들림효과</option>
				    <option value="option5">반전효과</option>
				    <option value="option6">세피아 효과</option>
					<option value="option7">채도 조절</option>
					<option value="option8">투명도 조절</option>
					<option value="option9">흐릿한 효과</option>
				</select>
				</div>
                <!-- 파일 업로드 -->
                <div class="file_btn">
                    <label for="imageInput" class="post_image" style="position: absolute; top: 40px; left: 1px;">
                        <i class="far fa-image"></i>
                        <i class="fa fa-video-camera"></i>
                    </label>
                    <input type="file" class="file_image" id="imageInput" name="">
                </div>
                
                
                <!-- 멤버십 전용 포스트 체크박스 -->
                <c:if test="${userType == 3}">
				    <div class="form-check">
				        <input class="form-check-input" type="checkbox" id="membershipPost">
				        <label class="form-check-label" for="membershipPost">멤버십 전용 포스트</label>
				    </div>
				</c:if>
            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <!-- 포스트 버튼 -->
                <button type="button" id="postBtn" class="btn btn-primary">포스트</button>
                <!-- 모달 닫기 버튼 -->
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<button type="button" id="modalBtn" style="display:none;" data-toggle="modal" data-target="#img-comt"></button>

	<!-- 모달 시작 -->
<div class="modal fade" id="img-comt">
	<div class="modal-dialog modalFullArea">
<!-- 	    <div class="modal-dialog"> -->
	        <div class="modal-content" style="height: 100%; border-radius: 10px;">
	
	            <!-- Modal Header -->
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" style="font-size: 35px;">×</button>
	            </div>
	
	            <!-- Modal body -->
	            <div class="modal-body"  style="width: 100%; height: 100%; padding: 3% !important; position: relative;">
	                <div class="row" style="margin: 0 !important;">
	                	<div class="modalFullBox">
	                		<div class="user modalFeedUser">
		                            <figure id="modalProfile" style="width: 55px; height: 55px">
		                                <img class="modalprofileBox" src="${pageContext.request.contextPath}${userProfile}" alt="">
		                            </figure>
		                            <div class="user-information">
		                                <h4>
		                                    <a href="#" title="" id="modalnick" class="modalnick">${mnNickName}</a>
		                                	<a id="modalmemberShip"></a>
		                                </h4>
		                                <span id="modalFeedRegdate"><fmt:formatDate value="${feedRegdate}" pattern="yyyy-MM-dd hh:mm"/></span>
		                            </div>
		                        </div>
			                	<div class="modalFullBody" style="overflow-y: auto;">
			                		<div style="width: 100%; height: 100%;">
			                			<div class="modalFeedBody">
	<!-- 				                    <div class="col-lg-8"> -->
					                        <div id="modalMedia">
					                        
					                        </div>
					                        
					                        <div id="modalContent" style="width:550px; height: auto; padding: 2%; line-height: 1.6;">
					                            ${feedContent}
					                        </div>
										</div>
				                    </div>
			                    </div>
<!-- 		                    <div class="col-lg-4"> -->
		                        
		                        <div class="modalFeedIcon">
			                        <div class="we-video-info modalFeedWUser">
			                            <ul>
			                                <li>
			                					<div id="likeFeed" class="like-button1" title="Like/Dislike" data-feedno="" data-userno="${UserInfo.userNo}" style="cursor: pointer; font-size: 22px;">
													        ❤ <span class="like-count1" style="position: absolute; bottom: 0px; margin-left: 5px; margin-bottom: 3px;" >0</span>
												</div>
			                                </li>
			                                <li>
			                                    <span title="Comments" class="comment" id="modalCommentBtn" data-userno="${userNo}" data-feedno="" >
			                                        <i class="fa fa-commenting" style="font-size: 20px;"></i>
			                                        <ins></ins>
			                                    </span>
			                                </li>
			                            </ul>
			                        </div>
		                        </div>
		                </div>
                        <div class="modalFullComment" style="height: 100%; width: 37%; position: absolute; right: 0; padding: 0 3%; height: 94%; overflow: hidden;">
	                        <div style="display: block; height: 94%; overflow: auto;" class="coment-area">
	                            <ul id="ulCommentArea" style="list-style: none; padding: 0;">
<!-- 	                    	시연용 -->
<!-- 		                            <ul class="we-comet" id="ulCommentArea"> -->	                            
	                            </ul>
	                        </div>
                        </div>
	                </div>
	            </div>
	        </div>
<!-- 	    </div> -->
	</div>
</div>
<!-- 댓글 작성 -->
<div id="commentModal" class="modal modalFeedArea">
    <!-- 모달 내용 -->
    <div class="modal-content modalFeedBox">
        <!-- 모달 헤더 -->
        <div class="modal-header">
            <h5>댓글 작성</h5>
            <!-- 모달 닫기 버튼 -->
            <button type="button" class="close modalFeedBtn" data-dismiss="modal">&times;</button>
        </div>
        <!-- 모달 바디 -->
        <div class="modal-body modalFeedContentBox">
            <!-- 댓글 작성 폼 -->
            <form id="commentForm">
            	<input type="hidden" name="feedNo" id="feedRealNo">
                <div class="form-group modalFeedContent">
                    <label for="commentContent">댓글 내용:</label>
                    <textarea class="form-control modalFeedTextarea" id="commentContent" rows="3"></textarea>
                </div>
                <!-- 댓글 작성 버튼 -->
                <sec:csrfInput/>
            </form>
           <input type="button" id ="commentButton" class="modalFeedsubmit modalFeedWrite" value="댓글쓰기">
        </div>
    </div>
</div>
<!-- 댓글수정 -->
<div id="editCommentModal" class="modal modalFeedArea">
    <!-- 모달 내용 -->
    <div class="modal-content modalFeedBox">
        <!-- 모달 헤더 -->
        <div class="modal-header">
            <h5>댓글 수정</h5>
            <!-- 모달 닫기 버튼 -->
            <button type="button" class="close modalFeedBtn" data-dismiss="modal">&times;</button>
        </div>
        <!-- 모달 바디 -->
        <div class="modal-body">
            <!-- 댓글 작성 폼 -->
            <form id="editCommentForm">
                <input type="hidden" name="commentNo" id="commentNo">
                <div class="form-group">
                    <label for="editCommentContent">댓글 내용:</label>
                    <textarea class="form-control" id="editCommentContent" rows="3"></textarea>
                </div>
                <sec:csrfInput/>
            </form>
            <input type="button" id ="editCommentButton" class="modalFeedsubmit modalFeedEdit" value="댓글 수정">
        </div>
    </div>
</div>
<!-- 유저 신고 모달 -->
<div id="commentReportModal" class="modal">
    <div class="modal-content" style="width: 400px; position: absolute; left: 700px; top: 300px;">
        <button type="button" class="close" onclick="closeCommentReportModal()">&times;</button>
        <h2>유저 신고하기</h2>
        <form id="commentReportForm">
            <input type="hidden" id="commentReportFeedNo" name="reportFeedNo">
            <input type="hidden" id="commentReportUserNo" name="reportUserNo">
            <div class="form-group">
                <label for="commentReportReason">신고 사유:</label>
                <select id="commentReportReason" class="form-control">
                    <option value="1">부적절한 닉네임</option>
                    <option value="2">선정/폭력성</option>
                    <option value="3">스팸/광고/도배글</option>
                    <option value="4">기타</option>
                </select>
            </div>
            <div class="form-group">
                <label for="commentReportCustomReason">상세내용(선택):</label>
                <input type="text" id="commentReportCustomReason" class="form-control" placeholder="기타 신고 사유를 입력하세요">
            </div>
            <input type="button" id="commentReportBtn" value="유저 신고">
        <sec:csrfInput/>
        </form>
    </div>
</div>

<script>
var header = "";
var token = ""; 
header = $("meta[name='_csrf_header']").attr("content");
token = $("meta[name='_csrf']").attr("content");







//파일 선택 시 미리보기 
function previewImage() {
	
    console.log("파일 선택 시 미리보기 함수 호출됨");
    var preview = document.getElementById('previewContainer');
    var fileInput = document.getElementById('imageInput');
    var file = fileInput.files[0];
    var reader = new FileReader();

    reader.onloadend = function () {
        console.log("이미지 미리보기 업데이트");
        preview.innerHTML = '<img src="' + reader.result + '" alt="Preview Image">';
    }

    if (file) {
        reader.readAsDataURL(file);
    } else {
        console.log("파일 없음");
        preview.innerHTML = '';
    }
}

document.getElementById('imageInput').addEventListener('change', function() {
    document.querySelector('.selectFilter').removeAttribute('hidden');
    previewImage();
});

document.getElementById('selectFilterBox').addEventListener('change', applyFilter);

function applyFilter() {
    console.log("필터 선택 시 applyFilter 함수 호출됨");
    var selectedFilter = document.getElementById('selectFilterBox').value;
    var previewImage = document.querySelector('#previewContainer img');

    previewImage.classList.remove('black-and-white', 'brightness', 'shake', 'invert', 'sepia', 'saturate', 'opacity', 'blur');

    if (selectedFilter === 'option2') {
        console.log("흑백 필터 적용");
        previewImage.classList.add('black-and-white');
    } else if (selectedFilter === 'option3') {
        console.log("뽀샤시 필터 적용");
        previewImage.classList.add('brightness');
    } else if (selectedFilter === 'option4') {
        console.log("흔들림 필터 적용");
        previewImage.classList.add('shake');
    } else if (selectedFilter === 'option5') {
        console.log("그림자톤 필터 적용");
        previewImage.classList.add('invert');
    } else if (selectedFilter === 'option6') {
        console.log("세피아 필터 적용");
        previewImage.classList.add('sepia');
    } else if (selectedFilter === 'option7') {
        console.log("채도 조절 필터 적용");
        previewImage.classList.add('saturate');
    } else if (selectedFilter === 'option8') {
        console.log("투명도 조절 필터 적용");
        previewImage.style.opacity = '0.5';
    } else if (selectedFilter === 'option9') {
        console.log("흐릿한 효과 필터 적용");
        previewImage.classList.add('blur');
    }
}

//유저 신고 모달 열기
function updateCharCount() {
    var max = 1000; 
    var now = $('#postContent').val().length; 
    var charCountElement = $('#charCount');

    charCountElement.text(now + '/' + max);

    if (now > max) {
        charCountElement.css('color', 'red');
        $('#postBtn').prop('disabled', true);
        alert("허용 글자수를 초과하셨습니다");
    } else {
        charCountElement.css('color', ''); 
        $('#postBtn').prop('disabled', false);
        $('#charLimitAlert').hide();
    }
}
function reportComment(feedNo, reporterUserNo) {
    $('#commentReportModal').modal('show');
    $('#commentReportFeedNo').val(feedNo);
    $('#commentReportUserNo').val(reporterUserNo);
    
    $('#commentReportBtn').on('click', function() {
        var feedNo = $('#commentReportFeedNo').val();
        var userNo = $('#commentReportUserNo').val();
		var reportType = $('#commentReportReason').val();
		var reportReason=$("#commentReportCustomReason").val();
		console.log("feedNo",feedNo);
		console.log("userNo",userNo);
		console.log("reportType",reportType);
		console.log("reportReason",reportReason);

		$.ajax({
			type : "POST",
			url : "/community/feed/userReport.do",
			beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
			data : JSON.stringify({
				
				feedNo : feedNo,
				userNo : userNo,
				reportType : reportType,
				reportReason : reportReason
				
			}),
			 contentType: "application/json; charset=utf-8",
	         success: function(response) {
	             	 $('#commentReportModal').hide();
	            	 Swal.fire({
	                     icon: "success",
	                     title: "신고가 완료되었습니다.",
	                     showConfirmButton: false,
	                     timer: 1500
	                 });
	            },
	            error: function(xhr, status, error) {
	            	
	            }
			
			
			
		});
    });
}

// 유저 신고 모달 닫기
function closeCommentReportModal() {
    $('#commentReportModal').modal('hide');
}


//좋아요기능
$(document).ready(function() {
    $('.like-button').each(function() {
        var $button = $(this);
        var feedNo = $button.data('feedno');
        var userNo = $('#myModal').data('loginuser');
        console.log("feedNo",feedNo);
        console.log("userNo",userNo);

        $.ajax({
            type: 'GET',
            url: '/community/feed/like/count',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { feedNo: feedNo },
            success: function(response) {
                $button.find('.like-count').text(response);
            },
            error: function(xhr, status, error) {
            }
        });
    });

    $('.like-button').click(function() {
        var $button = $(this);
        var feedNo = $button.data('feedno');
        var userNo = $('#myModal').data('loginuser');

        if ($button.prop('disabled')) {
            return;
        }
        $button.prop('disabled', true);

        $.ajax({
            type: 'POST',
            url: '/community/feed/like',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { feedNo: feedNo, userNo: userNo },
           
            success: function(response) {
                if (response === 'already_liked') {
                    var likeCount = parseInt($button.find('.like-count').text());
                    $button.find('.like-count').text(likeCount - 1);
                    $button.removeClass('liked');
                } else if (response === 'success') {
                    // 좋아요 추가 성공
                    var likeCount = parseInt($button.find('.like-count').text());
                    $button.find('.like-count').text(likeCount + 1);
                    $button.addClass('liked');
                } else {
                    // 실패 시
                    alert('좋아요 처리에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                // 에러 발생 시
                alert('AJAX request failed: ' + error);
            },
            complete: function() {
                // 요청 완료 시 버튼 활성화
                $button.prop('disabled', false);
            }
        });
    });
});
function likeFeedNo(feedNo) {
	$('.like-button1').attr("data-feedno", feedNo);
   
	$('.like-button1').each(function() {
        var $button = $(this);
        var feedNo = $button.data('feedno');
        var userNo = $('#myModal').data('loginuser');
        console.log("feedNo",feedNo);
        console.log("userNo",userNo);

        // 좋아요 수 가져오기
        $.ajax({
            type: 'GET',
            url: '/community/feed/like/count',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { feedNo: feedNo },
            success: function(response) {
                // 좋아요 수를 버튼에 반영
                $button.find('.like-count1').text(response);
            },
            error: function(xhr, status, error) {
                console.error('AJAX request failed:', error);
            }
        });
    });

    $('.like-button1').click(function() {
        var $button = $(this);
        var feedNo = $button.data('feedno');
        var userNo = $('#myModal').data('loginuser');

        if ($button.prop('disabled')) {
            return;
        }
        $button.prop('disabled', true);

        $.ajax({
            type: 'POST',
            url: '/community/feed/like',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { feedNo: feedNo, userNo: userNo },
            success: function(response) {
                if (response === 'already_liked') {
                    var likeCount = parseInt($button.find('.like-count').text());
                    $button.find('.like-count').text(likeCount - 1);
                    $button.removeClass('liked');
                    var likeCount1 = parseInt($button.find('.like-count1').text());
                    $button.find('.like-count1').text(likeCount1 - 1);
                    $button.removeClass('liked');
                    
                } else if (response === 'success') {
                	var likeCount = parseInt($button.find('.like-count').text());
                    $button.find('.like-count').text(likeCount - 1);
                    $button.removeClass('liked');
                    var likeCount1 = parseInt($button.find('.like-count1').text());
                    $button.find('.like-count1').text(likeCount1 + 1);
                    $button.addClass('liked');
                } else {
                    alert('좋아요 처리에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                alert('AJAX request failed: ' + error);
            },
            complete: function() {
                $button.prop('disabled', false);
            }
        });
    });
    $('#img-comt').on('hidden.bs.modal', function() {
        $('.like-button').each(function() {
            var $button = $(this);
            var feedNo = $button.data('feedno');
            var userNo = $('#myModal').data('loginuser');

            $.ajax({
                type: 'GET',
                url: '/community/feed/like/count',
                beforeSend: function(xhr){	
        			xhr.setRequestHeader(header, token);
        		},
                data: { feedNo: feedNo },
                success: function(response) {
                    $button.find('.like-count').text(response);
                },
                error: function(xhr, status, error) {
                    console.error('AJAX request failed:', error);
                }
            });
        });
    });
};    
function updateLikeCounts() {
    $('.like-button2').each(function() {
        var $button = $(this);
        var fcNo = $button.data('fcno');
        $.ajax({
            type: 'GET',
            url: '/community/comment/like/count',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { fcNo: fcNo },
            success: function(response) {
                $button.find('.like-count').text(response);
                $('#likeFeed').find('.like-count').text(response);
            },
            error: function(xhr, status, error) {
                console.error('AJAX request failed:', error);
            }
        });
    });
}
$(document).ready(function() {

    $('#modalCommentBtn').on('click', function() {
        $('#commentModal').show();
        
    });
    
    $('#commentModal .close').on('click', function() {
        $('#commentModal').hide();
    });
    
    $('#commentButton').on('click',function() {
        var commentContent = $('#commentContent').val();
        var feedNo = $('#feedRealNo').val();
        var userNo = $('#modalCommentBtn').data('userno');
		console.log("feedNo",feedNo);
		console.log("commentContent",commentContent);
		console.log("userNo",userNo);
        $.ajax({
            type: 'POST',
            url: '/community/feed/comment/insert.do',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { 
            	userNo:userNo,
            	feedNo:feedNo,
            	fcContent: commentContent,
            	}, 
            success: function(response) {
            	 $('#commentModal').hide();
            	 updateComments(feedNo);
            },
            error: function(xhr, status, error) {
                console.error(error);
                alert('댓글 작성에 실패했습니다. 다시 시도해주세요.');
            }
        });
    });
 });
 
function updateComments(feedNo) {
	var loggedUserNo = $('#myModal').data('loginuser');
	$.ajax({
	    type: 'get',
	    url: '/community/feed/artistFeedComment.do?feedNo=' + feedNo,
	    beforeSend: function(xhr){	
			xhr.setRequestHeader(header, token);
		},
	    success: function(data) {
	    	var commentsHtml = '';
	        data.feedCommentList.forEach(function(comment) {
	        	console.log("comment",comment);
    			var fcRegdate = comment.fcRegdate;
        		var date = new Date(fcRegdate);
     		    var formattedDate = date.toLocaleString();
        		var cjNo1 = comment.cjNo;
     			var userType=comment.userType;
     			var memberShipYn = data.memberShipYn;
     			var memberShipYn1 = data.memberShipYn;
     			console.log("memberShipYn",memberShipYn);
     			console.log("이거왜안나와",memberShipYn1);
	            var commentHtml = '<div class="comment">';
	            var contextPath = '${pageContext.request.contextPath}'; 
	            commentHtml += "<li>";
	            commentHtml += "	<div class='modalFeedCommentArea'>";
	            commentHtml += "    <div class='comet-avatar modalCommentImg modalFeedCommentProfile' id='modalComProfile'>";
	            commentHtml += "        <img src='" + contextPath + comment.userProfile + "' alt='' style='object-fit:cover;'>";
	            commentHtml += "    	<div class='we-comment modalFeedCommentTop'>";
	            commentHtml += "			<h5><a title='' href='/community/feed/myFeed.do?userNo=" + comment.userNo + "&agId=" + comment.agId + "'>" + comment.mnNickName + "</a></h5>";
	            for (var i = 0; i < memberShipYn.length; i++) {
        		    var feed1 = memberShipYn[i];
        		    console.log("수정제발요",cjNo1);
        		    if (feed1.cjNo == cjNo1 && userType !='3') {
        		    	commentHtml += "<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>";
        		    }
        		}

	        	if (userType == '3') {
	        		commentHtml += "<img src='${pageContext.request.contextPath}/resources/images/mark.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 1px;'>";
	        	}
	            commentHtml += "    	</div>";
	            commentHtml += "    </div>";
	            commentHtml += "    <p id='modalComContent' class='modalFeedCommentCon'>"+ comment.fcContent +"</p>";
	            commentHtml += "    <div class='inline-itms' id='modalcomFcRegdate'>";
	            commentHtml += "        <span class='modalFeedCommentDate'>"+ formattedDate +"</span>";
	            
	            commentHtml += "	<div class='modalFeedCommentBtns'>"
	            commentHtml += "			<div id='likeFeed2' class='like-button2 modalFeedCommentLike' title='Like/Dislike' data-fcno='" + comment.fcNo + "' data-userno='" + comment.userNo + "' style='cursor: pointer'>";
	            commentHtml += "    			<span class='modalFeedCommentLikeBtn'>❤</span>";
	            commentHtml += "    			<span class='like-count'>0</span>";
	            commentHtml += "			</div>";
	            
        		if (comment.userNo == loggedUserNo) {
        			commentHtml += "<a title='Edit Comment' href='#' onclick='openEditCommentModal("+ comment.fcNo +", \""+ comment.fcContent +"\")' class='edit-comment'><i class='fa fa-edit'></i></a>";
        			commentHtml += "<a title='Delete Comment' href='#' onclick='deleteComment("+ comment.fcNo +")' class='delete-comment'><i class='fa fa-trash'></i></a>";
        		}
        		if(comment.userNo != loggedUserNo){
        		commentHtml += "<a title='Report Comment' href='#' onclick='reportComment("+ comment.feedNo +", \""+ comment.userNo +"\")' class='report-comment'><i class='fa-sharp fa-regular fa-bell'></i></a>";
        		}
        		commentHtml += "    	</div>";
        		commentHtml += "    	</div>";
        		commentHtml += "    </div>";
        		commentHtml += "</li>";

	            commentsHtml += commentHtml;
	        });

	        $('#ulCommentArea').html(commentsHtml);
			$('#commentContent').val('');
	    },
	    error: function(xhr, status, error) {
	        console.error('댓글을 불러오는 중 오류 발생:', error);
	    }
	});

}

function deleteFeed(feedNo) {
    		console.log(feedNo);
        	var feedNo=feedNo;
    		console.log(feedNo);
        if (confirm('이 게시물을 삭제하시겠습니까?')) {
            $.ajax({
                type: 'POST',
                url: '/community/feed/feedDelete.do',
                beforeSend: function(xhr){	
        			xhr.setRequestHeader(header, token);
        		},
                data: JSON.stringify({ feedNo: feedNo }),
                contentType: "application/json; charset=utf-8",
                success: function(response) {
                    alert('게시물이 삭제되었습니다.');
                    location.reload();
                },
                error: function(xhr, status, error) {
                    console.error(error);
                    alert('게시물 삭제에 실패했습니다.');
                }
            });
        }
    
}

function deleteComment(fcNo) {
    if (confirm('댓글을 삭제하시겠습니까?')) { 
    	console.log("fcNo",fcNo);
        $.ajax({
            type: 'POST', 
            url: '/community/feed/comment/commentDelete.do',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: JSON.stringify({ fcNo: fcNo }),
            contentType: "application/json; charset=utf-8",
            success: function(comment) {
            	console.log("commentcomment",comment);
                updateComments(comment); 
            },
            error: function() {
                alert('댓글 삭제에 실패했습니다.');
            }
        });
    }
}

$('.post_button').on('click', function() {
    $('#myModal').modal('show'); // 모달 표시
});

$('#postBtn').on('click', function() {
    var agId = $('#myModal').data('agid');
    var userNo = $('#myModal').data('userno');
    var feedContent = $('#postContent').val(); 
    var feedMembership = $('#membershipPost').prop('checked') ? 1 : 0;
    var userType = $('#myModal').data('usertype');
 	// 선택된 필터 정보 가져오기
    var selectedOption = document.getElementById('selectFilterBox').value;
    var selectedFilter;

    if (selectedOption === 'option2') {
        selectedFilter = 'black-and-white';
    } else if (selectedOption === 'option3') {
        selectedFilter = 'brightness';
    } else if (selectedOption === 'option4') {
        selectedFilter = 'shake';
    } else if (selectedOption === 'option5') {
        selectedFilter = 'invert';
    } else if (selectedOption === 'option6') {
        selectedFilter = 'sepia';
    } else if (selectedOption === 'option7') {
        selectedFilter = 'saturate';
    } else if (selectedOption === 'option8') {
        selectedFilter = 'opacity';
    } else if (selectedOption === 'option9') {
        selectedFilter = 'blur';
    }
	console.log("selectedFilter",selectedFilter);
	
	if(feedContent.includes("샹")){
		alert("금지어가 포함되어있습니다.")		
		return;
	}
    
    
    var formData = new FormData();
    formData.append('agId', agId);
    formData.append('userNo', userNo);
    formData.append('feedContent', feedContent);
    formData.append('feedMembership', feedMembership);
    formData.append('userType', userType);
    // 파일이 첨부되었는지 확인
    var feedFile = $('#imageInput')[0].files[0]; 
    if (feedFile) {
        formData.append('feedFile', feedFile);
    }
	formData.append('faFilter', selectedFilter);
	console.log("formData", formData.get('faFilter'));

    // 서버에 데이터 전송
    $.ajax({
        type: 'POST',
        url: '/community/feed/insert.do',
        beforeSend: function(xhr){	
			xhr.setRequestHeader(header, token);
		},
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            $('#myModal').modal('hide');
            Swal.fire({
                icon: "success",
                title: "작성이 완료되었습니다.",
                showConfirmButton: false,
                timer: 1500
            }).then(() => {
                location.reload(); 
            });
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
});
document.addEventListener("DOMContentLoaded", function() {
    openCity(event, 'Feed');
  });

function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    tablinks = document.getElementsByClassName("tablinks");

    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

$(document).on('click', '.like-button2', function() {
	var $button = $(this);
    var fcNo = $button.data('fcno'); 
    var userNo = $button.data('userno');
    
	
		    console.log("fcNofcNofcNofcNo", fcNo);
		
	  
	    $.ajax({
	        type: 'POST',
	        url: '/community/comment/like',
	        beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
	        data: { fcNo: fcNo, userNo: userNo },
	        success: function(response) {
	            if (response === 'already_liked') {
	                var likeCount = parseInt($button.find('.like-count').text());
	                $button.find('.like-count').text(likeCount - 1);
	                $button.removeClass('liked');
	            } else if (response === 'success') {
	                var likeCount = parseInt($button.find('.like-count').text());
	                $button.find('.like-count').text(likeCount + 1);
	                $button.addClass('liked');
	            } else {
	                alert('좋아요 처리에 실패했습니다.');
	            }
	        },
	        error: function(xhr, status, error) {
	        },
	        complete: function() {
	            $button.prop('disabled', false);
	        }
	    });
	});

function myFeed(feedNo){
	console.log("rererefeedfeedfeedfeed여기는 마이피드",feedNo);
	var feedNo=feedNo;
	var loggedUserNo = $('#myModal').data('loginuser');
		
	console.log("feedfeedfeedfeed",feedNo);
    	
        $.ajax({
        	type: 'get',
        	url:'/community/feed/artistFeedComment.do?feedNo=' + feedNo,
        	beforeSend: function(xhr){	
     			xhr.setRequestHeader(header, token);
     		},
        	success: function(data){
        		console.log(data);
        		console.log(data.feedVO.feedContent);
        		// feedCommentList를 이용해서 댓글들을 뿌린다.
     			$("#feedRealNo").val(feedNo);
     			likeFeedNo(data.feedVO.feedNo);
        		var cmtHtml = "";
					
     			$("#ulCommentArea").empty();
     			data.feedCommentList.map(function(v,i){
       				var deleteButton = (userNo == loggedUserNo) ? "<a title='Delete Comment' href='#' onclick='deleteComment("+ fcNo +")' class='delete-comment'><i class='fa fa-trash'></i></a>" : "";
       				var fcContent = v.fcContent;
        			var feedNo=v.feedNo;
        			var fcNo = v.fcNo;
        			var userType = v.userType;
        			var cjNo = v.cjNo;
        			var fcRegdate = v.fcRegdate;
            		var date = new Date(fcRegdate);
         		    var formattedDate = date.toLocaleString();
        			var feedNo = v.feedNo;
        			var mnNickName = v.mnNickName;
        			var userNo = v.userNo;
        			var agId= v.agId;
        			var userProfile = v.userProfile;
        			var memberShipYn = data.memberShipYn;
	        		var contextPath = '${pageContext.request.contextPath}'; 
	        		cmtHtml += "<li>";
	        		cmtHtml += "	<div class='modalFeedCommentArea'>";
	        		cmtHtml += "    	<div class='comet-avatar modalFeedCommentProfile' id='modalComProfile'>";
	        		cmtHtml += "        	<img src='" + contextPath + userProfile + "' alt='' style='object-fit:cover;'>";
	        		cmtHtml += "    		<div class='we-comment modalFeedCommentTop'>";
	        		cmtHtml += "				<h5><a title='' href='/community/feed/myFeed.do?userNo=" + userNo + "&agId=" + agId + "'>" + mnNickName + "</a></h5>";
	        		for (var i = 0; i < memberShipYn.length; i++) {
	        		    var feed1 = memberShipYn[i];
	        		    console.log("제발",cjNo);
	        		    if (feed1.cjNo == cjNo && userType !='3') {
	        		        cmtHtml += "<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>";
	        		    }
	        		}
		        	if (userType == '3') {
		        		cmtHtml += "<img src='${pageContext.request.contextPath}/resources/images/mark.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 1px;'>";
		        	}
		        	
		        	
	        		cmtHtml += "    	</div>";
	        		cmtHtml += "    </div>";
	        		cmtHtml += "    <p id='modalComContent' class='modalFeedCommentCon'>"+ fcContent +"</p>";
	        		cmtHtml += "    <div class='inline-itms' id='modalcomFcRegdate'>";
	        		cmtHtml += "        <span class='modalFeedCommentDate'>"+ formattedDate +"</span>";
	        		
	        		cmtHtml += "	<div class='modalFeedCommentBtns'>"
	        		cmtHtml += "		<div id='likeFeed2' class='like-button2 modalFeedCommentLike' title='Like/Dislike' data-fcno='" + fcNo + "' data-userno='" + userNo + "' style='cursor: pointer'>";
	        		cmtHtml += "    		<span class='modalFeedCommentLikeBtn'>❤</span>";
	        		cmtHtml += "    		<span class='like-count'>0</span>";
	        		cmtHtml += "		</div>";
	        		if (userNo == loggedUserNo) {
	        		    cmtHtml += "<a title='Edit Comment' href='#' onclick='openEditCommentModal("+ fcNo +", \""+ fcContent +"\")' class='edit-comment' style='margin-right:10px;'><i class='fa fa-edit'></i></a>";
	        		    cmtHtml += "<a title='Delete Comment' href='#' onclick='deleteComment("+ fcNo +")' class='delete-comment'><i class='fa fa-trash'></i></a>";
	        		}
	        		if(userNo != loggedUserNo){
	        		cmtHtml += "<a title='Report Comment' href='#' onclick='reportComment("+ feedNo +", \""+ userNo +"\")' class='report-comment'><i class='fa-sharp fa-regular fa-bell'></i></a>";
	        		}
	        		cmtHtml += "    	</div>";
	        		cmtHtml += "    	</div>";
	        		cmtHtml += "    </div>";
	        		cmtHtml += "</li>";
	        		
        			
        			
        			
        		});
     			$("#ulCommentArea").prepend(cmtHtml);
     			updateLikeCounts();
     			
     			$("#modalmemberShip").empty();
     			
     			var contextPath = ''; 
     			var userNo= data.feedVO.userNo;
     			var agId= data.feedVO.agId;
     			$('#modalnick').attr('href', '/community/feed/myFeed.do?userNo=' + userNo + '&agId=' + agId);
     			var content = data.feedVO.feedContent;
     			var nickname = data.feedVO.mnNickName;
     			var feedRegdate = data.feedVO.feedRegdate;
     			var date = new Date(feedRegdate);
     			var imageName = data.feedVO.userProfile; 
     			var profile = "<img src='" + contextPath + imageName + "' alt=''>";
     			console.log(profile);
     			var mediaType = data.feedVO.faMime;
     			var faFilter = data.feedVO.faFilter;
     			var faSavedname = data.feedVO.faSavedname;
     			var userType=data.feedVO.userType;
    			var cjNo=data.feedVO.cjNo;
    			var memberShipYn = data.memberShipYn;
     			console.log("memberShipYn",memberShipYn);
     			for (var i = 0; i < memberShipYn.length; i++) {
     			    var feed = memberShipYn[i];
     			    console.log("cjNo밑",cjNo);
     			    console.log("feed",feed.cjNo);
     			    if (cjNo == feed.cjNo) {
     			    	$("#modalmemberShip").html("<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 20px;'>");
     			        console.log('cjNo와 memberShipYn의 cjNo가 같습니다.');
     			    } else {
     			        console.log('cjNo와 memberShipYn의 cjNo가 다릅니다.');
     			    }
     			}
     			
    			console.log("cjNo",cjNo);
     			console.log("userType1",userType);
     			// modalMedia 가져오기
     			var modalMedia = $("#modalMedia");

     			// 기존 내용 삭제
     			modalMedia.empty();

     			if (mediaType) {
     			    if (mediaType.includes("image")) {
     			        var modalImage = $("<img>");
     			        modalImage.attr("src", contextPath + "/resources/feed/" + faSavedname);
     			        modalImage.attr("alt", "");
     			       	modalImage.css("width", "100%");
     			       	
     			       	
//		                                    시연용 수정
	     			    modalImage.css("max-height", "700px");
			    		modalImage.css("object-fit", "contain");
// 			        	시연용 추가
			    		modalImage.css("object-position", "left");
// 	     			    modalImage.css("height", "auto");
     			        
     			        if (faFilter === "black-and-white") {
     			            modalImage.css("filter", "grayscale(100%)");
     			        } else if (faFilter === "brightness") {
     			            modalImage.css("filter", "brightness(150%)");
     			        } else if (faFilter === "shake") {
     			            modalImage.css("position", "relative");
     			            modalImage.css("animation", "shake 0.5s");
     			        } else if (faFilter === "invert") {
     			            modalImage.css("filter", "invert(100%)");
     			        } else if (faFilter === "sepia") {
     			            modalImage.css("filter", "sepia(100%)");
     			        } else if (faFilter === "saturate") {
     			            modalImage.css("filter", "saturate(200%)");
     			        } else if (faFilter === "opacity") {
     			            modalImage.css("opacity", "0.5");
     			        } else if (faFilter === "blur") {
     			            modalImage.css("filter", "blur(5px)");
     			        }
     			        modalMedia.append(modalImage);
     			    } else if (mediaType.includes("video")) {
     			        // 동영상인 경우
     			        var video = $("<video controls>");
     			       	video.css("width", "100%");	// 너비 설정
	     			    video.css("height", "auto");
//     			                   시연용 추가
	     			   	video.css("max-height", "760px");
     			        
     			        var source = $("<source>");
     			        source.attr("src", contextPath + "/resources/feed/" + faSavedname);
     			        video.append(source);
     			        if (faFilter === "black-and-white") {
     			            video.css("filter", "grayscale(100%)");
     			        } else if (faFilter === "brightness") {
     			            video.css("filter", "brightness(150%)");
     			        } else if (faFilter === "shake") {
     			            video.css("position", "relative");
     			            video.css("animation", "shake 0.5s");
     			        } else if (faFilter === "invert") {
     			            video.css("filter", "invert(100%)");
     			        } else if (faFilter === "sepia") {
     			            video.css("filter", "sepia(100%)");
     			        } else if (faFilter === "saturate") {
     			            video.css("filter", "saturate(200%)");
     			        } else if (faFilter === "opacity") {
     			            video.css("opacity", "0.5");
     			        } else if (faFilter === "blur") {
     			            video.css("filter", "blur(5px)");
     			        }
     			        modalMedia.append(video);
     			    } else {
     			        console.error("지원되지 않는 미디어 형식입니다.");
     			    }
     			} else {
     			   
     			}

     			if (userType == '3') {
     			    $("#modalmemberShip").html("<img src='${pageContext.request.contextPath}/resources/images/mark.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 1px;'>");
     			}
        		
        		$("#modalProfile").html(profile);
        		$("#modalContent").text(content);
        		$("#modalnick").text(nickname);
        		$("#modalFeedRegdate").text(date.toLocaleString());
        		
        		
        		$('#modalBtn').click();

        	}
        	
        	
        });
        
	
	
};
// $(document).ready(function() {
//     $('#modalCloseButton, .modal').on('click', function() {
//         location.reload(); // 페이지 새로고침
//     });
    
//     // 모달 내부 클릭 시 이벤트 전파 방지
//     $('.modal-content').on('click', function(event) {
//         event.stopPropagation(); // 이벤트 전파 방지
//     });
// });

function myFeedComment(feedNo){
	var feedNo=feedNo;
	var loggedUserNo = $('#myModal').data('loginuser');
    	console.log("feedfeedfeedfeed123",feedNo);
    	console.log("ASDF",feedNo);
    	$("#feedRealNo").val(feedNo);
        $.ajax({
        	type: 'get',
        	url:'/community/feed/artistFeedComment.do?feedNo=' + feedNo,
        	 beforeSend: function(xhr){	
     			xhr.setRequestHeader(header, token);
     		},
        	success: function(data){
        		console.log(data);
        		console.log(data.feedVO.feedContent);
        		// feedCommentList를 이용해서 댓글들을 뿌린다.
     			var cmtHtml = "";
					
     			$("#ulCommentArea").empty();
     			data.feedCommentList.map(function(v,i){
       				var deleteButton = (userNo == loggedUserNo) ? "<a title='Delete Comment' href='#' onclick='deleteComment("+ fcNo +")' class='delete-comment'><i class='fa fa-trash'></i></a>" : "";
       				var fcContent = v.fcContent;
        			var feedNo=v.feedNo;
        			var fcNo = v.fcNo;
        			var fcRegdate = v.fcRegdate;
            		var date = new Date(fcRegdate);
         		    var formattedDate = date.toLocaleString();
        			var feedNo = v.feedNo;
        			var mnNickName = v.mnNickName;
        			var cjNo = v.cjNo;
        			var userNo = v.userNo
        			var agId= v.agId;
        			var userType= v.userType;
        			var memberShipYn = data.memberShipYn;
        			var userProfile = v.userProfile;
	        		var contextPath = '${pageContext.request.contextPath}'; 
	        		cmtHtml += "<li>";
	        		cmtHtml += "	<div class='modalFeedCommentArea'>";
	        		cmtHtml += "    	<div class='comet-avatar modalFeedCommentProfile' id='modalComProfile'>";
	        		cmtHtml += "        <img src='" + contextPath + userProfile + "' alt='' style='object-fit:cover;'>";
	        		cmtHtml += "    	<div class='we-comment modalFeedCommentTop'>";
	        		cmtHtml += "			<h5><a title='' href='/community/feed/myFeed.do?userNo=" + userNo + "&agId=" + agId + "'>" + mnNickName + "</a></h5>";
// 	        		if (cjNo >0 && userType == '2') {
// 	        	   		cmtHtml += "<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 20px;'>";
// 	        		}
					for (var i = 0; i < memberShipYn.length; i++) {
	        		    var feed1 = memberShipYn[i];
	        		    console.log("제발",cjNo);
	        		    if (feed1.cjNo == cjNo &&userType != '3' ) {
	        		        cmtHtml += "<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>";
	        		    }
	        		}
		        	if (userType == '3') {
		        		cmtHtml += "<img src='${pageContext.request.contextPath}/resources/images/mark.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 1px;'>";
		        	}
	        		cmtHtml += "    	</div>";
	        		cmtHtml += "    </div>";
	        		cmtHtml += "        <p id='modalComContent' class='modalFeedCommentCon'>"+ fcContent +"</p>";
	        		cmtHtml += "    <div class='inline-itms' id='modalcomFcRegdate'>";
	        		cmtHtml += "        <span class='modalFeedCommentDate'>"+ formattedDate +"</span>";
	        		
	        		cmtHtml += "	<div class='modalFeedCommentBtns'>"
	        		cmtHtml += "		<div id='likeFeed2' class='like-button2 modalFeedCommentLike' title='Like/Dislike' data-fcno='" + fcNo + "' data-userno='" + userNo + "' style='cursor: pointer'>";
	        		cmtHtml += "    		<span class='modalFeedCommentLikeBtn'>❤</span>";
	        		cmtHtml += "    		<span class='like-count'>0</span>";
	        		cmtHtml += "		</div>";
	        		if (userNo == loggedUserNo) {
	        		    cmtHtml += "<a title='Edit Comment' href='#' onclick='openEditCommentModal("+ fcNo +", \""+ fcContent +"\")' class='edit-comment' style='margin-right:10px;'><i class='fa fa-edit'></i></a>";
	        		    cmtHtml += "<a title='Delete Comment' href='#' onclick='deleteComment("+ fcNo +")' class='delete-comment'><i class='fa fa-trash'></i></a>";
	        		}
	        		if(userNo != loggedUserNo){
	        		cmtHtml += "<a title='Report Comment' href='#' onclick='reportComment("+ feedNo +", \""+ userNo +"\")' class='report-comment'><i class='fa-sharp fa-regular fa-bell'></i></a>";
	        		}
	        		cmtHtml += "    	</div>";
	        		cmtHtml += "    	</div>";
	        		cmtHtml += "    </div>";
	        		cmtHtml += "</li>";

	        		
        			
        			
        			
        		});
     			$("#ulCommentArea").prepend(cmtHtml);
     			updateLikeCounts();
     			
     			
     			$("#modalmemberShip").empty();
     			var contextPath = ''; 
     			var content = data.feedVO.feedContent;
     			var userNo= data.feedVO.userNo;
     			var agId= data.feedVO.agId;
     			$('#modalnick').attr('href', '/community/feed/myFeed.do?userNo=' + userNo + '&agId=' + agId);
     			var nickname = data.feedVO.mnNickName;
     			var feedRegdate = data.feedVO.feedRegdate;
     			var date = new Date(feedRegdate);
     			var imageName = data.feedVO.userProfile; 
     			var profile = "<img src='" + contextPath + imageName + "' alt=''>";
     			console.log(profile);
     			var cjNo = data.feedVO.cjNo;
     			var userType=data.feedVO.userType;
     			var faFilter = data.feedVO.faFilter;
     			var mediaType = data.feedVO.faMime;
     			var faSavedname = data.feedVO.faSavedname;
				
     			var memberShipYn = data.memberShipYn;
     			console.log("memberShipYn",memberShipYn);
     			for (var i = 0; i < memberShipYn.length; i++) {
     			    var feed = memberShipYn[i];
     			    console.log("cjNo",cjNo);
     			    console.log("feed",feed.cjNo);
     			    if (cjNo == feed.cjNo) {
     			    	$("#modalmemberShip").html("<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>");
     			        console.log('cjNo와 memberShipYn의 cjNo가 같습니다.');
     			    } else {
     			        console.log('cjNo와 memberShipYn의 cjNo가 다릅니다.');
     			    }
     			}
     			
     			
     			// modalMedia 가져오기
     			var modalMedia = $("#modalMedia");

     			// 기존 내용 삭제
     			modalMedia.empty();

     			if (mediaType.includes("image")) {
     			    // 이미지인 경우
     			    var modalImage = $("<img>");
     			    modalImage.attr("src", contextPath + "/resources/feed/" + faSavedname);
     			    modalImage.attr("alt", "");
     			  	modalImage.css("width", "100%");
//    			    	modalImage.css("height", "auto");
    			    modalImage.css("max-height", "700px");
//  			        시연용 수정
    			    modalImage.css("object-fit", "contain");
//     			    modalImage.css("object-fit", "cover");
//  			        시연용 추가
    			    modalImage.css("object-position", "left");
   			    
     			   if (faFilter === "black-and-white") {
   				    modalImage.css("filter", "grayscale(100%)");
   				} else if (faFilter === "brightness") { 
   				    modalImage.css("filter", "brightness(150%)"); 
   				} else if (faFilter === "shake") { 
   				    modalImage.css("position", "relative"); 
   				    modalImage.css("animation", "shake 0.5s"); 
   				} else if (faFilter === "invert") { 
   				    modalImage.css("filter", "invert(100%)");
   				} else if (faFilter === "sepia") { 
   				    modalImage.css("filter", "sepia(100%)"); 
   				} else if (faFilter === "saturate") { 
   				    modalImage.css("filter", "saturate(200%)"); 
   				} else if (faFilter === "opacity") { 
   				    modalImage.css("opacity", "0.5"); 
   				} else if (faFilter === "blur") { 
   				    modalImage.css("filter", "blur(5px)"); 
   				}
     			    modalMedia.append(modalImage);
     			} else if (mediaType.includes("video")) {
     			    // 동영상인 경우
     			    var video = $("<video controls>");
     			   	video.css("width", "100%");	// 너비 설정
    			  	video.css("height", "100%");
//	                                    시연용 추가
     			  	video.css("max-height", "760px");
     			  	
     			    var source = $("<source>");
     			    source.attr("src", contextPath + "/resources/feed/" + faSavedname);
     			    video.append(source);
     			   if (faFilter === "black-and-white") {
       				  video.css("filter", "grayscale(100%)");
       				} else if (faFilter === "brightness") { 
       					video.css("filter", "brightness(150%)"); 
       				} else if (faFilter === "shake") { 
       					video.css("position", "relative"); 
       					video.css("animation", "shake 0.5s"); 
       				} else if (faFilter === "invert") { 
       					video.css("filter", "invert(100%)");
       				} else if (faFilter === "sepia") { 
       					video.css("filter", "sepia(100%)"); 
       				} else if (faFilter === "saturate") { 
       					video.css("filter", "saturate(200%)"); 
       				} else if (faFilter === "opacity") { 
       					video.css("opacity", "0.5"); 
       				} else if (faFilter === "blur") { 
       					video.css("filter", "blur(5px)"); 
       				}
     			    modalMedia.append(video);
     			} else {
     			    console.error("지원되지 않는 미디어 형식입니다.");
     			}


     			if (userType == '3') {
     			    $("#modalmemberShip").html("<img src='${pageContext.request.contextPath}/resources/images/mark.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 1px;'>");
     			}
        		
        		$("#modalProfile").html(profile);
        		$("#modalContent").text(content);
        		$("#modalnick").text(nickname);
        		$("#modalFeedRegdate").text(date.toLocaleString());
        		
        		
        		$('#modalBtn').click();

        	}
        	
        	
        
        });
	
	
};

function openEditCommentModal(fcNo, commentContent) {
    $('#editCommentModal').modal('show');
    
    $('#editCommentContent').val(commentContent);
    
    $('#editCommentButton').click(function() {
        var updatedContent = $('#editCommentContent').val();
		console.log("fcNo",fcNo);
        $.ajax({
            url: '/community/feed/comment/updateComment.do',
            type: 'POST',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data:JSON.stringify({fcNo: fcNo, fcContent: updatedContent }),
            contentType: "application/json; charset=utf-8",
            success: function(comment) {
            	 console.log("서버에서 반환한 comment:", comment);
             	 $('#editCommentModal').hide();
             	updateComments(comment);
            },
            error: function(xhr, status, error) {
            	
            }
        });
    });
}
function updateComments(comment) {
	var loggedUserNo = $('#myModal').data('loginuser');
	$.ajax({
	    type: 'get',
	    url: '/community/feed/artistFeedComment.do?feedNo=' + comment,
	    beforeSend: function(xhr){	
			xhr.setRequestHeader(header, token);
		},
	    success: function(data) {
	        var commentsHtml = '';
	        data.feedCommentList.forEach(function(comment) {
	        	console.log("comment",comment);
    			var fcRegdate = comment.fcRegdate;
        		var date = new Date(fcRegdate);
     		    var formattedDate = date.toLocaleString();
     		    var cjNo1 = comment.cjNo;
    			var userType=comment.userType;
    			var memberShipYn = data.memberShipYn;
	            var commentHtml = '<div class="comment">';
	            var contextPath = '${pageContext.request.contextPath}'; 
	            commentHtml += "<li>";
	            commentHtml += "	<div class='modalFeedCommentArea'>";
	            commentHtml += "    	<div class='comet-avatar modalFeedCommentProfile' id='modalComProfile'>";
	            commentHtml += "        <img src='" + contextPath + comment.userProfile + "' alt='' style='object-fit:cover;'>";
	            commentHtml += "    	<div class='we-comment modalFeedCommentTop'>";
	            commentHtml += "			<h5><a title='' href='/community/feed/myFeed.do?userNo=" + comment.userNo + "&agId=" + comment.agId + "'>" + comment.mnNickName + "</a></h5>";
	            for (var i = 0; i < memberShipYn.length; i++) {
        		    var feed1 = memberShipYn[i];
        		    console.log("수정제발요",cjNo1);
        		    if (feed1.cjNo == cjNo1 && userType !='3') {
        		    	commentHtml += "<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>";
        		    }
        		}
	            if (userType == '3') {
	        		commentHtml += "<img src='${pageContext.request.contextPath}/resources/images/mark.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 1px;'>";
	        	}
	            commentHtml += "    	</div>";
	            commentHtml += "    </div>";
	            commentHtml += "        <p id='modalComContent' class='modalFeedCommentCon'>"+ comment.fcContent +"</p>";
	            commentHtml += "    	<div class='inline-itms' id='modalcomFcRegdate'>";
	            commentHtml += "        	<span class='modalFeedCommentDate'>"+ formattedDate +"</span>";
	            
	            commentHtml += "	<div class='modalFeedCommentBtns'>"
	            
	            commentHtml += "		<div id='likeFeed2' class='like-button2 modalFeedCommentLike' title='Like/Dislike' data-fcno='" + comment.fcNo + "' data-userno='" + comment.userNo + "' style='cursor: pointer'>";
	            commentHtml += "    		<span class='modalFeedCommentLikeBtn'>❤</span>";
	            commentHtml += "    		<span class='like-count'>0</span>";
	            commentHtml += "		</div>";
        		if (comment.userNo == loggedUserNo) {
        			commentHtml += "<a title='Edit Comment' href='#' onclick='openEditCommentModal("+ comment.fcNo +", \""+ comment.fcContent +"\")' class='edit-comment' style='margin-right:10px;'><i class='fa fa-edit'></i></a>";
        			commentHtml += "<a title='Delete Comment' href='#' onclick='deleteComment("+ comment.fcNo +")' class='delete-comment'><i class='fa fa-trash'></i></a>";
        		}
        		if(comment.userNo != loggedUserNo){
        		commentHtml += "<a title='Report Comment' href='#' onclick='reportComment("+ comment.feedNo +", \""+ comment.userNo +"\")' class='report-comment'><i class='fa-sharp fa-regular fa-bell'></i></a>";
        		}
        		
        		commentHtml += "    	</div>";
        		commentHtml += "    	</div>";
        		commentHtml += "    </div>";
        		commentHtml += "</li>";

	            commentsHtml += commentHtml;
	        });

	        $('#ulCommentArea').html(commentsHtml);
			$('#commentContent').val('');
	    },
	    error: function(xhr, status, error) {
	        console.error('댓글을 불러오는 중 오류 발생:', error);
	    }
	});

}

</script>
   

