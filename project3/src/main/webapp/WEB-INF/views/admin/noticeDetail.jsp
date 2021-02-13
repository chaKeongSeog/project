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
					<span style="color: #46546e; font-weight: bold; text-align: center;"><span id="postTit" style = "font-size: 25px; margin-left: 5px;">${notice.title}</span></span>
				</h6>
			</div>
			<div class="card-body">
				<div class="cal-area" id="calarea">
					<span id = "postNum" hidden = "true">1</span>
					<div class = "row">
						<div class = "col-lg-6">
							<span id = "id" style="font-size: 18px; font-weight: bolder;">${notice.name}</span>
							<span id = "ctrgb">(${notice.regdate})</span>
						</div>	
						<div class = "col-lg-6" style="text-align: right;">
							<span id = "id" style="font-size: 18px; font-weight: bolder;">조회수:</span>
							<span>${notice.hit}</span>
						</div>
					</div>
					<hr>
					<div id = "postCt" style = "width: 90%; min-height: 300px; padding: 5px;">
					${notice.content}
					</div>
					<hr>
					<div class = "row">
						<div class = "col-lg-4" style = "text-align: center;">
							
						</div>
						<div class = "col-lg-4" style = "text-align: right;">
							<div id = "originShowbtn">
								<form id="deleteForm" action="<%=request.getContextPath()%>/admin/noticeDelete" method="post" style="float:right;">
									<input type="hidden" name="bno" id="bno" value="${notice.bno}"/>
									<input type="button" class="btn btn-danger" value="닫기" id="cancel">
								</form>
								<div style="clear:both;"></div>
							</div>
							<div id="modifyShowbtn" style="display: none;">
								<button type="button" class="btn btn-primary" id="modifyGo">SAVE</button>
								<button type="button" class="btn btn-primary" id="modifyCencel" style="margin-left: 4px;">BACK</button>
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
		replyList(bno);
// 		$('#answer').on('click',function(){
// 			var form = $(this).parents('#answerForm');
// 			form.submit();
// 		});
		
		$('#modify').on('click',function(){
			var id = '${notice.id}';
			if(id != '${user.id}'){
				alert('수정권한이 없습니다');
				return false;
			}
			var form = $(this).parents('#modifyForm');
			form.submit();
		})
		$('#list').on('click',function(){
			location.href="<%=request.getContextPath()%>/notice/list";
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
			url:'<%=request.getContextPath()%>/admin/NoticeDelete',
			type:'post',
			data:{"bno":'${notice.bno}'},
			success:function(res){
				alert('삭제하였습니다');
				window.opener.document.location.href=window.opener.document.URL; 
				self.close();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
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

















