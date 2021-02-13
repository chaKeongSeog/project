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
					<span style="color: #46546e; font-weight: bold; text-align: center;"><span id="postTit" style = "font-size: 25px; margin-left: 5px;">[${gno}]번 방 파일</span></span>
				</h6>
			</div>
			<div class="card-body">
			<form action="<%=request.getContextPath() %>/admin/groupFileModify" method="post"  name="pdsForm" enctype="multipart/form-data" onsubmit="return false;" id="pdsForm"/>
				<input type="hidden" name="gno" id="gno" value="${gno}"/>
				<input type="hidden" name="id" id="id" value="${user.id}"/>
				<div class="cal-area" id="calarea">
					<span id = "postNum" hidden = "true">1</span>
					<div class = "row">
						<div class = "col-lg-6">
							<span id = "id" style="font-size: 18px; font-weight: bolder;">첨부 파일</span>
						</div>	
					</div>
					<hr>
						<c:if test="${file == '[]'}">
							파일없음
						</c:if>
						<c:if test="${file != '[]'}">
							<c:forEach var="file" items="${file}">
		                     	 <div id="file">
		                     	 	첨부파일:
									<span class="mailbox-attachment-name" name="attachedFile">
										
									</span>													
									<i class="fas fa-paperclip"></i>
									<a href="#" onclick="fileDownload('${file.fno}')">${file.originFileName}</a>&nbsp;&nbsp;
									<button type="button" class="btn btn-link" id="attachFileCancel" idx="${file.fno}">X</button>																									
								 </div>
						   </c:forEach>
						</c:if>
			   	
					<hr>
					<div class="form-group">
				        <span class="cursor" id="addFile5"><i class="fa fa-plus-circle fa-lg"></i> 파일추가</span>
				        &nbsp;
				        <span class="cursor" id="deleteFile5"><i class="fa fa-times-circle fa-lg"></i> 파일삭제</span>
			    	</div>
			    	<div id="fdsArea">
			    	
			    	</div>
					<div class = "row">
						<div class = "col-lg-4" style = "text-align: center;">
						</div>
						<div class = "col-lg-4" style = "text-align: right;">
							<div id = "originShowbtn">
									<input type="button" class="btn btn-primary" value="수정" id="modify">
									<input type="button" class="btn btn-danger" value="닫기" id="cancel">
								<div style="clear:both;"></div>
							</div>
							
					 	</div>
					</div>
				</div>
			</form>	
			</div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
<script>
	$(function(){
		var gno = $('#gno').val();
		index = 0;
		$('#cancel').on('click',function(){
			window.close();
		})
		$('#modify').on('click',function(){
			
			var formData = new FormData($('#pdsForm')[0]);
			$.ajax({ 
				type: "POST", 
				enctype: 'multipart/form-data', 
				url: '<%=request.getContextPath()%>/admin/groupFileModify', 
				data: formData,
				processData: false,
				contentType: false,
				cache: false,
				success: function(res) { 
					alert('수정 되었습니다');
					location.href="groupFileDetail?gno="+gno;
				}, error: function(req){ 
					alert('상태:'+req.status);
				},dataType:'json' 
			});
		})
		
		$('#delete').on('click',function(){
			if('${user.authority}' != 'admin'){
				alert('삭제 권한이 없습니다');
				return false;
			}
			freedelete();

		})
		
		
		$('#addFile5').on('click',function(){
			index++;
			code = '<div id="inputRow"><input type="file" class="form-control" name="multi" id="fileName" style="margin:5px; 0px"></div>';
			$('#fdsArea').append(code);
		});
		
		$(this).on('change','#fileName',function(){
			if(this.files[0].size>1024 * 1024 * 10){
		  		alert('파일 사이즈가 10MB 초과하였습니다');
		  		$(this).val('');
		  		return false;
		  	}	
		});
		$(this).on('click','#attachFileCancel',function(){
			var fno = $(this).attr('idx');
			$('#pdsForm').append('<input type="hidden" name="fno" id="fno" value="'+fno+'"/>');
			$(this).parent().remove();
			
		});
		$('#deleteFile5').on('click',function(){
			var file = $('#fdsArea #inputRow');
			for(var i= 0;i<file.length;i++){
				var last = parseInt(file.length-1);
				file[last].remove();
			}
			
		});
		
	})
	function fileDownload(fno){
		location.href="/project3/group/download?fno="+fno;
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
















