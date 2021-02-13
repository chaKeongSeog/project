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
        <h2 class="text-center">자주하는 질문 글쓰기</h2>
        <form action="<%=request.getContextPath() %>/faq/regist" method="post"  name="form1"onsubmit="return false;"/>
          <table class="table">
            <tr>
                <td><input type="text"  class="form-control" name="id" id="id" value="${user.id}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>
                	<textarea rows="10" cols="50" name="title" id="title" placeholder="내용" class="form-control"></textarea>
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

	$('#write').on('click',function(){
		var id = $('#id').val().trim();
		var title = $('#title').val().trim();
		
		if(title == null){
			alert('내용을 입력해주세요');
			return false;
		}else if(title.length > 25){
			alert('글자는 25이하 입니다');
			return false;
		}
		document.form1.action = "<%=request.getContextPath()%>/faq/regist";
        document.form1.submit();
	});
	
	$('#list').on('click',function(){
		location.href="<%=request.getContextPath()%>/faq/list";
	});
});


</script> 

</body>
</html>