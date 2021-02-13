<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	table th{
		display: none;
	}
</style>

<body>

<form action="<%=request.getContextPath()%>/admin/memberDelete" id="memberDeleteForm" method ="post" name="memberDeleteForm">
	<input type="hidden" name="user" id="user" value="${user.id}"/>
</form>
        <h2 class="mt-4">회원 관리</h2>
        <!-- Navbar Search-->
        <form action="<%=request.getContextPath() %>/admin/memberList" method="get" name="form1" class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-5 my-2 my-md-0" style="text-align: center">
             <div class="input-group">
              <select class="form-control" name="search_option" style="width:100px;">
              <c:choose>
	              <c:when test="${map.search_option =='all'}">
	              	<option value="all" selected>전체</option>
					  <option value="id">아이디</option>
					  <option value="name">이름</option>
					  <option value="authority">권한</option>
	              </c:when>
	              <c:when test="${map.search_option =='id'}">
	              	<option value="all">전체</option>
					  <option value="id" selected>아이디</option>
					  <option value="name">이름</option>
					  <option value="authority">권한</option>
	              </c:when>
	               <c:when test="${map.search_option =='name'}">
	              	<option value="all">전체</option>
					  <option value="id">아이디</option>
					  <option value="name" selected>이름</option>
					  <option value="authority">권한</option>
	              </c:when>
	              <c:when test="${map.search_option =='authority'}">
	              	<option value="all">전체</option>
					  <option value="id">아이디</option>
					  <option value="name">이름</option>
					  <option value="authority" selected>권한</option>
	              </c:when>
	           </c:choose>
			  </select>
                 <input class="form-control" type="text" name="keyword" value="${map.keyword}"placeholder="검색어를 입력해주세요" aria-label="Search" aria-describedby="basic-addon2" style="width:199px;"/>
                 <div class="input-group-append">
                     <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                 </div>
             </div>
         </form>  
        <table class="table table-bordered" style="width:100%;">
  
	    <thead>
	      <tr>
	      	<th></th>
	        <th>아이디</th>
	        <th>이메일</th>
	        <th>이름</th>
	        <th>등록날짜<th>
	        <th>권한</th>
	        
	      </tr>
	    </thead>
	    <tbody>
	     	<c:forEach var="list" items="${map.list}">
	     		<tr>
	     			<td><input type="checkbox" name="bnobox" id="bnobox" value="${list.id}"/></td>
	     			<td>
	     				<a href="javascript:OpenWindow('/project3/excludes/admin/memberModifyForm?id=${list.id}','자유게시판 상세보기',900,600);">${list.id}</a>
	     			</td>
	     			<td>${list.email}</td>
	     			<td>${list.name}</td>
	     			<td>${list.regdate}</td>
	     			<td>${list.authority}</td>	     			
	     		</tr>
	     	</c:forEach>
	    </tbody>
	  </table>
	   <div class="form-group">
	  	<form action="" method="post" onsubmit="return false" id="boardDeleteForm" name="boardDeleteForm">
	  		<input type="hidden" name="boardType" value="${map.boardType}"/>
	  		<input type="hidden" name="myid" value="${user.id}"/>
	  		<input type="hidden" name="search_option" id="search_option" value="${map.search_option}"/>
        	<input type="hidden" name="keyword" id="keyword" value="${map.keyword}"/>
        	<input type="hidden" name="curPage" id="curPage" value="${map.pager.curPage}"/>
	  	</form>
	  	<button class="btn btn-primary" href="#" onclick="boardDelete4()">회원정지</button>
	  	<a class="btn btn-primary"  onclick="memberRegistForm()">회원등록</a>
	  </div>
	  <c:if test="${map.pager.blockEnd > 0}">
	  	     <ul class="pagination justify-content-center m-0">
            <li class="paginate_button page-item previous" id="dataTable_previous">
            	<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" onclick="list('1')">처음</a>
            </li>
            <li class="paginate_button page-item previous" id="dataTable_previous">
            	<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" onclick="list('${map.pager.prevPage}')">이전</a>
            </li>
            <c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
	            <c:choose>
	            	<c:when test="${map.pager.curPage == num}">
		            	<li class="paginate_button page-item active">
		            		<a href="#" aria-controls="dataTable" data-dt-idx="${num}" class="page-link" onclick="list('${num}')">${num}</a>
			            </li>           	
	           		</c:when>
	           		<c:otherwise>
		           		<li class="paginate_button page-item ">
			            	<a href="#" aria-controls="dataTable" data-dt-idx="${num}" class="page-link" onclick="list('${num}')">${num}</a>
			           </li>
		           </c:otherwise>
	            </c:choose>
            </c:forEach>
            
            <li class="paginate_button page-item next" id="dataTable_next">
            	<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link" onclick="list('${map.pager.nextPage}')">다음</a>
            </li>
            <li class="paginate_button page-item next" id="dataTable_next">
            	<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link" onclick="list('${map.pager.totPage}')">끝</a>
            </li>
        </ul>
	  </c:if>
	  
	  


