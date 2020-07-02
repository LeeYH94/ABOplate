<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<title>회원정보수정 페이지</title>
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
	<c:set var="memberBean" value="${requestScope.memberBean}" />
	<c:set var="mpref" value="${requestScope.mpref}"/>
	
	<section class="ftco-section contact-section">
		<div class="container">
			<div class="row block-9 justify-content-center mb-5">
				<div class="col-md-6 mb-md-5">
					<a class="navbar-brand" href="../index.jsp"
						style="font-size: 56px;"><img src="../images/ABO.png" /></a>

					<form name="modifyForm"
						action=""
						class="p-5 bg-light" method="POST">
						<div class="form-group">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="memberId" name="memberId"
								value="${sessionId}" readonly>
						</div>
						
						<div class="form-group">
							<label for="nickname">닉네임</label> <input type="text"
								class="form-control" id="memberNickname" name="memberNickname"
								value="${memberBean.getMember_nickname()}" readonly>
								
						</div>
						<div class="form-group">
							<label for="password">새 비밀번호</label> <input type="password"
								class="form-control" id="newMemberPassword"
								name="newMemberPassword">
						</div>
						<div class="form-group">
							<label for="password">새 비밀번호 확인</label> <input type="password"
								class="form-control" id="newMemberRePassword"
								name="newMemberRePassword">
						</div>
	
						<div class="form-group">
							
							
							<label for="favorite">선호음식 : </label>
							 <input type="checkbox" class="checks"
								id="memberFavorite" name="memberFavorite" value="korean" ${mpref == 'korean' ? "checked":" "}>
							<label for="demo-human" style="position: static;"> 한식 </label>
							 <input
								type="checkbox"  class="checks" id="memberFavorite" name="memberFavorite"
								value="chinese" ${mpref == 'chinese' ? "checked":" "}> <label for="demo-human"
								style="position: static;"> 중식 </label>
								 <input type="checkbox"  class="checks" id="memberFavorite" name="memberFavorite" value="japanese" ${mpref == 'japanese' ? "checked":" "}>
							<label for="demo-human" style="position: static;"> 일식 </label>
							 <input
								type="checkbox"  class="checks" id="memberFavorite" name="memberFavorite"
								value="american" ${mpref == 'american' ? "checked":" "}> <label for="demo-human"
								style="position: static;"> 양식 </label>
						</div>
			
						<div class="form-group">
							<label for="age">지역(서울시)</label>
							<div class="form-group">
								<select style="width: 150px; font-size: 13px;" name="region" id="region"
									class="form-control">
									<option value=''>선택하세요</option>
									<option value='Gwangjin'>광진구</option>
									<option value='Seocho'>서초구</option>
									<option value='Seongdong'>성동구</option>
									<option value='Yangcheon'>양천구</option>
									<option value='Yongsan'>용산구</option>
									<option value='Eunpyeong'>은평구</option>
									<option value='Jongno'>종로구</option>
									<option value='Jungnang'>중랑구</option>
									<option value='Goyang'>고양시</option>
									<option value='Suwon'>수원시</option>
									<option value='Yongin'>용인시</option>
								</select>
							</div>
						</div>
						<div class="form-group justify-content-center">
							<input type="button" style="width: 100%;" value="수정"
								onclick="javascript:formSubmit()" class="btn py-3 btn-primary">
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
<script src="https://maps.googleapis.com/maps/api/js?key=&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
<script src="${pageContext.request.contextPath}/member/memberJs/modify.js"></script>
</html>