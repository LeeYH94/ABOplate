function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();        
        $.ajax({
			url : contextPath + "/member/MemberJoinOk.me?googleId=" + profile.getId(),
			type : 'get',
			dataType : 'text'
		})       
}