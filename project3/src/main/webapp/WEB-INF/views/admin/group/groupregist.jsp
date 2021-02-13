<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
</head>
<body>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8" style="margin-left: -200px;">
        <h2 class="text-center" style="margin-top: 10px;">그룹방 추가</h2>
        <form action="<%=request.getContextPath()%>/group/insertStRoom" method="post"  name="form1"onsubmit="return false;" id="studyRoomForm"/>
        
          <table class="table">
            <tr>
                <td><input type="text"  class="form-control" name="id" id="id" value="${user.id}" readonly="readonly"></td>
            </tr>
            <tr>
	            <td>
	            	<input class="form-control" placeholder="이름을&nbsp;입력하세요." type="text" name="name" id="name" autocomplete="off"/>
	            </td>
            </tr>
            <tr>
                <td>
                	<textarea rows="10" cols="50" name="goal" id="goal" placeholder="목표를&nbsp;입력하세요" class="form-control"></textarea>
                </td>
            </tr>
            <tr>
                 
                <td colspan="2"  class="text-right">
                    <input type="button" value="방추가" class="btn btn-primary" id="write">
                    <button type="button"  class="btn btn-primary" id="list">목록</button>
                </td>
            </tr>
             
          </table>
        </form>
    </div>
</div>

<script>
$(function(){
	//스터디룸 생성
	$('#write').on('click',function(){
		var form = $('#studyRoomForm');
		var id = form.find('#id').val();
		var name = form.find('#name').val();
		var goal = form.find('#goal').val();
		if(name == ""){
			alert('이름을 입력해주세요');
			return false;
		}else if(goal == ""){
			alert('목표를 입력해주세요');
			return false;
		}
		if(name.length > 13 ){
			alert('스터디룸은 12글자 이하입니다');
			return false;
		}
		$.ajax({
			url:'/project3/group/insertStRoom',
			type:'post',
			data:{"id":id,
				"name":name,
				"goal":goal}
			,success:function(res){
				if(res.gmno == 1){
					alert('스터디룸이 생성되었습니다');
				}else{
					alert('생성을 실패하였습니다');
				}
				window.opener.document.location.href="<%=request.getContextPath()%>/admin/groupList"; 
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
</script>	

</body>
</html>