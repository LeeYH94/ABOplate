/**
 * 
 */


function CookieSave() {
	var r_bean=new RestaurantBean;
	var items = getCookie('r_bean');
	
	var maxItemNum = 5; // 최대 저장 가능한 아이템개수
	  var expire = 7; // 쿠키값을 저장할 기간
	  
	  if (items) {
	    var itemArray = items.split(',');
	    if (itemArray.indexOf(id) != -1) {
	      // 이미 존재하는 경우 종료
	      console.log('Already exists.');
	    }
	    else {
	      // 새로운 값 저장 및 최대 개수 유지하기
	      itemArray.unshift(id);
	      if (itemArray.length > maxItemNum ) itemArray.length = 5;
	      items = itemArray.join(',');
	      setCookie('productItems', items, expire);
	    }
	  }
	  else {
	    // 신규 id값 저장하기
	    setCookie('productItems', id, expire);
	  }
	}