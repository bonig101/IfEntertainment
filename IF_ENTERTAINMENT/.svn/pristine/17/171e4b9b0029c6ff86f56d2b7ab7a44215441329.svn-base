<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.central-meta {
    background: none; /* 백그라운드 컬러 없애기 */
    border: none; /* 보더 없애기 */
    padding:0;
}

.row {
    text-align: center; /* 콘텐츠 가운데 정렬 */
}

.header-inner > h2 {
    color: black;
    display: inline-block;
    font-size: 40px;
    font-weight: 400;
    line-height: initial;
    position: relative;
    text-transform: capitalize;
    vertical-align: middle;
    width: 100%;
    margin-bottom: 30px;
    text-align: left; /* 왼쪽 정렬 */
}

.header-inner {
    display: block;
    margin: 0;
    max-width: 0; /* max-width 속성을 0으로 설정하여 제거합니다. */
    text-align: center;
    width: 100%;
    z-index: 3;
    position: relative;
}

.gray-bg {
    float: left;
    width: 100%;
      background: none; 
}

.rate {
    border-top: none; /* border-top 속성 제거 */
    display: none; /* display 속성 제거 */
    padding-top: 10px;
    width: 100%;
}

.dig-pro {
    display: inline-block;
    position: relative;
    width: 100%;
    margin-bottom: 20px;
    border-radius: 10px; /* 원하는 정도로 조정 */

}

.digi-meta {
    display: inline-block;
    margin-top: 20px;
    padding: 0 20px;
    width: 100%;
}

.dig-pro:hover img {
    opacity: 0.8; /* 호버 시 이미지 투명도 조정 */
    transition: opacity 0.3s ease; /* 호버 시 부드러운 전환 효과 추가 */
}

.user-avatr {
    position: absolute;
    top: 45%;
    left: 50%;
    transform: translate(-50%, -50%);
    opacity: 0;
    transition: opacity 0.3s ease; /* 호버 시 부드러운 전환 효과 추가 */
    
}

.dig-pro:hover .user-avatr {
    opacity: 1; /* 호버 시 유저 아바타 보이도록 투명도 조정 */
}

.dig-pro:hover .user-avatr::after {
    content: "If"; /* 보이도록 하는 텍스트 */
    position: absolute;
    top: 10%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white; /* 텍스트 색상 */
    font-size: 24px; /* 텍스트 크기 */
    opacity: 0; /* 초기 투명도 0으로 설정 */
    transition: opacity 0.3s ease; /* 호버 시 부드러운 전환 효과 추가 */
}

.dig-pro:hover .user-avatr::after {
    opacity: 1; /* 호버 시 투명도를 1로 조정하여 텍스트가 나타나도록 함 */
}

.detailFooterbar {
    height: 100px;
    color: #000;
    background-color: transparent;
}

</style>

</head>
<body>

<section>
		<div class="header-inner">
			<h2>Our Artist</h2>
		</div>
</section>

<div class="central-meta">
		<div class="row">
			<c:forEach var="artist" items="${artist }">
				<div class="col-lg-3 col-md-6">
					<div class="dig-pro">
						<div>
							<a href="/entertain/artist/profile/list.do?agId=${artist.agId}">
								<img src="${pageContext.request.contextPath }/resources/artImg/${artist.agProfile}" alt=""
								style="width: 250px; height: 230px; object-fit: cover; border-radius: 7px;">
							</a>
							<div class="user-avatr">
								<img alt="" src="images/resources/admin.jpg">
							</div>
						</div>
						<div class="digi-meta">
							<h4>
								<a href="product-detail.html" title="">${artist.agName }</a>
							</h4>
							<div class="rate"></div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
</body>

</html>