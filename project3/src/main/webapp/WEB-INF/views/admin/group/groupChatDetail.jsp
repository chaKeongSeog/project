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
			<div class="col-lg-12 col-xl-12" style = "margin :0 auto;width:100%;">
				<div id="cal_bg" class="card shadow mb-4">
					<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
						<h6 class="text-primary font-weight-bold m-0">
							<span style="color: #46546e; font-weight: bold; text-align: center;"><span id="postTit" style = "font-size: 25px; margin-left: 5px;">[${gno}]번 방 채팅</span></span>
						</h6>
					</div>
					<div class="card-body">
						<div class="cal-area" id="calarea">
							<span id = "postNum" hidden = "true">1</span>
							<div class = "row">

							</div>
							<span id = "postDt" style = "margin-top: 7px;font-size: 18px; font-weight: bolder;">채팅 내역</span>
							<div id = "postCt" style = "width: 90%; max-height:auto;padding: 5px;">
								<c:choose>
									<c:when test="${chat == '[]'}">
										채팅 내역이 존재하지않습니다
									</c:when>
									<c:otherwise>
										<c:forEach var="chat" items="${chat}">
											<div id="todoListArea" style="margin: 5px 0">
												<form action="<%=request.getContextPath()%>/admin/chatModify" onsubmit="return false" id="todoForm" style="display:none;">
													<input type="hidden" class="form-control" name="gcno" id="gcno" value="${chat.gcno}"/>
													<input type="hidden" class="form-control" name="gno" id="gno" value="${chat.gno}"/>
													<input type="hidden" class="form-control" name="id" id="id" value="${chat.id}"/>
													<textarea class="form-control" name="content" id="content" cols="30" rows="10">${chat.content}</textarea>
													<button class="btn btn-primary btn-sm" onclick="modify(this)">수정</button>
													<button class="btn btn-primary btn-sm" onclick="cancel(this)">취소</button>
												</form>
												<div style="border:1px solid #dfdfdf;border-radius:10px;" id="todoArea">		
													<div style="margin: 10px;">								
														<p style="float:left;" id="todoListTitle">
															작성자:${chat.name}(${chat.id})
														</p>
														<p style="float:right;" id="todoListRegdate">
															${chat.regdate}
														</p>
													<div style="clear:both;"></div>
														<p id="todoListContent">
															내용:${chat.content}
														</p>
														[<span style="color:blue" onclick="modifyMode(this)">수정</span>]
														[<span style="color:red" onclick="groupDelete('${chat.gcno}',this)">삭제</span>]
													</div>		
												</div>	
											</div>	
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<div style="clear:both;"></div>
									
							</div>
							<hr />
						</div>
							<div class = "row">
									<div class = "col-lg-4" style = "text-align: center;">
										
									</div>
									<div class = "col-lg-4" style = "text-align: right;">
										<div id = "originShowbtn">
												<input type="button" class="btn btn-primary" value="작성" id="write">
												<input type="button" class="btn btn-danger" value="닫기" id="close">
											<div style="clear:both;"></div>
										</div>
										
								 	</div>
								</div>
					</div>
				</div>
			</div>
</div>



<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">[${gno}번 그룹방]채팅 작성</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
       	<form action="<%=request.getContextPath()%>/groupChatWrite" id="chatWriteForm">
			<input type="hidden" class="form-control" name="gno" id="gno" value="${gno}"/>
			<input type="hidden" class="form-control" name="id" id="id" value="${user.id}"/>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
        </form>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="groupChatWrite">작성</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" id="close">닫기</button>
      </div>

    </div>
  </div>
</div> 
<script>
	$(function(){	
		$('#write').on('click',function(){
			$('#myModal').modal('show')
		})
		$('#close').on('click',function(){
			self.close();
		})
		$('#groupChatWrite').on('click',function(){
			var form = $('#chatWriteForm');
			var gno = form.find('#gno').val();
			var id = form.find('#id').val();
			var content = form.find('#content').val();
			
			if(content == ""){
				alert('내용을 작성해주세요');
				return false;
			}else if(content.length > 15){
				alert('글자 수는 15글자 이하입니다');
				return false;
			}
			$.ajax({
				url:'<%=request.getContextPath()%>/admin/groupChatWrite',
				type:'post',
				data:{"gno":gno,
					"id":id,
					"content":content},
				success:function(res){
					alert('작성하였습니다');
					location.href="groupChatDetail?gno="+gno;
				},error:function(req){
					alert('상태:'+req.status);
				},dataType:'json'
			})
			
			
			
		});
		
	})
	function todoListDelete(gtno,t){
		$.ajax({
			url:'<%=request.getContextPath()%>/admin/groupTodoListDelete',
			type:'post',
			data:{"gtno":gtno},
			success:function(res){
				alert('삭제하였습니다');
				$(t).parents('#todoListArea').remove();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		})
	}
	function modify(t){
		var form = $(t).parents('#todoListArea').find('#todoForm');
		var gcno = form.find('#gcno').val();
		var gno = form.find('#gno').val();
		var content = form.find('#content').val();
		var id = form.find('#id').val();
		
		if(content == ""){
			alert('내용을 입력해주세요');
			return false;
		}else if(content.length >50){
			alert('채팅 글자는 50글자 이하입니다');
			return false;
		}
		
		$.ajax({
			url:'<%=request.getContextPath()%>/admin/chatModify',
			type:'post',
			data:{"gcno":gcno,
				"content":content,
				"gno":gno,
				"id":id},
			success:function(res){
				var chat = res.chat;
				alert('수정하였습니다');
				cancel(t);
				//var cont = content.replace("\n", "<br>");
				$(t).parents('#todoListArea').find('#todoListContent').html(chat.content)
				$(t).parents('#todoListArea').find('#todoListRegdate').html(chat.regdate)
				
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		})
		
		
	}
	function modifyMode(t){
		$(t).parents('#todoListArea').find('#todoForm').css('display','block');
		$(t).parents('#todoListArea').find('#todoArea').css('display','none');
		
	}
	function cancel(t){
		$(t).parents('#todoListArea').find('#todoForm').css('display','none');
		$(t).parents('#todoListArea').find('#todoArea').css('display','block');
		
	}
	function groupDelete(gcno,t){
		
		$.ajax({
			url:'<%=request.getContextPath()%>/admin/groupChatDelete',
			type:'post',
			data:{"gcno":gcno},
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
















