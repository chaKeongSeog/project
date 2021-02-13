<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
		
		<script>
			$(function(){
				$('#btnzip').on('click',function(){
					window.open('zip.html','우편번호찾기','width=500 height=400');
					//$('#myModal').modal('show');
				});
				
				//번호검색 버튼에 대한 이벤트-modal방식 -버튼에서 직접 기술
				
				
				//주소찾기 모달창에서 확인버튼 클릭하면
				$('#btndong').on('click',function(){
					dongval = $('#dong').val().trim();
					$.ajax({
						url:'/jqpro/zip.do',
						type:'post',
						data:{"dong":dongval},
						success:function(res){
							$('#result1').html(res);
						},
						error:function(req){
							alert("상태"+req.status+"\n 메세지:"+req.statusText);
						},
						dataType:'html'
					})//ajax
					
					//주소결과중 하나를 선택하면
					$('#result1').on('click','.ziptr',function(){
						zipcode = $('td:eq(0)',this).text();
						addr = $('td:eq(1)',this).text();
						
						$('#zip').val(zipcode);
						$('#add1').val(addr);
						
// 						$('#zip').prop('readonly',true);
// 						$('#add1').prop('readonly',true);
						$('#myModal').modal('hide');
							
						
						
						
					})//ziptr
					
					//모달창이 닫힐때 입력또는 출력된 결과값을 지운다
					$('#myModal').on('hide.bs.modal',function(){
						$('#dong').val("");
						$('#result1').empty();
					})
					
				})//input:button
				
				
				
				//가입신청 클릭
				$('#btnjoin').on('click',function(){
					//입력한 모든 값을 자동으로 가져온다.
					console.log($('#form').serialize());
					console.log($('#form').serializeArray());	
					console.log($('#form').serializeJSON());	
					$.ajax({
						url:'/jqpro/insert.do',
						type:'post',
						data:$('#form').serializeArray(),
						success:function(res){
							$('#btnreset').hide();
							$('#spjoin').html(res.sw).css('color','red');
						},
						error:function(req){
							alert("상태:"+req.status());	
						},
						dataType:'json'
					})//ajax
					
					
				})//btnjoin
				
				
				$('#btnid').on('click',function(){
					//idval = $('#id').val().trim();
					if(idval.length < 1){
						alert('아이디를 입력해주세요');
						return false;
					}//id길이 체크
					$.get(
						'/jqpro/CheckById',
						{"id":idval},
						function(res){
							$('#spid').html(res.sw).css('color','blue');
						},
						'json'
					);//get
					
					
					
					/*
					$.ajax({
						url:'/jqpro/CheckById',
						type:'get',
						data:{"id":idval},
						success:function(res){
							$('#spid').html(res.sw).css('color','blue');
						},
						error:function(req){
							alert('상태'+req.status);
						},
						dataType:'json'
						
					})//ajax
					*/
					
					
					
				})//bthid(중복체크)
				
				
				
			})//$(function(){}
		</script>
		<style>
			.box{
				font-size: 1.2em;
			}
			
		</style>
	</head>
	<body>
		<div class="box">
	
		<div class="container">
		  <h2>학생 추가</h2>
		  <form class="form-horizontal" action="" id="form">
		   	<div class="form-group">
		      <label class="control-label col-sm-2" for="name">이름</label>
		      <div class="col-sm-4">
		        <input type="text" class="form-control" id="name" placeholder="Enter name" name="mem_name">
		      </div>
		      <span class="sp" ></span>
		      <div class="msg" id="namemsg"></div>
		    </div>

		    <div class="form-group">
		      <label class="control-label col-sm-2" for="hp">연락처
		      	
		      </label>
		      <div class="col-sm-4">
		        <input type="text" class="form-control" id="hp" placeholder="Enter hp" name="mem_hp">
		        
		      </div>
		      <span id="sp"></span>
		       <div class="msg" id="zipmsg"></div>
		    </div>
		    
		   	<div class="form-group">
		      <label class="control-label col-sm-2" for="mail">메일
		      	
		      </label>
		      <div class="col-sm-4">
		        <input type="email" class="form-control" id="mail" placeholder="Enter mail" name="mem_mail">
		        
		      </div>
		        <span id="sp"></span>
		        <div class="msg" id="mailmsg"></div>
		    </div>
		    
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="mail">반
		      </label>
		      <div class="col-sm-4">
		        <select name="room" id="room" class="form-control">
		        	<option value="401">401</option>
		        	<option value="402">402</option>
		        	<option value="403">403</option>
		        	<option value="404">404</option>
		        </select>
		      </div>
		    </div>
		    
		        <div class="form-group">
		      <label class="control-label col-sm-2" for="mail">종류
		      </label>
		      <div class="col-sm-4">
		        <select name="kind" id="kind" class="form-control">
		        	<option value="풀스택">풀스택</option>
		        	<option value="인공지능">인공지능</option>
		        </select>
		      </div>
		    </div>
		    	    
		 	<div class="form-group">
		      <label class="control-label col-sm-2" for="add1">주소</label>
		      <div class="col-sm-6">
		        <input type="text" class="form-control" id="add1" placeholder="Enter add1" name="mem_add1">
		        <span id="sp"></span>
		        <div class="msg" id="add1msg"></div>
		      </div>
		      
		    </div>
		    
		      <div class="form-group">
		      <label class="control-label col-sm-2" for="add2">상세주소</label>
		      <div class="col-sm-6">
		        <input type="text" class="form-control" id="add2" placeholder="Enter add2" name="mem_add2">
		        <span id="sp"></span>
		        <div class="msg" id="add2msg"></div>
		      </div>
		         
		    </div>
		    
		    <div class="form-group">        
		      <div class="col-sm-offset-2 col-sm-10">
		        <button type="button" class="btn btn-primary btn-lg" id="btnjoin">학생추가</button>
		        <span id="spjoin"></span>
		        <input type="reset" class="btn btn-primary btn-lg" value="취소" id="btnreset"/>
		      </div>
		    </div>
		    
		 	 </form>
			</div>
		</div>
		
		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog modal-sm">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Modal Header</h4>
		      </div>
		      <div class="modal-body">
		        <h3>우편번호 찾기</h3>
				찾는 동 이름을 입력
				<br>
				<input type="text" id="dong"/>
				<input type="button" value="확인" id="btndong">
				<div id="result1"></div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		
		  </div>
		</div>
	</body>
</html>    