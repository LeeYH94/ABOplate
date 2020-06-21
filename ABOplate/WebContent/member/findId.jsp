<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
  <head>
    <title>아이디 찾기 페이지</title>
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
	      <a class="navbar-brand" href="../index.jsp">ABO PLATE</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="login.jsp" class="nav-link">로그인</a></li>
	          <li class="nav-item"><a href="signup.jsp" class="nav-link">회원가입</a></li>
	          <li class="nav-item"><a href="../other/event.jsp" class="nav-link">이벤트</a></li>
	          <li class="nav-item"><a href="" class="nav-link">최근 본 맛집</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

	<section class="ftco-section ftco-agent">
    	<div class="container">
    		<div class="row">
      		<div class="col-md-12 pills">
						<div class="bd-example bd-example-tabs">
							<div class="d-flex justify-content-center">
							  <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

							    <li class="nav-item">
							      <a class="nav-link active" id="pills-description-tab" data-toggle="pill" href="#pills-description" role="tab" aria-controls="pills-description" aria-expanded="true">아이디 찾기</a>
							    </li>
							    <li class="nav-item">
							      <a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill" href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer" aria-expanded="true">비밀번호 재설정</a>
							    </li>
							  </ul>
							</div>
						
						
						  <div class="tab-content" id="pills-tabContent">
						  	<!-- 아이디 찾기 -->
						  	<div class="tab-pane fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab">
						    	<div class="row">
					     
						          <div style="margin:0 auto;" class="col-md-8 mb-md-5">
						            <form action="${pageContext.request.contextPath}/member/MemberCheckEmail.me" class="bg-light p-5 contact-form">
						              <div class="form-group">
						                <input type="text" class="form-control" placeholder="이름" name="memberName">
						              </div>
						              <div class="form-group">
						                <input type="email" class="form-control" placeholder="이메일" name="memberEmail">
						               
						                <input  type="submit" value="인증번호 받기" class="btn btn-primary py-3 p=x-5" style="padding: 15px;" name="cerNumber">
						              </div>
						    
						              <!-- <div class="form-group">
						                <input type="text" class="form-control" placeholder="인증번호 입력">
						                <input  type="submit" value="인증번호 확인" class="btn btn-primary py-3 p=x-5" style="padding: 15px;">
						              </div> -->
						              <div class="d-flex justify-content-center">	
							              <div class="form-group">
							                <input type="submit" value="    아이디 찾기    " class="btn btn-primary py-3 px-5">
							              </div>
							              </div>

						            </form>
						          
						          </div>

					        	
						    </div>
						    </div>
						  
						  <!-- 비밀번호 재설정 -->
						    <div class="tab-pane fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-description-tab">
						    <div class="row">
						    	<div id="find" style="margin:0 auto;" class="col-md-8 mb-md-5">
						            <form action="#" class="bg-light p-5 contact-form">
						              <div class="form-group">
						                <input type="text" class="form-control" placeholder="이름" name="memberName">
						              </div>
						              <div class="form-group">
						                <input type="text" class="form-control" placeholder="아이디" name="memberId">
						              </div>
						              <div class="form-group">
						                <input type="email" class="form-control" placeholder="이메일" name="memberEmail">
						                <input  type="submit" value="인증번호 받기" class="btn btn-primary py-3 p=x-5" style="padding: 15px;">
						              </div>
						              <!-- <div class="form-group">
						                <input type="text" class="form-control" placeholder="인증번호 입력" name="memberCerNumber">
						                <input  type="submit" value="인증번호 확인" class="btn btn-primary py-3 p=x-5" style="padding: 15px;">
						              </div> -->
						              <div class="d-flex justify-content-center">	
							              <div class="form-group">
							                <input type="submit" value="비밀번호 재설정" class="btn btn-primary py-3 px-5" name="memberPasswordConfig">
							              </div>
							              </div>
						            </form>
						          
						          </div>
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
  <script src="../https://maps.googleapis.com/maps/api/js?key=&sensor=false"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
  <script src="${pageContext.request.contextPath}/member/memberJs/test.js"></script>
  </body>
</html>