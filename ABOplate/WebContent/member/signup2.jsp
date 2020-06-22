<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="kor">
<head>
<title>회원가입정보입력</title>
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
	<section class="ftco-section contact-section">
      <div class="container">
        <div class="row block-9 justify-content-center mb-5">
          <div class="col-md-6 mb-md-5">
          	<a class="navbar-brand" href="../index.jsp" style="font-size:56px;"><img src="../images/ABO.png"/></a>
            <form name="joinForm" action="${pageContext.request.contextPath}/member/MemberJoinOk.me" class="p-5 bg-light"  method="post">
            	  <div class="form-group">
                    <label for="id">아이디 </label>
                    <input type="text" class="form-control check" id="id" name="memberId" required>
                    <p id="idCheckText"></p>
                  </div>
                  <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" class="form-control" id="name" name="memberName" required>
                  </div>
                  <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control" id="email" name="memberEmail" required>
                    <input type="button" id ="checkEmail" name="memberCerNumber" value="인증번호 받기"  onClick ="sendEmail()"class="btn btn-primary py-3 p=x-5" style="padding: 15px;">
                  	<input type="text" id="verifyNum" name="numberKey" style="padding: 15px; display: none;" >
                  	<input type="button" id="resendEmail" name="resendMail" value="재전송" onclick="sendEmail()" class="btn btn-primary py-3 p=x-5" style="padding: 15px; display: none;">
                  	<input type="button" id="checkVerifyEmail" name="verifyEmail" value="인증" onclick="clickEmail()" class="btn btn-primary py-3 p=x-5" style="padding: 15px; display: none;" >
                  	<p id="emailCheckText"></p>
                  </div>
                  <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="memberPassword" required>
                  
                  </div>
                  <div class="form-group">
                    <label for="password">비밀번호 확인</label>
                    <input type="password" class="form-control" id="password" name="memberRePassword" required>
               
                  </div>
                  <div class="form-group">
                    <label for="nickname">닉네임</label>
                    <input type="text" class="form-control" id="nickname" name="memberNickname" required>
                    <p id="nicknameCheckText"></p>
                  </div>
                  <div class="form-group">
                    <label for="favorite"> 선호음식 : </label>
                    <input type="checkbox" class="check" id="favorite" name="memberFavorite" required>
                    <label for="demo-human" style="position: static;"> 
					한식
					</label>
                    <input type="checkbox" id="favorite" name="memberFavorite" >
                    <label for="demo-human" style="position: static;"> 
					중식
					</label>
                    <input type="checkbox" id="favorite" name="memberFavorite" >
                    <label for="demo-human" style="position: static;"> 
					일식
					</label>
                    <input type="checkbox" id="favorite" name="memberFavorite">
                    <label for="demo-human" style="position: static;"> 
					양식
					</label>
                  </div>
                  <div class="form-group">
                    <label for="age">나이대</label>
                   	<div class="form-group"><select style="width: 150px; font-size: 13px;" name="age" class="form-control check" name="memberAge" required>
										<option value=''>선택하세요</option>
										<option value='10'>10대</option>
										<option value='20'>20대</option>
										<option value='30'>30대</option>
										<option value='40'>40대</option>
										<option value='50'>50대</option>
										<option value='60'>60대</option>
								</select>
					</div>
                  </div>
                  <div class="form-group">
                    <label for="memberRegion">지역(서울시)</label>
                   	<div class="form-group"><select style="width: 150px; font-size: 13px;" class="form-control check" name="memberRegion" required>
										<option value=''>선택하세요</option>
										<option value='45'>강남구</option>
										<option value='46'>강동구</option>
										<option value='47'>강서구</option>
										<option value='48'>강북구</option>
										<option value='49'>관악구</option>
										<option value='51'>광진구</option>
										<option value='52'>구로구</option>
										<option value='53'>금천구</option>
										<option value='54'>노원구</option>
										<option value='55'>도봉구</option>
										<option value='56'>동대문구</option>
										<option value='57'>동작구</option>
										<option value='58'>마포구</option>
										<option value='59'>서대문구</option>
										<option value='61'>서초구</option>
										<option value='62'>성동구</option>
										<option value='63'>성북구</option>
										<option value='64'>송파구</option>
										<option value='65'>양천구</option>
										<option value='66'>영등포구</option>
										<option value='67'>용산구</option>
										<option value='68'>은평구</option>
										<option value='69'>종로구</option>
										<option value='70'>중구</option>
										<option value='71'>중랑구</option>
								</select>
					</div>
                  </div>
                  <div class="form-group justify-content-center">
                  	<input type="button" style="width:100%;" value="가입" onclick="javascript:formSubmit()" class="btn py-3 btn-primary">
                  </div>
                </form>
                
            
          </div>
        </div>
      </div>
    </section>


	
</body>
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
<script src="../js/main.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/member/memberJs/test.js"></script>
</html>
