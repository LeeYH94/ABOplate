
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근본 목록</title>
</head>
<body>
<div id="rightSide">

	<div id="right_zzim">

		<div  class="recTit">최근본상품 <span id=recentCnt></span></div>

			<ul></ul>    <!-- 본 상품이 뿌려질 부분  -->
		<div id="paging"><a class="btn_prev" style="cursor:pointer" >이전</a>
		<span  id="currentPage"></span><span id="totalPageCount"></span>
		<a class="btn_next" style="cursor:pointer" >다음</a>
		</div>
	</div>
</div> 
</body>

  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <script typet>
  var Cpage;   // 현재 페이지 

	/* var pagingSize = 4;   // 원하는 페이지 사이즈로 조정하세용  */

	function chkRecent(a){

	var itemID = getCookie("itemID");


	if(itemID){

		var totcount = itemID.split('&').length-1;   //

		var totpage = Math.ceil(totcount / pagingSize) *1;

		

		Cpage = (totpage >= a )? a:1;

		Cpage = (Cpage <1)? totpage:Cpage;

		

		var start = (Cpage-1) * pagingSize;    

	

		for (i = start ; i <= start+(pagingSize-1) ;i++){

		var  thisItem = itemID.split('&')[i];

			if(thisItem){

				var itemId = thisItem.split(':')[0];

				var itemImg = thisItem.split(':')[1];

			$("#right_zzim ul").append('<li><a href="/_detail.php?id='+itemId+'" target="_top"><img src="http://www.xxx.com/images/s'+itemImg+'"  width="75" border=1></a><div class="detail"><a href="javascript:removeRecentItem(\''+thisItem+'\')" class="btn_delete">삭제</a></div></li>')

			}

		}

		

		$("#paging").show();

	}else{

		$("#right_zzim ul").append('<p class="noData">최근 본 상품이<br> 없습니다.</p>');

		$("#paging").hide();$("#recentCnt").text('');

	}

	

	

	updateRecentPage(totcount, Cpage);

	

}

chkRecent(1);



	function removeRecentItem(itemname){

		var itemID = getCookie("itemID");

		itemID = itemID.replace(itemname+"&","");			

		setCookie("itemID",itemID,1);

		chkRecent(Cpage);

	}





	function updateRecentPage(totcount,Cpage){  //  

	

		$("#recentCnt").text(totcount);  //

		

		$("#totalPageCount").text("/"+Math.ceil((totcount / pagingSize) *1)); 

		if(Math.ceil((totcount / pagingSize) *1) < Cpage){

		$("#currentPage").text(Math.ceil((totcount / pagingSize) *1));

		}else{

		$("#currentPage").text(Cpage);  //

		}

	}



	$(".btn_next").on('click',function(){

	chkRecent(Cpage + 1);

	 

	});

	

	$(".btn_prev").on('click',function(){

	chkRecent(Cpage - 1);

	});

	</script>



</html>