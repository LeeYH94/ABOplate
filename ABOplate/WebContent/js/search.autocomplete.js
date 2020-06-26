/**
 * index에서 검색창 id를 autocomplete자리에 넣기
 */

$("document").ready(() => {
	
	$("#filter").change(() => {
		var filter = $("#filter option:selected").val();
		var search = $("#mainSearch").val();
		var keywords;
		$.ajax({
			type: 'get',
			url: contextPath + "/restaurant/restaurantAutoComplete.re?filter=" + filter + "&search=" + search,
			dataType: "text",
			success: function(data) {
		       	data = data.trim();
		       	//data는 구분자를 가진 String
		       	data = data.replace('[', '');
		       	data = data.replace(']', '');
		       	keywords = Array.from(data.split(','));
		       	console.log(typeof(keywords));
		       	console.log(keywords);
		       	
				$("#mainSearch").autocomplete({
			        source : keywords
//			        select : function( event, ui ) {
//			        	console.log(ui.item);
//			        	goTo(ui.item.value);
////			        	${"#mainSearch"}.text(ui.item);//검색창 값을 ui.item
//			        },
//			        focus : function(event, ui){
//			        	return false;
//			        },
//			        minLength : 1,
//			        autoFocus : true
				});
			}
	  	});
	});
	$("#filter").change();
})