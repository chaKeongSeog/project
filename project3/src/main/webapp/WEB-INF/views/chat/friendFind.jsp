<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/custom.css" />
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		$(this).on('click','#chatDetail',function(){
			var toID = $(this).attr('val');
			var form1 = $('#form1');
			form1.find('#toID').val(toID);
			form1.submit();
			
		});
	})
	function find(){
		var id = $('#findID').val();
		$.ajax({
			url:'<%=request.getContextPath()%>/member/idCheck',
			type:'post',
			data:{"id":id},
			success:function(res){
				if(res != ""){
					getFriend(id);	
				}else{
					failFriend();
				}
			},error:function(req){
				alert('상태:'+req.status);
			}
		})
	}
	function getFriend(id){
		var tr = "";
		tr +='<thead>';
		tr +='<tr>';
		tr +='<th><h4>검색 결과</h4></th>';
		tr +='</tr>';
		tr +='</thead>';
		tr +='<tbody>';
		tr +='<tr>';
		tr +='<td style="text-align:center;"><h3>'+id+'</h3><a href="#"id="chatDetail" val="'+id+'"class="btn btn-primary" style="float:right;">'+'메시지 보내기</a></td>';
		tr +='</tr>';
		tr +='</tbody>';
		$('#friendResult').html(tr);
	}
	function failFriend(id){
		var tr = "";
		tr +='<thead>';
		tr +='<tr>';
		tr +='<th><h4>검색 결과</h4></th>';
		tr +='</tr>';
		tr +='</thead>';
		tr +='<tbody>';
		tr +='<tr>';
		tr +='<td style="text-align:center;"><h3>아이디를 찾을수 없습니다</h3></td>';
		tr +='</tr>';
		tr +='</tbody>';
		$('#friendResult').html(tr);
	}
</script>
<form action="<%=request.getContextPath()%>/chat/detail" method="post" id="form1">
	<input type="hidden" name="toID" id="toID" value=""/>
</form>
	<div class="container">
		<table class="table table-bordered table-hover" style="text-align: center;border:1px solid #dddddd">
			<thead>
				<tr style="background-color: #036DCE;color:white;">
					<th colspan="2"><h4>검색으로 친구찾기</h4></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width:110px;"><h5>아이디</h5></td>
					<td><input class="form-control" type="text" id="findID" maxlength="20" placeholder="찾을 아이디를 입력해주세요"></td>
					
				</tr>

				<tr>
					<td colspan="2">
						<button class="btn btn-primary"style="float:right;"onclick="find()">검색</button>
					</td>					
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container">
		<table id="friendResult" class="table table-bordered table-hover" style="text-align: center;border:1px solid #dddddd;">
			
		</table>
	</div>
</body>
</html>