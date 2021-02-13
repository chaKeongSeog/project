<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>수강후기</title>
</head>
<body>
	<h2 class="mt-4">수강후기</h2>
	<form method="get" action="<%=request.getContextPath()%>/lecture/list" class="form-inline mt-3">
			<select name="search_option" class="form-control mx-1 mt-2" id="search_option">
				<c:choose>
					<c:when test="${map.search_option eq 'all'}">
						<option value="all" selected>전체</option>
						<option value="풀스택">풀스택</option>
						<option value="인공지능">인공지능</option>
					</c:when>
					<c:when test="${map.search_option eq '풀스택'}">
						<option value="all" >전체</option>
						<option value="풀스택" selected>풀스택</option>
						<option value="인공지능">인공지능</option>
					</c:when>
					<c:when test="${map.search_option eq '인공지능'}">
						<option value="all">전체</option>
						<option value="풀스택">풀스택</option>
						<option value="인공지능" selected>인공지능</option>
					</c:when>
				</c:choose>
			</select>
			<input type="text" name="keyword" class="form-control mx-1 mt-2" placeholder="제목을 입력하세요." id="keyword"/>
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#" id="lectureWrite">등록하기</a>
	</form>

	<c:choose>
		<c:when test="${map.list == '[]'}">
		<div id="accordion" style="margin-top:10px;">
			<div class="card" style="border:0;">
				 <div class="card-header" style="background-color: white;border:0;">
				 	<div class="row">
				 		<div class="col-8 text-left;">
		    				<span style="font-size:15px;font-weight: bold;">게시물이 존재하지않습니다</span>
		    			</div>
				 	</div>
				 </div>
				
     		</div>
     	</div>	
	    </c:when>
		<c:otherwise>
			<c:forEach var="list" items="${map.list}">
				<div id="accordion" style="margin-top:10px;">
				    <div class="card">
				    	<input type="hidden" name="eno" id="eno" value="${list.eno}"/>
				      <div class="card-header">
				        <a class="card-link" data-toggle="collapse" href="#collapse${list.eno}" id="lectureTitle">
				          	<div>
								<div class="row">
									<div class="col-8 text-left">&nbsp;
										<c:if test="${list.ref_level>1}">
						     				<c:forEach begin="1" end="${list.ref_level}">
						     					&nbsp;&nbsp;&nbsp;&nbsp;
						     				</c:forEach>
						     				<span style="color:red;">[답변]</span>
						     			</c:if>
										<strong>[${list.divide}]${list.title}</strong>
									</div>
									<div class="col-4 text-right">
										과목<span style="color: red;">${list.lecturename}</span>
									</div>
								</div>
							</div>
				        </a>
				      </div>
				      <div id="collapse${list.eno}" class="collapse" data-parent="#accordion">
				        <div class="card-body" id="lectureArea">
			        		<h5 class="card-title">
			        			<img src="/project3/resources/upload/${list.fileName}" alt="" class="media-object img-circle" style="width:50px;height:50px;border-radius:30px;"/>
					            <span id="writer" style="font-size:15px;">${list.name}</span>
					            <span style="font-size:15px;">(${list.regdate})</span>
							</h5>
							<div style="margin-top: 10px;">
								${list.content}
							</div>
							<div class="row">
								<div class="col-9 text-left">
									[교수 ${list.professorname}]
									평가<span style="color: red;">${list.totalscore}</span>
									<span style="color: green;">(추천 : ${list.likecount})</span>
								</div>
								<div class="col-3 text-right">
									<div style="float:right;">
										<a href="#" onclick="likeUp('${list.eno}')" style="color:purple;">추천</a>
									</div>
									<c:if test="${list.ref_level < 4}">
										<div style="float:right;margin-right: 5px;" id="lectureAnswerArea">
											<form action="<%=request.getContextPath() %>/lecture/answerForm" method="post" id="lectureAnswerForm">
												<input type="hidden" name="eno" value="${list.eno}"/>
												<input type="hidden" name="search_option" value="${map.search_option}"/>
												<input type="hidden" name="keyword" value="${map.keyword}"/>
												<input type="hidden" name="curPage" value="${map.pager.curPage}"/>
											</form>
												<a href="#" onclick="answer('${list.eno}','${list.id}',this)" style="color:green;">답변</a>
										</div>
									</c:if>
									<div style="float:right;margin-right: 5px;margin-left: 5px;" id="lectureModifyArea">
										<form action="<%=request.getContextPath() %>/lecture/modifyForm" method="post" id="lectureForm">
											<input type="hidden" name="eno" value="${list.eno}"/>
										</form>
											<a href="#" onclick="update('${list.eno}','${list.id}',this)" style="color:blue;">수정</a>
									</div>
									<div style="float:right;">
										<a href="#" onclick="Delete('${list.eno}','${list.id}')" style="color:red;">삭제</a>
									</div>
								</div>
							</div>
			        		<hr style="clear:both;"/>
							<div style="width:100%;" id="replyArea">
								<textarea cols="60" class="form-control" placeholder="댓글을 입력해주세요" id="lectureReply"></textarea>
								<button type="button" id="reply" class="btn btn-primary" onclick="reply('${list.eno}',this)">등록</button>
							</div>
							<div id="replyContentArea">
								
							</div>
				        </div>
				      </div>
				    </div>
				  </div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<div class="form-group" style="margin: 10px;">
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
      </div>  
     <div id="layoutAuthentication_footer" style="display:none;">
               <footer class="py-4 bg-light mt-auto">
                   <div class="container-fluid">
                       <div class="d-flex align-items-center justify-content-between small">
                           <div class="text-muted">Copyright &copy; Your Website 2020</div>
                           <div>
                               <a href="#">Privacy Policy</a>
                               &middot;
                               <a href="#">Terms &amp; Conditions</a>
                           </div>
                       </div>
                   </div>
               </footer>
           </div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script>
