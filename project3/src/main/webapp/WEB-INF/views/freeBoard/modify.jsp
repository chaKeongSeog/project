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
    <div class="col-md-8">
        <h2 class="text-center" style="margin-top: 10px;">자유게시판 글수정</h2>
        <form action="<%=request.getContextPath() %>/freeBoard/modify" method="post"  name="form1"onsubmit="return false;"/>
        	<input type="hidden" name="bno" id="bno" value="${freeBoard.bno}"/>
          <table class="table">
            <tr>
                <td><input type="text"  class="form-control" name="id" id="id" value="${user.id}" readonly="readonly"></td>
            </tr>
            <tr>
                <td><input type="text" class="form-control" name="title" placeholder="제목" id="title" value="${freeBoard.title}"></td>
            </tr>
            <tr>
                <td>
                <textarea rows="10" cols="50" name="content" id="content" placeholder="내용" class="form-control">${freeBoard.content}</textarea>
              

                </td>
            </tr>
            <tr>
                 
                <td colspan="2"  class="text-right">
                    <input type="button" value="글수정" class="btn btn-primary" id="modify">
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
		width:1000
	});
	
	$('#modify').on('click',function(){
		var id = $('#id').val().trim();
		var title = $('#title').val().trim();
		var text = $('#content').val().trim();

		
		if(title ==""){
			alert('제목을 입력해주세요');
			return false;
		}else if(title.length >15){
			alert('글자수는 15글자 입니다');
			return false;
		}else if(content == ""){
			alert('내용을 입력해주세요');
			return false;
		}
		
		
		document.form1.action = "<%=request.getContextPath()%>/freeBoard/modify";
        document.form1.submit();

		
		
	});
	$('#list').on('click',function(){
		location.href="<%=request.getContextPath()%>/freeBoard/list";
	});
});


</script> 

</body>
</html>