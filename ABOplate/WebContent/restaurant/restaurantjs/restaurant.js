/**
 * like()좋아요
 * notify() 신고
 */

function like(){
		$.ajax({
			url : contextPath + "/restaurant/ReviewLike.re",
			type : 'get',
			dataType : 'text',
			success : function(data) {
				if (data.trim() == 'add') {
					$("#likeIcon").style.backgroundColor = "none";
					/*'좋아요'가 취소되었습니다.*/
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
	like();
})


function notify(){
		$.ajax({
			url : contextPath + "/restaurant/ReviewNotify.re",
			type : 'get',
			dataType : 'text',
			success : function(data) {
				if (data.trim() == 'add') {
					$("#notifyIcon").style.backgroundColor = "none";
					/*신고가 취소되었습니다.*/
				} else{
					$("#notifyIcon").style.backgroundColor = "#ff0000";
				}
			},
			error : function() {
				console.log("notify() 오류");
			}
		})
	}


$("notify").click(function() {
	notify();
})
