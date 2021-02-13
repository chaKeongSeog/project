<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>DDIT 공부방</title>
        <link href="<%=request.getContextPath()%>/resources/css/styles.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/custom.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/group.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/lecture.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/main.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link href='<%=request.getContextPath() %>/resources/lib/main.css' rel='stylesheet' />
		<link href="<%=request.getContextPath() %>/resources/lib/custom/css/schedule.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/groupChat.css" /> 
		<link href="<%=request.getContextPath() %>/summernote/summernote.min.css" rel="stylesheet">
		<script src="<%=request.getContextPath() %>/summernote/summernote.min.js"></script> 
		<script src='<%=request.getContextPath() %>/resources/lib/main.js'></script>
		<script src="<%=request.getContextPath()%>/resources/lib/custom/js/schedule.js"></script>
<%-- 		<script src="<%=request.getContextPath() %>/resources/js/memberreg.js"></script> --%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script>
        	$(function(){
        		var fromID = '${user.id}';
        		unreadMessageCount(fromID);
//         		//스터디룸 리스트 가져오기
//         		GroupList(fromID);
        		
        		
        	})
	    	function unreadMessageCount(fromID){
	    		$.ajax({
	    			url:'<%=request.getContextPath()%>/chat/unreadCount',
	    			type:'post',
	    			data:{"fromID":fromID},
	    			success:function(res){
	    				$('#unread').html('('+res+')');
	    			},error:function(req){
	    				alert('상태:'+req.status);
	    			}
	    		})
	    	}
        </script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/main">DDIT STUDY</a>
<!--             <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button> -->
            <!-- Navbar Search-->
          
            <!-- Navbar-->
              <div class="collapse navbar-collapse" id="navbarsExample03">

			    <ul class="navbar-nav mr-auto">
			    </ul>
			  </div>
        </nav>
       <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                    	<c:choose>
	                		<c:when test="${user.authority == 'user'}">
	                			    <div class="nav">
			                            <div class="sb-sidenav-menu-heading"></div>
			                             <a class="nav-link collapsed" href="<%=request.getContextPath()%>/member/myinfo?id=${user.id}">
			                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
			                                	내정보
			                            </a>
			                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
			                                <div class="sb-nav-link-icon"><i class="far fa-file"></i></div>
			                                	커뮤니티
			                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                            </a>
			                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
			                                <nav class="sb-sidenav-menu-nested nav">
			                                    <a class="nav-link" href="<%=request.getContextPath()%>/freeBoard/list">자유 게시판</a>
			                                    <a class="nav-link" href="<%=request.getContextPath()%>/notice/list">공지사항</a>
			                                    <a class="nav-link" href="<%=request.getContextPath()%>/lecture/list">수강후기</a>
			                                    <a class="nav-link" href="<%=request.getContextPath()%>/pds/list">자료실</a>
			                                </nav>
			                            </div>
			                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
			                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
			                                	스터디룸
			                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                            </a>
			                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
			                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
			                                    <a class="nav-link collapsed" href="#" id="groupList" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
			                                    	<form action="<%=request.getContextPath()%>/group/list" method="post" id="groupListForm">
			                                    		<input type="hidden" name="id" id="id" value="${user.id}"/>
			                                    	</form>
			                                        	나의 방 목록
			                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                                    </a>
			                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
			                                        <nav class="sb-sidenav-menu-nested nav" id="studyRoomList">
			                                            
			                                        </nav>
			                                    </div>
			                                    <a class="nav-link collapsed" id="studyroomCreateModal" val="${user.id}" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
			                                        	만들기
			                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                                    </a>
			                                    <a class="nav-link collapsed" id="studyroomJoinModal" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
			                                        	참여
			                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                                    </a>
			                                </nav>
			                            </div>
			                          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#client" aria-expanded="false" aria-controls="client">
			                                <div class="sb-nav-link-icon"><i class="fas fa-tty"></i></div>
			                                	고객센터
			                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                            </a>
			                            <div class="collapse" id="client" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
			                                <nav class="sb-sidenav-menu-nested nav">
			                                    <a class="nav-link" href="<%=request.getContextPath()%>/qna/list">Q&A</a>
			                                    <a class="nav-link" href="<%=request.getContextPath()%>/faq/list">자주하는질문</a>
