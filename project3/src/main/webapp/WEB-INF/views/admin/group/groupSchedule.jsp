<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="registHeader.jsp" %>
</head>   

     
<body>	
<div class="row">
			<div class="col-lg-12 col-xl-12" style = "width:100%;margin-top:25px;">
				<div id="cal_bg" class="card shadow mb-12">
					<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
						<h6 class="text-primary font-weight-bold m-0">
							<span style="color: #46546e; font-weight: bold; text-align: center;"><h6 class="font-weight-bold m-0">[${gno}]번방 일정</h6></span>
						</h6>
					</div>
					<div class="card-body" style="margin-bottom:30px;">
						<div id="groupMemberCard" class="col-lg-12 col-xl-12">
							<div id='calendar'>
  		
 							</div>  
						</div>
					</div>
				</div>
			</div>
		</div>







<script>
	$(function(){
		
		
		
		teamCalander();	
	});
		
	function teamCalander(){
		//현재 날짜
		var now = new Date();
		var year= now.getFullYear();
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
		var chan_val = year + '-' + mon + '-' + day;
		//fullcalandar
		  var calendarEl = document.getElementById('calendar');
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		      },
		      initialDate:chan_val,
		      navLinks: true, // can click day/week names to navigate views
		      businessHours: true, // display business hours
		      editable: false,
		      selectable: true,
		      droppable: false,
		      select:function(event){
//	 	    	  alert(JSON.stringify(event));
		    	  var startDate = event.startStr;
		    	  var endDate = event.endStr;
		    	  var title = prompt('계획을 입력해주세요');
		    	  var id = '${user.id}';
		    	  var gno = '${gno}';
		    	  if(title == null){
		    		  alert('계획을 입력해주세요');
		    		  return false;
		    	  }
		    	   $.ajax({
		     			data :{"title":title,
		     				"startDate":startDate,
		     				"endDate":endDate,
		     				"id":id,
		     				"gno":gno},
		     			url : "<%=request.getContextPath()%>/calendar/GroupAddSchedule",
		     			type : "POST",
		     			dataType : "json",
		     			success : function(res) {
		     				numData = res.num;
		     				calendar.addEvent({
		     					title : title,
		     					start : startDate,
		     					end:endDate,
		     					sno:numData
		     				});
		     			},error:function(req){
		     				alert('상태:'+req.status);
		     			}
		     		  });
		      }, events: [	    	  
		    	  <c:forEach items="${groupSchedule}" var="item">
		    		{
			    	  title : "${item.title}",
			  		  start : "${item.startDate}",
			  		  end : "${item.endDate}",
			  		  sno:"${item.sno}"
		    		}, 
			      </c:forEach>
		    	  {
		   		   title : '',
		   		   start : "",
		   		   end : ""
		   		  }
		      ], eventClick:function(info) {
		    	  event = info.event;
		    	  console.log(JSON.stringify(event));
		    	  var sno = event.extendedProps.sno;
		          if(confirm('정말로 삭제하시겠습니까?')) {
		        	  event.remove();
		        	  $.ajax({
		        		  url:'<%=request.getContextPath()%>/calandar/GroupCalandarDelete',
		        		  type:'post',
		        		  data:{"sno":sno},
		        		  success:function(res){
		        			  
		        		  },error:function(req){
		        			  alert('상태:'+req.status)
		        		  }
		        	  });
		          }
		      }
		    });
		    calendar.render();
	}		
		

	
	
  //팝업창들 뛰우기
  //새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
  function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
  	winleft = (screen.width - WinWidth) / 2;
  	wintop = (screen.height - WinHeight) / 2;
  	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
  							+"height="+ WinHeight +", top="+ wintop +", left=" 
  							+ winleft +", resizable=yes, status=yes"  );
  	win.focus() ; 
  }

  //팝업창 닫기
  function CloseWindow(){
  	if(window.opener)window.opener.location.reload(true);
  	window.close();
  }	

</script>
</html>
</body>

















