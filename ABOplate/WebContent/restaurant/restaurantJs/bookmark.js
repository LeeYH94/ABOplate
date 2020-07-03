/**
 * 즐겨찾기
 * enroll() 등록,
 */

function enroll(restaurantNum){
		var icon = document.getElementById("bookmarkIcon");
	$.ajax({
		url : contextPath +"/restaurant/restaurantBookmarkOk.re?restaurantNum=" + restaurantNum,
		type : 'GET',
		dataType : 'text',
		success : function(data){
			if(data.trim() == 'add'){
				/*icon.src =" ../images/favoritecolor.png";*/
				icon.src = "../images/favorite.png";
			}else{
				/*icon.src = "../images/favorite.png";*/
				icon.src =" ../images/favoritecolor.png";
			}
		},
		error : function(){
			console.log("enroll() 오류");
		}
	})
$("enroll").click(function(){
	enroll();
})





}