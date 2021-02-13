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
        <h2 class="text-center" style="margin-top: 10px;">[${freeBoard.bno}번]자유게시판 답글</h2>
        <form action="<%=request.getContextPath() %>/freeBoard/regist" method="post"  name="form1"onsubmit="return false;"/>
        <input type="hidden" name="bno" id="bno" value="${freeBoard.bno}"/>
          <table class="table">
            <tr>
                <td><input type="text"  class="form-control" name="id" id="id" value="${user.id}" readonly="readonly"></td>
            </tr>
            <tr>
                <td><input type="text" class="form-control" name="title" placeholder="답변할 제목을 입력해주세요" id="title"></td>
            </tr>
            <tr>
                <td>
                <textarea rows="10" cols="50" name="content" id="content" placeholder="내용" class="form-control"></textarea>
              

                </td>
            </tr>
            <tr>
                 
                <td colspan="2"  class="text-right">
                    <input type="button" value="답변하기" class="btn btn-primary" id="write">
                    <button type="button"  class="btn btn-primary">목록</button>
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
	
	$('#write').on('click',function(){
		var id = $('#id').val().trim();
		var title = $('#title').val().trim();
		var text = $('#content').val().trim();
		
		if(title ==""){
			alert('제목을 입력해주세요');
			return false;
		}else if(title.length >15){
			alert('글자수는 15글자 입니다');
			return false;
		}else if(text == ""){
			alert('내용을 입력해주세요');
			return false;
		}
		
		document.form1.action = "<%=request.getContextPath()%>/freeBoard/answer";
        document.form1.submit();

		
		
	})
})


</script> 

</body>
</html>