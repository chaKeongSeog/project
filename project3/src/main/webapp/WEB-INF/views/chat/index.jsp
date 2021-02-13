<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/custom.css" />

<title>실시간 채팅제 서비스</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		var toID = 'admin';
		unreadMessageCount(toID);
	})
	function unreadMessageCount(toID){
		$.ajax({
			url:'<%=request.getContextPath()%>/chat/unreadCount',
			type:'post',
			data:{"toID":toID},
			success:function(res){
				$('#unread').html(res);
			},error:function(req){
				alert('상태:'+req.status);
			}
		})
	}
</script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>

</head>
<body>
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<ul class="nav navbar-nav">
			<li><a href="/test/member/memberFind">친구찾기</a></li>
			<li><a href="/test/chat/messageBoxDetail">메시지함<span id="unread" class="label label-info"></span></a></li>
		</ul>
	</div>
</nav>

</body>
</html>