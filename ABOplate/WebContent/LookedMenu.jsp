
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근본 목록</title>
</head>
<body>

</body>

  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <script >
  function checkCookie() {

	  var cookieCnt=10;	  
	    var foodID = getCookie("foodID");
		/*var thisFood='<?=$food?>:<?=$foodImage ?>';   // 제품 아이디와 이미지 이름을 저장  2차원 배열*/
		String[] cookieList ;// HashMap에 들어갈 key name
		 HashMap map = new HashMap();
		  boolean check = false; // 중복확인체크

		/* if (thisFood){
			if (thisFood != "" && thisFood != null) {
				if (foodID.indexOf(foodID) ==-1 ){ //값이 없으면 
						setCookie("foodID",foodItem+"&"+foodID,1);

				 }

			} else {

				if (foodID == "" || foodID == null) {

					setCookie("itemID",foodItem+"&",1);

				}

			}
			checkCookie();

		} */
		  
		  for(int i=0; i<cookieCnt; i++){
			   map.put(cookieList[i], cookies[i].getValue()); // map에 대입
			  }

			  if(!map.containsValue(request.getParameter("idx"))){ // 중복숫자 x
			   for(var i=map.size()-1; i>0 && i<=cookieList.length; i--){ // 마지막부터
			    if(i!=cookies.length){ // 맨끝은 제외
			     map.remove(cookieList[i]); // 한칸씩 뒤로
			     map.put(cookieList[i], (String)map.get(cookieList[i-1])); // 이동
			    }
			   }
			  } else{ // 중복숫자 o
			   for( i=map.size()-1; i>0 && i<=cookieList.length; i--){ // 마지막부터
			    if(i!=cookies.length){ // 맨끝은 제외
			     if(((String)map.get(cookieList[i])).equals(request.getParameter("idx"))){ // 중복숫자체크
			      check = true; // 확인 후
			     }
			     if(check){ // 중복이 발견 된 곳부터
			      map.remove(cookieList[i]); // 한칸씩 뒤로
			      map.put(cookieList[i], (String)map.get(cookieList[i-1])); // 이동
			     }
			    }
			   }
			  }
			  map.put(cookieList[0], request.getParameter("idx")); // 맨 앞에 현재 본 상품 삽입

			  for( i=0; i<cookieCnt; i++){
			   Cookie cookie = new Cookie(cookieList[i], (String)map.get(cookieList[i])); // 쿠키굽기
			   response.addCookie(cookie);
			  }

			  for( i=0; i<cookieCnt; i++){
			   out.println(cookies[i].getName() + ": " + cookies[i].getValue()+"<br>"); // 쿠키확인
			  }
			  
			  
  }



	</script>

</html>