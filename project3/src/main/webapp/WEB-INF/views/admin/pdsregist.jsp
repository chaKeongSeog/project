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
    <div class="col-md-4" style="margin-left: -200px;">
        <h2 class="text-left">자료실 글쓰기</h2>
        <form action="<%=request.getContextPath() %>/pds/regist" method="post"  name="fdsForm" id="pdsForm"enctype="multipart/form-data" onsubmit="return false;"/>
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
            	<td>
            		<div class="form-group">
				        <span class="cursor" id="addFile5"><i class="fa fa-plus-circle fa-lg"></i> 파일추가</span>
				        &nbsp;
				        <span class="cursor" id="deleteFile5"><i class="fa fa-times-circle fa-lg"></i> 파일삭제</span>
			    	</div>
            	</td>
            </tr>
            <tr>
                <td>
                    <div id="fdsArea">
                      
                   </div>                 
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
	var index = 0;
	$('#content').summernote({
		height:300,
		width:700
	});
	
	$('#write').on('click',function(){
		var id = $('#id').val().trim();
		var title = $('#title').val().trim();
		var text = $('#content').val().trim();
		var form = $('#pdsForm');
		if(id == ""){
			alert('로그인은 필수입니다');
			return false;
		}else if(title == ""){
			alert('제목을 입력해주세요');
			return false;
		}else if(text == ""){
			alert('내용을 입력해주세요');
			return false;
		}else if(title.length>15){
			alert('글자수는 15글자 이하입니다');
			return false;
		}
		
        var data = new FormData(form[0]);
        $.ajax({
            type: "post",
            enctype: 'multipart/form-data',
            url: "/project3/admin/pdsregist",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (res) {
            	alert('글을 작성하였습니다');
            	window.opener.document.location.href="<%=request.getContextPath()%>/admin/pdsList"; 
				self.close();
            },error: function(req) {
               alert('상태:'+req.status);
            }
        });
		
<%-- 		document.fdsForm.action = "<%=request.getContextPath()%>/admin/pdsregist"; --%>
//         document.fdsForm.submit();
	});
	
	$('#addFile5').on('click',function(){
		index++;
		code = '<div id="inputRow"><input type="file" class="form-control" name="multi" id="fileName" style="margin:5px; 0px"></div>';
		$('#fdsArea').append(code);
	});
	
	$(this).on('change','#fileName',function(){
		if(this.files[0].size>1024 * 1024 * 10){
	  		alert('파일 사이즈가 10MB 초과하였습니다');
	  		$(this).val('');
	  		return false;
	  	}	
	});
	
	$('#deleteFile5').on('click',function(){
		var file = $('#fdsArea #inputRow');
		for(var i= 0;i<file.length;i++){
			var last = parseInt(file.length-1);
			file[last].remove();
		}
		
	});
	
	$('#list').on('click',function(){
		location.href="<%=request.getContextPath()%>/fds/list";
	});
});


</script> 

</body>
</html>