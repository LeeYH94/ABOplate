<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
	<c:set var="reviewBean" value="${requestScope.reviewBean}"/>
	<c:set var="restaurantBean" value="${requestScope.restaurantBean}"/>
	<c:set var="modify"/>
	

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="../index.jsp">ABOplate</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="../member/login.jsp" class="nav-link">로그인</a></li>
	          <li class="nav-item"><a href="../member/signup.jsp" class="nav-link">회원가입</a></li>
	          <li class="nav-item"><a href="../other/event.jsp" class="nav-link">이벤트</a></li>
	          <li class="nav-item"><a href="javascript:goDetail('테스트');" class="nav-link">최근 본 맛집</a></li>
	        </ul>
	      </div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap2 hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('../images/main.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          
            <p class="mb-3 bread" style="position: relative; top: 50px; font-size: 30px;">리뷰페이지</p>

        </div>
      </div>
    </section>

	<div id="mask"></div>
		    <!--Popup Start -->
		    <div id="layerbox" class="layerpop" style="width:700px; height:500px;">
		        <article class="layerpop_area">
		        <div class="title">최근 본 맛집</div>
		        <a href="javascript:popupClose();" class="layerpop_close" id="layerbox_close">X</a><br>
		        		<div class="content" style="display:flex;">
					          <div class="col-md-4 d-flex ftco-animate">
					          	<div class="blog-entry justify-content-end">
					              <div class="text">
					                <a href="blog-single.html" class="block-20 img" style="background-image: url('../images/image_1.jpg');">
						              </a>
						              <p>맛있어보이는 돈까스!</p>
					                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
					              </div>
					            </div>
					          </div>
					          <div class="col-md-4 d-flex ftco-animate">
					          	<div class="blog-entry justify-content-end">
					              <div class="text">
					                <a href="blog-single.html" class="block-20 img" style="background-image: url('../images/image_2.jpg');">
						              </a>
						              <p>맛있어보이는 냉면!</p>
					                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
					              </div>
					            </div>
					          </div>
					          <div class="col-md-4 d-flex ftco-animate">
					          	<div class="blog-entry justify-content-end">
					              <div class="text">
					                <a href="blog-single.html" class="block-20 img" style="background-image: url('../images/image_3.jpg');">
						              </a>
						              <p>맛있어보이는 아이스크림!</p>
					                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
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
				<div class="text text-left">
						<h2>음식점 이름</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="property-details">
						<!-- 수정 시작 -->
						<div class="row block-9 justify-content-center mb-5">
							<div class="col-md-8 mb-md-5">

								<form action="#" class="bg-light p-5 contact-form ">
									<div class="form-group">
										<div>
											<h8>이 가게의 별점</h8>
											<br>
											<p class="star_rating">
												<!-- a태그는 별점 jquery 적용해야함 -->
												<a href="#" class="on">★</a> <a href="#" class="on">★</a> <a
													href="#" class="on">★</a> <a href="#">★</a> <a href="#">★</a>
											</p>
										</div>
									</div>

									<c:choose>
									<c:when test="test="${modify ne null}">
									<div class="form-group">
									<c:choose>
									<c:when test="${modify ne null}">
										<textarea name="" id="" cols="100" rows="10" class="form-control" placeholder="리뷰내용"></textarea>
									</c:when>
									<c:otherwise>
										<textarea name="" id="" cols="100" rows="10" class="form-control" placeholder="리뷰내용" readonly></textarea>									
									</c:otherwise>		
									</c:choose>		
									</div>
									
									</c:when>
									</c:choose>
									
									

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
																<p class="mb-4">사진부분1</p>
																<div class="pl-3"></div>
															</div>
														</div>
													</div>
												</div>
												<div class="item">
													<div class="testimony-wrap py-4">
														<div class="text">
															<p class="mb-4 ">사진부분2</p>
															<div class="d-flex align-items-center">
																<div class="pl-3"></div>
															</div>
														</div>
													</div>
												</div>

												<div class="item">
													<div class="testimony-wrap py-4">
														<div class="text">
															<p class="mb-4 ">사진부분3</p>
															<div class="d-flex align-items-center">
																<div class="pl-3"></div>
															</div>
														</div>
													</div>
												</div>
												<div class="item">
													<div class="testimony-wrap py-4">
														<div class="text">
															<p class="mb-4 ">사진부분4</p>
															<div class="d-flex align-items-center">
																<div class="pl-3"></div>
															</div>
														</div>
													</div>
												</div>
												<div class="item">
													<div class="testimony-wrap py-4">
														<div class="text">
															<p class="mb-4 ">사진부분5</p>
															<div class="d-flex align-items-center">
																<div class="pl-3"></div>
															</div>
														</div>
													</div>
												</div>
											<!-- </div> -->
										</div>
									<!-- </div> -->
									
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
              <p>Far far away, behind the word mountains, far from the countries.</p>
              <ul class="ftco-footer-social list-unstyled mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Community</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Search storeInfoBefore</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>For Agents</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Reviews</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>FAQs</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">About Us</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Our Story</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Meet the team</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Careers</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Company</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>About Us</a></li>
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
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope pr-4"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">-->

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
	
</body>
</html>