<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>회원가입정보입력</title>
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
</head>
<body>
	<section class="ftco-section contact-section">
      <div class="container">
        <div class="row block-9 justify-content-center mb-5">
          <div class="col-md-8 mb-md-5">
          	<a class="navbar-brand" href="main_1.html" style="font-size:56px;"><img src="images/ABO.png"/></a>
            <form action="#" class="bg-light p-5 contact-form">
 
            <table class="form-control-tablel" width="840;" style="padding: 5px 0 5px 0;">
								
								<tr>
									<th>아이디</th>
									<td style="margin-bottom:16px;"><div class="form-group"><input type="text" class="form-control" placeholder="ID"></div></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><div class="form-group"><input type="text" class="form-control" placeholder="NAME"></div></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><div style="display:flex;" class="form-group"><input type="text" class="form-control"><div style="margin:3px">@</div><input 
									type="text" class="form-control"><div style="margin:3px">  </div><select style="width: 110px; font-size: 13px;" name="emailaddr" class="form-control">
											<option value="">직접입력</option>
											<option value="daum.net">daum.net</option>
											<option value="empal.com">empal.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="msn.com">msn.com</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
									</select></div></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><div class="form-group"><input type="text" class="form-control" placeholder="PW">영문/숫자포함 6자이상</div></td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td><div class="form-group"><input type="text" class="form-control" placeholder="PW"></div></td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td><div class="form-group"><input type="text" class="form-control" placeholder="ID"></div></td>
								</tr>
								<tr>
									<th>선호음식</th>
									<td><div class="form-group">
										<input type="checkbox" id="demo-human" name="demo-human">
										<label for="demo-human" style="position: static;"> 
										한식
										</label>
										<input type="checkbox" id="demo-human" name="demo-human">
										<label for="demo-human" style="position: static;"> 
										중식
										</label>
										<input type="checkbox" id="demo-human" name="demo-human">
										<label for="demo-human" style="position: static;"> 
										일식
										</label>
										<input type="checkbox" id="demo-human" name="demo-human">
										<label for="demo-human" style="position: static;"> 
										양식
										</label>
									</div></td>
								</tr>
								<tr>
									<th>나이대</th>
									<td><div class="form-group"><select style="width: 150px; font-size: 13px;" name="emailaddr" class="form-control">
											<option value=''>선택하세요</option>
											<option value='39'>10대</option>
											<option value='40'>20대</option>
											<option value='41'>30대</option>
											<option value='42'>40대</option>
											<option value='43'>50대</option>
											<option value='44'>60대</option>
									</select></div></td>
								</tr>
								<tr>
									<th>지역 (서울시)</th>
									<td><div class="form-group"><select style="width: 150px; font-size: 13px;" name="emailaddr" class="form-control">
											<option value=''>선택하세요</option>
											<option value='45'>강남구</option>
											<option value='46'>강동구</option>
											<option value='47'>강서구</option>
											<option value='48'>강북구</option>
											<option value='49'>관악구</option>
											<option value='50'>광진구</option>
											<option value='51'>구로구</option>
											<option value='52'>금천구</option>
											<option value='53'>노원구</option>
											<option value='54'>도봉구</option>
											<option value='55'>동대문구</option>
											<option value='56'>동작구</option>
											<option value='57'>마포구</option>
											<option value='58'>서대문구</option>
											<option value='59'>서초구</option>
											<option value='60'>성동구</option>
											<option value='61'>성북구</option>
											<option value='62'>송파구</option>
											<option value='63'>양천구</option>
											<option value='64'>영등포구</option>
											<option value='65'>용산구</option>
											<option value='66'>은평구</option>
											<option value='67'>종로구</option>
											<option value='68'>중구</option>
											<option value='69'>중랑구</option>
									</select></div></td>
								</tr>
				
							</table>
							<br>
							
							<div class="d-flex justify-content-center">
								<input type="reset" value="취소" style="margin:5px;" onclick="location.href='main_1.html'" class="btn btn-primary py-3 p=x-5">
								<input type="reset" value="초기화" style="margin:5px;" class="btn btn-primary py-3 p=x-5">
								<input type="submit" value="회원가입" style="margin:5px;" onclick="location.href='signup3.html'" class="btn btn-primary py-3 p=x-5">
								
							</div>

            </form>
          
          </div>
        </div>
      </div>
    </section>


	
</body>
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
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
</html>
