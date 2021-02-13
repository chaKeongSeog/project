<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/custom.css" />
<title>실시간 채팅제 서비스</title>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		var fromID = '${user.id}';
// 		unreadMessageCount(toID);
		getMessageBox(fromID);
		$(this).on('click','#chatDetail',function(){
			var toID = $(this).attr('val');
			var form1 = $('#form1');
			form1.find('#toID').val(toID);
			form1.submit();
			
		});
		
	})
	function unreadMessageCount(fromID){
		$.ajax({
			url:'<%=request.getContextPath()%>/chat/unreadCount',
			type:'post',
			data:{"fromID":fromID},
			success:function(res){
				$('#unread').html(res);
			},error:function(req){
				alert('상태:'+req.status);
			}
		})
	}
	function getMessageBox(fromID){
		$.ajax({
			url:'<%=request.getContextPath()%>/chat/messageList',
			type:'post',
			data:{"fromID":fromID},
			success:function(res){
				$('#boxTable').empty();
				for(i=0;i<res.length;i++){
					if(res[i].toID == fromID){
						res[i].toID = res[i].fromID;
					}
					addBox(res[i].cno,res[i].toID,res[i].content,res[i].regdate);
				}
			},error:function(req){
				alert('상태:'+req.status);
			}
		})
	}
	
	function addBox(cno,toID,content,regdate){
		var list = '';
		list +='<tr id="chatDetail" val="'+toID+'">';
		list += '<td style="width:150px;vertical-align:middle;font-weight:bold;"><h4>'+toID+'</h4></td>';
		list +='<td>';
		list +='<div class="chatContent" style="width:950px;height:40px;overflow: hidden;text-overflow: ellipsis;cursor:pointer;white-space: nowrap;">';
		list +='<h3>'+content+'</h3>';
		list +='</div>';
		list +='<div class="pull-right">';
		list +=regdate;
		list +='</div>';
// 		list +='<div class="pull-right">';
// 		list +=regdate;
// 		list +='</div>';
		list +='</td>'
		list +='</tr>' 
		$('#boxTable').append(list);
	}
	
</script>
<form action="<%=request.getContextPath()%>/chat/detail" method="post" id="form1">
	<input type="hidden" name="toID" id="toID" value=""/>
</form>
<div class="container">
	<table class="table" style="margin: 0 auto;">
		<thead>
		<tr style="background-color: #036DCE;">
			<th><h4 style="text-align:center;color:white;">주고받은 메시지 목록</h4></th>
		</tr>
		</thead>
		<div style="overflow-y:auto;width:100%;max-height:450px;"> 
			<table class="table table-bordered table-hover" style="text-align: center;border:1px solid #dddddd;margin:0 auto;">
				<tbody id="boxTable">
					
				</tbody>			
			</table>
		</div>
	</table>
</div>
</body>
</html>