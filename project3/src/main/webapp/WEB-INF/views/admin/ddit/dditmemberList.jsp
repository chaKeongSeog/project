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
        <h2 class="mt-4">학생 추가</h2>
        <!-- Navbar Search-->
        <form action="<%=request.getContextPath() %>/admin/dditmemberList" method="get" name="form1" class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-5 my-2 my-md-0" style="text-align: center">
             <div class="input-group">
              <select class="form-control" name="search_option" style="width:100px;">
              <c:choose>
	              <c:when test="${map.search_option =='all'}">
	              	<option value="all" selected>전체</option>
					  <option value="name">이름</option>
					  <option value="room">반</option>
					  <option value="kind">종류</option>
	              </c:when>
	              <c:when test="${map.search_option =='name'}">
	              	<option value="all">전체</option>
					  <option value="name" selected>이름</option>
					  <option value="room">반</option>
					  <option value="kind">종류</option>
	              </c:when>
	               <c:when test="${map.search_option =='room'}">
	              	<option value="all">전체</option>
					  <option value="name">이름</option>
					  <option value="room" selected>반</option>
					  <option value="kind">종류</option>
	              </c:when>
	              <c:when test="${map.search_option =='kind'}">
	              	<option value="all">전체</option>
					  <option value="name">이름</option>
					  <option value="room">반</option>
					  <option value="kind" selected>종류</option>
	              </c:when>
	           </c:choose>
			  </select>
                 <input class="form-control" type="text" name="keyword" value="${map.keyword}"placeholder="검색어를 입력해주세요" aria-label="Search" aria-describedby="basic-addon2" style="width:199px;"/>
                 <div class="input-group-append">
                     <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                 </div>
             </div>
         </form>  
                <table class="table table-bordered">
        <colgroup>
	        <col width="5%">
	        <col width="7%">
	        <col width="10%">
	        <col width="45%">
	        <col width="10%">
			<col width="15%">
			<col width="20%">
			<col width="20%">
	    </colgroup>
	    <thead>
	      <tr>
	      	<th></th>
	        <th>이름</th>
	        <th>반</th>
	        <th>주소</th>
	        <th>종류</th>
	        <th>날짜</th>
	        <th>날짜</th>
	      </tr>
	    </thead>
	     <tbody>
	     	<c:forEach var="list" items="${map.list}">
	     		<tr>
	     			<td><input type="checkbox" name="bnobox" id="bnobox" value="${list.dno}"/></td>
	     			<td onclick="dditName('${list.dno}')">
	     				<span><a href="#" style="color:blue;">${list.name}</a></span>
	     			</td>
	     			<td>${list.room}</td>
	     			<td> 
	     				<div class="chatContent" style="width:472px;height:20px;overflow: hidden;text-overflow: ellipsis;cursor:pointer;  white-space: nowrap;">
	     					${list.addr1}&nbsp;${list.addr2}
	     				</div>
	     			</td>
	     			<td>${list.kind}</td>
	     			<td>${list.regdate}</td>
	     		</tr>
	     	</c:forEach>
	    </tbody>
	  </table>
	  <div class="form-group">
	  	<form action="" method="post" onsubmit="return false" id="boardDeleteForm" name="boardDeleteForm">
	  		<input type="hidden" name="boardType" value="${map.boardType}"/>
	  		<input type="hidden" name="search_option" id="search_option" value="${map.search_option}"/>
        	<input type="hidden" name="keyword" id="keyword" value="${map.keyword}"/>
        	<input type="hidden" name="curPage" id="curPage" value="${map.pager.curPage}"/>
	  	</form>
	  	<button class="btn btn-primary" href="#" onclick="boardDelete3()">회원삭제</button>
	  	<a class="btn btn-primary pull-right" href="#" id="dditmemberAdd">회원등록</a>
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
	  
