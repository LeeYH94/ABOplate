/**
 * like()좋아요
 * notify() 신고
 */

function recommend(reviewNum){
		console.log("들어왔어요");
		$.ajax({
			url : contextPath + "/restaurant/ReviewRecommend.re?reviewNum=" + reviewNum,
			type : 'GET',
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

$('#review').on('keyup', function() {
	if($(this).val().length > 50) {
		alert("글자수는 50자로 이내로 제한됩니다.");
		$(this).val($(this).val().substring(0, 50));
	}
});