<%-- 			                                    <a class="nav-link" href="<%=request.getContextPath()%>/lecture/list">신고</a> --%>
			                                </nav>
			                            </div>
			                            <a class="nav-link" href="<%=request.getContextPath()%>/chat/messageBoxDetail">
			                                <div class="sb-nav-link-icon"><i class="far fa-envelope-open"></i></div>
			                               		메시지함
			                            </a>
			                             <a class="nav-link collapsed" href="<%=request.getContextPath()%>/chat/memberFind">
			                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
			                                	친구찾기
			                            </a>
			                        </div>
	                		
	                		</c:when>
	                		<c:otherwise>
	                				<div class="nav">
			                            <div class="sb-sidenav-menu-heading"></div>
			                             <a class="nav-link collapsed" href="<%=request.getContextPath()%>/admin/memberList">
			                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
			                                	회원 관리
			                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                            </a> 
			                            <a class="nav-link collapsed" href="<%=request.getContextPath()%>/admin/dditmemberList">
			                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
			                                	학생 추가
			                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                            </a>
			                             <a class="nav-link collapsed" href="<%=request.getContextPath()%>/admin/chatList">
			                                <div class="sb-nav-link-icon"><i class="far fa-envelope-open"></i></div>
			                                	메세지 관리
			                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                            </a>  
			                            <a class="nav-link collapsed" href="<%=request.getContextPath()%>/admin/noticeList">
			                                <div class="sb-nav-link-icon"><i class="far fa-file"></i></div>
			                                	커뮤니티 관리
			                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                            </a>
			                            <a class="nav-link collapsed" href="<%=request.getContextPath() %>/admin/groupList">
			                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
			                                	스터디룸 관리
			                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                            </a>
			                            <a class="nav-link collapsed" href="<%=request.getContextPath() %>/admin/replyList">
			                                <div class="sb-nav-link-icon"><i class="fas fa-comment-dots"></i></div>
			                                	댓글관리
			                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                            </a>
			                          	<a class="nav-link collapsed" href="<%=request.getContextPath() %>/admin/clientList">
			                                <div class="sb-nav-link-icon"><i class="fas fa-tty"></i></div>
			                                	고객센터 관리
			                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
			                            </a>
			                            <div class="collapse" id="client" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
			                                <nav class="sb-sidenav-menu-nested nav">
			                                    <a class="nav-link" href="<%=request.getContextPath()%>/qna/list">Q&A</a>
			                                    <a class="nav-link" href="<%=request.getContextPath()%>/faq/list">자주하는질문</a>
			                                    <a class="nav-link" href="<%=request.getContextPath()%>/lecture/list">신고</a>
			                                </nav>
			                            </div>
			                             
			                        </div>
	                		</c:otherwise>
	                	</c:choose>
                    	
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small"></div>
                        Start DDIT
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main style="width:1300px;">
                    <div class="container-fluid" >
                    	
                    	<decorator:body></decorator:body>
                    	<div class="sidenav">
							<div class="basic-outlogin">
								<div class="profile">
									<div class="photo pull-left">
										<img src="/project3/resources/upload/${user.fileName}" alt="" class="media-object img-circle" style="width:50px;height:50px;border-radius:30px;"/>
									</div>
									<div class="name">
										<i class="far fa-user" style="color:gray;"></i> <span class="username" style="color:white;font-weight:bold;vertical-align: middle">${user.name}</span>
									</div>
									</a>
									<div class="font-12 text-muted" style="letter-spacing:-1px;font-size:13px;margin-left:60px;">
										 사용자
									</div>
									
								</div>
								<div class="text-muted memberArea">
									<div class="pull-left">
										 <span onclick="messageShow()">메시지</span>
										 <span class="sidebarLabel" id="unread"></span>
										<span>&nbsp;|&nbsp;</span>
<%-- 										 <span id="room" style="color:white;">${user.room}호</span> --%>
									</div>
									<div class="pull-right">
