<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- 		<%@include file="registHeader.jsp" %> --%>
		
</head>
<body>

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-4" style="margin-left: -200px;">
        <h2 class="text-left" style="margin-top: 10px;">자유게시판 글수정</h2>
        <form action="<%=request.getContextPath() %>/freeBoard/modify" method="post"  name="form1"onsubmit="return false;"/>
        	<input type="hidden" name="bno" id="bno" value="${freeBoard.bno}"/>
        	<input type="hidden" name="id" id="id" value="${user.id}"/>
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
                    <input type="button" value="글수정" class="btn btn-primary " id="freemodify">
                </td>
            </tr>
             
          </table>
        </form>
    </div>
</div>
 <script>
 
$(function(){
	//opener.open("about:blank", "_self").close();
	$('#content').summernote({
		height:300,
		width:700
	});
	
	$('#freemodify').on('click',function(){
		
		var bno = $('#bno').val();
		var id = $('#id').val().trim();
		var title = $('#title').val().trim();
		var text = $('#content').val().trim();
		
		
		if(title == ""){
			alert('제목을 입력해주세요')
			return false;
		}else if(text == ""){
			alert('내용을 입력해주세요')
			return false;
		}else if(title.length>15){
			alert('글자수는 15글자 입니다')
			return false;
		}
		
		
		$.ajax({
			url:'/project3/admin/freemodify',
			type:'post',
			data:{"bno":bno,
				"id":id,
				"title":title,
				"content":text}
			,success:function(res){
				alert('수정 하였습니다');
				window.opener.document.location.href=window.opener.document.URL; 
				self.close();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
		aler('asdsa')
		
<%-- 		document.form1.action = "<%=request.getContextPath()%>/admin/freemodify"; --%>
//         document.form1.submit();
	});
	$('#list').on('click',function(){
		location.href="<%=request.getContextPath()%>/freeBoard/list";
	});
});


</script> 

</body>
</html>