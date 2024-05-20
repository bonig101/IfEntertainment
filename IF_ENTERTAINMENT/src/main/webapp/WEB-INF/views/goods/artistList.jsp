<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    h4 {
        font-family: 'Roboto', sans-serif; /* Roboto 글씨체 적용 */
        text-align: center; /* 가운데 정렬 */
        font-weight: 700; /* 글씨 두께 */
    }
</style>
</head>
<body>
	<div class="central-meta">
								
								<div class="row">
								<c:forEach var="artist" items="${artist }">
									<div class="col-lg-3 col-md-6">
										<div class="dig-pro">
											<div>
												<a href="/entertain/artist/profile/list.do?agId=${artist.agId}">
   													 <img src="${artist.agProfile}" alt="" style="width: 200px; height: 200px; object-fit: cover;">
													</a>
												<div class="user-avatr">
													<img alt="" src="images/resources/admin.jpg" >
												</div>
											</div>
											<div class="digi-meta">
											<h4><a href="product-detail.html" title="">${artist.agName }</a></h4>
												<div class="rate">
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
</body>
</html>