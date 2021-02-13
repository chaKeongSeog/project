<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
        <link href="<%=request.getContextPath()%>/resources/css/styles.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/custom.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/group.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/lecture.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/main.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link href='<%=request.getContextPath() %>/resources/lib/main.css' rel='stylesheet' />
		<link href="<%=request.getContextPath() %>/resources/lib/custom/css/schedule.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/groupChat.css" /> 
		<link href="<%=request.getContextPath() %>/summernote/summernote.min.css" rel="stylesheet">
		<script src="<%=request.getContextPath() %>/summernote/summernote.min.js"></script> 
		<script src="<%=request.getContextPath()%>/resources/lib/custom/js/schedule.js"></script>
		<script src='<%=request.getContextPath() %>/resources/lib/main.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>    
<body>	
<div class="row">
	<div class="col-lg-12 col-xl-12" style = "margin :0 auto;width:100%;">
		<div id="cal_bg" class="card shadow mb-4">
			<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
				<h6 class="text-primary font-weight-bold m-0">
					<span style="color: #46546e; font-weight: bold; text-align: center;"><span id="postTit" style = "font-size: 25px; margin-left: 5px;">[${qna.bno}]번 Q&A 글</span></span>
				</h6>
			</div>
			<div class="card-body">
				<div class="cal-area" id="calarea">
					<span id = "postNum" hidden = "true">1</span>
					<div class = "row">
						<div class = "col-lg-6">
							<span id = "id" style="font-size: 18px; font-weight: bolder;">${qna.name}</span>
							<span id = "ctrgb">(${qna.regdate})</span>
						</div>	
					</div>
					<div class = "row">
						<span id = "postDt" style = "margin-top: 7px;"></span>
					</div>
					<hr>
					
					<div id = "postCt" style = "width: 90%; min-height: 300px; padding: 5px;">
					${qna.content}
					</div>
					
				
				</div>
			</div>
			
		</div>
	</div>
</div>
<!-- 댓글 -->
<div class="row">
	<div class="col-lg-12 col-xl-12" style = "margin : auto;width:100%;">
		<div id="cal_bg" class="card shadow mb-4">
			<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
				<h6 class="text-primary font-weight-bold m-0">
					<span style="color: #46546e; font-weight: bold; text-align: center;">Answer</span>
				</h6>
			</div>
			<div class="card-body">
				<div class="cal-area" id="calarea">
					<div class = "row">
						<div class="rbox" style = "width : 100%;">
							<div class="col-xs-2 col-md-2 "></div>
							<div class="replyarea">
								<hr style="clear: both" />
								<form name="replyForm1" id="qnaForm1" class="form-horizontal" onsubmit="return false" >
									<input type="hidden" name="id" id="id" value="${user.id}"/>
									<input type="hidden" name="bno" id="bno" value="${qna.bno}"/>
									<div class="col-xs-12 col-md-12 replywritearea">
										<p style="width: 80%; float: left">
										<textarea type="text" id="content" name="content" class="form-control" placeholder="답변을 작성해주세요" style = "height : 100px"></textarea>
										</p>
										<p style="width: 20%; float: right;">
										<button type="button" class="replyWriteBtn btn btn-secondary replybtn" style="height:100px;" onclick="qnaAnswer(this)">Answer</button>
										</p>
									</div>
								</form>
								<hr style="clear: both" />
								<div id="replycontent">
									
								</div>
								<br />
							</div>
						</div>
					</div>
						<div class = "row">
						<div class = "col-lg-4" style = "text-align: center;">
						</div>
						<div class = "col-lg-4" style = "text-align: right;">
							<div id = "originShowbtn">
								<form id="deleteForm" action="<%=request.getContextPath()%>/admin/freeDelete" method="post" name="deleteForm" style="float:right;">
									<input type="hidden" name="bno" id="bno" value="${qna.bno}"/>
									<input type="button" class="btn btn-danger" value="닫기" id="cancel">
								</form>
								<div style="clear:both;"></div>
							</div>
							
					 	</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
<script>
	$(function(){
		
		var bno = $('#bno').val().trim();
// 		replyList(bno);
		$('#answer').on('click',function(){
			var form = $(this).parents('#answerForm');
			form.submit();
		});
	
		$('#modify').on('click',function(){
			var id = '${freeBoard.id}';
			if(id != '${user.id}'){
				alert('수정권한이 없습니다');
				return false;
			}
			var form = $(this).parents('#modifyForm');
			form.submit();
		})
		$('#list').on('click',function(){
			location.href="<%=request.getContextPath()%>/freeBoard/list";
		})
		$('#cancel').on('click',function(){
			window.close();
		})
		
		$('#delete').on('click',function(){
			if('${user.authority}' != 'admin'){
				alert('삭제 권한이 없습니다');
				return false;
			}
			freedelete();

		})
		
	})
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

















