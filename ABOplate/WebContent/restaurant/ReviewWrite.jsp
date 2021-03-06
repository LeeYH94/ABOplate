<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<title>리뷰 페이지</title>
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
<body>

	<c:set var="restaurantBean" value="${requestScope.restaurantBean}" />
	<c:if test="">
	
	</c:if>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/main.jsp">ABOplate</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<c:choose>
						<c:when test="${sessionId eq null}">
							<li class="nav-item"><a href="../member/login.jsp"
								class="nav-link">로그인</a></li>
							<li class="nav-item"><a href="../member/signup.jsp"
								class="nav-link">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><p class="nav-p">${memberBean.getMember_nickname()}님</p></li>
							<li class="nav-item"><p class="nav-p">${memberBean.getMember_stamp()}점</p></li>
							<li class="nav-item"><a href="../member/mypage.jsp"
								class="nav-link">마이페이지</a></li>
							<li class="nav-item"><a
								href="${pageContext.request.contextPath}/member/MemberLogOut.me"
								class="nav-link">로그아웃</a></li>
							<li class="nav-item"><a href="../member/favorites.jsp"
								class="nav-link">즐겨찾기</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a href="../other/event.jsp"
						class="nav-link">이벤트</a></li>
					<li class="nav-item"><a href="#" class="nav-link">최근 본 맛집</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap2 hero-wrap-2 ftco-degree-bg js-fullheight"
		style="background-image: url('../images/main.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">

				<p class="mb-3 bread"
					style="position: relative; top: 50px; font-size: 30px;">리뷰페이지</p>

			</div>
		</div>
	</section>

	<div id="mask"></div>
	<!--Popup Start -->
	<div id="layerbox" class="layerpop"
		style="width: 700px; height: 500px;">
		<article class="layerpop_area">
			<div class="title">최근 본 맛집</div>
			<a href="javascript:popupClose();" class="layerpop_close"
				id="layerbox_close">X</a><br>
			<div class="content" style="display: flex;">
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<div class="text">
							<a href="blog-single.html" class="block-20 img"
								style="background-image: url('../images/image_1.jpg');"> </a>
							<p>맛있어보이는 돈까스!</p>
							<div>
								<a href="#" class="meta-chat"><span class="icon-chat"></span>
									3</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<div class="text">
							<a href="blog-single.html" class="block-20 img"
								style="background-image: url('../images/image_2.jpg');"> </a>
							<p>맛있어보이는 냉면!</p>
							<div>
								<a href="#" class="meta-chat"><span class="icon-chat"></span>
									3</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<div class="text">
							<a href="blog-single.html" class="block-20 img"
								style="background-image: url('../images/image_3.jpg');"> </a>
							<p>맛있어보이는 아이스크림!</p>
							<div>
								<a href="#" class="meta-chat"><span class="icon-chat"></span>
									3</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<li><a href="#">&lt;</a></li>
							<li class="active"><span>1</span></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&gt;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</article>
	</div>

	<section class="ftco-section ftco-property-details">

		<div class="container">
			<!-- 리뷰 작성 부분 -->
			<div class="row" style="margin-top: 2.25rem; margin-bottom: 3rem;">
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="property-details">
						<!-- 수정 시작 -->
						<div class="row block-9 justify-content-center mb-5">
							<div class="col-md-8 mb-md-5">

								<form
									action="${pageContext.request.contextPath}/restaurant/ReviewWriteOk.re"
									class="reviewForm" method="POST" name="reviewForm"
									enctype="multipart/form-data">
									<input type="hidden" name="restaurantNum"
										value="${restaurantBean.getRestaurant_num()}">
									<div class="form-group">
										<div>
											<h2>${restaurantBean.getRestaurant_name()}</h2>
											<h8>별점</h8>
											<br>
											<p class="star_rating">
												<input style="display: none;" class="star_rating_cnt"
													value="" name="starRating" />
												<!-- a태그는 별점 jquery 적용해야함 -->
												<a href="#" >★</a> <a href="#" >★</a> <a
													href="#">★</a> <a href="#">★</a> <a href="#">★</a>
											</p>
										</div>
									</div>

									<div class="form-group">
										<textarea name="review" cols="100" rows="10" id="review"
											class="form-control" placeholder="리뷰를 작성해주세요"></textarea>
									</div>

									<!-- 사진 올리기 용 -->
									<div class="row justify-content-center mb-5">
										<div class="col-md-7 text-center heading-section ftco-animate">
											<h2 class="mb-3">Photos Upload</h2>
										</div>
									</div>
									<!--  <div class="row ftco-animate"> -->
									<div class="col-md-12">
										<!-- <div class="carousel-testimony owl-carousel ftco-owl"> -->
										<!-- 한 칸  -->
										<div class="item">
											<div class="testimony-wrap py-4">
												<div class="d-flex align-items-center">
													<div class="text">
														<p class="mb-4">사진 첨부</p>
														<input type="file" name="picture_1"
															accept="image/x-png,image/gif,image/jpeg"> <input
															type="button" onclick="cancelFile('picture_1')"
															value="첨부 삭제">
													</div>
												</div>
											</div>
										</div>
										<div class="item">
											<div class="testimony-wrap py-4">
												<div class="text">
													<p class="mb-4 ">사진 첨부</p>
													<div class="d-flex align-items-center">
														<input type="file" name="picture_2"
															accept="image/x-png,image/gif,image/jpeg"> <input
															type="button" onclick="cancelFile('picture_2')"
															value="첨부 삭제">
													</div>
												</div>
											</div>
										</div>

										<div class="item">
											<div class="testimony-wrap py-4">
												<div class="text">
													<p class="mb-4 ">사진 첨부</p>
													<div class="d-flex align-items-center">
														<input type="file" name="picture_3"
															accept="image/x-png,image/gif,image/jpeg"> <input
															type="button" onclick="cancelFile('picture_3')"
															value="첨부 삭제">
													</div>
												</div>
											</div>
										</div>
										<!-- </div> -->
									</div>
									<!-- </div> -->
									<br> <br>

									<div class="form-group text-right">
										<input type="button" onclick="location.href='javascript:history.back()'"
											value="취소" class="btn btn-primary py-2 px-3"> <input
											type="button" value="작성" onclick="javascript:submitReview()" class="btn btn-primary py-2 px-3">
									</div>
									<!-- form 태그 끝  -->
								</form>
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
									storeInfoBefore</a></li>
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
					-->

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
	<script src="../js/scrollax.min.js"></script>
	<script src="../js/google-map.js"></script>
	<script src="../js/main.js"></script>
	<script src="../js/popup.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<script>
		var rating;
		$('.star_rating a').click(function() {
			$(this).parent().children('a').removeClass('on');
			$(this).addClass('on').prevAll('a').addClass('on');
			rating = $('.star_rating').children('.on').text().length;
			$('.star_rating_cnt').val(rating);
			console.log($('.star_rating_cnt').val());
			return false;
		})
		

		function modifyReview() {
			reviewForm.submit();
		}

		function cancelFile(fileTagName) {

			if ($.browser.msie) {
				$("input[name='" + fileTagName + "']").replaceWith(
						("input[name='" + fileTagName + "']").clone(true));
			} else {
				console.log($("input[name='" + fileTagName + "']").val());
				$("input[name='" + fileTagName + "']").val("");
			}
		}
		
		function submitReview(){
			if ($('.star_rating_cnt').val() == 0){
				alert("별점을 입력해 주세요");
				return false;
			}else if($("#review").val() == ""){
				alert("내용을 입력해 주세요");
				return false;
			}
			reviewForm.submit();
		}
	</script>
</body>
</html>