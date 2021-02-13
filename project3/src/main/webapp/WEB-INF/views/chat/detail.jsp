<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/custom.css" />
<title>실시간 채팅제 서비스</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		var toID = '${toID}';
 		var fromID = '${user.id}';
		setInterval(function(){
			getList(fromID,toID,0);
		},3000);
	})
	function getList(fromID,toID,cno){
		$.ajax({
			url:'<%=request.getContextPath()%>/chat/list',
			type:'post',
			data:{"fromID":fromID,
				"toID":toID,
				"cno":cno},
			success:function(res){
				$('#chatList').empty();
				for(i = 0;i <res.length;i++){
					addList(res[i].fromID,res[i].content,res[i].regdate,res[i].fileName);
				}
				
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		})
	}

	function addList(fromID,content,date,fileName){
 		if(fromID == '${user.id}'){
 			fromID = '나';
 		}
		var list = "";
		list +='<div class="row">';
		list +='<div class="col-lg-12">';
		list += '<div class="media">';
		list += '<a href="#" style="margin-left:10px;">';	
		list += '<img src="/project3/resources/upload/'+fileName+'" alt="" class="media-object img-circle" style="width:30px;height:30px;border-radius:30px;"/>';		
		list += '</a>';					
		list += '<div class="media-body">';		
		list += '<h5 style="margin-left:5px; font-weight:bold">'+fromID;		
		list += '<span class="small" style="float:right;margin-right:5px;">'+date+'</span>';					
		list += '</h5>'
		list += '<p>'			
		list += content;					
		list += '</p>'				
		list += '</div>';			
		list += '</div>';		
		list += '</div>';
		list += '</div>';
		list += '<hr/>';
		$('#chatList').append(list);
		
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight)
	}
	function submitFunction(toID){
		var fromID = '${user.id}';
		var toID = toID;
		var content = $('#content').val();
		
		if(content == ""){
			alert('메세지를 입력해주세요');
			return false;
		}		
		
		$.ajax({
			url:'<%=request.getContextPath()%>/chat/regist',
			type:'post',
			data:{"fromID":fromID,
				"toID":toID,
				"content":content},
			success:function(res){
				$('#content').val('');
			},error:function(req){
				alert('상태:'+req.status);
			}	
		})
	}
	
</script>
<nav class="navbar navbar-default">
	<div class="navbar-header">
		
	</div>
</nav>
<!-- 실시간 채팅 서비스 디자인 구현 -->
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xl-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle text-green"></i>메시지 주고받기</h4>
						</div>
						
						<hr style="clear:both;"/>
					</div>
					
					<div id="chat" class="">
				
						<div id="chatList" class="" style="overflow-y: auto; overflow-x:hidden;width: auto; height: 600px;">
							
			
							
						</div>
						<div class="">
							<div class="row" style="height: 90px;">
								<div class="form-group col-xl-11">
									<textarea style="height: 80px;" id="content" class="form-control" placeholder="메시지를 입력하세요."  maxlength="100"></textarea>
								</div>
								<div class="form-group col-xl-1">
									<button type="button" class="btn" onclick="submitFunction('${toID}');" style="margin-left:-23px;width:90px;height:80px;background-color:#34495E;color:white;">전송</button>
									<hr style="clear:both;"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>