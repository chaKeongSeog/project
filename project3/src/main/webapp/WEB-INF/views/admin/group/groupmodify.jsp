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
    <div class="col-md-6" style="margin-left: -200px;">
        <h2 class="text-left" style="margin-top: 10px;">[${group.gno}]번 그룹방 수정</h2>
        <form action="<%=request.getContextPath() %>/admin/groupModify" method="post"  name="form1"onsubmit="return false;"/>
        	<input type="hidden" name="gno" id="gno" value="${group.gno}"/>
        	<input type="hidden" name="id" id="id" value="${user.id}"/>
          <table class="table">
            <tr>
                <td><input type="text"  class="form-control" name="id" id="id" value="${user.id}" readonly="readonly"></td>
            </tr>
            <tr>
                <td><input type="text" class="form-control" name="code" placeholder="초대코드" id="code" value="${group.code}"></td>
            </tr>
            <tr>
                <td><input type="text" class="form-control" name="name" placeholder="방이름" id="name" value="${group.name}"></td>
            </tr>
            <tr>
                <td>
                <textarea rows="10" cols="50" name="goal" id="goal" placeholder="내용" class="form-control">${group.goal}</textarea>
              

                </td>
            </tr>
            <tr>
                 
                <td colspan="2"  class="text-right">
                    <input type="button" value="수정" class="btn btn-primary " id="groupmodify">
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
	
	$('#groupmodify').on('click',function(){
		
		var gno = $('#gno').val();
		var id = $('#id').val().trim();
		var name = $('#name').val().trim();
		var goal = $('#goal').val().trim();
		var code = $('#code').val().trim();
		
		if(name == ""){
			alert('방이름을 입력해주세요');
			return false;
		}else if(name.length > 15){
			alert('글자수 15글자 입니다');
			return false;
		}else if(goal == ""){
			alert('목표를 입력해주세요');
			return false;
		}else if(code == ""){
			alert('코드를 입력해주세요');
			return false;
		}
		
		$.ajax({
			url:'/project3/admin/groupModify',
			type:'post',
			data:{"gno":gno,
				"id":id,
				"name":name,
				"goal":goal,
				"code":code}
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