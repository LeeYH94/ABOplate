<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="kor">
  <head>
    <title>리스트 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap" rel="stylesheet">

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
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="../index.jsp">ABO plate</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <c:choose>
			<c:when test="${session_id eq null}">
				<li class="nav-item"><a href="../member/login.jsp" class="nav-link">로그인</a></li>
				<li class="nav-item"><a href="../member/signup.jsp" class="nav-link">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li class="nav-item"><p class="nav-p">${MemberBean.getMember_id()}님</p></li>
	          	<li class="nav-item"><p class="nav-p">${MemberBean.getMember_stamp()}점</p></li>
	          	<li class="nav-item"><a href="../member/mypage.jsp" class="nav-link">마이페이지</a></li>
	          	<li class="nav-item"><a href="${pageContext.request.contextPath}/member/MemberLogOut.me" class="nav-link">로그아웃</a></li>
			</c:otherwise>
			</c:choose>
	          <li class="nav-item"><a href="../other/event.jsp" class="nav-link">이벤트</a></li>
	          <li class="nav-item"><a href="../member/favorites.jsp" class="nav-link">즐겨찾기</a></li>
	          <li class="nav-item"><a href="#" class="nav-link">최근 본 맛집</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
		<!-- 여기가 시작 -->
		<section class="ftco-section">
		<div class="col-md-8">
		<form action="#" class="search-location mt-md-5">
							<div class="row justify-content-center">
								<div class="col-lg-10 align-items-end">
									<div class="form-group">
										<div class="form-field">
											<input type="text" class="form-control" placeholder="Search location" style="border: 1px solid;"></input>
											<button>
												<span class="ion-ios-search"></span>
											</button>
										</div>
									</div>
									<div class=row style="height:60px;">
										<div class="tag-widget post-tag-container">
								            		<div class="tagcloud" style="display:flex;">
								            			<a href="#">위치순</a>
														<a href="#">지역화폐</a>
									              		<a href="#" class="tag-cloud-link">태그1</a>
									              		<a href="#" class="tag-cloud-link">태그2</a>
									              		<a href="#" class="tag-cloud-link">태그3</a>
									              		<a href="#" class="tag-cloud-link">태그4</a>
									              		<a href="#" class="tag-cloud-link">태그5</a>
								            		</div>
								        </div>
							        </div>
								</div>
							</div>
		</form>
		</div>
    	<div class="container" style="margin-left:0;">
	    <div id="map"></div>
        <div class="row justify-content-center">
        	<div class="col-md-5">
        		<div class="property-wrap ftco-animate">
        			<a href="properties-single.html" class="img" style="background-image: url(../images/work-1.jpg);"></a>
        			<div class="text">
        				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
        				<ul class="property_list">
        					<li><span class="flaticon-bed"></span>3</li>
        					<li><span class="flaticon-bathtub"></span>2</li>
        					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
        				</ul>
        				<h3><a href="properties-single.html">The Blue Sky Home</a></h3>
        				<span class="location">Oakland</span>
        				<a href="properties-single.html" class="d-flex align-items-center justify-content-center btn-custom">
        					<span class="ion-ios-link"></span>
        				</a>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-5">
        		<div class="property-wrap ftco-animate">
        			<a href="properties-single.html" class="img" style="background-image: url(../images/work-2.jpg);"></a>
        			<div class="text">
        				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
        				<ul class="property_list">
        					<li><span class="flaticon-bed"></span>3</li>
        					<li><span class="flaticon-bathtub"></span>2</li>
        					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
        				</ul>
        				<h3><a href="properties-single.html">The Blue Sky Home</a></h3>
        				<span class="location">Oakland</span>
        				<a href="properties-single.html" class="d-flex align-items-center justify-content-center btn-custom">
        					<span class="ion-ios-link"></span>
        				</a>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-5">
        		<div class="property-wrap ftco-animate">
        			<a href="properties-single.html" class="img" style="background-image: url(../images/work-3.jpg);"></a>
        			<div class="text">
        				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
        				<ul class="property_list">
        					<li><span class="flaticon-bed"></span>3</li>
        					<li><span class="flaticon-bathtub"></span>2</li>
        					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
        				</ul>
        				<h3><a href="properties-single.html">The Blue Sky Home</a></h3>
        				<span class="location">Oakland</span>
        				<a href="properties-single.html" class="d-flex align-items-center justify-content-center btn-custom">
        					<span class="ion-ios-link"></span>
        				</a>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-5">
        		<div class="property-wrap ftco-animate">
        			<a href="properties-single.html" class="img" style="background-image: url(../images/work-4.jpg);"></a>
        			<div class="text">
        				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
        				<ul class="property_list">
        					<li><span class="flaticon-bed"></span>3</li>
        					<li><span class="flaticon-bathtub"></span>2</li>
        					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
        				</ul>
        				<h3><a href="properties-single.html">The Blue Sky Home</a></h3>
        				<span class="location">Oakland</span>
        				<a href="properties-single.html" class="d-flex align-items-center justify-content-center btn-custom">
        					<span class="ion-ios-link"></span>
        				</a>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-5">
        		<div class="property-wrap ftco-animate">
        			<a href="properties-single.html" class="img" style="background-image: url(../images/work-5.jpg);"></a>
        			<div class="text">
        				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
        				<ul class="property_list">
        					<li><span class="flaticon-bed"></span>3</li>
        					<li><span class="flaticon-bathtub"></span>2</li>
        					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
        				</ul>
        				<h3><a href="properties-single.html">The Blue Sky Home</a></h3>
        				<span class="location">Oakland</span>
        				<a href="properties-single.html" class="d-flex align-items-center justify-content-center btn-custom">
        					<span class="ion-ios-link"></span>
        				</a>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-5">
        		<div class="property-wrap ftco-animate">
        			<a href="properties-single.html" class="img" style="background-image: url(../images/work-6.jpg);"></a>
        			<div class="text">
        				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
        				<ul class="property_list">
        					<li><span class="flaticon-bed"></span>3</li>
        					<li><span class="flaticon-bathtub"></span>2</li>
        					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
        				</ul>
        				<h3><a href="properties-single.html">The Blue Sky Home</a></h3>
        				<span class="location">Oakland</span>
        				<a href="properties-single.html" class="d-flex align-items-center justify-content-center btn-custom">
        					<span class="ion-ios-link"></span>
        				</a>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-5">
        		<div class="property-wrap ftco-animate">
        			<a href="properties-single.html" class="img" style="background-image: url(../images/work-4.jpg);"></a>
        			<div class="text">
        				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
        				<ul class="property_list">
        					<li><span class="flaticon-bed"></span>3</li>
        					<li><span class="flaticon-bathtub"></span>2</li>
        					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
        				</ul>
        				<h3><a href="properties-single.html">The Blue Sky Home</a></h3>
        				<span class="location">Oakland</span>
        				<a href="properties-single.html" class="d-flex align-items-center justify-content-center btn-custom">
        					<span class="ion-ios-link"></span>
        				</a>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-5">
        		<div class="property-wrap ftco-animate">
        			<a href="properties-single.html" class="img" style="background-image: url(../images/work-5.jpg);"></a>
        			<div class="text">
        				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
        				<ul class="property_list">
        					<li><span class="flaticon-bed"></span>3</li>
        					<li><span class="flaticon-bathtub"></span>2</li>
        					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
        				</ul>
        				<h3><a href="properties-single.html">The Blue Sky Home</a></h3>
        				<span class="location">Oakland</span>
        				<a href="properties-single.html" class="d-flex align-items-center justify-content-center btn-custom">
        					<span class="ion-ios-link"></span>
        				</a>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-5">
        		<div class="property-wrap ftco-animate">
        			<a href="properties-single.html" class="img" style="background-image: url(../images/work-6.jpg);"></a>
        			<div class="text">
        				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
        				<ul class="property_list">
        					<li><span class="flaticon-bed"></span>3</li>
        					<li><span class="flaticon-bathtub"></span>2</li>
        					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
        				</ul>
        				<h3><a href="properties-single.html">The Blue Sky Home</a></h3>
        				<span class="location">Oakland</span>
        				<a href="properties-single.html" class="d-flex align-items-center justify-content-center btn-custom">
        					<span class="ion-ios-link"></span>
        				</a>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-5">
        		<div class="property-wrap ftco-animate">
        			<a href="properties-single.html" class="img" style="background-image: url(../images/work-1.jpg);"></a>
        			<div class="text">
        				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
        				<ul class="property_list">
        					<li><span class="flaticon-bed"></span>3</li>
        					<li><span class="flaticon-bathtub"></span>2</li>
        					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
        				</ul>
        				<h3><a href="properties-single.html">The Blue Sky Home</a></h3>
        				<span class="location">Oakland</span>
        				<a href="properties-single.html" class="d-flex align-items-center justify-content-center btn-custom">
        					<span class="ion-ios-link"></span>
        				</a>
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
    	</div>
    </section>
    <!-- 여기가 끝 -->

    <footer class="ftco-footer ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Uptown</h2>
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
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Search Properties</a></li>
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
          <div class="col-md-12 text-center">
	
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <script>var contextPath = "${pageContext.request.contextPath}";</script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=056b94bb5df03a78a04b2c7f67882c60"></script>
  <script src="${pageContext.request.contextPath}/restaurant/restaurantJs/kakaoMap.js"></script>

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
  <script src="https://maps.googleapis.com/maps/api/js?key=&sensor=056b94bb5df03a78a04b2c7f67882c60"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
  
  </body>
</html>