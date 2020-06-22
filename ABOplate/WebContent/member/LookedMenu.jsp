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



	    var itemID = getCookie("itemID");

		var thisItem='<?=$bookID?>:<?=$itemImage ?>';   // 제품 아이디와 이미지 이름을 저장  2차원 배열처럼 쓸려고 짱구를 굴림...  json 형태로 저장도 가능할텐데.... 그건 취향대로 

		

		if (thisItem){

			if (itemID != "" && itemID != null) {

				if (itemID.indexOf(thisItem) ==-1 ){ //값이 없으면 

						setCookie("itemID",thisItem+"&"+itemID,1);

				 }

			} else {

				if (itemID == "" || itemID == null) {

					setCookie("itemID",thisItem+"&",1);

				}

			}

		}

	}

	checkCookie();



	</script>

</html>