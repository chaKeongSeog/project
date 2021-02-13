<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="registHeader.jsp" %>
</head>

<body>
<div class="row" style="margin-left: 250px;">
    <div class="col-md-2"></div>
    <div class="col-md-7">
        <h2 class="text-center">신고하기</h2>
 			<form action="<%=request.getContextPath()%>/lecture/reportWrite" method="post">
 				<input type="hidden" name="id" value="${user.id}"/>
				<div class="form-group">
					<label>신고 제목</label>
					<input type="text" name="title" class="form-control" maxlength="30">
				</div>
				<div class="form-group">
					<label>신고 내용</label>
					<textarea name="content" class="form-control" maxlength="2048" id="content" style="height:180px;"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-danger">신고하기</button>
				</div>
			</form>
    </div>
</div>

 <script>
$(function(){
	$('#content').summernote({
		height:300,
		width:950
	});
	
	$('#regist').on('click',function(){
		document.form1.action = "<%=request.getContextPath()%>/lecture/regist";
        document.form1.submit();

		
		
	})
	$('#list').on('click',function(){
		location.href="<%=request.getContextPath()%>/lecture/list"
	})
})


</script> 

</body>
</html>