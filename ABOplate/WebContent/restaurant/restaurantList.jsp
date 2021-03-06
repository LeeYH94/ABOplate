<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<title>리스트 페이지</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../css/animate.css">

<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">

<link rel="stylesheet" href="../css/aos.css">

<link rel="stylesheet" href="../css/ionicons.min.css">

<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/jquery.timepicker.css">


<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/icomoon.css">
<link rel="stylesheet" href="../css/style.css">
</head>
<body onload="javascript:goDetail();">
	<c:set var="restaurantBeanList" value="${requestScope.restaurantBeanList}" />
	<c:set var="search" value="${requestScope.searchRestaurant}" />
	<c:set var="restaurantBean" value="${requestScope.restaurantBean}" />
	<c:set var="restaurantList" value="${requestScope.restaurant}" />
	
	<c:set var="startPage" value="${requestScope.startPage}" />
	<c:set var="nowPage" value="${requestScope.currentPage}"/>
	<c:set var="endPage" value="${requestScope.endPage}" />
	<c:set var="totalCnt" value="${requestScope.totalCnt}" />
	<c:set var="totalPage" value="${requestScope.totalPage}" />


	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/main.jsp">ABO plate</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse dropmenu" id="ftco-nav">

				<ul class="navbar-nav ml-auto" id="dm_ul">
					<c:choose>
						<c:when test="${sessionId eq null}">
							<li class="nav-item"><a href="../member/login.jsp"
								class="nav-link">로그인</a></li>
							<li class="nav-item"><a href="../member/signup.jsp"
								class="nav-link">회원가입</a></li>
						</c:when>
						<c:when test="${sessionId ne null && memberBean ne null}">
							<li class="nav-item"><p class="nav-p">${memberBean.getMember_nickname()}님</p></li>
							<li class="nav-item"><p class="nav-p">${memberBean.getMember_stamp()}점</p></li>
							<li class="nav-item"><a
								href="${pageContext.request.contextPath}/restaurant/restaurantBookmark.re"
								class="nav-link">즐겨찾기</a></li>
							<li class="nav-item"><a
								href="${pageContext.request.contextPath}/member/mypage.me"
								class="nav-link">마이페이지</a></li>
							<li class="nav-item"><a
								href="${pageContext.request.contextPath}/member/MemberLogOut.me"
								class="nav-link">로그아웃</a></li>
						</c:when>
					</c:choose>
					<li class="nav-item"><a href="../other/event.jsp"
						class="nav-link">이벤트</a></li>
					<li class="nav-item"><a class="nav-link">최근본 맛집</a>
						<ul>
							<li>
								<div class="flavor">
									<div class="d-flex">
										<a href=""> <img src="../images/image_1.jpg"
											style="width: 100px;"></img>aaaa
										</a>
									</div>
								</div>
							</li>
							<li>
								<div class="flavor">
									<div class="d-flex">
										<a href=""> <img src="..images/image_3.jpg"
											style="width: 100px;"></img>bbbb
										</a>
									</div>
								</div>
							</li>
							<li>
								<div class="flavor">
									<div class="d-flex">
										<a href=""> <img src="../images/image_3.jpg"
											style="width: 100px;"></img>cccc
										</a>
									</div>
								</div>
							</li>
							<li>
								<div class="flavor">
									<div class="d-flex">
										<a href=""> <img src="../images/image_4.jpg"
											style="width: 100px;"></img>dddd
										</a>
									</div>
								</div>
							</li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<!-- 여기가 시작 -->
	<section class="ftco-section">
		<div class="col-md-13">
			<form
				action="${pageContext.request.contextPath}/restaurant/RestaurantSearch.re"
				class="search-location mt-md-5">
				<div class="row justify-content-center">
					<div class="form-group">
						<div class="form-field">
							<select style="border: solid 1px;" class="form-control"
								id="filter" name="keyField">
								<option value='restaurant_name' selected>전체</option>
								<option value='restaurant_food_category'>음식 종류</option>
								<option value='restaurant_address'>주소</option>
								<option value='restaurant_best'>모범 음식점</option>
							</select>
						</div>
					</div>
					<div class="col-lg-5 align-items-end">
						<div class="form-group">
							<div class="form-field">
								<input type="text" class="form-control" name="keyWord"
									placeholder="Search location" style="border: 1px solid;"></input>
								<button type="button"
									onclick="${pageContext.request.contextPath}/restaurant/RestaurantSearch.re">
									<span class="ion-ios-search"></span>
								</button>
							</div>
						</div>
						<%-- <div class=row style="height: 60px;">
							<div class="tag-widget post-tag-container">
								<div class="tagcloud" style="display: flex;">
									<a href="#">위치순</a> <a href="${pageContext.request.contextPath}/restaurant/restaurantLocalCurrency.re?restaurantList=${restaurantBean.getRestaurant_local_currency()}">지역화폐</a> 
									<a href="#"
										class="tag-cloud-link">태그1</a> <a href="#"
										class="tag-cloud-link">태그2</a> <a href="#"
										class="tag-cloud-link">태그3</a> <a href="#"
										class="tag-cloud-link">태그4</a> <a href="#"
										class="tag-cloud-link">태그5</a>
								</div>
							</div>
						</div> --%>
					</div>
				</div>
			</form>
		</div>
		<div class="container">
			<div class="row justify-content-center">
				<c:choose>
					<c:when test="${restaurantBeanList ne null}">
						<c:forEach var="restaurantBeanList" items="${restaurantBeanList}">
							<div class="col-md-5">
								<div class="img">
									<a
										href="${pageContext.request.contextPath}/restaurant/RestaurantView.re?restaurantNum=${restaurantBeanList.getRestaurant_num()}">
										<img style="width: 100%; height: 300px;"
										src="${pageContext.request.contextPath}/restaurantImages/${restaurantBeanList.getRestaurant_num()}.jpg"
										class="img-fluid" alt="Colorlib Template">
									</a>
								</div>
								<div class="desc">
									<h3>
										<a
											href="${pageContext.request.contextPath}/restaurant/RestaurantView.re?restaurantNum=${restaurantBeanList.getRestaurant_num()}">
											${restaurantBeanList.getRestaurant_name()} </a>
									</h3>
									<p class="h-info">
										<a
											href="${pageContext.request.contextPath}/restaurant/RestaurantView.re?restaurantNum=${restaurantBeanList.getRestaurant_num()}">
											<span class="location">${restaurantBeanList.getRestaurant_address()}</span>
											<span class="details">${restaurantBeanList.getRestaurant_food_category()}</span>
										</a>
									</p>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:when test="${restaurantBeanList ne null and fn:length(restaurantBeanList) > 0}">
						<c:forEach var="restaurantBeanList" items="${restaurantBeanList}">
							<div class="col-md-5">
								<div class="img">
									<a
										href="${pageContext.request.contextPath}/restaurant/restaurantLocalCurrency.re?restaurantNum=${restaurantBeanList.getRestaurant_num()}">
										<img style="width: 100%; height: 300px;"
										src="${pageContext.request.contextPath}/restaurantImages/${restaurantBeanList.getRestaurant_num()}.jpg"
										class="img-fluid" alt="Colorlib Template">
									</a>
								</div>
								<div class="desc">
									<h3>
										<a
											href="${pageContext.request.contextPath}/restaurant/restaurantLocalCurrency.re?restaurantNum=${restaurantBeanList.getRestaurant_num()}">
											${restaurantBeanList.getRestaurant_name()} </a>
									</h3>
									<p class="h-info">
										<a
											href="${pageContext.request.contextPath}/restaurant/restaurantLocalCurrency.re?restaurantNum=${restaurantBeanList.getRestaurant_num()}">
											<span class="location">${restaurantBeanList.getRestaurant_address()}</span>
											<span class="details">${restaurantBeanList.getRestaurant_food_category()}</span>
										</a>
									</p>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h3>등록된 게시글이 없습니다.</h3>
					</c:otherwise>
				</c:choose>
			</div>
			<%-- <div class="review d-flex">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<c:choose>
								<c:when test="${nowPage > 1}">
									<li><a href="${pageContext.request.contextPath}/restaurant/ReviewList.re?page=${nowPage - 1}">&lt;</a></li>
								</c:when>
							</c:choose>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:choose>
									<c:when test="${i eq nowPage}">
										<li>[${i}]</li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/restaurant/ReviewList.re?page=${i}">[${i}]</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${nowPage < totalPage}">
									<li><a
										href="${pageContext.request.contextPath}/restaurant/ReviewList.re?page=${nowPage + 1}">&gt;</a></li>
										
								</c:when>
							</c:choose>
						</ul>
					</div>
				</div>
			</div> --%>
			<!-- 지역화폐 -->
			<div class="d-flex">
				<div class="col text-center">
					<div class="block-27">
						<ul>
						<c:choose>
						
								<c:when test="${nowPage > 1 and restaurantBeanList ne null and fn:length(restaurantBeanList) > 0}">
									<li><a href="${pageContext.request.contextPath}/restaurant/restaurantLocalCurrency.re?page=${nowPage - 1}">&lt;</a></li> <!-- 이전 -->
								</c:when>
							</c:choose>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:choose>
									<c:when test="${i eq nowPage}">
										<li>[${i}]</li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/restaurant/restaurantLocalCurrency.re?page=${i}">[${i}]</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${nowPage < totalPage}">
									<li><a
										href="${pageContext.request.contextPath}/restaurant/restaurantLocalCurrency.re?page=${nowPage + 1}">&gt;</a></li><!-- 다음 -->
										
								</c:when>
							
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 여기가 끝 -->

	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">ABOplate</h2>
						<p>Far far away, behind the word mountains, far from the
							countries.</p>
						<ul class="ftco-footer-social list-unstyled mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">Community</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Search
									Properties</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>For
									Agents</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Reviews</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>FAQs</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">About Us</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Our
									Story</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Meet
									the team</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Careers</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Company</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>About
									Us</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Press</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Contact</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Careers</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope pr-4"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script>
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=056b94bb5df03a78a04b2c7f67882c60&libraries=services"></script>
	<script
		src="${pageContext.request.contextPath}/restaurant/restaurantJs/kakaoMap.js"></script>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.easing.1.3.js"></script>
	<script src="../js/jquery.waypoints.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>
	<script src="../js/jquery.animateNumber.min.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/jquery.timepicker.min.js"></script>
	<script src="../js/search.autocomplete.js"></script>
	<script src="../js/scrollax.min.js"></script>
	<script src="../js/popup.js"></script>
	<script src="../js/main.js"></script>

</body>
</html>