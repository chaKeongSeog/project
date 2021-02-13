<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- 	<%@include file="registHeader.jsp" %> --%>
</head>
<body>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-6" style="margin-left: -200px;">
        <h2 class="text-left">채팅 수정</h2>
        <form action="<%=request.getContextPath() %>/notice/regist" method="post"  name="form1"onsubmit="return false;"/>
          <input type="hidden" name="cno" id="cno" value="${chat.cno}"/>
          <table class="table">
            <tr>
                <td><input type="text"  class="form-control" name="id" id="id" value="${user.id}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>
                <textarea rows="10" cols="50" name="content" id="content" placeholder="채팅을 수정해주세요" class="form-control">${chat.content}</textarea>
              

                </td>
            </tr>
            <tr>
                <td colspan="2"  class="text-right">
                    <input type="button" value="수정" class="btn btn-primary" id="modify">
                    
                </td>
            </tr>
             
          </table>
        </form>
    </div>
</div>

 <script>
$(function(){
	//opener.open("about:blank", "_self").close();
	$('#modify').on('click',function(){
		var cno = $('#cno').val();
		var id = $('#id').val().trim();
		var content = $('#content').val().trim();
		
		$.ajax({
			url:'/project3/admin/chatVOModify',
			type:'post',
			data:{"cno":cno,
				"id":id,
				"content":content}
			,success:function(res){
				alert('수정 하였습니다');
				window.opener.document.location.href="/project3/admin/chatList?search_option=${map.search_option}&keyword=${map.keyword}&curPage=${map.curPage}"; 
				self.close();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
		
		
<%-- 		document.form1.action = "<%=request.getContextPath()%>/admin/noticemodify"; --%>
//         document.form1.submit();

		
		
	});
	$('#list').on('click',function(){
			location.href="<%=request.getContextPath()%>/notice/list";
	});
})


</script> 

</body>
</html>