<!-- 회원 수정페이지 모달 -->
  <div class="modal" id="dditModify">
    <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">학생 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        		<form action="<%=request.getContextPath() %>/admin/dditmemberModify" class="form-horizontal"  method="post" enctype="multipart/form-data" id="dditmemberModifyForm" name="dditmemberModifyForm" style="width:600px;">
        			<input type="hidden" name="dno" id="dno" value=""/>
        			<input type="hidden" name="search_option" id="search_option" value="${map.search_option}"/>
        			<input type="hidden" name="keyword" id="keyword" value="${map.keyword}"/>
        			<input type="hidden" name="curPage" id="curPage" value="${map.pager.curPage}"/>
					<div class="form-group">
						<label class="control-label col-sm-3" for="mname">Name</label>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="name"
								placeholder="Enter Name" name="name">
								<span id="msgname" class="msg"></span>
						</div>
						
					</div>
			    <div class="form-group">
			      <label class="control-label col-sm-3" for="mail">반
			      </label>
			      <div class="col-sm-12">
			        <select name="room" id="room" class="form-control">
			        	<option id="401" value="401">401</option>
			        	<option id="402" value="402">402</option>
			        	<option id="403" value="403">403</option>
			        	<option id="404" value="404">404</option>
			        </select>
			      </div>
			    </div>
			    
			        <div class="form-group">
			      <label class="control-label col-sm-3" for="mail">종류
			      </label>
			      <div class="col-sm-12">
			        <select name="kind" id="kind" class="form-control">
			        	<option id="full" value="풀스택">풀스택</option>
			        	<option id="ai" value="인공지능">인공지능</option>
			        </select>
			      </div>
			    </div>
		    	    
			 	<div class="form-group">
			      <label class="control-label col-sm-3" for="add1">주소</label>
			      <div class="col-sm-12">
			        <input type="text" class="form-control" id="addr1" placeholder="Enter addr1" name="addr1">
			        <span id="sp"></span>
			        <div class="msg" id="add1msg"></div>
			      </div>
			      
			    </div>
			    
			      <div class="form-group">
			      <label class="control-label col-sm-3" for="add2">상세주소</label>
			      <div class="col-sm-12">
			        <input type="text" class="form-control" id="addr2" placeholder="Enter addr2" name="addr2">
			        <span id="sp"></span>
			        <div class="msg" id="add2msg"></div>
			      </div>
			         
			    </div>
					
				<div class="form-group">
					<label class="control-label col-sm-3" for="tel">Tel</label>
					<div class="col-sm-12">
						<input type="text" class="form-control" id="tel2"
							placeholder="Enter Tel" name="tel">
							<span id="msgddno" class="msg"></span>
					</div>
					
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="tel"></label>
					<div class="col-sm-12">
						<button type="button"  class="btn btn-primary" data-dismiss="modal" onclick="modifyBtn()">회원수정</button>
					</div>
				</div>
				</form>	
        	</div>
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        </div>
        </div>
      </div>
    </div>
  </div>




