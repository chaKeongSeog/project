<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
<form action="/project3/group/detail" method="post" name="groupDetailForm" id="groupDetailForm" style="display:none;">
 	<input type="hidden" name="gno" id="gno" value="${gno}"/>
</form>
<div class="row" id="fullRow">
	<div class="col-lg-12 col-xl-12">
		<div class="row" style="margin-top: 25px;">
			<div class="col-md-3">
				<div class="card card-stats card-warning">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12 text-center">
								<div class="numbers">
									<p class="card-category">
										<span style="font-size:20px;font-weight:bold;" id="ddayContent">
											
										</span>
									</p>
									<h4 class="card-title">
										<div style="display:inline-block" id="dday">
											
										</div>
										<div style="display:inline-block" id="d-dayWrite">
											<i class="fas fa-calendar-day" style="cursor:pointer;"></i>
										</div>
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card card-stats card-warning">
					<div class="card-body ">
						<div class="row">
							<div class="col-md-12 text-center">
								<div class="numbers">
								<p class="card-category">
									<span style="font-size:20px;font-weight:bold;">
										스터디 그룹 이름
									</span>
								</p>	
									<h4 class="card-title">
										<div id="groupName" style="font-size: 25px;">
											
										</div>
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card card-stats card-warning">
					<div class="card-body ">
						<div class="row">
							<div class="col-md-12 text-center">
								<div class="numbers">
									<p class="card-category">
										<span style="font-size:20px;font-weight:bold;">
											참가 인원
										</span>
									</p>
									<h4 class="card-title" id="GroupCount">
										
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				<div class="col-md-3">
				<div class="card card-stats card-warning">
					<div class="card-body ">
						<div class="row">
							<div class="col-md-12 text-center">
								<div class="numbers">
									<p class="card-category">
										<span style="font-size:20px;font-weight:bold;">
											스터디 계획 미인증 수
										</span>
									</p>
									<h4 class="card-title" id="nonVertifyCcount">
										
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
<div class="col-lg-8 col-xl-8" style = "width:100%;margin-top:25px;">
	<div class="card shadow mb-12">
			<div class="card-header d-flex justify-content-between align-items-center">
				<h6 class="font-weight-bold m-0">파일 공유</h6>
			</div>
			<div class="card-body fileupload">
	 			<div class="form-group">
                  	<form id="fileform" enctype="multipart/form-data" action="<%=request.getContextPath() %>/group/upload" method="post">
	                  	<input type="hidden" name="gno" id="gno" value="${gno}">
	                  	<input type="hidden" name="id" value="${user.id}"/>
	                  	<div class="chart-area" id="groupdrive" style="overflow : scroll;height:320px;margin-bottom:10px;">
	                  		<div class="row" id="row">
	                  			<p>파일이 없습니다</p>
	                  		</div>
	                  	</div>
						<input id="fileInput" type="file" data-class-button="btn btn-default" name="file" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="control-label col-sm-2" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
						<div class="row">
							<div class="col-lg-4 col-xl-4">
								<div class="bootstrap-filestyle input-group" style="width:250px;">
									<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
									<span class="group-span-filestyle input-group-btn" tabindex="0">
										<label for="fileInput" class="btn btn-default">
											<span class="glyphicon"><i class="fas fa-upload"></i></span>
										</label>
									</span>
								</div>
							</div>
							<div>
								<button type="button" class="btn btn-primary filebtn" id="btnupload" disabled="disabled">upload</button>