<%-- 										<span id="roomType">${user.kind}</span> --%>
									</div>
									<a href=""></a>
									
								</div>
								<hr class="clearfix"/>
								
								<div class="login-line">
									<div class="pull-left">
										<span style="color:gray;font-weight:normal;" class="text-muted" onclick="join()"> 회원가입</span>
									</div>
									<div class="pull-right" style="letter-spacing:-1px;">
										<span style="color:gray;font-weight:normal;" class="text-muted"></span>
										<span style="color:gray;font-weight:normal;">&nbsp;&nbsp;</span>
										<span style="color:gray;font-weight:normal;" class="text-muted" onclick="myinfoModify()">정보수정</span>
									</div>
									<div class="clearfix">
									</div>
								</div>
								<a href="#" class="btn btn-navy btn-block en" style="background-color: #3B75D2;font-size:15px;color:white;font-weight:bold;margin-top: 10px;" onclick="logout()">
									LOG OUT
								</a>
								<div class="widget">
									<div class="wheader" style="font-size:17px;color:#DCDCDC;font-weight:bold;">
										공지사항
									</div>
									<hr class="clearfix"/>
									<div class="wBody">
										<div class="basic-post-list">
											<ul class="post-list" id="noticeUl">
										
												
											</ul>
										</div>
									</div>
								</div>
								<hr class="clearfix" style="background:#212529 "/>
								<div class="widget">
									<div class="wheader" style="font-size:17px;color:#DCDCDC;font-weight:bold;">
										자유게시판
									</div>
										<hr class="clearfix"/>
										<div class="wBody">
										<div class="basic-post-list">
											<ul class="post-list" id="freeUl">
												
											</ul>
										</div>
									</div>
								</div>
								<hr class="clearfix" style="background:#212529 "/>
								<div class="widget">
									<div class="wheader" style="font-size:17px;color:#DCDCDC;font-weight:bold;">
										나의 스터디 그룹
									</div>
										<hr class="clearfix"/>
										<div class="wBody">
										<div class="basic-post-list">
											<ul class="post-list" id="groupUl">
												
											</ul>
										</div>
									</div>
								</div>
							</div>
							</div>
                    	
                    	
                    	
                  	</div>
                </main>  	
            
            </div>
        </div>
           <!-- 스터디룸 참여 Modal -->
	  <!-- Modal -->
	  <div class="modal fade" id="studyroomJoin" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title">스터디룸 참여</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body">
	          	<form action="<%=request.getContextPath()%>/group/insertStRoomMember" id="studyRoomMemberForm" onsubmit="return false">
						<input type="hidden" name="id" value="${user.id}" id="id"/>
						<input class="form-control" placeholder="초대 코드를 입력해주세요" type="text" name="code" id="code" autocomplete="off"/>
			    </form>
	        </div>
	        <div class="modal-footer">
	          <button type="button" id="studyjoin" class="btn btn-primary" data-dismiss="modal">참여</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>  
        
        
        <!-- 스터디룸 생성 Modal -->
		<div class="modal fade" id="studyRoomCreate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h3 class="modal-title"></h3><h4><strong>스터디룸 생성</strong></h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
			        <form action="<%=request.getContextPath()%>/group/insertStRoom" id="studyRoomForm" onsubmit="return false">
						<input type="hidden" name="id" value="${user.id}" id="id"/>
						<input class="form-control" placeholder="이름을&nbsp;입력하세요." type="text" name="name2" id="name2" autocomplete="off"/>
						<div style="height: 7px;"></div>
						<input class="form-control" placeholder="목표를 입력해주세요" type="text" name="goal" id="goal" autocomplete="off"/>
			
			        </form>
		      </div>
		      <div class="modal-footer">
				<button type="button" id="studycreate" class="btn btn-primary" data-dismiss="modal" >생성</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/group.js"></script>
