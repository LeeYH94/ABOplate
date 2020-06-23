/**
 * 
 * like()좋아요
 * 
 */

function like(){
		$.ajax({
			url : contextPath + "/restaurant/ReviewLike.re",
			type : 'get',
			dataType : 'text',
			success : function(data) {
				if (data.trim() == 'add') {
				$("#likeIcon").style.backgroundColor = "none";
				} else{
					$("#likeIcon").style.backgroundColor = "#ff0000";
				}
			},
			error : function() {
				console.log("like() 오류");
			}
		})
	}


$("like").click(function() {
	checknickname();
})
