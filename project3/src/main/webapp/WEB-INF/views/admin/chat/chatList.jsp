<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	table th{
		display: none;
		
	}


</style>
<body>
        <h2 class="mt-4">메세지 관리</h2>
        <form action="<%=request.getContextPath() %>/admin/chatList" method="get" name="form1" style="text-align: center;width:700px;">
             <div class="input-group">
              <select class="form-control col-md-3" name="search_option">
              	<c:choose>
	              <c:when test="${map.search_option eq 'all'}">
	              	<option value="all" selected>전체</option>
					  <option value="id">아이디</option>
					  <option value="content">내용</option>
	              </c:when>
	               <c:when test="${map.search_option eq 'id'}">
	              	<option value="all">전체</option>
					  <option value="id" selected>아이디</option>
					  <option value="content">내용</option>
	              </c:when>
	              <c:when test="${map.search_option eq 'content'}">
	              	<option value="all">전체</option>
					  <option value="id">아이디</option>
					  <option value="content" selected>내용</option>
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
	        <col width="7%">
	        <col width="7%">
	        <col width="35%">
	        <col width="15%">
	        <col width="15%">
	        <col width="15%">
	    </colgroup>
	    <thead>
	      <tr>
	      	<th></th>
	        <th>번호</th>
	        <th>보낸사람</th>
	        <th>받은사람</th>
	        <th>내용</th>
	        <th>날짜</th>
	        <th>날짜</th>
	        <th>수정/삭제</th>
	      </tr>
	    </thead>	    
	     <tbody>
	     	<c:forEach var="chat" items="${map.chat}">	     		
	     		<tr>
	     			<td><input type="checkbox" name="bnobox" id="bnobox" value="${chat.cno}"/></td>
	     			<td>${chat.cno}</td>
	     			<td><span style="color:blue;">${chat.fromID}</span></td>
	     			<td>
	     				${chat.toID}
	     			</td>
	     			<td>
	     				<div class="chatContent" style="width:472px;height:20px;overflow: hidden;text-overflow: ellipsis;cursor:pointer;white-space: nowrap;">
	     					<a href="#" onclick="chatContent('${chat.cno}')">${chat.content}</a>
	     				</div>
	     			</td>
	     			<td>
	     				${chat.regdate}
	     			</td>
	     			<td>
						<a href="javascript:OpenWindow('/project3/admin/chatModifyForm?cno=${chat.cno}&search_option=${map.search_option}&keyword=${map.keyword}&curPage=${map.pager.curPage}','자료실 수정',800,600);" class="btn btn-primary btn-sm">수정</a>
						<a href="#" class="btn btn-primary btn-sm" onclick="chatDelete('${chat.cno}')">삭제</a>
					</td>
	     		</tr>
	     	</c:forEach>
	    </tbody>
	  </table>
	
	  <div class="form-group">
    	<form action="<%=request.getContextPath()%>/admin/chatDeleteList" method="post" onsubmit="return false" id="boardDeleteForm" name="boardDeleteForm">
	  		<input type="hidden" name="curPage" id="curPage" value="${map.pager.curPage}"/>
	  	</form>
	  	<button class="btn btn-primary" href="#" onclick="boardDelete()">삭제</button>
	  	<a class="btn btn-primary pull-right" href="#" id="send">보내기</a>
	  </div>
	  <c:if test="${map.pager.blockEnd > 0}">
	  	  <div class="form-group">
		  	  <ul class="pagination justify-content-center m-0" style="">
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
	</c:if>
<style>
	table th:nth-child(6){
		display: none;
	}
</style>
<script>
	$(function(){
		$('#send').on('click',function(){
			var b = $("input:checkbox[name=bnobox]:checked").val();
			if(b == null){
				alert('보낼 대상을 체크해주세요');
				return false;
			}
			var arrayParam = new Array();
			$("input:checkbox[name=bnobox]:checked").each(function(i){
				var num = $(this).val();
				arrayParam[i] = num;
			});
			OpenWindow('/project3/excludes/admin/chatRegistForm?cno='+arrayParam+'&search_option=${map.search_option}&keyword=${map.keyword}&curPage=${map.pager.curPage}','자료실 수정',900,600);
		});
		
	});
	function chatContent(cno){
		OpenWindow('/project3/excludes/admin/chatDetail?cno='+cno,'자료실 수정',900,600);
	}
	function groupdelete(gno){
		$.ajax({
			url:'<%=request.getContextPath()%>/admin/groupOneDelete',
			type:'post',
			data:{"gno":gno},
			success:function(res){
				alert('삭제하였습니다');
				list('${map.pager.curPage}');
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		})
	}
	function list(page){
		location.href="<%=request.getContextPath()%>/admin/chatList?curPage="+page
				+"&search_option=${map.search_option}"
				+"&keyword=${map.keyword}";
	}
	function detail(bno){
		location.href="<%=request.getContextPath()%>/notice/detail?bno="+bno;
	}
	
	function chatDelete(cno){
		$.ajax({
			url:'<%=request.getContextPath()%>/admin/chatDelete',
			type:'post',
			data:{"cno":cno},
			success:function(res){
				alert('삭제하였습니다');
				list('${map.pager.curPage}');
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		})
	}
	function boardDelete(){
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
			var code = '<input type="hidden" name="cno" id="cno" value="'+num+'"/>';
			$('#boardDeleteForm').append(code);
		});
		document.boardDeleteForm.action = "<%=request.getContextPath()%>/admin/chatDeleteList";
		document.boardDeleteForm.submit();
		alert('삭제하였습니다');
		
	}
	
	function boardWriteForm(){
		location.href="<%=request.getContextPath()%>/admin/pdsregistForm";
		
	}
	
	
</script>
<%-- <script src="<%=request.getContextPath()%>/resources/js/group.js"></script> --%>
</body>

</html>
