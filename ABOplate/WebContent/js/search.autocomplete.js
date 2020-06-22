/**
 * index에서 검색창 id를 autocomplete자리에 넣기
 */



function autoComplete(){
	var filter = $("#filter option:selected").val();
    $( "#search" ).autocomplete({
        source : function() {
             $.ajax({
                    type: 'get',
                    url: contextPath + "/restaurant/restaurantAutoComplete.re?filter=" + filter,
                    dataType: "text",
                    success: function(data) {
                    	data = data.trim();
                    	//data는 구분자를 가진 String
                    	data = data.replace('[', '');
                    	data = data.replace(']', '');
                    	var dataArray = data.split(',');
                    	return dataArray;
                    }
               });
            },
        select: function( event, ui ) {
        	//검색창 값을 ui.item
        },
        focus:function(event, ui){
        	return false;
        }
    });
}