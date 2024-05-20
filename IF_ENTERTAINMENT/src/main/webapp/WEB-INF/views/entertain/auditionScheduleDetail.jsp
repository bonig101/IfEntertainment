<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="create-post detail_title_box">
		<div class="detail_title">${auditionBoard.bfTitle }</div>
		<div class="detail_date">
		<fmt:formatDate value="${auditionBoard.bfRegdate }" pattern="yyyy-MM-dd hh:mm"/>
		</div>
	</div>
	<div class="bottom_box">
		<div class="about-chnl detail_content_box">
			<div class="detail_content">
				${auditionBoard.bfContent }
			</div>
		</div>
		<div class="detail_bottom_line">
			<div class="detail_button">
				<div class="detail_left_btn">
					<a href="#" 
					title="이전" class="main-btn btn_pre">
						<i class="fa fa-chevron-left" aria-hidden="true"></i>
					</a> 
					<a href="#" title="다음" class="main-btn btn_next">
						<i class="fa fa-chevron-right" aria-hidden="true"></i>
					</a>
				</div>
				<div class="detail_right_btn">
					<a href="/entertain/audition/scheduleList.do" title="목록" class="main-btn go_list" data-ripple="">목록</a>
					 <c:choose>
				        <c:when test="${auditionBoard.bfDelyn == 'Y'}">
				        </c:when>
				        <c:otherwise>
				          <a href="/entertain/audition/auditionSupportGuide.do" title="오디션지원하기" class="main-btn support" data-ripple="">오디션지원하기</a>
				        </c:otherwise>
				    </c:choose>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>