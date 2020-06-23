<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html lang="kor">
  <head>
    <title>맛집페이지 로그인 후</title>
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
  		<c:set var="List" value="${requestScope.reviewList}"/>
		<c:set var="nowPage" value="${requestScope.currentPage}"/>
		<c:set var="startPage" value="${requestScope.startPage}"/>
		<c:set var="endPage" value="${requestScope.endPage}"/>
		<c:set var="totalCnt" value="${requestScope.totalCnt}"/>
		<c:set var="totalPage" value="${requestScope.totalPage}"/>
		<c:set var="restaurantBean" value="${requestScope.restaurantBean}"/>
    
	  	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="main_2.html">ABO PLATE</a>
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
    
    <section class="hero-wrap2 hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('../images/main.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          
            <p class="mb-3 bread" style="position: relative; top: 50px; font-size: 30px;">맛집페이지</p>

        </div>
      </div>
    </section>
	<!-- 수정 시작 부분 -->
    <section class="ftco-section ftco-agent">
    	<div class="container">
        <div class="row">
        	<div class="col-md-3">
        		<div class="agent">
    					<div class="img img-fluid">
		    				<img src="../images/img_01.jpg" id="img_size"  alt="Colorlib Template">
	    				</div>
	    				
    				</div>
        	</div>
        	<div class="col-md-3">
        		<div class="agent">
    					<div class="img img-fluid">
		    				<img src="../images/img_02.jpg" id="img_size"  alt="Colorlib Template">
	    				</div>
	    				
    				</div>
        	</div>
        	<div class="col-md-3">
        		<div class="agent">
    					<div class="img img-fluid">
		    				<img src="../images/img_03.jpg" id="img_size"  alt="Colorlib Template">
	    				</div>
	    				
    				</div>
        	</div>
        	<div class="col-md-3">
        		<div class="agent">
    					<div class="img img-fluid">
		    				<img src="../images/img_04.jpg" id="img_size" alt="Colorlib Template">
	    				</div>
	    				
    				</div>
        	</div>
        </div>
    	</div>
    </section>
		<!-- 음식점 정보 영역 -->
		<section class="ftco-section01  services-section img mx-md-5" id="#line02" >
    	 
    	    	<div class="container">
    	 
    	<div>
    		<div class="row justify-content-start mb-5">
    			<div id="map"></div>
			
			
          <div class="col-md-6  heading-section heading-section-white ftco-animate">
          	<h1>${RestaurantBean.getRestaurant_name()} </h1><br> <!-- 이름 -->
          	<h3>${RestaurantBean.getRestaurant_name()}</h3>
          	<c:choose>  
	   			<c:when test="${session_id eq !null}">
	   				<div class="form-group text-right">
						<a href="#" class="reply" style="background:none;"><img src="../images/favorite.png" width="25px" height="25px"></a>
					</div>
				</c:when>
			</c:choose>
			<!-- 로그인 시 북마크 표시 뜨게함 -->
			
          	<strong><span>${RestaurantBean.getRestaurant_ration_total()}</span></strong> <!-- 평점 -->
          </div>
          	</div>
          	
		 
        </div>
        
        
         <div class="row text-right col-md-5 ftco-animate">
       	 </div>
    	<div class="row">
					<div class="col-md-7" >
						<!-- 음식점 정보 테이블 시작 -->
						<div>
							<table>
								<tbody>
									<tr>
										<th>주소</th>
										<td>${RestaurantBean.getRestaurant_address_road()}<br>
											<span>지번 : </span> <span>${RestaurantBean.getRestaurant_address()}</span>
										</td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td>${RestaurantBean.getRestaurant_tel()}</td>
									</tr>
									<tr>
										<th>음식 종류</th>
										<td><span>${RestaurantBean.getRestaurant_food_category()}</span></td>
									</tr>
									<tr>
										<th>시설정보</th>
										<td>${RestaurantBean.getRestaurant_facility()}</td> 
									</tr>
									<tr>
										<th>재난지원금</th>
										<td>${RestaurantBean.getRestaurant_disaster_grant()}</td>
									</tr>
									<tr>
										<th>지역화폐</th>
										<td>${RestaurantBean.getRestaurant_local_currency()}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
    		</div>
    		
    	<!-- 리뷰 부분 -->	
     <div class="ftco-section01  services-section" id="line02">
    
   	<div class="container">
   	
 		<div class="row">
 		
			<div class="col-md-12 pills">
			
						<div class="bd-example bd-example-tabs">
							

						  <div class="tab-content" id="pills-tabContent">

						    <div id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
						    
						      <div class="row">
						      		
							   			<div class="col-md-7">
							   			<form action="${pageContext.request.contextPath}/restaurant/ReviewWriteOk.re?seq=${restaurantBean.getrestaurant_num()}" method="post" name="Review">
							   			<h3 class="head">Reviews</h3>
											<div class="text-right">
												
												<div class="form-field">
													<p><a href="${pageContext.request.contextPath}/restaurant/ReviewWrite.re">[글쓰기]</a></p>
					            					<p>글 개수 : ${totalCnt}</p>
						              			</div>
											</div>
										<c:choose>
										<c:when test="${list != null and fn:length(list) > 0}">	
										<c:forEach var="r_bean" items="${reviewList}">
							   			<div class="review d-flex">
							   				
									   		<div class="user-img" style="background-image: url(../images/apeach_01.jpeg)"></div>
									   		<div class="desc">
									   			<h4>
									   				<span class="text-left">${r_bean.getMember_id()}</span>
									   				<span class="text-right">${r_bean.getBoard_date()}</span>
									   			</h4>
									   			
									   			<p class="star">
									   				<span>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
								   					</span>
								   					<span class="text-right">
								   					<c:if test="${r_bean.getMember_id() eq session_id}">
														<a href="${pageContext.request.contextPath}/restaurant/ReviewModify.re?seq=${r_bean.getreview_num()}">[수정]</a>&nbsp;&nbsp;
														<a href="${pageContext.request.contextPath}/restaurant/ReviewDeleteOk.re?review_num=${r_bean.getreview_num()}&seq=${restaurantBean.getrestaurant_num()}">[삭제]</a>&nbsp;&nbsp;
													</c:if>
													
														<a href="like()" name="like" class="reply" style="background:none;"><img id="likeIcon" src="../images/좋아요.jpg" width="25px" height="25px"></a>
														<a href="notify()" name="notify" class="reply" style="background:none;"><img src="../images/신고.jpg" width="25px" height="25px"></a>
													</span>
									   			</p>
									   			<p>${r_bean.getReview_contents()}</p>
									   		</div>
									   		
									   	</div>
									   	</c:forEach>
									   	</c:when>
										<c:otherwise>
											<div class="review d-flex">
									   			<p>등록된 리뷰가 없습니다.</p>
									   		</div>
										</c:otherwise>
										</c:choose>
										
										<br/>
										<br/>
									   	
									   	<div class="review d-flex">
									   			<div class="col text-center">
            										<div class="block-27">
											              <ul>
											              <c:choose>
															<c:when test="${nowPage > 1}">
											                	<li><a href="#">&lt;</a></li>
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
																<li><a href="${pageContext.request.contextPath}/restaurant/ReviewList.re?page=${nowPage + 1}">&gt;</a></li>
															</c:when>
														</c:choose>
											              </ul>
											            </div>
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
						    
    		</div>
    		
    		</div>
    </section>
	
   
   
   
	<section>
    <footer class="ftco-footer img mx-md-5">
      <div class="container">
        <div class="row">
         <div class="col-md"> 
            <div class="ftco-footer-widget">
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
    </section> 
    
 
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
  <script src="https://maps.googleapis.com/maps/api/js?key=&sensor"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
    
  </body>
</html>