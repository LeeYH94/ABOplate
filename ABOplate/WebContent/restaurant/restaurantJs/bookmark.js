/**
 * 즐겨찾기
 * enroll() 등록,
 */

function enroll(){
	$.ajax({
		url : contextPath +"/restaurant/restaurantBookmarkOk.re",
		type : 'get',
		dataType : 'text',
		success : function(data){
			if(data.trim() == 'add'){
				$("#bookmarkIcon").style.backgroundColor = "#f6ff00";
			}else{
				$("#bookmarkIcon").style.backgroundColor = "none";
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