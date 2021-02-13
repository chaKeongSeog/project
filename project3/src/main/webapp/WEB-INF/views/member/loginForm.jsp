<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>로그인</title>
        <link href="<%=request.getContextPath() %>/resources/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        
    </head>
     <body style="background-color: #212529;">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">로그인</h3></div>
                                    <div class="card-body">
                                        <form action="<%=request.getContextPath()%>/member/login" method="post" id="loginForm">
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputEmailAddress">ID</label>
                                                <input class="form-control py-4" id="id" type="text" name="id" placeholder="아이디" />
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputPassword">Password</label>
                                                <input class="form-control py-4" id="password" type="password" name="pwd" placeholder="비밀번호" />
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" />
                                                </div>
                                            </div>
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="#" onclick="passwordForget()">비밀번호 찾기</a>
                                               
                                                <input type="submit" class="btn btn-primary" value="로그인" id="login"/>
                                            </div>
                                              <div class="form-group d-flex align-items-center justify-content-between mt-2 mb-0">
                                              		<a class="small" href="#" onclick="passwordID()">아이디 찾기</a>
                                              </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="<%=request.getContextPath()%>/excludes/member/joinForm">회원가입</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
             
            </div>
        </div>
        
        
        
		<!-- 비밀번호 찾기 Modal -->
		<div class="modal fade" id="findPassForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h3 class="modal-title"></h3><h4><strong>비밀번호 찾기</strong></h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
			        <form id = "findPass">	       
						<input class="form-control" placeholder="아이디를&nbsp;입력하세요." type ="text" name = "id" id = "pfid">
						<div style="height: 7px;"></div>
						<input class="form-control" placeholder="이메일&nbsp;주소를&nbsp;입력하세요." type ="text" name = "email" id = "pfmail">    
			        </form>
		      </div>
		      <div class="modal-footer">
			<button type="button" id="passFind" class="btn btn-primary" data-dismiss="modal">Send</button>
			<button type="button" id="passreset" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>       
        
        <!-- 아이디 찾기 Modal -->
		<div class="modal fade" id="IdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h3 class="modal-title"></h3><h4><strong>아이디 찾기</strong></h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
			        <form action="" id="Idform">
			
						<input class="form-control" placeholder="이름을&nbsp;입력하세요." type="text" name="name" id="ifname" autocomplete="off"/>
						<div style="height: 7px;"></div>
						<input class="form-control" placeholder="이메일&nbsp;주소를&nbsp;입력하세요." type="text" name="email" id="ifemail" autocomplete="off"/>
			
			        </form>
		      </div>
		      <div class="modal-footer">
				<button type="button" id="idFind" class="btn btn-primary" data-dismiss="modal">Search</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
        
        
        
        
        
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
  <script>
	$(function(){
		$('#login').on('click',function(){
			var id = $('#id').val().trim();
			var pass = $('#password').val().trim();
			var form = $('#loginForm');
			if(id == "" || id == null){
				alert('아이디를 입력해주세요');
				return false;
			}else if(pass == "" || pass == null){
				alert('비밀번호를 입력해주세요');
				return false;
			}
			form.submit();
		});
		
		$("#passFind").on("click",function(){
		$.ajax({
			url: "/project3/member/searchPwd",
			type : "post",
			data : $("#findPass").serializeArray(),
			success:function(res){
					if(res.pwd == null){
						alert('해당 아이디는 찾을수 없습니다');
					}else{
						alert('해당 이메일로 임시 패스워드를 발송하였습니다.');	
					}
				},
				error:function(req){
					alert('상태:'+req.status);
				},
				dataType:'json'
			});
		
		});//pwd
		
		$('#idFind').on('click',function(){
			$.ajax({
					url:'<%=request.getContextPath()%>/member/SearchID',
					type:'post',
					data:$('#Idform').serializeArray(),
					success:function(res){
						if(res == ""){
							alert("아이디가 존재하지않습니다.");	
						}else{
							resnumFull = res.length;
							resnum = resnumFull/2;
							res = res.substring(0,resnum);
							for(i=resnum;i<resnumFull;i++){
								res +="*";
							}
							alert("아이디:"+res);	
						}
					$('#IdModal').modal('hide');
					},
					error:function(req){
						alert('상태:'+req.status);
					},dataType:'text'
				});//ajax
		})//id
		
	})
	function passwordForget(){
		$('#findPassForm').modal('show');
	}
	function passwordID(){
		$('#IdModal').modal('show');
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath() %>/resources/js/scripts.js"></script>
    </body>
</html>
