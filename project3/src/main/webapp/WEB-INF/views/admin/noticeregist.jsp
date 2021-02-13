<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="registHeader.jsp" %>
</head>
<body>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-4" style="margin-left: -200px;">
        <h2 class="text-center">공지사항 글쓰기</h2>
        <form action="<%=request.getContextPath() %>/notice/regist" method="post"  name="form1"onsubmit="return false;"/>
        
          <table class="table">
            <tr>
                <td><input type="text"  class="form-control" name="id" id="id" value="${user.id}" readonly="readonly"></td>
            </tr>
            <tr>
                <td><input type="text" class="form-control" name="title" placeholder="제목" id="title"></td>
            </tr>
            <tr>
                <td>
                <textarea rows="10" cols="50" name="content" id="content" placeholder="내용" class="form-control"></textarea>
              

                </td>
            </tr>
            <tr>
                 
                <td colspan="2"  class="text-right">
                    <input type="button" value="글쓰기" class="btn btn-primary" id="write">
                    <button type="button"  class="btn btn-primary" id="list">목록</button>
                </td>
            </tr>
             
          </table>
        </form>
    </div>
</div>

 <script>
$(function(){
	$('#content').summernote({
		height:300,
		width:700
	});
	
	$('#write').on('click',function(){
		var id = $('#id').val().trim();
		var title = $('#title').val().trim();
		var text = $('#content').val().trim();
		
		if(title == ""){
			alert('제목을 입력해주세요');
			return false;
		}else if(text == ""){
			alert('내용을 입력해주세요');
			return false;
		}else if(title.length>15){
			alert('글자수는 15글자 이하입니다');
			return false;
		}
		
		$.ajax({
			url:'/project3/admin/noticeregist',
			type:'post',
			data:{"id":id,
				"title":title,
				"content":text}
			,success:function(res){
				alert('글을 작성하였습니다');
				window.opener.document.location.href="<%=request.getContextPath()%>/admin/noticeList"; 
				self.close();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
			
	});
	$('#list').on('click',function(){
		location.href="<%=request.getContextPath()%>/notice/list";
	});
});


</script> 

</body>
</html>