<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="loadMore">
		<div class="central-meta item" style="width: 400px;">
			<div class="user-post">
				<div class="friend-info">
					<c:forEach items="${feedList}" var="feed">
					<figure>
						<img src="${pageContext.request.contextPath }/resources/images/resources/nearly1.jpg"
							alt="">
					</figure>
					<div class="friend-name">
						<div class="more">
							<div class="more-post-optns">
								<i class="ti-more-alt"></i>
								<ul>
<!-- 										이부분 옆에 버튼 메뉴 -->
									<li><i class="fa-sharp fa-regular fa-square-pen"></i> Edit
										Post</li>
									<li><i class="fa-regular fa-trash"></i> Delete Post</li>
									<li class="bad-report"><i
										class="fa-solid fa-flag-checkered"></i> 신고 하기</li>

								</ul>
							</div>
						</div>
						<ins>
							<a href="time-line.html" title="">${feed.mnNickName}</a>
						</ins>
						<span><i class="fa fa-globe"></i> <fmt:formatDate value="${feed.feedRegdate}" pattern="yyyy-MM-dd hh:mm"/> </span>
					</div>
					</c:forEach>
					<div class="post-meta">
						<figure>
							<div class="img-bunch">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-6">
										<figure>
											<a href="#" title="" data-toggle="modal"
												data-target="#img-comt"> ${feed.feedContent}
											</a>
										</figure>
									</div>
								</div>
							</div>
							<ul class="like-dislike">
								<li><a class="bg-purple" href="#" title="Save to Pin Post"><i
										class="ti-pin2"></i></a></li>
								<li><a class="bg-blue" href="#" title="Like Post"><i
										class="ti-thumb-up"></i></a></li>
								<li><a class="bg-red" href="#" title="dislike Post"><i
										class="ti-thumb-down"></i></a></li>
							</ul>
						</figure>
						<div class="we-video-info">
							<ul>
								<li>
									<div class="likes heart" title="Like/Dislike">
										❤ <span>
										좋
<!-- 										좋아요 수증가 -->
										</span>
									</div>
								</li>
								<li><span class="comment" title="Comments"> <i
										class="fa fa-commenting"></i> <ins>
										댓
<!-- 										댓글갯수 -->
										</ins>
								</span></li>
							</ul>
<!-- 							<div class="users-thumb-list"> -->
<!-- 								<a data-toggle="tooltip" title="Anderw" href="#"> <img -->
<!-- 									alt="" -->
<%-- 									src="${pageContext.request.contextPath }/resources/images/resources/userlist-1.jpg"> --%>
<!-- 									여기 좋아요누른 멤버 프로필 -->
<!-- 								</a>  -->
<!-- 							</div> -->
						</div>
					</div>
					<div class="coment-area" style="display: block;">
						<ul class="we-comet">
							<li>
								<div class="comet-avatar">
									<img
										src="${pageContext.request.contextPath }/resourcesimages/resources/nearly3.jpg"
										alt="">
								</div>
								<div class="we-comment">
									<h5>
										<a href="time-line.html" title="">내 닉네임</a>
									</h5>
									<p> 댓글 내용</p>
									<div class="inline-itms">
										<span>작성 시간</span><a href="#"
											title=""><i class="fa fa-heart"></i><span>내 댓글 좋아요 갯수</span></a>
									</div>
								</div>
							</li>

<!-- 								<div class="post-comt-box"> -->
<!-- 									<form method="post"> -->
<!-- 										<textarea placeholder="Post your comment"></textarea> -->
<!-- 										<div class="add-smiles"> -->
<!-- 											<div class="uploadimage"> -->
<!-- 												<i class="fa fa-image"></i> <label class="fileContainer"> -->
<!-- 													<input type="file"> -->
<!-- 												</label> -->
<!-- 											</div> -->
<!-- 											<span class="em em-expressionless" title="add icon"></span> -->
<!-- 											<div class="smiles-bunch"> -->
<!-- 												<i class="em em---1"></i> <i class="em em-smiley"></i> <i -->
<!-- 													class="em em-anguished"></i> <i class="em em-laughing"></i> -->
<!-- 												<i class="em em-angry"></i> <i class="em em-astonished"></i> -->
<!-- 												<i class="em em-blush"></i> <i class="em em-disappointed"></i> -->
<!-- 												<i class="em em-worried"></i> <i class="em em-kissing_heart"></i> -->
<!-- 												<i class="em em-rage"></i> <i class="em em-stuck_out_tongue"></i> -->
<!-- 											</div> -->
<!-- 										</div> -->

