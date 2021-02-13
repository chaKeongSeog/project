// add schedule popup open
function click_add() {
	var url = "schedulePopup";
	var name = "schedulePopup";
	var option = "width = 600, height = 600 left = 650, top=250,location=no";
	window.open(url,name,option)
};

//datepicker
$(document).ready(function(){
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		showOtherMonths : true,
		showMonthAfterYear : true,
		changeYear : true,
		changeMonth : true,          
       yearSuffix: "년",
      	monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
      	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       dayNamesMin: ['일','월','화','수','목','금','토'],
       dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
	});
	$("#startDate").datepicker();
	$("#endDate").datepicker();
	
	$("#startDate").datepicker('setDate', 'today');
	$("#endDate").datepicker('setDate', 'today');
});

//add schedule
$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
    	var name = $.trim(this.name),
    		value = $.trim(this.value);
    	
        if (o[name]) {
            if (!o[name].push) {
                o[name] = [o[name]];
            }
            o[name].push(value || '');
        } else {
            o[name] = value || '';
        }
    });
    return o;
};

function click_ok(){
	var subject = $('#subject').val().trim();
	var startDate = $('#startDate').val().trim();
	var endDate = $('#endDate').val().trim();
//	var memo = $('#memo').val();
	if(subject == ""){
		alert('제목을 입력해주세요');
		return false;
	}else if(startDate == null){
		alert('시작 날짜를 선택해주세요');
		return false;
	}else if(endDate == null){
		alert('종료 날짜를 선택해주세요');
		return false;
	}
	$.ajax({
		data :{"subject":subject,
			"startDate":startDate,
			"endDate":endDate},
		url : "addSchedule",
		type : "POST",
		dataType : "json",
		success : function(data) {
			opener.parent.location.reload();
			window.close();
		},error:function(req){
			alert('상태:'+req.status);
		}
	});
};