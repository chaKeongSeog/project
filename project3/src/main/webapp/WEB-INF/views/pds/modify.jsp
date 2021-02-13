<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<%@include file="registHeader.jsp" %>
</head>
<body>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">자료실 수정</h2>
        <form action="<%=request.getContextPath() %>/pds/modify" method="post"  name="pdsForm" enctype="multipart/form-data" onsubmit="return false;" id="pdsForm"/>
        <input type="hidden" name="bno" value="${pds.bno}"/>
          <table class="table">
            <tr>
                <td><input type="text"  class="form-control" name="id" id="id" value="${user.id}" readonly="readonly"></td>
            </tr>
            <tr>
                <td><input type="text" class="form-control" name="title" placeholder="제목" id="title" value="${pds.title}"></td>
            </tr>
            <tr>
                <td>
                	<textarea rows="10" cols="50" name="content" id="content" placeholder="내용" class="form-control">${pds.content}</textarea>
                </td>
            </tr>
            <tr>
            	<td>
            		<div class="form-group">
				        <span class="cursor" id="addFile99"><i class="fa fa-plus-circle fa-lg"></i> 파일추가</span>
				        &nbsp;
				        <span class="cursor" id="deleteFile99"><i class="fa fa-times-circle fa-lg"></i> 파일삭제</span>
			    	</div>
            	</td>
            </tr>
            <tr>
                <td>
                    <div id="fdsArea">
                       <c:forEach var="attach" items="${attach}">
	                     	 <div id="attach">
	                     	 	첨부파일:
								<span class="mailbox-attachment-name" name="attachedFile">
									
								</span>													
								<i class="fas fa-paperclip"></i>
								${attach.originFileName}&nbsp;&nbsp;
								<button type="button" class="btn btn-link" id="attachFileCancel" idx="${attach.ano}">X</button>																									
							 </div>
					   </c:forEach>
                   </div>                 
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
	var index = 0;
	$('#content').summernote({
		height:300,
		width:1000
	});
	
	$('#modify').on('click',function(){
		var id = $('#id').val().trim();
		var title = $('#title').val().trim();
		var text = $('#content').val().trim();
		if(id == ""){
			alert('로그인은 필수입니다');
			return false;
		}else if(title == ""){
			alert('제목을 입력해주세요');
			return false;
		}else if(text == ""){
			alert('내용을 입력해주세요');
			return false;
		}
		document.pdsForm.action = "<%=request.getContextPath()%>/pds/modify";
        document.pdsForm.submit();
	});
	
	$('#addFile99').on('click',function(){
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
	$(this).on('click','#attachFileCancel',function(){
		var ano = $(this).attr('idx');
		$('#pdsForm').append('<input type="hidden" name="ano" id="ano" value="'+ano+'"/>');
		$(this).parent().remove();
		
	});
	$('#deleteFile99').on('click',function(){
		var file = $('#fdsArea #inputRow');
		for(var i= 0;i<file.length;i++){
			var last = parseInt(file.length-1);
			file[last].remove();
		}
		
	});
	
	$('#list').on('click',function(){
		location.href="<%=request.getContextPath()%>/pds/list";
	});
});


</script> 

</body>
</html>