<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
	<%@include file="registHeader.jsp" %>
</head> 
<body>	
<!-- 		<div class = "row"> -->
<!-- 			<div class = "col-lg-4" style = "text-align: center;"> -->
<!-- 			</div> -->
<!-- 			<div class = "col-lg-4" style = "text-align: right;"> -->
<!-- 				<div id = "originshowbtn"> -->
<!-- 					<input type="button" class="btn btn-danger" value="닫기" id="cancel"> -->
					
<!-- 					<div style="clear:both;"></div> -->
<!-- 				</div> -->
				
<!-- 		 	</div> -->
<!-- 		</div> -->
<div class="row">
	<c:forEach var="member" items="${member}">
			<div class="col-lg-12 col-xl-12" style = "margin :0 auto;width:100%;">
				<div id="cal_bg" class="card shadow mb-4">
					<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
						<h6 class="text-primary font-weight-bold m-0">
							<span style="color: #46546e; font-weight: bold; text-align: center;"><span id="postTit" style = "font-size: 25px; margin-left: 5px;">[${gno}]번 방 회원</span></span>
						</h6>
					</div>
					<div class="card-body">
						<div class="cal-area" id="calarea">
							<span id = "postNum" hidden = "true">1</span>
							<div class = "row">
								<div class = "col-lg-6">
									<img src="/project3/resources/upload/${member.fileName}" alt="" class="media-object img-circle" style="width:50px;height:50px;border-radius:30px;"/>
									<span id = "id" style="font-size: 18px; font-weight: bolder;">${member.memberName}</span>
									<span id = "ctrgb">(${member.id})</span>
								</div>	
							</div>
							<div class = "row">

							</div>
							<hr>
							<span id = "postDt" style = "margin-top: 7px;font-size: 18px; font-weight: bolder;">하루 공부 계획</span>
							<div id = "postCt" style = "width: 90%; max-height:auto;padding: 5px;">
								<c:forEach var="todolist" items="${member.todoList}">
									<div id="todoListArea" style="margin: 5px 0">
										<form action="<%=request.getContextPath()%>/group/todoListModify" onsubmit="return false" id="todoForm" style="display:none;">
											<input type="hidden" class="form-control" name="gtno" id="gtno" value="${todolist.gtno}"/>
											<input type="hidden" class="form-control" name="gno" id="gno" value="${todolist.gno}"/>
											<input type="hidden" class="form-control" name="id" id="id" value="${todolist.id}"/>
											<input type="text" class="form-control" name="title" id="title" value="${todolist.title}"/>
											<textarea class="form-control" name="content" id="content" cols="30" rows="10">${todolist.content}</textarea>
											<button class="btn btn-primary btn-sm" onclick="modify(this)">수정</button>
											<button class="btn btn-primary btn-sm" onclick="cancel(this)">취소</button>
										</form>
										<div style="border:1px solid #dfdfdf;border-radius:10px;" id="todoArea">		
											<div style="margin: 10px;">								
												<p style="float:left;" id="todoListTitle">
													제목:${todolist.title}
												</p>
												<p style="float:right;" id="todoListRegdate">
													${todolist.regdate}
												</p>
											<div style="clear:both;"></div>
												<p id="todoListContent">
													내용:${todolist.content}
												</p>
												[<span style="color:blue" onclick="modifyMode(this)">수정</span>]
												[<span style="color:red" onclick="todoListDelete('${todolist.gtno}',this)">삭제</span>]
											</div>		
										</div>	
									</div>	
								</c:forEach>
								<div style="clear:both;"></div>		
							</div>
							<hr />
						</div>
						<div class = "row">
							<div class = "col-lg-4" style = "text-align: center;">
								
							</div>
							<div class = "col-lg-4" style = "text-align: right;">
								<div id = "originShowbtn">
<!-- 										<input type="button" class="btn btn-primary" value="작성" id="write"> -->
										<input type="button" class="btn btn-danger" value="닫기" onclick="popupclose()">
									<div style="clear:both;"></div>
								</div>
						 	</div>
						</div>
					</div>
				</div>
			</div>
	</c:forEach>
</div>




  <!-- The Modal -->
  <div class="modal fade" id="memberModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">하루 일정 작성</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form action="<%=request.getContextPath()%>/admin/groupTodoListWrite" id="todoListForm">
          	<input type="hidden" name="gno" id="gno" value="${gno}"/>
          	<input type="hidden" name="id" id="id" value="${user.id}"/>
          	<input class="form-control" type="text" name="title" id="title"/>
          	<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
          </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal" id="groupTodoListWrite">작성</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
 
