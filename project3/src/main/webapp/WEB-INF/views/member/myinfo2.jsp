<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	table th td{
		color:black;
	}
	a{
		color:black;
	}
</style>
<script>
document.addEventListener('DOMContentLoaded', function() {
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
// 	    	  alert(JSON.stringify(event));
	    	  var startDate = event.startStr;
	    	  var endDate = event.endStr;
	    	  var title = prompt('계획을 입력해주세요');
	    	  var id = '${user.id}';
	    	  if(title == null){
	    		  alert('계획을 입력해주세요');
	    		  return false;
	    	  }
	    	   $.ajax({
	     			data :{"title":title,
	     				"startDate":startDate,
	     				"endDate":endDate,
	     				"id":id},
	     			url : "<%=request.getContextPath()%>/calendar/addSchedule",
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
	    	  <c:forEach items="${showSchedule}" var="item">
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
	        		  url:'<%=request.getContextPath()%>/calandar/calandarDelete',
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
	   
	  
});
</script> 
  <div class="col-xl-12">
      <div class="card mb-4">
          <div class="card-header">
              <p class="text m-0 font-weight-bold">내정보</p>
          </div>
    
     <div class="row">
        <div class="col-md-3">
        <form id="imgForm" name="imgForm" action="imgModify" onsubmit="return false" class="form-horizontal"  method="post" enctype="multipart/form-data">
    	<input type="hidden" name="originFileName" id="originFileName" value="${member.fileName}"/>
    	<input type="hidden" name="id" value="${member.id}"/>
        <div id="profileImg">
            <img alt="" style="width:280px;height:400px;margin:0;padding:0;" title="" class="img-circle img-thumbnail isTooltip" src="<%=request.getContextPath() %>/resources/upload/${member.fileName}" data-original-title="Usuario">
         
			<div class="col-sm-12">
				<input id="fileInput" type="file" data-class-button="btn btn-default" name="file" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="control-label col-sm-3" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
				<div class="bootstrap-filestyle input-group">
					<input type="text" id="userfile" class="form-control" name="userfile" readonly="readonly">
					<span class="group-span-filestyle input-group-btn" tabindex="0">
						<label for="fileInput" class="btn btn-default">
							<span class="glyphicon"><i class="fas fa-upload"></i></span>
						</label>
					</span>
				</div>
			</div>
		</div>  	
            <ul title="Ratings" class="list-inline ratings text-center">
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
            </ul>
            </form>
        </div>
        <div class="col-md-9">
            <div class="table-responsive">
            <form id="memberModify" name="memberModify" action="modify" class="form-horizontal"  method="post" onsubmit="return false">
            <table class="table table-user-information">
                <tbody>
                    <tr>        
                        <td style="vertical-align: middle;width:100px;height:50px;">
                            <strong>
                                <span class="glyphicon glyphicon-asterisk text-primary"></span>
                                ID                                           
                            </strong>
                        </td>
                        <td style="vertical-align: middle;height:50px;">
                        <span class="glyphicon glyphicon-asterisk text-primary"></span>
                           <input class="form-control" type="text" placeholder="ID"  name="id" id="id" value="${member.id}" readonly="readonly">      
                        </td>
                    </tr>
                    <tr>        
                        <td style="vertical-align: middle;width:100px;height:50px;">
                            <strong>
                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
                               Name                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            <input class="form-control" type="text" placeholder="Name" name="name" id = "name" value="${member.name}"readonly="readonly">
                        </td>
                    </tr>

                    <tr>        
                        <td style="vertical-align: middle;width:100px;height:50px;">
                            <strong>
                                <span class="glyphicon glyphicon-bookmark text-primary"></span> 
                               Email                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            <input class="form-control" type="text" placeholder="email" name="email" id = "email" value="${member.email}"> 
                        </td>
                    </tr>


                    <tr>        
                        <td style="vertical-align: middle;width:100px;height:50px;">
                            <strong>
                                <span class="glyphicon glyphicon-eye-open text-primary"></span> 
                                Tel                                              
                            </strong>
                        </td>
                        <td class="text-primary">
                       		<input class="form-control" type="text" placeholder="tel" name="tel" id = "tel" value="${member.tel}">
                        </td>
                    </tr>
                    <tr>        
                        <td style="vertical-align: middle;width:100px;height:50px;">
                            <strong>
                                <span class="glyphicon glyphicon-calendar text-primary"></span>
                                	created                                             
                            </strong>
                        </td>
                        <td class="text-primary">
                            <input class="form-control" type="text" placeholder="created" name="regdate" id = "regdate" value="${member.regdate}" readonly="readonly">
                        </td>
                    </tr>
                    <tr>        
                        <td style="vertical-align: middle;height:50px;">
                            
                        </td>
                        <td class="text-primary">
                            <button type="button" class="btn btn-primary btn-sm" id="memberModifyBtn">회원정보 수정</button> 
                            <button type="button" class="btn btn-primary btn-sm" onclick="memberDelete('${member.id}')">회원 탈퇴</button>
                        </td>
                    </tr>                                    
                </tbody>
            </table>
            </div>
          </div>
       </div>
      </form>
    </div>
    <!-- 비밀번호 수정 -->
    <div class="card mb-4">
	   <div class="card-header">
	       <p class="text m-0 font-weight-bold">비밀번호 수정</p>
	   </div>
	   <div class="row">
		   <div class="col-md-12">
          		<div class="card-body" style="height: 247px;">
          		<form id="pwdModifyForm" name="pwdModifyForm" action="pwdModify" method="post" onsubmit="return false">
          	      <input type="hidden" name="id" value="${member.id}"/>
          	      <div class="form-row">
          	      	  <div class="col">
		                  <div class="form-group">
		                  <label for="currpass"><strong>
		                  		현재 비밀번호</strong>
		                  </label>
		                  <input class="form-control" type="password"  name="currentpassword" id = "currentpassword">
		                  		
		                  </div>
	                  </div>
	                  <div class="col">
	                  
	                  </div>
                  </div>
                  <div class="form-row">
                      <div class="col">
                          <div class="form-group"><label for="password"><strong>변경할 비밀번호</strong></label><input class="form-control" type="password"  name="password"  id = "password"></div>
                      </div>
                      <div class="col">
                          <div class="form-group"><label for="repassword"><strong>변경할 비밀번호 확인</strong></label><input class="form-control" type="password"  name="repassword"  id = "repassword"></div>
                      </div>
                  </div>
                  <div class="form-group"><button class="btn btn-primary btn-sm" id = "Mpwd" >비밀번호 수정</button></div>
                </form>
               </div>
                   
		   </div>
	   </div>
	</div>	
    	
</div>
<!-- 달력 -->
<div class="row">
	<div class="col-md-7">
		<div class="card-body">
		    <div class="card mb-4">
			   <div class="card-header">
			       <p class="text m-0 font-weight-bold">나의 일정</p>
			   </div>
			   <div class="row">
				   <div class="col-md-12">
				   		<div id='calendar'>
			  
		  				</div>       
				   </div>
			   </div>
			</div>  
		</div>
	</div>
		<div class="col-md-5">
		<div class="card-body">
		    <div class="card mb-4">
			   <div class="card-header">
			       <p class="text m-0 font-weight-bold">나의 메모</p>
			   </div>
				  <div class="row">
				   <div class="col-md-12">
				   		<div class="card-body" id="writeArea">
							<input type="text" class="form-control" id="memoListContent"/>
							<div id="memoListWrite">
								<i class="far fa-edit" id="memoListWriteIcon"></i>
							</div>
						</div>
						<div class="card-body">
					   		<div id="con">
							     <h1>목록</h1>
							     <ul id="memoListUl" style="overflow-y: auto; overflow-x:hidden;width: auto; height: 405px;">
							     
							     </ul>
							</div>
						</div>
				   </div>
			   </div>
			</div>  
		</div>
	</div>			 
	 
</div>  	
<script>
	$(function(){
		getMemoList('${user.id}');
		//memo 삭제하기
 		$(this).on('click','#memoListDelete',function(){
 			var mno = $(this).parent().parent().attr('idx');
 			memoDelete(mno,this);
 		});
 		//memo 작성
		$('#memoListWrite').on('click',function(){
			var content = $('#memoListContent').val();
			if(content == ""){
				alert('해야할일 내용을 입력해주세요');
				return false;
			}else if(content.length > 20){
				alert('글자수는 20글자 이하입니다');
				return false;
			}
			$.ajax({
				url:'/project3/member/memoWrite',
				type:'post',
				data:{"content":content,
					  "id":'${user.id}'},
				success:function(res){
					$('#memoListContent').val('');
					getMemoList('${user.id}');
				},error:function(req){
					alert('상태:'+req.status);
				},dataType:'json'	
			});
		});
 		
 		$(this).on('click','#memoListDelete',function(){
 			var mno = $(this).parents('#memoList').attr('idx');
 			memoDelete(mno,this);
 		});
	});
	//to do List 삭제하기
	function memoDelete(mno,li){
		$.ajax({
			url:'/project3/member/memoDelete',
			type:'post',
			data:{"mno":mno},
			success:function(res){
				$(li).parent().parent().remove();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
	}
	//to do List 불러오기
	function getMemoList(id){
		$.ajax({
			url:'/project3/member/getMemoList',
			type:'post',
			data:{"id":id},
			success:function(res){
				var list = res.list;
				var code = "";
				for(var i=0;i<list.length;i++){
				      code += '<li id="memoList" idx = "'+list[i].mno+'">';
				      code += '<span id="memoListSpan">';
				      code += '<i class="fa fa-trash" id="memoListDelete"></i>';
				      code += '</span>'; 
				      code += list[i].content;
				      code += '</li>';
				}
				$('#memoListUl').html(code);
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
	}
	function memberDelete(id){
		var form = $('#memberForm');
		var id = form.find('#id').val();
		alert(id);
		
		
	}
</script>
<script src="<%=request.getContextPath() %>/resources/js/mypage.js"></script> 
</body>
</html>