<!--         <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script> -->
<%--         <script src="<%=request.getContextPath()%>/resources/assets/demo/chart-area-demo.js"></script> --%>
<%--         <script src="<%=request.getContextPath()%>/resources/assets/demo/chart-bar-demo.js"></script> --%>
<!--         <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  -->
<%--         <script src="<%=request.getContextPath()%>/resources/assets/demo/datatables-demo.js"></script> --%>
        
        
    <script>
	    $(function(){
	    	myinfo();
	    });
	    function logout(){
	    	location.href="<%=request.getContextPath() %>/member/logout";
	    }
	    function myinfoModify(){
	    	location.href="<%=request.getContextPath()%>/member/myinfo?id=${user.id}";
	    }
    	function join(){
    		location.href="<%=request.getContextPath()%>/excludes/member/joinForm";
    	}
    	function myinfo(){
    		$.ajax({
    			url:'<%=request.getContextPath()%>/home/myinfo',
    			type:'post',
    			data:{"id":'${user.id}'},
    			success:function(res){
    				var notice = res.map.notice;
    				var free = res.map.free;
    				var group = res.map.group;
    				
    				var no = "";
    				for(var i = 0; i <notice.length;i++){
    					no += '<li class="ellipsis">';	
        				no += '<span class="pull-left">';
        				no += '<i class="fas fa-exclamation-circle" style="color:#7A887D"></i>';
        				no += '<span style="color:#7A887D" onclick="noticeDetail('+notice[i].bno+')">&nbsp;'+notice[i].title+'</span>';	
        				no += '</span>';
        				no += '<span class="pull-right" id="noticeRegdate" style="color:#7A887D">';
        				no += '&nbsp; </span>';
        				no += '</li>';
        				no += '<br />';
    				}
    				if(notice == ""){
    					noticeli = "";
    					noticeli += '<li class="ellipsis">';	
    					noticeli += '<span class="pull-left">';
    					noticeli += '<i class="fas fa-exclamation-circle" style="color:#7A887D"></i>';
    					noticeli += '<span style="color:#7A887D">&nbsp;게시물이 존재하지않습니다</span>';	
    					noticeli += '</span>';
    					noticeli += '<span class="pull-right" id="noticeRegdate" style="color:#7A887D">';
    					noticeli += '&nbsp; </span>';
    					noticeli += '</li>';
    					noticeli += '<br />';
    					$('#noticeUl').html(noticeli);	
    				}else{
    					$('#noticeUl').html(no);	
    				}
    				
    				var freeLi="";
    				for(var i = 0; i <free.length;i++){
   						freeLi += '<li class="ellipsis">';
   						freeLi += '<span class="pull-left">';
   						freeLi += '<i class="fas fa-star" style="color:#7A887D"> </i>';
   						freeLi += '<span style="color:#7A887D" onclick="freeDetail('+free[i].bno+')">&nbsp;'+free[i].title+'</span>';	
   						freeLi += '</span>';
   						freeLi += '<span class="pull-right" id="freeRegdate" style="color:#7A887D">';
   						freeLi += '&nbsp; </span>';
   						freeLi += '<br />';
    				}
    				if(free == ""){
    					freeli = "";
    					freeli += '<li class="ellipsis">';
    					freeli += '<span class="pull-left">';
    					freeli += '<i class="fas fa-star" style="color:#7A887D"> </i>';
    					freeli += '<span style="color:#7A887D">&nbsp;게시물이 존재하지않습니다</span>';	
    					freeli += '</span>';
    					freeli += '<span class="pull-right" id="freeRegdate" style="color:#7A887D">';
    					freeli += '&nbsp; </span>';
    					freeli += '<br />';
    					
    					$('#freeUl').html(freeli);	
    				}else{
    					$('#freeUl').html(freeLi);	
    				}
    				
    				
    				var groupLi = "";
    				for(var i = 0; i <group.length;i++){	
    					groupLi += '<li class="ellipsis" id="grellipsis">';
    					groupLi += '<form action="/project3/group/detail" method="post" name="groupDetailForm" id="groupDetailForm" style="display:none;">';
    					groupLi += '<input type="hidden" name="gno" id="gno" value="'+group[i].gno+'"/>';
    					groupLi += '</form>';
    					groupLi += '<span class="pull-left">';
    					groupLi += '<i class="fas fa-book" style="color:#7A887D"></i>';
    					groupLi += '<span style="color:#7A887D" onclick="groupJoin2(this)">&nbsp;'+group[i].name+'</span>';	
    					groupLi += '</span>';
    					groupLi += '<span class="pull-right" id="freeRegdate" style="color:#7A887D">';
    					groupLi += '&nbsp;</span>';
    					groupLi += '</li>';
    					groupLi += '<br />';
    				}
    				if(group == ""){
    					groupli = ""
   						groupli += '<li class="ellipsis" id="grellipsis">';
   						groupli += '<form action="/project3/group/detail" method="post" name="groupDetailForm" id="groupDetailForm" style="display:none;">';
   						groupli += '<input type="hidden" name="gno" id="gno" value=""/>';
   						groupli += '</form>';
   						groupli += '<span class="pull-left">';
   						groupli += '<i class="fas fa-book" style="color:#7A887D"></i>';
   						groupli += '<span style="color:#7A887D">&nbsp;스터디 그룹이 존재하지않습니다</span>';	
   						groupli += '</span>';
   						groupli += '<span class="pull-right" id="freeRegdate" style="color:#7A887D">';
   						groupli += '&nbsp;</span>';
   						groupli += '</li>';
   						groupli += '<br />';
    					$('#groupUl').html(groupli);
    				}else{
    					$('#groupUl').html(groupLi);	
    				}
    				
    				
    				
    			},error:function(req){
    				alert('상태:'+req.status);
    			},dataType:'json'
    		})
    	}
    	function noticeDetail(bno){
    		location.href="<%=request.getContextPath()%>/notice/detail?bno="+bno;
    	}
    	function freeDetail(bno){
    		location.href="<%=request.getContextPath()%>/freeBoard/detail?bno="+bno;
    	}
    	function groupJoin2(t){
    		var form = $(t).parents('#grellipsis').find('#groupDetailForm');
    		form.submit();
    	}
    	function messageShow(){
    		location.href="<%=request.getContextPath()%>/chat/messageBoxDetail";
    	}
    	
    </script>    
    </body>
</html>
