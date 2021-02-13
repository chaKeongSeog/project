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
    <div class="col-md-7" style="margin-left: -200px;">
        <h2 class="text-center">수강평 수정</h2>
 		<form action="<%=request.getContextPath() %>/admin/evalmodify" onsubmit="return false;"name="lectureModifyForm" id="lectureModifyForm" method="post">
 			<input type="hidden" name="id" value="${user.id}"/>
 			<input type="hidden" name="eno" id="eno" value="${lecture.eno}"/>
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>강의명</label>
								<input type="text" name="lecturename" id="lecturename" class="form-control" maxlength="20" value="${lecture.lecturename}"/>
							</div>
							<div class="form-group col-sm-6">
								<label>교수명</label>
								<input type="text" name="professorname" id="professorname" class="form-control" maxlength="20" value="${lecture.professorname}"/>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>수강 연도</label>
								<select name="year" class="form-control" id="year">
									<option value="2011">2011</option>
									<option value="2012">2012</option>
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018">2018</option>
									<option value="2019">2019</option>
									<option value="2020"selected>2020</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>수강 월</label>
								<select name="month" class="form-control" id="month">
									<option value="1" selected>1월</option>
									<option value="2">2월</option>
									<option value="3">3월</option>
									<option value="4">4월</option>
									<option value="5">5월</option>
									<option value="6">6월</option>
									<option value="7">7월</option>
									<option value="8">8월</option>
									<option value="9">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>강의 구분</label>
								<select name="divide" class="form-control" id="divide">
									<option value="풀스택" selected> 풀-스택 개발자 양성과정</option>
									<option value="인공지능">엔지니어링 과정</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>제목</label>
								<input type="text" name="title" id="title" class="form-control" maxlength="30" value="${lecture.title}">
							</div>
							<div class="form-group col-sm-12">
								<label>내용</label>
								<textarea name="content" id="content"class="form-control" maxlength="2048" style="height:180px;">${lecture.content}</textarea>
								
							</div>
						</div>
						
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>평점</label>
								<select name="totalscore" class="form-control" id="totalscore">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
						</div>
						<hr style="clear:both;opacity:0;"/>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary" id="modify">수정하기</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal" id="list">목록</button>
						</div>
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
	$('#modify').on('click',function(){
		var eno = $('#eno').val();
		var id = $('#id').val();
		var lecturename = $('#lecturename').val();
		var professorname = $('#professorname').val();
		var year = $('#year').val();
		var month = $('#month').val();
		var divide = $('#divide').val();
		var title = $('#title').val();
		var content = $('#content').val();
		var totalscore = $('#totalscore').val();
		
		if(lecturename == ""){
			alert('강의명을 입력해주세요');
			return false;
		}else if(professorname == ""){
			alert('교수명을 입력해주세요');
			return false;
		}else if(year == ""){
			alert('년도를 입력해주세요');
			return false;
		}else if(divide == ""){
			alert('구분을 입력해주세요');
			return false;
		}else if(title == ""){
			alert('제목을 입력해주세요');
			return false;
		}else if(content == ""){
			alert('내용을 입력해주세요');
			return false;
		}else if(totalscore == ""){
			alert('종합 평가를 입력해주세요');
			return false;
		}else if(title.length>15){
			alert('글자수는 15글자 이하 입니다');
			return false;
		}
		var form = $('#lectureModifyForm');
		
		$.ajax({
			url:'/project3/admin/evalmodify',
			type:'post',
			data:{"eno":eno,
				"lecturename":lecturename,
				"id":id,
				"professorname":professorname,
				"year":year,
				"month":month,
				"divide":divide,
				"title":title,
				"content":content,
				"totalscore":totalscore}
			,success:function(res){
				alert('수정 하였습니다');
				window.opener.document.location.href=window.opener.document.URL; 
				self.close();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
		
		
        //document.lectureModifyForm.submit();

		
		
	})
	$('#list').on('click',function(){
		location.href="<%=request.getContextPath()%>/lecture/list"
	})
})


</script> 

</body>
</html>