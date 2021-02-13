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
							<span style="color: #46546e; font-weight: bold; text-align: center;"><span id="postTit" style = "font-size: 25px; margin-left: 5px;">[${gno}]번 방 인증게시판</span></span>
						</h6>
					</div>
				
					<div class="card-body">
					<c:if test="${list == '[]'}">
						해당 그룹방에 게시물이 존재하지않습니다.
					</c:if>
					<c:forEach var="list" items="${list}">
						<div class="cal-area" id="calarea">
							<span id = "postNum" hidden = "true">1</span>
							<span id = "postDt" style = "margin-top: 7px;font-size: 18px; font-weight: bolder;">게시물</span>
							<div id = "postCt" style = "width: 90%; max-height:auto;padding: 5px;">
							<div id="todoListArea" style="margin: 5px 0">
								<form action="<%=request.getContextPath()%>/group/grBoardModify" onsubmit="return false" id="todoForm" style="display:none;">
									<input type="hidden" class="form-control" name="gbno" id="gbno" value="${list.gbno}"/>
									<input type="hidden" class="form-control" name="gno" id="gno" value="${list.gno}"/>
									<input type="hidden" class="form-control" name="id" id="id" value="${list.id}"/>
									<input type="text" class="form-control" name="title" id="title" value="${list.title}"/>
									<input type="hidden" name="curPage" id="curPage" value="1"/>
									<textarea class="form-control contents" name="content" id="content${list.gbno}" cols="30" rows="10">${list.content}</textarea>
								</form>
								<script>
									var index7 = 0;
									
									$('#content${list.gbno}').summernote({
							 			height:300,
							 			width:655
							 		});
								</script>
								<div style="border:1px solid #dfdfdf;border-radius:10px;">	
									<div style="margin: 10px;" id="todoArea">								
										<p style="float:left;" id="todoListTitle">
											제목:${list.title}
										</p>
										<p style="float:right;" id="todoListRegdate">
											${list.regdate}
										</p>
										<div style="clear:both;"></div>
										<p id="todoListContent">
											내용:${list.content}
										</p>
									</div>		
									<hr>
									<div class="cal-area" id="calarea" style="margin: 10px;">
										<span id = "postNum" hidden = "true">1</span>
										<div class = "row">
											<div class = "col-lg-6">
												<span id = "id" style="font-size: 18px; font-weight: bolder;">첨부 파일</span>
											</div>	
										</div>
										
										<c:if test="${list.groupAttachVOList == '[]'}">
											파일없음
										</c:if>
										<c:if test="${list.groupAttachVOList != '[]'}">
											<c:forEach var="file" items="${list.groupAttachVOList}">
						                     	 <div id="fileModifyArea" style="margin-top: 5px;">
													<span class="mailbox-attachment-name" name="attachedFile">
													</span>													
													<i class="fas fa-paperclip"></i>
													<a href="#" onclick="fileDownload('${file.gano}','${file.gno}')">${file.originfileName}</a>&nbsp;&nbsp;
													<button type="button" class="btn btn-link" id="attachCancel" onclick="attachFileCancel(this)" idx="${file.gano}" style="opacity:0;">X</button>																									
												 </div>
										   </c:forEach>
										</c:if>
										<div style="display:none;" id="attachAddDeleteArea">
											<div class="form-group">
										        <span class="cursor" onclick="addFile7(this)"><i class="fa fa-plus-circle fa-lg"></i> 파일추가</span>
										        &nbsp;
										        <span class="cursor" onclick="deleteFile7(this)"><i class="fa fa-times-circle fa-lg"></i> 파일삭제</span>
									    	</div>
									    	<div id="fdsArea">
									    	
									    	</div>
										</div>
									</div>
									<div style="text-align: right;display:none" id="nonModeArea">
										<button class="btn btn-primary btn-sm" onclick="modify(this)">수정</button>
										<button class="btn btn-primary btn-sm" onclick="cancel(this)">취소</button>
									</div>
									<div style="text-align: right;" id="modeArea">
										[<span style="color:blue" onclick="modifyMode(this)">수정</span>]
										[<span style="color:red" onclick="groupBoardDelete('${list.gbno}',this)">삭제</span>]
									</div>
								</div>	
							</div>	

								<div style="clear:both;"></div>		
							</div>
						</div>
					</c:forEach>
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

<!-- 인증게시판 글쓰기 모달 -->
<div id="grBoardModal" class="modal fade" role="dialog">
<div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      <h4 class="modal-title">글 작성</h4>
      </div>
      <div class="modal-body">
	   <form id="grBoardForm" name="grBoardForm" onsubmit="return false;">
	   		<input type="hidden" name="gno" id="gno" value="${gno}"/>
	   		<input type="hidden" name="id" id="id" value="${user.id}"/>
		    <div class="form-group">
		      <label for="usr">제목</label>
		      <input type="text" class="form-control" id="grBoardTitle" name="title">
		    </div>
		    <div class="form-group">
		      <label for="usr">내용</label>
		      <textarea class="form-control" id="grBoardContent" name="content" rows="5"></textarea><br>
		    </div>
           		<div class="form-group">
			        <span class="cursor" id="addFile9"><i class="fa fa-plus-circle fa-lg"></i> 파일추가</span>
			        &nbsp;
			        <span class="cursor" id="deleteFile9"><i class="fa fa-times-circle fa-lg"></i> 파일삭제</span>
		    	</div>
                <div id="fdsArea2">
                  
                </div>                 
		</form>
      </div>
      <div class="modal-footer">
      	<button class="btn btn-default pull-right" type="button" id="grBoardadd">인증</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>