<!-- 								<button type="button" class="btn btn-danger filebtn" id="btndelete" disabled="disabled">reset</button> -->
							</div>
						</div>
					</form>
				</div>		
			</div>
		</div>
		<div class="row">
				<div class="col-lg-6 col-xl-6" style = "width:100%;margin-top:25px;">
				<div id="cal_bg" class="card shadow mb-4">
					<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
						<h6 class="text-primary font-weight-bold m-0">
							<span style="color: #46546e; font-weight: bold; text-align: center;"><h6 class="font-weight-bold m-0">공부 진행도</h6></span>
						</h6>
					</div>
					<div class="card-body">
						<div id="taskText">
						           
					    </div>       
					</div>
						
					</div>
					
				</div>
				<div class="col-lg-6 col-xl-6" style = "width:100%;margin-top:25px;">
					<div id="cal_bg" class="card shadow mb-4" style="height:500px;">
						<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
							<h6 class="text-primary font-weight-bold m-0">
								<span style="color: #46546e; font-weight: bold; text-align: center;"><h6 class="font-weight-bold m-0">회원</h6></span>
							</h6>
						</div>
						<div class="card-body" style="margin-bottom:30px;">
							<div id="groupMemberCard" class="col-lg-10 col-xl-10">
									<div id="memCardList" class="row">
						               
						            </div>
							</div>
						</div>
					</div>
				</div>
			
		</div>
		<div class="row">
			<div class="col-lg-12 col-xl-12" style = "width:100%;margin-top:25px;">
				<div id="cal_bg" class="card shadow mb-12">
					<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
						<h6 class="text-primary font-weight-bold m-0">
							<span style="color: #46546e; font-weight: bold; text-align: center;"><h6 class="font-weight-bold m-0">팀 일정</h6></span>
						</h6>
					</div>
					<div class="card-body" style="margin-bottom:30px;">
						<div id="groupMemberCard" class="col-lg-12 col-xl-12">
							<div id='calendar'>
  		
 							</div>  
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
	<div class="col-lg-4 col-xl-4" style = "width:100%;margin-top:25px;">
		<div class="card shadow mb-12">
			<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
				<h6 class="text-primary font-weight-bold m-0">
					<span style="color: #46546e; font-weight: bold; text-align: center;"><h6 class="font-weight-bold m-0">채팅</h6></span>
				</h6>
			</div>
			<div class="card-body">
				<div id="chatArea" class="chatArea" style="border:1px solid #dfdfdf;width:100%;height:880px;overflow-y:auto;">
					
					
				</div>
				<div class="chatSubmitArea">
					<form action="<%=request.getContextPath()%>/group/addChatMessage" method="post" onsubmit="return false;" id="groupChatForm">
						<input type="hidden" id="gno" name="gno" value="${gno}"/>
						<input type="hidden" id="id" name="id" value="${user.id}"/>
						<input id="chatText" name="chatText" type="text" style="width:100%;border:1px solid #dfdfdf;" placeholder="채팅을 입력해주세요" autofocus="autofocus" autocomplete="off"/>
						<input class="btn-primary" id="chatBtn"type="submit" value="전송">
					</form>	
				</div>
			</div>
		</div>
	
		<div class="card shadow mb-12" style = "width:100%;margin-top:50px;">
			<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
				<h6 class="text-primary font-weight-bold m-0">
					<span style="color: #46546e; font-weight: bold; text-align: center;"><h6 class="font-weight-bold m-0">해야 할일</h6></span>
				</h6>
			</div>
			<div class="card-body" id="writeArea">
				<input type="text" class="form-control" id="memoListContent"/>
					<div id="memoListWrite">
						<i class="far fa-edit" id="memoListWriteIcon"></i>
					</div>
			</div>
			<div class="card-body">
				<div id="con">
				     <h1>목록</h1>
				    <ul id="memoListUl" style="overflow-y: auto; overflow-x:hidden;width: auto; height: 529px;">
				  		
				    </ul>
				</div>
			</div>
			<div class="chatSubmitArea">
				
			</div>
		</div>
	</div>
	
	<!--  -->
	<div class="col-lg-12 col-xl-12" style = "width:100%;margin-top:25px;">
		<div id="cal_bg" class="card shadow mb-4">
			<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
				<h6 class="text-primary font-weight-bold m-0">
					<span style="color: #46546e; font-weight: bold; text-align: center;"><h6 class="font-weight-bold m-0">인증 게시판</h6></span>
				</h6>
			</div>
			<div class="card-body" id="groupBoardArea">
		
			</div>
			<div class="card-body" class="groupSubmit">
				<div class="form-group">
					<button class="btn btn-primary btn-sm" id="vertify">인증하기</button>
				</div>
			</div>
		</div>
		<div id="GroupCard" class="col-lg-12 col-xl-12" style = "width:100%;margin-top:25px;">
			
		</div>
		
	
	
	</div>

</div>
<div id="layoutAuthentication_footer">
    <footer class="py-4 bg-light mt-auto">
        <div class="container-fluid">
            <div class="d-flex align-items-center justify-content-between small">
                <div class="text-muted">Copyright © Your Website 2020</div>
                
            </div>
        </div>
    </footer>
</div>

<!-- 프로젝트 진행도 Modal -->
<div id="progressModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      	<h4 class="modal-title">프로젝트 진행도 수정</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <form action="<%=request.getContextPath()%>/group/modifyGroupMember" id="modifyGM" onsubmit="return false">
			<input type="hidden" name="id" value="${user.id}" id="id"/>
			<input type="hidden" name="gno" value="${gno}" id="gno"/>
			<input class="form-control" placeholder="담당 역할" type="text" name="name" id="name" autocomplete="off" style="width:100%;"/>
			<div style="height: 7px;"></div>
			<input type="range" name="processivity" id="processivity" style="width:100%;"/>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" id="modifyGroupMember" class="btn btn-primary" data-dismiss="modal">생성</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

 <!-- 그룹 멤버 초대하기 -->
  <div class="modal fade" id="GroupAddMemberModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">그룹에 회원 초대하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <p>그룹에 초대할 반</p>
          <select name="classRoom" id="classRoom" class="form-control">
            <option value="">선택해주세요</option>
          	<option value="401">401</option>
          	<option value="402">402</option>
          	<option value="403">403</option>
          	<option value="404">404</option>
          </select>
          <p style="margin-top: 10px;">그룹에 초대할 회원</p>
          <select name="selectmMember" id="selectMember" class="form-control" disabled="true">
          	
          </select>
          <button type="button" class="btn btn-primary" id="groupAddMember" style="float:right;margin-top:10px;">초대하기</button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- D-day Modal -->
  <div class="modal fade" id="D-dayModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">D-DAY</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        	<div>
        		<span style="font-weight:bold;">내용</span>
        		<input type="text" class="form-control" name="content" id="dcontent"/>
        	</div>
          	<div>
          		<span style="font-weight:bold;">날짜</span>
          		<input type="date" class="form-control" name="date" id="ddate"/>	
          	</div>
          	<div class="text-right" style="margin-top: 10px;">
          		<button class="btn btn-primary" id="dwrite">입력</button>
          	</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