<!-- 회원추가 모달 -->
  <div class="modal" id="memberModal">
    <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">회원 추가</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
           <div class="container" >
                 <form action="<%=request.getContextPath() %>/admin/join" class="form-horizontal"  method="post" enctype="multipart/form-data" id="memberForm" style="width:600px;">
					<div class="form-group" style="text-align: center;">
						<div class="col-xs-12"></div>
						<div id="profileImg" class="col-xs-12 profileplace">
							<img class="img-responsive center-block" id=m_photo name="m_photo" src="/project3/resources/images/basicprofile.jpg" style="border:1px solid gray;width:200 px;height:200px;">
						</div>
						<div class="col-xs-5"></div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="mid">이미지 첨부</label>
						<div class="col-sm-12">
						<input id="fileInput" type="file" data-class-button="btn btn-default" id="picture" name="file" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="control-label col-sm-3" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
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
							<input type="text" class="form-control" id="mid" placeholder="Enter id" name="id">
							<button type="button" class="btn btn-primary" id="idchk">중복확인</button>
							<span id="msgpass" class="msg"></span>
							<div class="msgid" id="msgid"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="mpassword">Password</label>
						<div class="col-sm-12">
							<input type="password" class="form-control" id="mpassword"
								placeholder="Enter password" name="pwd">
								<span id="msgpass" class="msg"></span>
						</div>
						
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="pwdchk">RePassword</label>
						<div class="col-sm-12">
							<input type="password" class="form-control" id="pwdchk"
								placeholder="Enter password again" name="pwdchk">
								<span id="msgchk" class="msg"></span>
						</div>
						
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="mname">Name</label>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="mname"
								placeholder="Enter Name" name="name">
								<span id="msgname" class="msg"></span>
						</div>
						
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="tel">Tel</label>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="tel"
								placeholder="Enter Tel" name="tel">
								<span id="msgddno" class="msg"></span>
						</div>
						
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="tel">Email</label>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="modalmail" placeholder="Enter Email" name="email">
							<span id="msgmail" class="msg"></span>
						</div>
							
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="tel">Authority</label>
						<div class="col-sm-12">
							<select name="authority" id="authority" class="form-control">
								<option value="user">사용자</option>
								<option value="admin">관리자</option>
							</select>
						</div>
							
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="tel"></label>
						<div class="col-sm-12">
							<button type="button"  class="btn btn-primary" data-dismiss="modal" id="joinBtn">회원추가</button>
						</div>
					</div>
				</form>
             </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>


	  
<style>
	table th:nth-child(6){
		display: none;
	}
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
	})
	function memberDetail(id){
		$.ajax({
			url:'<%=request.getContextPath()%>/admin/memberDetail',
			type:'post',
			data:{"id":id},
			success:function(res){
				var member = res.member;
				var filename = member.fileName;
				var img = '<img class="img-responsive center-block" id=m_photo name="m_photo" src="/project3/resources/upload/'+filename+'" style="border:1px solid gray;width:200 px;height:200px;">';
				$('#profileImg').html(img);
				$('#memberModifyModal').find('#mname').val(member.name);
				$('#memberModifyModal').find('#mid').val(member.id);
				$('#memberModifyModal').find('#modalmail').val(member.email);
				$('#memberModifyModal').find('#tel').val(member.tel);
			
				$('#memberModifyModal').find('#authority').val(member.authority);	
				
				$('#memberModifyModal').modal('show');
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
		
	}
	function modifyBtn(){
		var form = $('#memberModifyForm');
		var tel = form.find('#tel').val();
		var email = form.find('#email').val();
		if(tel == ""){
			alert('연락처를 입력해주세요');
			return false;
		}else if(email == ""){
			alert('이메일을 입력해주세요');
			return false;
		}
		document.memberModifyForm.submit();
		
		
	}
	function list(page){
		location.href="<%=request.getContextPath()%>/admin/memberList?curPage="+page
				+"&search_option=${map.search_option}"
				+"&keyword=${map.keyword}";
	}
	function detail(bno){
		location.href="<%=request.getContextPath()%>/freeBoard/detail?bno="+bno;
	}
	function memberRegistForm(){
		$('#memberModal').modal('show');
	}
	function deleteBtn(t){
		var id = $(t).parents('#memberModifyForm').find('#mid').val();
		var form = $('#memberDeleteForm');
		form.append('<input type="hidden" name="id" id="id" value="'+id+'"/>');
		document.memberDeleteForm.submit();
	}
	function boardDelete4(){
		var b = $("input:checkbox[name=bnobox]:checked").val();
		if(b == null){
			alert('삭제할 대상을 체크해주세요');
			return false;
		}
		var form = $('#boardDeleteForm');
		// 배열 선언
		var arrayParam = new Array();
		//each로 loop를 돌면서 checkbox의 check된 값을 가져와 담아준다.
		$("input:checkbox[name=bnobox]:checked").each(function(){
			var Id = $(this).val();
			var code = '<input type="hidden" name="user" id="user" value="'+Id+'"/>';
			$('#boardDeleteForm').append(code);
		});
		document.boardDeleteForm.action = "<%=request.getContextPath()%>/admin/memberDeleteList";
		document.boardDeleteForm.submit();
	}
</script>

  	<script src="<%=request.getContextPath() %>/resources/js/joinreg.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/joinjs.js"></script>
	
</body>

</html>