<script>
	$(function(){	
		$(this).on('change','#fileName',function(){
			if(this.files[0].size>1024 * 1024 * 10){
		  		alert('파일 사이즈가 10MB 초과하였습니다');
		  		$(this).val('');
		  		return false;
		  	}	
		});
		
		//그룹방 인증게시판 글쓰기 파일추가
		$('#addFile9').on('click',function(){
			code = '<div id="inputRow"><input type="file" class="form-control" name="multi" id="fileName" style="margin:5px; 0px"></div>';
			$('#fdsArea2').append(code);
		});
		//그룹방 인증게시판 글쓰기 파일삭제
		$('#deleteFile9').on('click',function(){
			var file = $('#fdsArea2 #inputRow');
			for(var i= 0;i<file.length;i++){
				var last = parseInt(file.length-1);
				file[last].remove();
			}
		});
		
		$('#grBoardContent').summernote({
 			height:300,
 			width:655
 		});
		
		//인증 게시판 글쓰기
		$('#grBoardadd').on('click',function(){
			var form = $('#grBoardForm');
			var user = $('#grBoardForm').find('#id').val();
			var gno = $('#grBoardForm').find('#gno').val();
			var title = form.find('#grBoardTitle').val();
			var content = form.find('#grBoardContent').val();
			var gno = form.find('#gno').val();
			
			if(title == ""){
				alert('제목을 입력해주세요');
				return false;
			}else if(title.length >15){
				alert('글자 수는 15글자 입니다');
				return false;
			}else if(content == ""){
				alert('내용을 입력해주세요');
				return false;
			}
	        var data = new FormData(form[0]);
	        $.ajax({
	            type: "post",
	            enctype: 'multipart/form-data',
	            url: "/project3/group/grBoardWrite",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (res) {
	            	alert('글을 작성하였습니다');
	            	location.href="groupBoardDetail?gno="+gno;
	            },error: function(req) {
	               alert('상태:'+req.status);
	            }
	        });
		})
		
		$('#close').on('click',function(){
			window.close();
		})
		
		$('#write').on('click',function(){
		
			$('#grBoardModal').modal('show');
		});
	})
	
	function fileDownload(gano,gno){
		location.href="/project3/group/GroupAttachDownload?gano="+gano+"&gno="+gno;
	}
	function attachFileCancel(t){
		var gano = $(t).attr('idx');
		$(t).parents('#todoListArea').find('#todoForm').append('<input type="hidden" name="gano" id="gano" value="'+gano+'"/>');
		$(t).parent().remove();
		
	}
	function addFile7(t){		
		code = '<div id="inputRow"><input type="file" class="form-control" name="multi" id="fileName" style="margin:5px; 0px"></div>';
		$(t).parents('#todoListArea').find('#fdsArea').append(code);
	}
	
	function deleteFile7(t){
		var file = $(t).parents('#todoListArea').find('#fdsArea #inputRow');
		for(var i= 0;i<file.length;i++){
			var last = parseInt(file.length-1);
			file[last].remove();
		}
	}
	
	function groupBoardDelete(gbno,t){
		$.ajax({
			url:'<%=request.getContextPath()%>/group/GroupBoardDelete',
			type:'post',
			data:{"gbno":gbno},
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
		var gtno = form.find('#gbno').val();
		var gno = form.find('#gno').val();
		var title = form.find('#title').val();
		var content = form.find('.contents').val();
		var id = form.find('#id').val();
		if(title == ""){
			alert('제목을 입력해주세요');
			return false;
		}else if(title.length > 15){
			alert('15글자 이하로 작성해주세요');
			return false;
		}else if(content == ""){
			alert('내용을 입력해주세요');
			return false;
		}
		var fdsArea = $(t).parents('#todoListArea').find('#fdsArea');
		
		form.append(fdsArea);
	    var data = new FormData(form[0]);
        $.ajax({
            type: "post",
            enctype: 'multipart/form-data',
            url: "/project3/group/grBoardModify",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (res) {
            	alert('수정하였습니다');
            	location.href="groupBoardDetail?gno="+gno;           	
            },error: function(req) {
               alert('상태:'+req.status);
            }
        });
	}
	
	
	function modifyMode(t){
		$(t).parents('#todoListArea').find('#todoForm').css('display','block');
		$(t).parents('#todoListArea').find('#todoArea').css('display','none');
		$(t).parents('#todoListArea').find('#modeArea').css('display','none');
		$(t).parents('#todoListArea').find('#nonModeArea').css('display','block');
		$(t).parents('#todoListArea').find('#attachAddDeleteArea').css('display','block');
		$(t).parents('#todoListArea').find('#fileModifyArea #attachCancel').css('opacity','1');
		
	}
	function cancel(t){
		$(t).parents('#todoListArea').find('#todoForm').css('display','none');
		$(t).parents('#todoListArea').find('#todoArea').css('display','block');
		$(t).parents('#todoListArea').find('#modeArea').css('display','block');
		$(t).parents('#todoListArea').find('#nonModeArea').css('display','none');
		$(t).parents('#todoListArea').find('#attachAddDeleteArea').css('display','none');
		$(t).parents('#todoListArea').find('#fileModifyArea #attachCancel').css('opacity','0');
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

















