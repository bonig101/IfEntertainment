<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
.nav_box {
	display: none;
}
#membership-title{
	margin-top: 60px;
}
#membership-title h2 {
	color: #fff;
	font-weight: 600;
	font-size: 50px;
}
.no-membership {
    font-size: 20px;
    min-height: 200px;
    text-align: center;
    margin-left: 410px;
    margin-top: 125px;
}
</style>
<div id="membership-title">
	<h2>멤버십</h2>
</div>

<div class="central-meta memebership-box">
	<div class="job-detail membership-notice">
		<h2>💎Membership 이용혜택💎</h2>
			<div class="p-box">
				<p><i class="fa fa-check"></i>커뮤니티 사용시 닉네임 옆에 팬인증 마크 추가</p>
				<p><i class="fa fa-check"></i>멤버십 전용 굿즈샵 이용가능</p>
				<p><i class="fa fa-check"></i>멤버십 전용 게시물 및 라이브시청 가능</p>
			</div>
		
		<!-- <h5>Qualification & Requirements</h5>
		<ul>
			<li>
				<i class="fa fa-check"></i>
				<span>Undergraduate degree in addition to a Master's degree or 1 - 3 years of work experience after completing an undergraduate degree</span>
			</li>
			<li>
				<i class="fa fa-check"></i>
				<span>Outstanding record of academic achievement</span>
			</li>
			<li>
				<i class="fa fa-check"></i>
				<span>Demonstrated aptitude for analytics</span>
			</li>
			<li>
				<i class="fa fa-check"></i>
				<span>Proven record of leadership in a work setting and/or through extracurricular activities</span>
			</li>
			<li>
				<i class="fa fa-check"></i>
				<span>Exceptional analytical and quantitative problem-solving skills</span>
			</li>
			<li>
				<i class="fa fa-check"></i>
				<span>Ability to work collaboratively in a team environment and effectively with people at all levels in an organization</span>
			</li>
			<li>
				<i class="fa fa-check"></i>
				<span>Ability to communicate complex ideas effectively - both verbally and in writing - in English and the local language</span>
			</li>
		</ul> -->
		<!-- <div class="job-tgs">
			<span>Tags:</span>
			<a href="#" title="">Project Manager</a>
			<a href="#" title="">Senior Web Developer</a>
			<a href="#" title="">Frontend Developer</a>
			<a href="#" title="">Backend Developer</a>
		</div>
		<div class="apply-bttons">
			<a class="main-btn" href="#" title="">Apply Now</a>
			<a class="main-btn" href="#" title="">Send Direct Email</a>
		</div> -->
	</div>
</div>

<div class="central-meta">
	<div class="row remove-ext-40">
		<div class="col-lg-12">
			<h4 class="title">나의 멤버십
				<a class="" href="/community/main.do" title="" style="font-size: 15px">새로운 멤버십 가입하기</a>
			</h4>
		</div>
		<c:choose>
			<c:when test="${empty myMembershipList}">
				<div class="no-membership">현재 가입된 멤버십이 존재하지 않습니다.</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${myMembershipList }" var="mymembership" varStatus="idx">
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="game-box">
					<div class="memberships">
						<a href="/community/artist?agId=${mymembership.agId }" title="">
							<img src="${pageContext.request.contextPath }/resources/artImg/${mymembership.agProfile }" alt="">
						</a></div>
					<div class="game-meta">
						<h5><a href="/community/artist?agId=${mymembership.agId }" title="">${mymembership.agId }</a></h5>
						<div class="membershipdays"><fmt:formatDate value="${mymembership.membershipStartday}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${mymembership.membershipEndday}" pattern="yyyy-MM-dd" /></div>
					</div>
				</div>
			</div>
		</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</div>
</div>