<script>
	$(function(){	
		$('#write').on('click',function(){
			$('#memberModal').modal('show');
		});
		
		$('#groupTodoListWrite').on('click',function(){
			var form = $('#todoListForm');
			var gno = form.find('#gno').val();
			var id = form.find('#id').val();
			var title = form.find('#title').val();
			var content = form.find('#content').val();
			
			if(title == ""){
				alert('제목을 입력해주세요');
				return false;
			}else if(title.length > 15){
				alert('글자수는 15글자 이하입니다');
				return false;
			}else if(content == ""){
				alert('내용을 입력해주세요');
				return false;
			}
					
			$.ajax({
				url:'/project3/admin/groupTodoListWrite',
				type:'post',
				data:{"gno":gno,
					"title":title,
					"content":content,
					"id":id},
				success:function(res){
					alert('작성하였습니다');
					location.href="groupMemberDetail?gno="+gno;
				},error:function(req){
					alert('상태:'+req.status);
				},dataType:'json'
			})
			
			
		});
	})
	
	function todoListDelete(gtno,t){
		$.ajax({
			url:'/project3/admin/groupTodoListDelete',
			type:'post',
			data:{"gtno":gtno},
			success:function(res){
				alert('삭제하였습니다');
				$(t).parents('#todoListArea').remove();
// 				window.opener.document.location.href=window.opener.document.URL; 
// 				self.close();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		})
	}
	function modify(t){
		var form = $(t).parents('#todoListArea').find('#todoForm');
		var gtno = form.find('#gtno').val();
		var gno = form.find('#gno').val();
		var title = form.find('#title').val();
		var content = form.find('#content').val();
		var id = form.find('#id').val();
		
		if(title == ""){
			alert('제목을 입력해주세요');
			return false;
		}else if(title.length > 15){
			alert('15글자 이하입니다');
			return false;
		}
		if(content == ""){
			alert('내용을 입력해주세요');
			return false;
		}
		
		$.ajax({
			url:'<%=request.getContextPath()%>/admin/groupTodoListModify',
			type:'post',
			data:{"gtno":gtno,
				"title":title,
				"content":content,
				"gno":gno,
				"id":id},
			success:function(res){
				var todo = res.todoList;
				var content = res.todoList;
				alert('수정하였습니다');
				cancel(t);
				//var cont = content.replace("\n", "<br>");
				$(t).parents('#todoListArea').find('#todoListTitle').html(todo.title)
				$(t).parents('#todoListArea').find('#todoListContent').html(todo.content)
				$(t).parents('#todoListArea').find('#todoListRegdate').html(todo.regdate)
				
// 				window.opener.document.location.href=window.opener.document.URL; 
// 				self.close();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		})
		
		
	}
	function popupclose(){
		self.close();
	}
	function modifyMode(t){
		$(t).parents('#todoListArea').find('#todoForm').css('display','block');
		$(t).parents('#todoListArea').find('#todoArea').css('display','none');
		
	}
	function cancel(t){
		$(t).parents('#todoListArea').find('#todoForm').css('display','none');
		$(t).parents('#todoListArea').find('#todoArea').css('display','block');
		
	}
	function freedelete(){
		$.ajax({
			url:'<%=request.getContextPath()%>/admin/FreeDelete',
			type:'post',
			data:{"bno":'${freeBoard.bno}'},
			success:function(res){
				alert('삭제하였습니다');
				window.opener.document.location.href=window.opener.document.URL; 
				self.close();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		})
	}
	function qnaAnswer(el){
		var id = $(el).parents('#qnaForm1').find('#id').val();
		var bno = $(el).parents('#qnaForm1').find('#bno').val();
		var content = $(el).parents('#qnaForm1').find('#content').val();
		if(content.length > 15){
			alert('15자 이하로 작성하셔야 합니다')
			return false;
		}
// 		content = content.replace(/\n/g,"<br>");
		$.ajax({
			type:'post',
			url:'<%=request.getContextPath()%>/admin/qnaAnswer',
			data:{"id":id,
				"bno":bno,
				"content":content},
			success:function(res){
				alert('답변 하였습니다');
				window.opener.document.location.href=window.opener.document.URL; 
				self.close();
			},error:function(req){
				alert('상태:'+req.status)
			}
		})
		
	}
	function replyWrite(el){
		var id = $(el).parents('#replyForm1').find('#id').val();
		var bno = $(el).parents('#replyForm1').find('#bno').val();
		var content = $(el).parents('#replyForm1').find('#content').val();
		if(content.length > 180){
			alert('글자수는 180자 이하로 작성하셔야 합니다')
			return false;
		}
		content = content.replace(/\n/g,"<br>");
		$.ajax({
			type:'post',
			url:'<%=request.getContextPath()%>/reply/write',
			data:{"id":id,
				"bno":bno,
				"content":content},
			success:function(res){
				$('#replyForm1').find('#content').val('');
				var bno = $('#bno').val();
				replyList(bno);
			},error:function(req){
				alert('상태:'+req.status)
			}
		})
		
	}
	function replyList(bno){
		$.ajax({
			type:'post',
			url:'<%=request.getContextPath()%>/excludes/reply/replyList',
			data:{"bno":bno},
			success:function(res){
				$('#replycontent').html(res);
			},error:function(req){
				alert('상태:'+req.status)
			}
		})
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
</body>
</html>
