$(function(){
	$(this).on('click','#lectureTitle',function(){
		var eno = $(this).parent().parent().find('#eno').val();
		replyList(eno,this);
		
	});
	
	$('#lectureWrite').on('click',function(){
		location.href="<%=request.getContextPath()%>/lecture/registForm";
	})
	$('#reportWrite').on('click',function(){
		location.href="<%=request.getContextPath()%>/lecture/reportRegistForm";
	})
// 	replyList(eno,this);
	
})
function update(eno,id,t){
	if(id != '${user.id}'){
		alert('수정 권한이 없습니다');
		return false;
	}
	var form = $(t).parents('#lectureModifyArea').find('#lectureForm');
	form.submit();
	
}
function answer(eno,id,t){
	
	var form = $(t).parents('#lectureAnswerArea').find('#lectureAnswerForm');
	form.submit();
	
}
function list(page){
	location.href="<%=request.getContextPath()%>/lecture/list?curPage="+page
	+"&search_option=${map.search_option}"+"&keyword=${map.keyword}";	
}
function Delete(eno,id){
	var page = ${map.pager.curPage};
	var userId = '${user.id}';
	if(id != userId){
		alert('삭제할 권한이 없습니다');
		return false;
	}
	if (confirm("정말 삭제하시겠습니까??") == true){    
		$.ajax({
			url:'<%=request.getContextPath()%>/lecture/delete',
			type:'post',
			data:{"eno":eno},
			success:function(res){
				list(page);
			},error:function(req){
				alert('상태:'+req.status);
			}
		})
	}else{   
	    return;
	}

}
function likeUp(eno){
	var id = '${user.id}';
	var page = ${map.pager.curPage};
	if (confirm("정말 추천하시겠습니까??") == true){    
		$.ajax({
			url:'<%=request.getContextPath()%>/lecture/likeUp',
			type:'post',
			data:{"eno":eno,
				"id":id},
			success:function(res){
				list(page);
				alert(res)
			},error:function(req){
				alert('상태:'+req.status);
			}
		})
	}else{   
	    return;
	}
}
function reply(eno,t){
	var content = $(t).parents('#replyArea').find('#lectureReply').val();
	var id = '${user.id}';
	if(content == null || content ==""){
		alert('댓글을 입력해주세요');
		return false;
	}
	if(content.length > 180){
		alert('글자수는 180자 이하로 작성하셔야 합니다')
		return false;
	}
	content = content.replace(/\n/g,"<br>");
	$.ajax({
		url:'<%=request.getContextPath()%>/lecture/replyWrite',
		type:'post',
		data:{"eno":eno,
			"content":content,
			"id":id},
		success:function(res){
			$(t).parents('#replyArea').find('#lectureReply').val('');
			replyList(eno,t);
		},error:function(req){
			alert('상태:'+req.status);
		},dataType:'json'
		
	});
}
function replyList(eno,t){
	$.ajax({
		url:'<%=request.getContextPath()%>/excludes/lecture/replyList',
		type:'post',
		data:{"eno":eno},
		success:function(res){
			$(t).parents('#accordion').find('#replyContentArea').html(res)
		},error:function(req){
			alert('상태:'+req.status);
		}
		
	});
}

</script>
</body>

</html>