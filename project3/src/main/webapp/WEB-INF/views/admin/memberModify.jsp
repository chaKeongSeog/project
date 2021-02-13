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
        <title>회원수정</title>
        <link href="<%=request.getContextPath() %>/resources/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <style>
    	#idarea{
    		position: relative;
    	}
    	#idarea::after{
    		content: "";
    		display: block;
    		clear: both;
    	}
    	#idchk{
    		position: absolute;
    		top:0;
    		right:10px;
    	}
    </style>
    <body>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원수정</h3></div>
                                    <div class="card-body">
                                       	<form action="<%=request.getContextPath() %>/admin/membermodify" class="form-horizontal"  method="post" enctype="multipart/form-data" id="memberForm">
                                       		<input type="hidden" name="user" id="id" value="${user.id}"/>
											<div class="form-group" style="text-align: center;">
												<div class="col-xs-12"></div>
												<div id="profileImg" class="col-xs-12 profileplace">
													<img class="img-responsive center-block" id=m_photo name="m_photo" src="/project3/resources/upload/${member.fileName}" style="border:1px solid gray;width:200 px;height:200px;">
												</div>
												<div class="col-xs-5"></div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-3" for="mid">이미지 첨부</label>
												<div class="col-sm-12">
												<input id="fileInput" type="file" data-class-button="btn btn-default" id="picture" name="file" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="control-label col-sm-3" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);" accept=".gif, .jpg, .png">
												<div class="bootstrap-filestyle input-group">
													<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
													<span class="group-span-filestyle input-group-btn" tabindex="0">
														<label for="fileInput" class="btn btn-default">
															<span class="glyphicon"><i class="fas fa-upload"></i></span>
														</label>
													</span>
												</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-3" for="mid">ID</label>
												<div class="col-sm-12" id="idarea">
													<input type="text" class="form-control" id="mid" placeholder="Enter id" name="id" value="${member.id}" readonly="readonly">
													<span id="msgpass" class="msg"></span>
													<div class="msgid" id="msgid"></div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-3" for="mpassword">Password</label>
												<div class="col-sm-12">
													<input type="password" class="form-control" id="mpassword"
														placeholder="Enter password" name="pwd" value="${member.pwd}" readonly="readonly">
														<span id="msgpass" class="msg"></span>
												</div>
												
											</div>
											<div class="form-group">
												<label class="control-label col-sm-3" for="mname">Name</label>
												<div class="col-sm-12">
													<input type="text" class="form-control" id="mname"
														placeholder="Enter Name" name="name" value="${member.name}">
														<span id="msgname" class="msg"></span>
												</div>
												
											</div>
											<div class="form-group">
												<label class="control-label col-sm-3" for="tel">Tel</label>
												<div class="col-sm-12">
													<input type="text" class="form-control" id="tel"
														placeholder="Enter Tel" name="tel" value="${member.tel}">
														<span id="msgddno" class="msg"></span>
												</div>
												
											</div>
											<div class="form-group">
												<label class="control-label col-sm-3" for="tel">Email</label>
												<div class="col-sm-12">
													<input type="text" class="form-control" id="modalmail" placeholder="Enter Email" name="email" value="${member.email}">
													<span id="msgmail" class="msg"></span>
												</div>
													
											</div>
												<div class="form-group">
													<label class="control-label col-sm-3" for="tel">Authority</label>
													<div class="col-sm-12">
														<select name="authority" id="authority" class="form-control">
															<c:choose>
																<c:when test="${member.authority== 'user' }">
																	<option value="user" selected="selected">사용자</option>
																	<option value="admin">관리자</option>
																	<option value="disabled">회원정지</option>	
																</c:when>
																<c:when test="${member.authority== 'admin' }">
																	<option value="user">사용자</option>
																	<option value="admin" selected="selected">관리자</option>
																	<option value="disabled">회원정지</option>	
																</c:when>
																<c:when test="${member.authority== 'disabled' }">
																	<option value="user">사용자</option>
																	<option value="admin">관리자</option>
																	<option value="disabled" selected="selected">회원정지</option>	
																</c:when>
															</c:choose>
															
														</select>
													</div>
														
												</div>
											<div class="form-group">
												<label class="control-label col-sm-3" for="tel"></label>
												<div class="col-sm-12">
													<button type="button"  class="btn btn-primary" data-dismiss="modal" id="modifyBtn">회원수정</button>
													<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
												</div>
											</div>
										</form>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
          
             
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		$(function(){
		  $("#fileInput").change(function(){
			  if(window.FileReader){  // modern browser
					var filename = $(this)[0].files[0].name;
				} else {  // old IE
		 			var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
				}
		
		 		// 추출한 파일명 삽입
				$("#userfile").val(filename);
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     	$("#profileImg img").attr("src", data.target.result).width(200);  
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
		  });
		  
		  $('#modifyBtn').on('click',function(){
			 var form = $('#memberForm');
			 
			 var data = new FormData(form[0]);
		        $.ajax({
		            type: "post",
		            enctype: 'multipart/form-data',
		            url: "/project3/admin/memberModify",
		            data: data,
		            processData: false,
		            contentType: false,
		            cache: false,
		            timeout: 600000,
		            success: function (res) {
		            	alert('수정하였습니다')
		            	if(res == 'user'){
		            		alert('관리자 페이지에 접근할 권한이 없습니다');
		            		window.opener.document.location.href="<%=request.getContextPath()%>/index";
		            		self.close();
		            	}else if(res == 'disabled'){
		            		alert('관리자 페이지에 접근할 권한이 없습니다');
		            		window.opener.document.location.href="<%=request.getContextPath()%>/index"; 
			            	self.close();
		            	}else{
		            		window.opener.document.location.href=window.opener.document.URL; 
			            	self.close();	
		            	}
		            },error: function(req) {
		               alert('상태:'+req.status);
		            },dataType:'text'
		        });
			 
		  });
		 
		})
		
	</script>
	<!-- include libraries(jQuery, bootstrap) -->
	<script src="<%=request.getContextPath() %>/resources/js/scripts.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/login.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/joinreg.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/joinjs.js"></script>
    </body>
</html>