<!-- 										<button type="submit"></button> -->
<!-- 									</form> -->
<!-- 								</div> -->
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>


	<div class="modal fade" id="img-comt">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-8">
							<div class="pop-image">
								<div id="demo" class="carousel slide" data-interval="false"
									data-ride="carousel" data-pause="hover">
									<!-- The slideshow -->
									<div class="pop-item">
										<div class="carousel-item active">
											<img
												src="${pageContext.request.contextPath }/resources/images/resources/blog-detail.jpg"
												alt="">
<!-- 												올린사진 슬라이드쇼로 -->
										</div>
									</div>

									<!-- Left and right controls -->
									<a class="carousel-control-prev" href="#demo" data-slide="prev">
										<span class="carousel-control-prev-icon"></span>
									</a> <a class="carousel-control-next" href="#demo"
										data-slide="next"> <span
										class="carousel-control-next-icon"></span>
									</a>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="user">
								<figure>
									<img
										src="${pageContext.request.contextPath }/resources/images/resources/user1.jpg"
										alt="">
<!-- 										유저 프로필 사진 -->
								</figure>
								<div class="user-information">
									<h4>
										<a href="#" title="">게시글이름</a>
									</h4>
									<span>게시 날짜 시간</span>
								</div>
							</div>
							<div class="we-video-info">
								<ul>
									<li>
										<div title="Approvals/Disapprovals" class="likes heart">
											❤ <span>
											좋
<!-- 											좋아요 갯수 -->
											</span>
										</div>
									</li>
									<li><span title="Comments" class="comment"> <i
											class="fa fa-commenting"></i> <ins>
<!-- 											댓글 개수 -->
											댓
											</ins>
									</span></li>

								</ul>
								<div class="users-thumb-list">
									<a href="#" title="" data-toggle="tooltip"
										data-original-title="Anderw"> <img
										src="${pageContext.request.contextPath }/resources/images/resources/userlist-1.jpg"
										alt="">
									</a> 
								</div>
							</div>
							<div style="display: block;" class="coment-area">
								<ul class="we-comet">
									<li>
										<div class="comet-avatar">
											<img alt=""
												src="${pageContext.request.contextPath }/resources/images/resources/nearly3.jpg">
										</div>
										<div class="we-comment">
											<h5>
												<a title="" href="time-line.html">댓글 작성자</a>
											</h5>
											<p>댓글 내용 </p>
											<div class="inline-itms">
												<span>1 year ago</span> <a title="Reply" href="#"
													class="we-reply"><i class="fa-solid fa-circle-check"></i><span>댓글 좋아요</span></a>
											</div>
										</div>

									</li>
									<li>
										
										
										<div class="post-comt-box">
											<form method="post">
												<textarea placeholder="Post your comment"></textarea>
												<div class="add-smiles">
													<div class="uploadimage">
														<i class="fa fa-image"></i> <label class="fileContainer">
															<input type="file">
														</label>
													</div>
													<span title="add icon" class="em em-expressionless"></span>
													<div class="smiles-bunch">
														<i class="em em---1"></i> <i class="em em-smiley"></i> <i
															class="em em-anguished"></i> <i class="em em-laughing"></i>
														<i class="em em-angry"></i> <i class="em em-astonished"></i>
														<i class="em em-blush"></i> <i class="em em-disappointed"></i>
														<i class="em em-worried"></i> <i
															class="em em-kissing_heart"></i> <i class="em em-rage"></i>
														<i class="em em-stuck_out_tongue"></i>
													</div>
												</div>

												<button type="submit"></button>
											</form>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>