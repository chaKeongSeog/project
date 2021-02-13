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
			<div class="col-lg-12 col-xl-12" style = "margin :0 auto;width:100%;">
				<div id="cal_bg" class="card shadow mb-4">
					<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
						<h6 class="text-primary font-weight-bold m-0">
							<span style="color: #46546e; font-weight: bold; text-align: center;"><span id="postTit" style = "font-size: 25px; margin-left: 5px;">[${gno}]번 방 메모</span></span>
						</h6>
					</div>
					<div class="card-body">
						<div class="cal-area" id="calarea">
							<span id = "postNum" hidden = "true">1</span>
							<div class = "row">

							</div>
							<span id = "postDt" style = "margin-top: 7px;font-size: 18px; font-weight: bolder;">메모 내역</span>
							<div id = "postCt" style = "width: 90%; max-height:auto;padding: 5px;">
								<c:choose>
									<c:when test="${memo == '[]'}">
										메모 내역이 존재하지않습니다
									</c:when>
									<c:otherwise>
										<c:forEach var="memo" items="${memo}">
											<div id="todoListArea" style="margin: 5px 0">
												<form action="<%=request.getContextPath()%>/admin/chatModify" onsubmit="return false" id="todoForm" style="display:none;">
													<input type="hidden" class="form-control" name="mno" id="mno" value="${memo.mno}"/>
													<input type="hidden" class="form-control" name="gno" id="gno" value="${memo.gno}"/>
													<input type="hidden" class="form-control" name="id" id="id" value="${memo.id}"/>
													<textarea class="form-control" name="content" id="content" cols="30" rows="10">${memo.content}</textarea>
													<button class="btn btn-primary btn-sm" onclick="modify(this)">수정</button>
													<button class="btn btn-primary btn-sm" onclick="cancel(this)">취소</button>
												</form>
												<div style="border:1px solid #dfdfdf;border-radius:10px;" id="todoArea">		
													<div style="margin: 10px;">								
														<p style="float:left;" id="todoListTitle">
															작성자:${memo.name}(${memo.id})
														</p>
														<p style="float:right;" id="todoListRegdate">
															${memo.regdate}
														</p>
													<div style="clear:both;"></div>
														<p id="todoListContent">
															내용:${memo.content}
														</p>
														[<span style="color:blue" onclick="modifyMode(this)">수정</span>]
														[<span style="color:red" onclick="memoDelete('${memo.mno}',this)">삭제</span>]
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
												<input type="button" class="btn btn-primary" value="글작성" id="write">
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
        <h4 class="modal-title">[${gno}]번 그룹방 메모 작성</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="<%=request.getContextPath()%>/groupMemoWrite" id="memoWriteForm">
        	<input type="hidden" class="form-control" name="mno" id="mno" value="${memo[0].mno}"/>
			<input type="hidden" class="form-control" name="gno" id="gno" value="${gno}"/>
			<input type="hidden" class="form-control" name="id" id="id" value="${user.id}"/>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
        
        </form>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
      	<input type="button" class="btn btn-primary" value="글작성" id="memoWrite">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div> 
   
<script>
	$(function(){	
		$('#close').on('click',function(){
			self.close();
		});
		$('#write').on('click',function(){
			$('#myModal').modal('show')
		});
		$('#memoWrite').on('click',function(){
			var form = $('#memoWriteForm');
			var mno = form.find('#mno').val();
			var gno = form.find('#gno').val();
			var id = form.find('#id').val();
			var content = form.find('#content').val();
			
			if(content == ""){
				alert('메모를 입력해주세요');
				return false;
			}else if(content.length >15){
				alert('글자 수는 15글자 입니다');
				return false;
			}

			$.ajax({
				url:'/project3/admin/groupMemoWrite',
				type:'post',
				data:{"gno":gno,
					"id":id,
					"content":content},
				success:function(res){
					alert('작성 하였습니다');
					location.href="groupMemoDetail?gno="+gno;
				},error:function(req){
					alert('상태:'+req.status);
				},dataType:'json'
			})
			
		})
		
	})
	
	function memoDelete(mno,t){
		$.ajax({
			url:'/project3/admin/groupMemoDelete',
			type:'post',
			data:{"mno":mno},
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
		var mno = form.find('#mno').val();
		var gno = form.find('#gno').val();
		var content = form.find('#content').val();
		var id = form.find('#id').val();
		
		if(content == ""){
			alert('내용을 입력해주세요');
			return false;
		}else if(content.length > 15){
			alert('글자 수는 15글자 입니다');
			return false;
		}
		
		$.ajax({
			url:'<%=request.getContextPath()%>/admin/groupMemoModify',
			type:'post',
			data:{"mno":mno,
				"content":content,
				"gno":gno,
				"id":id},
			success:function(res){
				var memo = res.memo;
				alert('수정하였습니다');
				cancel(t);
				//var cont = content.replace("\n", "<br>");
				$(t).parents('#todoListArea').find('#todoListContent').html(memo.content)
				$(t).parents('#todoListArea').find('#todoListRegdate').html(memo.regdate)
				
// 				window.opener.document.location.href=window.opener.document.URL; 
// 				self.close();
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
