<!-- 미인증 내역  수정 Modal -->
<div id="todoListModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      <h4 class="modal-title">미인증 내역 수정</h4>
      </div>
      <div class="modal-body">
		   <form id="vForm" action="/project3/group/todoListWrite" name="vForm" onsubmit="return false;">
		    <div class="form-group">
		      <label for="usr">제목</label>
		      <input type="text" class="form-control" id="vtitle" name="title">
		    </div>
		    <div class="form-group">
		      <label for="usr">내용</label>
		      <textarea class="form-control" id="vcontent" name="content" rows="5"></textarea><br>
		    </div>
		  </form>
      </div>
      <div class="modal-footer">
	      <button class="btn btn-primary pull-right" type="button" id="vmodify">작성</button>
	      <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>

<!-- 미인증 내역  상세 Modal -->
<div id="todoListDetailModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      <h4 class="modal-title">미인증 내역 상세보기</h4>
      </div>
      <div class="modal-body">
		    <div class="form-group">
		      <label for="usr" style="font-size:20px;font-weight:bold;">제목</label>
		      <div id="toTitle">
		      	
		      </div>
		    </div>
		    <div class="form-group">
		      <label for="usr" style="font-size:20px;font-weight:bold;">내용</label>
		      <div id="toContent">
		   			
		      </div>
		    </div>
      </div>
      <div class="modal-footer">
	      <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>  

<!-- 인증게시판 글쓰기 모달 -->
<div id="grBoardModal" class="modal fade" role="dialog">
<div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      <h4 class="modal-title">글 작성</h4>
      </div>
      <div class="modal-body">
	   <form id="grBoardForm" name="grBoardForm" onsubmit="return false;">
	   		<input type="hidden" name="gno" id="gno" value="${gno}"/>
	   		<input type="hidden" name="id" id="id" value="${user.id}"/>
		    <div class="form-group">
		      <label for="usr">제목</label>
		      <input type="text" class="form-control" id="grBoardTitle" name="title">
		    </div>
		    <div class="form-group">
		      <label for="usr">내용</label>
		      <textarea class="form-control" id="grBoardContent" name="content" rows="5"></textarea><br>
		    </div>
           		<div class="form-group">
			        <span class="cursor" id="addFile"><i class="fa fa-plus-circle fa-lg"></i> 파일추가</span>
			        &nbsp;
			        <span class="cursor" id="deleteFile"><i class="fa fa-times-circle fa-lg"></i> 파일삭제</span>
		    	</div>
                <div id="fdsArea">
                  
                </div>                 
		</form>
      </div>
      <div class="modal-footer">
      	<button class="btn btn-default pull-right" type="button" id="grBoardWrite">인증</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 인증 게시판 수정 모달창 -->
  <!-- The Modal -->
  <div class="modal fade" id="grBoardModifyModal">
    <div class="modal-dialog modal-lg" style="max-width: 100%; width: auto; display: table;">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">글 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <form id="grBoardModifyForm" name="grBoardForm" onsubmit="return false;">
		   		<input type="hidden" name="gno" id="gno" value="${gno}"/>
		   		<input type="hidden" name="id" id="id" value="${user.id}"/>
			    <div class="form-group">
			      <label for="usr">제목</label>
			      <input type="text" class="form-control" id="grBoardTitle" name="title" value="">
			    </div>
			    <div class="form-group">
			      <label for="usr">내용</label>
			      <textarea class="form-control" id="grBoardModifyContent" name="content" rows="5"></textarea><br>
			    </div>
	           		<div class="form-group">
				        <span class="cursor" id="modifyAddFile"><i class="fa fa-plus-circle fa-lg"></i> 파일추가</span>
				        &nbsp;
				        <span class="cursor" id="modifyDeleteFile"><i class="fa fa-times-circle fa-lg"></i> 파일삭제</span>
			    	</div>
	                <div id="mofidyAttachArea">
	                  
	                </div> 
	                <div id="pagegbnoArea">
	                
	                </div>   
	                <div id="ganoArea">
	                	
	                </div>             
			</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button class="btn btn-default pull-right" type="button" id="grBoardModify">수정</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

 <!-- 오늘 공부 계획 작성 모달 -->
  <div class="modal" id="todoListWrite">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">오늘 하루 공부 계획</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form id="todoListWriteForm" action="/project3/group/todoListWrite" name="vForm" onsubmit="return false;">
          	<input type="hidden" name="gno" id="gno" value="${gno}"/>
          	<input type="hidden" name="id" id="id" value="${user.id}"/>
		    <div class="form-group">
		      <label for="usr">제목</label>
		      <input type="text" class="form-control" id="title" name="title">
		    </div>
		    <div class="form-group">
		      <label for="usr">내용</label>
		      <textarea class="form-control" id="content" name="content" rows="5"></textarea><br>
		    </div>
		  </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	<button class="btn btn-default pull-right" type="button" id="todoListWriteBtn">작성</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
