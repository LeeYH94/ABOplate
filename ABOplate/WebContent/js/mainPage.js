/**
 * 
 */
function getPopularList(){
	$.ajax({
		url : contextPath + "/restaurant/RestaurantPopular.re",
		type : "GET"
	});
}

function getMemberBean(sessionId){
	$.ajax({
		url : contextPath + "/member/MemberGetBean.me",
		type : "GET"
	});
}

function getRestaurantRecommend(){
	$.ajax({
		url : contextPath + "/restaurant/RestaurantRecommend.re",
		type : "GET"
	});
}