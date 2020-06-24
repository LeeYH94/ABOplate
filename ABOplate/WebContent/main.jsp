<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="kor">
<head>
<title>메인페이지</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>

</head>
<!-- 페이지 시작 때 popular list 불러옴 -->
<body onload="javascript:goDetail()">
	<c:set var="popularList" value="${requestScope.popularList}"/>
	<c:choose>
	<c:when test="${memberBean ne null}">
		<c:when test="${memberBean.member_type == 1}">
			<script type="javascript:getRestaurantRecommend()"></script>
			<c:set var="recommendList" value="${requestScope.recommendList}"/>
		</c:when>
	</c:when>
	
	</c:choose>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">ABO PLATE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse dropmenu" id="ftco-nav">

				<ul class="navbar-nav ml-auto" id="dm_ul">
					<c:choose>
					<c:when test="${sessionId eq null}">
						<li class="nav-item"><a href="./member/login.jsp" class="nav-link">로그인</a></li>
						<li class="nav-item"><a href="./member/signup.jsp" class="nav-link">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><p class="nav-p">${MemberBean.getMember_nickname()}님</p></li>
	          <li class="nav-item"><p class="nav-p">${MemberBean.getMember_stamp()}점</p></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/mypage.me" class="nav-link">마이페이지</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/MemberLogOut.me" class="nav-link">로그아웃</a></li>
						<li class="nav-item"><a href="${pageContext.request.contextPath}/member/favorites.me" class="nav-link">즐겨찾기</a></li>
					</c:otherwise>
					</c:choose>
					<li class="nav-item"><a href="other/event.jsp" class="nav-link">이벤트</a></li>
					<li class="nav-item"><a class="nav-link">최근본 맛집</a>
						<ul>
							<li>
								<div class="flavor">
									<div class="d-flex">
										<a href="restaurant/storeInfoBefore.jsp"> <img
											src="images/image_1.jpg" style="width: 100px;"></img>aaaa
										</a>
									</div>
								</div>
							</li>
							<li>
								<div class="flavor">
									<div class="d-flex">
										<a href="restaurant/storeInfoBefore.jsp"> <img
											src="images/image_2.jpg" style="width: 100px;"></img>bbbb
										</a>
									</div>
								</div>
							</li>
							<li>
								<div class="flavor">
									<div class="d-flex">
										<a href="restaurant/storeInfoBefore.jsp"> <img
											src="images/image_3.jpg" style="width: 100px;"></img>cccc
										</a>
									</div>
								</div>
							</li>
							<li>
								<div class="flavor">
									<div class="d-flex">
										<a href="restaurant/storeInfoBefore.jsp"> <img
											src="images/image_4.jpg" style="width: 100px;"></img>dddd
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

	<section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight"
		style="background-image: url('images/main.jpg'); background-position: center bottom; background-size: cover;"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center fadeInUp ftco-animated">
					<div style="margin: 0 auto;">
						<form action="#" class="search-location mt-md-5">
							<div class="row justify-content-center">
								<div class="form-group">
									<div class="form-field">
										<select class="form-control" id="filter">
											<option value='name'>전체</option>
											<option value='food_category'>음식 종류</option>
											<option value='address'>주소</option>
											<option value='best_restaurant'>모범 음식점</option>
										</select>
									</div>
								</div>
								<div class="col-lg-8 align-items-end">
									<div class="form-group">
										<div class="form-field">
											<input type="text" class="form-control" placeholder="Search location" id="search">
											<button type="button" onclick="javascript:searchRestaurant()">
												<span class="ion-ios-search"></span>
											</button>
										</div>
									</div>
								</div>
								<div class="col-lg-10 align-items-end">
									<div class="form-group">
										<div class="form-field">
											실시간 차트
											<table style="margin: 0 auto; background-color: white;"
												class="form-control-tablel">
												<tbody>
													<tr>
														<td><div id="ranking" style="padding: 10px;">키워드</div></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="form-group">
										<div class="form-field">
											<input type="button" value="지역화폐"
												class="btn btn-primary py-3 px-5"
												onclick="location.href = '${contextPath}/restaurant/restaurantLocalCurrency.re'"
												style="position: relative;">
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>




	<div id="mask"></div>
	<!--Popup Start -->
	<div class="container">
		<div id="layerbox" class="layerpop"
			style="height: 300px; border-radius: 5% !important;">
			<article class="layerpop_area">
				<div class="title"
					style="color: red; border-radius: 15% 15% 0% 0% !important;">경고
					회원가입 금지</div>
				<a href="javascript:popupClose();" class="layerpop_close"
					id="layerbox_close">X</a><br>
				<div class="content">
					<p>이 페이지는 테스트용 페이지입니다.</p>
					<br>
					<p>따라서 회원가입으로 어떠한 혜택도 받으실 수 없고 넘겨진 개인정보는 즉시 파기할 것입니다.</p>
					<br>
				</div>
			</article>
		</div>
	</div>

	<section class="ftco-section ftco-agent">
		<div class="container">
			<div class="row">
				<div class="col-md-12 pills">
					<div class="bd-example bd-example-tabs">
						<div class="d-flex justify-content-center">
							<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="pills-description-tab" data-toggle="pill"
									href="#pills-description" role="tab"
									aria-controls="pills-description" aria-expanded="true">인기맛집</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									id="pills-manufacturer-tab" data-toggle="pill"
									href="#pills-manufacturer" role="tab"
									aria-controls="pills-manufacturer" aria-expanded="true">회원추천</a>
								</li>
							</ul>
						</div>


						<div class="tab-content" id="pills-tabContent">
							<!-- 인기 맛집 -->
							<div class="tab-pane fade show active" id="pills-description"
								role="tabpanel" aria-labelledby="pills-description-tab">
								<div class="row">
									<c:choose>
									<c:when test="${popularList ne null and fn:length(popularList) > 0}">
										<c:forEach var="restaurantBean" items="${popularList}">
											<div class="col-md-3">
												<div class="agent">
													<div class="img">
														<img style="width: 100%; height: 300px;" 
															src="${pageContext.request.contextPath}/restaurantImages/${restaurantBean.getRestaurant_num()}.jpg"
															class="img-fluid" alt="Colorlib Template">
													</div>
													<div class="desc">
														<h3>
															<a href="${pageContext.request.contextPath}/restaurant/RestaurantView.me?restaurantNum=${restaurantBean.getRestaurant_num}">
															${restaurantBean.getRestaurant_name}
															</a>
														</h3>
														<p class="h-info">
															<span class="location">${restaurantBean.getRestaurant_address}</span> 
															<span class="details">${restaurantBean.getRestaurant_food_category}</span>
														</p>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:when>
									</c:choose>
								</div>
							</div>

							<!-- 회원 추천 -->
							<div class="tab-pane fade" id="pills-manufacturer"
								role="tabpanel" aria-labelledby="pills-description-tab">
								<div class="row">
									<c:choose>
									<c:when test="${sessionId eq null}">
										<div style="margin: 0 auto;">
											<h5 style="text-align: center;">로그인(회원가입)을 하시면 맞춤 맛집을
												추천해드립니다</h5>
											<div class="justify-content-center"
												style="text-align: center;">
												<input type="button" style="margin-bottom: 15px" value="로그인"
													class="btn btn-primary py-3"
													onClick="location.href='./member/login.jsp'"> <input
													type="button" style="margin-bottom: 15px" value="회원가입"
													class="btn btn-primary py-3"
													onClick="location.href='./member/signup.jsp'">
											</div>
										</div>
									</c:when>
									
									<c:when test="${memberBean.getMember_type == 2}">
										<div style="margin: 0 auto;">
											<h5 style="text-align: center;">회원정보를 입력하시면 맞춤 맛집을 추천해드립니다.</h5>
											<div class="justify-content-center"
												style="text-align: center;">
												<input type="button" style="margin-bottom: 15px" value="마이페이지"
													class="btn btn-primary py-3"
													onClick="location.href='./member/mypage'">
											</div>
										</div>
									</c:when>
									
									<c:when test="${memberBean.getMember_type == 1}">
										<c:choose>
										<c:when test="${recommendList != null and fn:length(recommendList) > 0}">
											<c:forEach var="restaurantBean" items="${recommendList}">
												<div class="col-md-3">
													<div class="agent">
														<div class="img">
															<img style="width: 100%; height: 300px;" 
																src="${pageContext.request.contextPath}/restaurantImages/${restaurantBean.getRestaurant_num()}.jpg"
																class="img-fluid" alt="Colorlib Template">
														</div>
														<div class="desc">
															<h3>
																<a href="${pageContext.request.contextPath}/restaurant/RestaurantView.me?restaurantNum=${restaurantBean.getRestaurant_num}">
																${restaurantBean.getRestaurant_name}
																</a>
															</h3>
															<p class="h-info">
																<span class="location">${restaurantBean.getRestaurant_address}</span> 
																<span class="details">${restaurantBean.getRestaurant_food_category}</span>
															</p>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:when>
										</c:choose>
									</c:when>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Uptown</h2>
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
									restaurant</a></li>
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


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=&sensor=false"></script>
	<script src="js/main.js"></script>
	<script type="js/search.autocomplete.js"></script>
	<script src="js/popup.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

</body>
</html>