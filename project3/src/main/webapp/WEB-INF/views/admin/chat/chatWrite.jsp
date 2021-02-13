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
        <h2 class="text-left">메세지 보내기</h2>
        <form action="<%=request.getContextPath() %>/notice/regist"id="chatForm" method="post" name="chatForm" onsubmit="return false;"/>
        	
        	<input type="hidden" name="id" id="id" value="${user.id}"/>
        	<input type="hidden" name="curPage" id="curPage" value="${curPage}"/>
        	<input type="hidden" name="search_option" id="search_option" value="${search_option}"/>
        	<input type="hidden" name="keyword" id="keyword" value="${keyword}"/>
        	<c:forEach var="chat" items="${chatList}">
                <input type="hidden" name="fromID" id="fromID" value="${chat}"/> 
            </c:forEach>
          <table class="table">
            <tr>
                <td>
                	보낼 아이디:
                	<c:forEach var="chat" items="${chatList}">
                		<span style="border:1px solid #dfdfdf;padding:5px;border-radius:10px;" id="fromID">${chat}&nbsp;</span> 
                	</c:forEach>
                </td>
            </tr>
            <tr>
                <td>
                <textarea rows="10" cols="50" name="content" id="content" placeholder="메세지를 작성해주세요" class="form-control"></textarea>
              

                </td>
            </tr>
            <tr>
                <td colspan="2"  class="text-right">
                    <input type="button" value="보내기" class="btn btn-primary" id="write">
                    
                </td>
            </tr>
             
          </table>
        </form>
    </div>
</div>

 <script>
$(function(){	
	//opener.open("about:blank", "_self").close();
	$('#write').on('click',function(){
		
		
		var content = $('#content').val().trim();
		var form = $('#chatForm');
		
		if(content == ""){
			alert('메세지를 입력해주세요');
			return false;
		}else if(content.length > 50){
			alert('글자수는 50글자 이하입니다');
			return false;
		}
		$.ajax({
			url:'/project3/admin/chatWrite',
			type:'post',
			data:form.serialize()
			,success:function(res){
				alert('작성 하였습니다');
				window.opener.document.location.href="/project3/admin/chatList"; 
				self.close();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
		
	});
	
	
	$('#list').on('click',function(){
			location.href="<%=request.getContextPath()%>/notice/list";
	});
	
	//팝업창들 뛰우기
	//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
								+"height="+ WinHeight +", top="+ wintop +", left=" 
								+ winleft +", resizable=yes, status=yes"  );
		win.focus() ; 

	}

	//팝업창 닫기
	function CloseWindow(){
		if(window.opener)window.opener.location.reload(true);
		window.close();
	}
	
	
	
})


</script> 

</body>
</html>