<script>
	$(function(){
		//팀일정
		teamCalander();
		var gno = '${gno}';
		GroupInfo(gno);
		groupFileList(gno);
 		//그룹 채팅방 리스트 불러오기
 		setTimeout(function(){
 			groupChatList(gno);
 		},1000);
 		//그룹 삭제
 		$(this).on('click','#Grdelete',function(){
 			if(confirm('정말로 그룹방을 삭제하시겠습니까?')){
 				var form = $(this).parents('#groupDeleteForm');
 	 			form.submit();	
 			}
 		});
 		//인증게시판 당일 평가
 		var now = new Date();
		var millisTill10 = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 17, 1, 40, 0);
//  		setInterval(function(){
//  			GroupBoardTest(gno);
//  		},10000);



 		//인증 게시판 리스트 불러오기
 		groupBoardList(1, gno);
		//하루일정 등록했는지 안했는지 체크
		TodayTodoListCheck(gno,'${user.id}');
 		//인증게시판 글쓰기 summernote
 		$('#grBoardContent').summernote({
 			height:300,
 			width:1250
 		});
 		//인증게시판 글수정 summernote
 		$('#grBoardModifyContent').summernote({
 			height:300,
 			width:1250
 		});
 		//미인증 내역 상세보기
 		$(this).on('click','#todoListTitle',function(){
 			var gtno = $(this).closest('#memberStudyList').attr('idx');
 			$('#todoListDetailModal').find('#toTitle').html('');
 			$('#todoListDetailModal').find('#toContent').html('');
 			$.ajax({
 				url:'/project3/group/getMemberTodoList',
 				type:'post',
 				data:{"gno":gno,
 					  "gtno":gtno},
 				success:function(res){
 					var todoList = res.todoList;
 					var content = todoList.content.replace(/\n/g, '<br>');
 					$('#todoListDetailModal').find('#toTitle').html('<p style="margin:5px;">'+todoList.title+'</p>');
 					$('#todoListDetailModal').find('#toContent').html('<p style="margin:5px;">'+content+'</p>');
 					$('#todoListDetailModal').modal('show');	
 				},error:function(req){
 					alert('상태:'+req.status);
 				},dataType:'json'
 			});
 		})
 		//미인증 내역 수정하기
 		$('#vmodify').on('click',function(){
 			var form = $('#vForm');
 			var gtno = form.find('#gtno').val();
 			var title = form.find('#vtitle').val();
 			var content = form.find('#vcontent').val();
 			if(title == ""){
 				alert('제목을 입력해주세요');
 				return false;
 			}else if(content == ""){
 				alert('내용을 입력해주세요');
 				return false;
 			}else if(title.length > 25){
 				alert('제목은 25글자 이하로 입력해주세요');
 				return false;
 			}
 			$.ajax({
 				url:'/project3/group/todoListModify',
 				type:'post',
 				data:{"gno":gno,
 					  "gtno":gtno,
 					  "title":title,
 					  "content":content,
 					  "id":'${user.id}'},
 				success:function(res){
 					form.find('#vtitle').val('');
 					form.find('#vcontent').val('');
 					GroupInfoCard(gno);
 					//인증 게시판 수정 모달
 					$('#todoListModal').modal('hide');
 					
 					
 				},error:function(req){
 					alert('상태:'+req.status);
 				},dataType:'json'
 			});
 		});
 		//미인증 내역 수정 모달창 띄우기
 		$(this).on('click','#memberStudyListDelete',function(){
 			var id = $(this).attr('user');
 			if(id != '${user.id}'){
 				alert('수정 권한이 없습니다');
 				return false;
 			}
 			$('#vForm').find('#gtno').remove();
 			var idx = $(this).closest('#memberStudyList').attr('idx');
 			$.ajax({
 				url:'/project3/group/getMemberTodoList',
 				type:'post',
 				data:{"gno":gno,
 					  "gtno":idx,
 					  "gno":gno,
 					  "id":'${user.id}'},
 				success:function(res){
 					var todo = res.todoList;
 					var gtno = '<input type="hidden" name="gtno" id="gtno" value="'+todo.gtno+'"/>';
 					$('#vForm').append(gtno);
 					$('#vForm').find('#vtitle').val(todo.title);
 					$('#vForm').find('#vcontent').val(todo.content);
 					
 					//인증 게시판 수정 모달
 					$('#todoListModal').modal('show');
 				},error:function(req){
 					alert('상태:'+req.status);
 				},dataType:'json'
 			});
 			
 			
 		});
 		//card에 그룹 정보 불러오기
 		GroupInfoCard(gno);
 		//d-day 모달 띄우기
 		$('#d-dayWrite').on('click',function(){
 			$('#D-dayModal').modal('show');
 		});
 		//d-day 작성
 		$('#dwrite').on('click',function(){
 			var cont = $('#dcontent').val();
 			var date = $('#ddate').val();
 			$.ajax({
 				url:'/project3/group/dayWrite',
 				type:'post',
 				data:{"content":cont,
 					"date":date,
 					"id":'${user.id}',
 					"gno":gno},
 				success:function(res){
 					var ddayVO = res.ddayVO;
 					var dday = res.dday;
 					$('#ddayContent').html(ddayVO.content);
 					$('#dday').html('D'+dday);
 					$('#D-dayModal').modal('hide');
 					$('#dcontent').val('');
 				},error:function(req){
 					alert('상태:'+req.status);
 				},dataType:'json'
 			});
 		});
 		//D-day 불러오기
 		getday(gno);
 		//memo 작성
 		$('#memoListWrite').on('click',function(){
 			var content = $('#memoListContent').val();
 			if(content == ""){
 				alert('해야할일 내용을 입력해주세요');
 				return false;
 			}
 			$.ajax({
 				url:'/project3/group/memoWrite',
 				type:'post',
 				data:{"content":content,
 					  "id":'${user.id}',
 					"gno":gno},
 				success:function(res){
 					$('#memoListContent').val('');
 					getMemoList(gno);
 				},error:function(req){
 					alert('상태:'+req.status);
 				},dataType:'json'	
 			});
 		});
 		//memo 불러오기
 		getMemoList(gno);
 		//memo 삭제하기
 		$(this).on('click','#memoListDelete',function(){
 			var mno = $(this).parent().parent().attr('idx');
 			memoDelete(mno,this);
 		});
 		//그룹에 회원 초대하기
 		$('#groupAddMember').on('click',function(){
 			var toID = $('#selectMember option:selected').val();
 			var fromID = '${user.id}';
 			$.ajax({
 				url:'/project3/group/addcode',
 				type:'post',
 				data:{"toID":toID,
 					"fromID":fromID,
 					"gno":gno},
 				success:function(res){
 					alert(res.result);
 					$('#GroupAddMemberModal').modal('hide');
 				},error:function(req){
 					alert('상태:'+req.status);
 				},dataType:'json'
 			});
 			
 		});
 		//그룹에 초대할 반 고를때
 		$('#classRoom').on('change',function(){
 			$('#selectMember').attr('disabled',false);
 			var room = $('#classRoom').val();
 			$.ajax({
 				url:'/project3/group/getDDitMember',
 				type:'post',
 				data:{"room":room},
 				success:function(res){
 					var list = res.list;
 					var code = "";
 					for(var i = 0; i <list.length;i++){
 						code += '<option id="dditMember" value="'+list[i].id+'">'+list[i].name+'('+list[i].id+')'+'</option>';
 					}
 					$('#selectMember').empty();
 					$('#selectMember').append(code);
 				},error:function(req){
 					alert('상태:'+req.status);
 				},dataType:'json'
 			})	
 		});
 		
 		//그룹방 나가기
 		$(this).on('click','#GrOut',function(){
 			if(confirm('정말로 그룹방에서 나가시겠습니까?')){
 				var form = $('#groupMemberOutForm');
 	 			form.submit();
 			}
 		});
		//그룹방 채팅 입력
		$('#chatBtn').on('click',function(){
			var form = $('#groupChatForm');
			var gno = form.find('#gno').val();
			var chatText = form.find('#chatText').val();
			var id = form.find('#id').val();
			if(chatText == ""){
				alert('채팅을 입력해주세요');
				return false;
			}
			$.ajax({
				url:'<%=request.getContextPath()%>/group/addChatMessage',
				type:'post',
				data:{"gno":gno,
					"id":id,
					"chatText":chatText
				},
				success:function(res){
					$('#chatText').val('');
					setTimeout(function(){
						groupChatList(gno);
					},1000);
				},error:function(req){
					alert('상태:'+req.status);
				},dataType:'json'
			});	
		});
		//그룹방 초대하기
		$(this).on('click','#addGroupMember',function(){
			$('#GroupAddMemberModal').modal('show');
		});
		//파일 업로드
		$('#btnupload').on('click',function(){
			var formData = new FormData($('#fileform')[0]);
			$.ajax({ 
				type: "POST", 
				enctype: 'multipart/form-data', 
				url: '<%=request.getContextPath()%>/group/upload', 
				data: formData,
				processData: false,
				contentType: false,
				cache: false,
				success: function(res) { 
					$('#userfile').val('');
					$('#btnupload').attr('disabled','disabled');
					$('#btndelete').attr('disabled','disabled');
					groupFileList(gno);
				}, error: function(req){ 
					alert('상태:'+req.status);
				},dataType:'json' 
			});
		});//파일 업로드
	});//$(function)
	//인증게시판 수정 모달창
	function GroupBoardModify(gbno,gno,page,t){
		var id = $(t).attr('user');
		var user = '${user.id}';
		if(user != id){
			alert('수정 권한이 없습니다');
			return false;
		}
		$.ajax({
			url:'/project3/group/GroupBoardModifyForm',
			type:'post',
			data:{"gbno":gbno,
				"gno":gno}
			,success:function(res){
				var gr = res.grBoard;
				var attach = res.attach;
				var code = "";			
				var input = "";
				input += '<input type="hidden" name="curPage" id="curPage" value="'+page+'">';
				input += '<input type="hidden" name="gbno" id="gbno" value="'+gr.gbno+'">';
				for(var i = 0; i <attach.length;i++){
					code += '<div id="attach">'
					code += '첨부파일:'
					code += '<span class="mailbox-attachment-name" name="attachedFile">'
					code += '</span>'													
					code += '<i class="fas fa-paperclip"></i>'
					code += attach[i].originfileName 
					code += '<button type="button" class="btn btn-link" id="attachFileCancel" idx="'+attach[i].gano+'">X</button>'																									
					code += '</div>'
				}
				;
				$('#grBoardModifyModal').find('#pagegbnoArea').html(input);
				$('#grBoardModifyModal').find('#grBoardTitle').val(gr.title);
				//$('#grBoardModifyModal').find('#grBoardContent').html(gr.content);
				$('#grBoardModifyContent').summernote('code',gr.content);
//				 $('#grBoardModifyModal').find('#grBoardContent').text($('#summernote').summernote(gr.content));
				$('#grBoardModifyModal').find('#mofidyAttachArea').html(code);
				$('#grBoardModifyModal').modal('show');
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
	}
	//인증 게시판 좋아요
	function GroupBoardGood(page,gno,gbno,search_option,keyword){
		GroupBoardGoodCheck(page,gno,gbno,search_option,keyword,'${user.id}');
	}
	//인증 게시판 나빠요
	function GroupBoardBad(page,gno,gbno,search_option,keyword){
		GroupBoardBadCheck(page,gno,gbno,search_option,keyword,'${user.id}');
	}
	
	//인증 게시판 게시물 삭제
	function GroupBoardDelete(page,gno,gbno,t){
		var id = $(t).attr('user');
		var user = '${user.id}';
		if(user != id){
			alert('삭제 권한이 없습니다');
			return false;
		}
		$.ajax({
			url:'/project3/group/GroupBoardDelete',
			type:'post',
			data:{"gbno":gbno},
			success:function(res){
				groupBoardList(page, gno, search_option,keyword);
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
		
	}
	//오늘 하루 일정 등록했는지 안했는지 체크
	function TodayTodoListCheck(gno,id){
		var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate()); 
		// 한자리수일 경우 0을 채워준다. 
		if(month.length == 1){ 
		  month = "0" + month; 
		} 
		if(day.length == 1){ 
		  day = "0" + day; 
		} 
		var today2 = (year + '-' + month + '-' + day);
		$.ajax({
			url:'/project3/group/TodayTodoListCheck',
			type:'post',
			data:{"gno":gno,
				"id":id,
				"today":today2}
			,success:function(res){
				var list = res.todoListID;
				for(var i = 0; i <list.length;i++){
					if(list[i] == '${user.id}'){
						$('#todoListWrite').modal('show');
					}
				}
				
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
	}
	//to do List 삭제하기
	function memoDelete(mno,li){
		$.ajax({
			url:'/project3/group/memoDelete',
			type:'post',
			data:{"mno":mno},
			success:function(res){
				$(li).parent().parent().remove();
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
	}
	//to do List 불러오기
	function getMemoList(gno){
		$.ajax({
			url:'/project3/group/getMemoList',
			type:'post',
			data:{"gno":gno},
			success:function(res){
				var list = res.list;
				var code = "";
				for(var i=0;i<list.length;i++){
				      code += '<li id="memoList" idx = "'+list[i].mno+'">';
				      code += '<span id="memoListSpan">';
				      code += '<i class="fa fa-trash" id="memoListDelete"></i>';
				      code += '</span>'; 
				      code += list[i].content;
				      code += '</li>';
				}
				$('#memoListUl').html(code);
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
	}
	//dday 불러오기
	function getday(gno){
		$.ajax({
			url:'<%=request.getContextPath()%>/group/getDay',
			type:'post',
			data:{"gno":gno},
			success:function(res){
				var dday = res.dday;
				var ddayVO = res.ddayVO;
				if(ddayVO != ""){
					$('#ddayContent').html(ddayVO.content);
					$('#dday').html('D'+dday);	
				}else{
					$('#ddayContent').html('일정 없음');
					$('#dday').html('D-DAY');
				}
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
	}
	//그룹 채팅 리스트
	function groupChatList(gno){
		$.ajax({
			url:'<%=request.getContextPath()%>/group/getMessage',
			type:'post',
			data:{"gno":gno},
			success:function(res){
				var list = res.list;
				$('#chatArea').empty();
				for(var i = 0; i <list.length;i++){
					$('#chatArea').append('<div>'+list[i].name+':'+list[i].content+'</div>').css('font-size','18px');
				}
				//채팅 내용 맨아래로 스크롤 내리기
		 		$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
	}
	//파일 리스트
	function groupFileList(gno){
		$.ajax({
			url:'<%=request.getContextPath()%>/group/getGroupFileList',
			type:'post',
			data:{"gno":gno},
			success:function(res){
				var list = res.list;
				$('#row').empty();
				var code = "";
				for(i=0;i<list.length;i++){
					var originFname = list[i].originFileName.split('.');
					code +='<div class="col-md-2 col-sm-2 col-xs-12"  style="cursor:pointer;">';
					code +='<div class="dropdown">';
					code +='<div class="dropdown-toggle" data-toggle="dropdown">'
					code +='<span class="card bg-light text-dark">'
					code += '<i class="fa fa-copy" style="width:100%;height:150px;"></i>';
					code += '</span>';
					code += '<div id="fileName">';
					code += originFname[0];
					code += '</div>';
					code += '<ul class="dropdown-menu">';
				    code += '<li><a href="#" onclick="fileDownload2('+list[i].fno+')">Download</a></li>';
				    code += '<li><a href="#" onclick="fileDelete('+list[i].fno+')">Delete</a></li>';
				    code += '</ul>'
					code +='</div>'
					code +='</div>'
					code +='</div>'	
				}
				$('#row').append(code);
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
	}
	function fileDelete(fno){
		$.ajax({
			url:'<%=request.getContextPath()%>/group/fileDelete',
			type:'post',
			data:{"fno":fno},
			success:function(res){
				var gno = res.gno;
				alert(res.result);
				groupFileList(gno);
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
	}
	function fileDownload2(fno){
		location.href="/project3/group/download?fno="+fno;
	}
	function GroupInfo(gno){
		$.ajax({
			url:'/project3/group/getGroupInfo',
			type:'post',
			data:{"gno":gno},
			success:function(res){
				var group = res.group;
				var list = res.list;
				$('#taskText').empty();
				$('#memCardList').empty();	
				var code1 = "";
				var code2 = "";
				var code3 = "";
				var code4 = "";
				code1 +='<h6>해야 할 인증 갯수</h6>';
				code1 +='<hr>';
				for(i=0;i<list.length;i++){
					//랜덤 숫자 
					var random = Math.floor((Math.random() * 5) + 1);
					code2 += '<div id="progresivity" val="'+list[i].id+'">';    
					code2 += '<h5>';    
					code2 += '<hr  style="display:none;"/>';
					code2 += '<span id="id" style="font-size:15px;"><i class="far fa-user"></i>'+list[i].memberName+'('+list[i].novertifyCount+'/5)'+'</span>';       
					code2 += '<div class="mb-3">';            
					code2 += '<input type="text" class="taskBarHidden" value="2" hidden="true">';                
					code2 += '</div>';                
					code2 += '</div>';	
					code3 += '<div class="col-lg-6 mb-8" style="margin-top:30px;">';
					if(random == 1){
						code3 += '<div class="card text-white bg-primary shadow">';	
					}else if(random == 2){
						code3 += '<div class="card text-white bg-success shadow">';
					}else if(random == 3){
						code3 += '<div class="card text-white bg-warning shadow">';
					}else if(random == 4){
						code3 += '<div class="card text-white bg-secondary shadow">';
					}else if(random == 5){
						code3 += '<div class="card text-white bg-dark shadow">';
					}
					code3 += '<div class="card-body" style="text-align:center;">';
					code3 += '<img src="<%=request.getContextPath() %>/resources/upload/'+list[i].fileName+'" class="border rounded-circle img-profile" alt="프로필이미지" style="width: 40px;height : 40px;">';
					code3 += '<p class="m-0"><span class="memCardNm">'+list[i].memberName+'</span></p>';	                    
	                code3 += '<input type="text" class="taskBarHidden" value="2" hidden="true">';        
		            code3 += '</div>';
		            code3 += '</div>';
		            code3 += '</div>';
				}
				if(list.length <4){
					code3 +='<div class="col-lg-6 mb-8" style="margin-top:30px;">';        	
	                code3 += '<div id="emptyMemCard" class="card text-white shadow">';        	
	                code3 += '<div class="card-body" style="text-align:center;" id="addGroupMember">';        
	                code3 += '<img src="<%=request.getContextPath() %>/resources/images/addgroup.png" class="border rounded-circle img-profile" alt="프로필이미지" style="width : 40px; height : 40px;">';
	               	code3 +='</div>';
	               	code3 +='</div>';
	               	code3 +='</div>';
				}
				code4 += '<div id="groupEditArea">';
				code4 += '<div style="float:left;margin-right:10px;">';
				code4 += '<form action="groupDelete" method="post"  id="groupDeleteForm">';
				code4 += '<input type="hidden" name="gno" id = "gno" value="${gno}"/>';
				code4 += '<button type="button" class="btn btn-danger btn-sm" id="Grdelete" style="margin-left:10px;">그룹방 삭제</button>';
				code4 += '</form>';
				code4 += '</div>';
				code4 += '<div style="float:left;">';
				code4 += '<form action="groupMemberOut" method="post" id="groupMemberOutForm">';
				code4 += '<input type="hidden" name="id" id="id" value="${user.id}"/>';
				code4 += '<input type="hidden" name="gno" id="gno" value="${gno}"/>';
				code4 += '<button type="button" class="btn btn-primary btn-sm" id="GrOut">그룹방 나가기</button>';	
				code4 += '</form>';
				code4 += '<div style="clear:both;"></div>';
	            code4 += '</div>';
	            code4 += '</div>';
				$('#taskText').append(code1);
				$('#taskText').append(code2);
				$('#memCardList').append(code3);
				$('#taskText').append(code4);
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		})
	}
	function GroupInfoCard(gno){
		$.ajax({
			url:'/project3/group/getGroupInfo',
			type:'post',
			data:{"gno":gno},
			success:function(res){
				var group = res.group;
				var list = res.list;
				var count = res.count;
				var vertifyCount = res.vertifyCount;
				var processivity = 0;
				$('#groupName').html(group.name);
				$('#GroupCount').html(count);
				$('#nonVertifyCcount').html(vertifyCount);
 				//그룹 초대 코드$('#groupCode').html(group.code);
 				
				//회원 미션 내역
				var missison = "";
				for(var i = 0; i <list.length;i++){
					var todo = getTodoList(list[i].id,gno);
					missison +='<div class="col-lg-3 col-xl-3" style = "width:100%;margin-top:25px;display:inline-block;">';
					missison +='<div id="cal_bg" class="card shadow mb-12">';
					missison +='<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">';
					missison +='<h6 class="text-primary font-weight-bold m-0">';
					missison +='<span style="color: #46546e; font-weight: bold; text-align: center;"><h6 class="font-weight-bold m-0">미인증 내역</h6></span>';
					missison +='</h6>';
					missison +='</div>';
					missison +='<div class="card-body" style="margin-bottom:30px;height:270px;">';		
					missison +='<div id="MemberContent">';
					missison +='<img src="/project3/resources/upload/'+list[i].fileName+'" alt="" class="media-object img-circle" style="width:50px;height:50px;border-radius:30px;"/>';
					missison +='<span id="writer" style="font-size:15px;">'+list[i].memberName+'</span>';
					missison +='<ul id="memberStudyListUl">';
					for(var j = 0; j <todo.length;j++){
						const regdate = todo[j].regdate.split(" ");
						missison +='<li id="memberStudyList" idx = "'+todo[j].gtno+'">';
						missison +='<div style="float:left;">';
						missison +='<span id="memberStudyListSpan">';
						missison +='<i class="fas fa-user-edit" id="memberStudyListDelete" user="'+todo[j].id+'"></i>';
						missison +='</span>';
						missison += '<span id="todoListTitle"><a href="#" style="color:#666697">'+todo[j].title+'</a></span>';
						missison +='</div>';
						missison +='<div style="float:right;">'+regdate[0]+'</div>';
						missison +='</li>';
					}
					missison +='</ul>';
					missison +='</div>';  
					missison +='</div>';
					missison +='</div>';
					missison +='</div>';
				}
				$('#GroupCard').html(missison);
				
				
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
		
		
	}
	function getTodoList(id,gno){
		var tolist = "";
		$.ajax({
			url:'/project3/group/getTodoList',
			type:'post',
			data:{"id":id,
				"gno":gno},
			async: false,
			success:function(res){
				tolist = res.todoList;
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		})
		return tolist;
	}

function teamCalander(){
	//현재 날짜
	var now = new Date();
	var year= now.getFullYear();
	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	var chan_val = year + '-' + mon + '-' + day;
	//fullcalandar
	  var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
	      },
	      initialDate:chan_val,
	      navLinks: true, // can click day/week names to navigate views
	      businessHours: true, // display business hours
	      editable: false,
	      selectable: true,
	      droppable: false,
	      select:function(event){
// 	    	  alert(JSON.stringify(event));
	    	  var startDate = event.startStr;
	    	  var endDate = event.endStr;
	    	  var title = prompt('계획을 입력해주세요');
	    	  var id = '${user.id}';
	    	  var gno = '${gno}';
	    	  if(title == null){
	    		  alert('계획을 입력해주세요');
	    		  return false;
	    	  }
	    	   $.ajax({
	     			data :{"title":title,
	     				"startDate":startDate,
	     				"endDate":endDate,
	     				"id":id,
	     				"gno":gno},
	     			url : "<%=request.getContextPath()%>/calendar/GroupAddSchedule",
	     			type : "POST",
	     			dataType : "json",
	     			success : function(res) {
	     				numData = res.num;
	     				calendar.addEvent({
	     					title : title,
	     					start : startDate,
	     					end:endDate,
	     					sno:numData
	     				});
	     			},error:function(req){
	     				alert('상태:'+req.status);
	     			}
	     		  });
	      }, events: [	    	  
	    	  <c:forEach items="${teamSchedule}" var="item">
	    		{
		    	  title : "${item.title}",
		  		  start : "${item.startDate}",
		  		  end : "${item.endDate}",
		  		  sno:"${item.sno}"
	    		}, 
		      </c:forEach>
	    	  {
	   		   title : '',
	   		   start : "",
	   		   end : ""
	   		  }
	      ], eventClick:function(info) {
	    	  event = info.event;
	    	  console.log(JSON.stringify(event));
	    	  var sno = event.extendedProps.sno;
	          if(confirm('정말로 삭제하시겠습니까?')) {
	        	  event.remove();
	        	  $.ajax({
	        		  url:'<%=request.getContextPath()%>/calandar/GroupCalandarDelete',
	        		  type:'post',
	        		  data:{"sno":sno},
	        		  success:function(res){
	        			  
	        		  },error:function(req){
	        			  alert('상태:'+req.status)
	        		  }
	        	  });
	          }
	      }
	    });
	    calendar.render();
}	
</script>
</body>





