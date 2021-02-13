<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="registHeader.jsp" %>
</head>

<body>
<div class="row" style="margin-left: 200px;">
    <div class="col-md-2"></div>
    <div class="col-md-7">
        <h2 class="text-center">수강평 작성</h2>
 		<form action="<%=request.getContextPath() %>/lecture/regist" onsubmit="return false;"name="form1" method="post">
 			<input type="hidden" name="id" value="${user.id}"/>
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>강의명</label>
								<input type="text" name="lecturename" id="lecturename" class="form-control" maxlength="20"/>
							</div>
							<div class="form-group col-sm-6">
								<label>교수명</label>
								<input type="text" name="professorname" id="professorname" class="form-control" maxlength="20"/>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>수강 연도</label>
								<select name="year" id="year" class="form-control">
									<option value="2011">2011</option>
									<option value="2012">2012</option>
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018">2018</option>
									<option value="2019">2019</option>
									<option value="2020">2020</option>
									<option value="2021"selected>2021</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>수강 월</label>
								<select name="month" id="month" class="form-control">
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
								<select name="divide" id="divide" class="form-control">
									<option value="풀스택" selected> 풀-스택 개발자 양성과정</option>
									<option value="인공지능">엔지니어링 과정</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>제목</label>
								<input type="text" name="title" id="title" class="form-control" maxlength="30">
							</div>
							<div class="form-group col-sm-12">
								<label>내용</label>
								<textarea name="content" id="content" class="form-control" maxlength="2048" style="height:180px;"></textarea>
								
							</div>
						</div>
						
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>평점</label>
								<select name="totalscore" id="totalscore" class="form-control">
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
							<button type="submit" class="btn btn-primary" id="regist">등록하기</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal" id="list">목록</button>
						</div>
					</form>
    </div>
</div>

 <script>
$(function(){
	$('#content').summernote({
		height:300,
		width:600
	});
	
	$('#regist').on('click',function(){
		
		var lecturename = $('#lecturename').val().trim();
		var professorname = $('#professorname').val().trim();
		var year = $('#year').val().trim();
		var month = $('#month').val().trim();
		var divide = $('#divide').val().trim();
		var title = $('#title').val().trim();
		var content = $('#content').val().trim();
		var totalscore = $('#totalscore').val().trim();
		
		if(lecturename == ""){
			alert('강의명을 입력해주세요');
			return false;
		}else if(professorname ==""){
			alert('교수명을 입력해주세요');
			return false;
		}else if(year ==""){
			alert('년도를 입력해주세요');
			return false;
		}else if(month ==""){
			alert('달을 입력해주세요');
			return false;
		}else if(divide ==""){
			alert('구분을 입력해주세요');
			return false;
		}else if(title ==""){
			alert('제목을 입력해주세요');
			return false;
		}else if(title.length >15){
			alert('글자수는 15글자 입니다');
			return false;
		}else if(content == ""){
			alert('내용을 입력해주세요');
			return false;
		}
		
		
		document.form1.action = "<%=request.getContextPath()%>/lecture/regist";
        document.form1.submit();

		
		
	})
	$('#list').on('click',function(){
		location.href="<%=request.getContextPath()%>/lecture/list"
	})
})


</script> 

</body>
</html>