<!-- 회원추가 모달 -->
  <div class="modal" id="memberModal">
    <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">학생 추가</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
		<div class="container" style="width:700px;">
		  <h2>학생 추가</h2>
		  <form class="form-horizontal" action="<%=request.getContextPath() %>/admin/dditRegitst" method="post" name="dditform" id="dditform">
		   	<div class="form-group">
		      <label class="control-label col-sm-4" for="name">이름</label>
		      <div class="col-sm-12">
		        <input type="text" class="form-control" id="name2" placeholder="Enter name" name="name">
		      </div>
		      <span class="sp" ></span>
		      <div class="msg" id="namemsg"></div>
		    </div>

		    <div class="form-group">
		      <label class="control-label col-sm-3" for="tel">연락처
		      	
		      </label>
		      <div class="col-sm-12">
		        <input type="text" class="form-control" id="tel2" placeholder="Enter hp" name="tel">
		        
		      </div>
		      <span id="sp"></span>
		       <div class="msg" id="zipmsg"></div>
		    </div>
		    
		   	<div class="form-group">
		      <label class="control-label col-sm-3" for="mail">메일
		      	
		      </label>
		      <div class="col-sm-12">
		        <input type="email" class="form-control" id="mail" placeholder="Enter mail" name="mail">
		        
		      </div>
		        <span id="sp"></span>
		        <div class="msg" id="mailmsg"></div>
		    </div>
		    
		    <div class="form-group">
		      <label class="control-label col-sm-3" for="mail">반
		      </label>
		      <div class="col-sm-12">
		        <select name="room" id="room" class="form-control">
		        	<option value="401">401</option>
		        	<option value="402">402</option>
		        	<option value="403">403</option>
		        	<option value="404">404</option>
		        </select>
		      </div>
		    </div>
		    
		        <div class="form-group">
		      <label class="control-label col-sm-3" for="mail">종류
		      </label>
		      <div class="col-sm-12">
		        <select name="kind" id="kind" class="form-control">
		        	<option value="풀스택">풀스택</option>
		        	<option value="인공지능">인공지능</option>
		        </select>
		      </div>
		    </div>
		    	    
		 	<div class="form-group">
		      <label class="control-label col-sm-3" for="add1">주소</label>
		      <div class="col-sm-12">
		        <input type="text" class="form-control" id="addr1" placeholder="Enter addr1" name="addr1">
		        <span id="sp"></span>
		        <div class="msg" id="add1msg"></div>
		      </div>
		      
		    </div>
		    
		      <div class="form-group">
		      <label class="control-label col-sm-3" for="add2">상세주소</label>
		      <div class="col-sm-12">
		        <input type="text" class="form-control" id="addr2" placeholder="Enter addr2" name="addr2">
		        <span id="sp"></span>
		        <div class="msg" id="add2msg"></div>
		      </div>
		         
		    </div>
		    
		    <div class="form-group">        
		      <div class="col-sm-offset-2 col-sm-10">
		        <button type="button" class="btn btn-primary" id="dditjoin">학생추가</button>
		        <span id="spjoin"></span>
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
		$('#dditmemberAdd').on('click',function(){
			$('#memberModal').modal('show');
		});
		

		
		$('#dditjoin').on('click',function(){
			var form = $('#dditform');
			var name = form.find('#name2').val();
			var addr1 = form.find('#addr1').val();
			var addr2 = form.find('#addr2').val();
			var tel = form.find('#tel2').val();
			var room = form.find('#room').val();
			var kind = form.find('#kind').val();
			if(name == ""){
				alert('이름을 입력해주세요');
				return false;
			}else if(addr1 == ""){
				alert('주소를 입력해주세요');
				return false;
			}else if(addr2 == ""){
				alert('상세 주소를 입력해주세요');
				return false;
			}else if(tel == ""){
				alert('연락처를 입력해주세요');
				return false;
			}else if(room == ""){
				alert('반을 선택해주세요');
				return false;
			}else if(kind == ""){
				alert('종류를 선택해주세요');
				return false;
			}
			form.submit();
			
			
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
				$('#memberModifyModal').find('#email').val(member.email);
				$('#memberModifyModal').find('#tel').val(member.tel);
				$('#memberModifyModal').find('#authority').val(member.authority);
				$('#memberModifyModal').modal('show');
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
		
	}
	function modifyBtn(){
		var form = $('#dditmemberModifyForm');
		var tel = form.find('#tel').val();
		var name = form.find('#name').val();
		var addr1 = form.find('#addr1').val();
		var addr2 = form.find('#addr2').val();
		var kind = form.find('#kind').val();
		var room = form.find('#room').val();
		
		
		
		if(tel == ""){
			alert('연락처를 입력해주세요');
			return false;
		}else if(name == ""){
			alert('이름을 입력해주세요');
			return false;
		}else if(addr1 == ""){
			alert('주소를 입력해주세요');
			return false;
		}else if(addr2 == ""){
			alert('상세 주소를 입력해주세요');
			return false;
		}else if(kind == ""){
			alert('종류를 입력해주세요');
			return false;
		}else if(room == ""){
			alert('반을 입력해주세요');
			return false;
		}
		
		document.dditmemberModifyForm.submit();
		alert('수정하였습니다')
		
	}
// 	function dditmemberRegistForm(){
// 		$('#memberModal').modal('show');
// 	}
	function deleteBtn(t){
		var id = $(t).parents('#memberModifyForm').find('#mid').val();
		var form = $('#memberDeleteForm');
		form.append('<input type="hidden" name="id" id="id" value="'+id+'"/>');
		document.memberDeleteForm.submit();
	}
	
	function boardDelete3(){
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
			var num = $(this).val();
			var code = '<input type="hidden" name="dno" id="dno" value="'+num+'"/>';
			$('#boardDeleteForm').append(code);
		});
		document.boardDeleteForm.action = "<%=request.getContextPath()%>/admin/dditmemberDelete";
		document.boardDeleteForm.submit();
	}
	
	function list(page){
		location.href="<%=request.getContextPath()%>/admin/dditmemberList?curPage="+page
				+"&search_option=${map.search_option}"
				+"&keyword=${map.keyword}"+"&boardType=${map.boardType}";
	}
	function dditName(dno){
		
		$.ajax({
			url:'<%=request.getContextPath()%>/admin/dditmemberDetail',
			type:'post',
			data:{"dno":dno},
			success:function(res){
				var dditmem = res.ddit;
				$('#dditmemberModifyForm').find('#dno').val(dditmem.dno);
				$('#dditmemberModifyForm').find('#name').val(dditmem.name);
				$('#dditmemberModifyForm').find('#tel2').val(dditmem.tel);
				$('#dditmemberModifyForm').find('#addr1').val(dditmem.addr1);
				$('#dditmemberModifyForm').find('#addr2').val(dditmem.addr2);
				if(dditmem.kind == "풀스택"){
					$('#dditmemberModifyForm').find('#kind #full').val(dditmem.kind);	
				}else{
					$('#dditmemberModifyForm').find('#kind #ai').val(dditmem.kind);
				}
				$('#dditmemberModifyForm').find('#kind ').val(dditmem.kind);
				if(dditmem.room == "401"){
					$('#dditmemberModifyForm').find('#room #401').val(dditmem.room);	
				}else if(dditmem.room == "402"){
					$('#dditmemberModifyForm').find('#room #402').val(dditmem.room);
				}else if(dditmem.room == "403"){
					$('#dditmemberModifyForm').find('#room #403').val(dditmem.room);
				}else if(dditmem.room == "404"){
					$('#dditmemberModifyForm').find('#room #404').val(dditmem.room);
				}else{
					$('#dditmemberModifyForm').find('#room option').val(dditmem.room);
				}
				
				
				$('#dditModify').modal('show');
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		});
	}
</script>
<script src="<%=request.getContextPath() %>/resources/js/joinreg.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/joinjs.js"></script>
</body>

</html>
