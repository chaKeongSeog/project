<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
		
</head>
<body>

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8" style="margin-left: -200px;">
        <h2 class="text-left" style="margin-top: 10px;">Q&A 수정</h2>
        
        <form action="<%=request.getContextPath() %>/admin/qnamodify" method="post"  name="form1"onsubmit="return false;"/>
        	<input type="hidden" name="bno" id="bno" value="${qna.bno}"/>
        	<input type="hidden" name="id" id="id" value="${user.id}"/>
        	<input type="hidden" name="boardType" id="boardType" value="${boardType}"/>
          <table class="table">
          
            <tr>
                <td><input type="text"  class="form-control" name="id" id="id" value="${user.id}" readonly="readonly"></td>
            </tr>
            <tr>
          		<td>
          			<input type="text"  class="form-control" name="title" id="title" value="${qna.title}">
          		</td>
          	</tr>
            <tr>
                <td>
                <textarea rows="10" cols="70" name="content" id="content" placeholder="내용" class="form-control">${qna.content}</textarea>
              

                </td>
            </tr>
            <tr>
                 
                <td colspan="2"  class="text-right">
                    <input type="button" value="수정" class="btn btn-primary " id="freemodify">
                </td>
            </tr>
             
          </table>
        </form>
    </div>
</div>
 <script>
 
$(function(){
	$('#freemodify').on('click',function(){
		var boardType = $('#boardType').val();
		var bno = $('#bno').val();
		var id = $('#id').val().trim();
		var title = $('#title').val().trim();
		var text = $('#content').val().trim();
		
		if(title == ""){
			alert('제목을 입력해주세요');
			return false;
		}else if(title.length >15){
			alert('15글자 이하로 작성해주세요');
			return false;
		}
		if(text == ""){
			alert('내용을 입력해주세요');
			return false;
		}
		//text = text.replace(/\n/g, '<br>');
		
		$.ajax({
			url:'/project3/admin/qnamodify',
			type:'post',
			data:{"bno":bno,
				"id":id,
				"title":title,
				"content":text,
				"boardType":boardType}
			,success:function(res){
				alert('수정 하였습니다');
				window.opener.document.location.href=window.opener.document.URL; 
				self.close();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
		
	});
	$('#list').on('click',function(){
		location.href="<%=request.getContextPath()%>/freeBoard/list";
	});
});


</script> 

</body>
</html>