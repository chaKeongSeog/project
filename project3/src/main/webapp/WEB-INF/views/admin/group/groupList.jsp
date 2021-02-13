<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	table th{
		display: none;
	}
</style>
<body>
        <h2 class="mt-4">그룹방 관리</h2>
        <form action="<%=request.getContextPath() %>/admin/groupList" method="get" name="form1" style="text-align: center;width:700px;">
             <div class="input-group">
              <select class="form-control col-md-3" name="search_option">
              	<c:choose>
	              <c:when test="${map.search_option eq 'all'}">
	              	<option value="all" selected>전체</option>
					  <option value="name">방이름</option>
					  <option value="id">방 조장 아이디</option>
	              </c:when>
	              <c:when test="${map.search_option eq 'name'}">
	              	<option value="all">전체</option>
					  <option value="name" selected>방이름</option>
					  <option value="id">방 조장 아이디</option>
	              </c:when>
	               <c:when test="${map.search_option eq 'id'}">
	              	<option value="all">전체</option>
					  <option value="name">방이름</option>
					  <option value="id" selected>방 조장 아이디</option>
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
	        <col width="10%">
	        <col width="20%">
	        <col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="15%">
	    </colgroup>
	    <thead>
	      <tr>
	      	<th></th>
	        <th>방번호</th>
	        <th>회원</th>
	        <th>첨부</th>
	        <th>채팅</th>
	        <th>이름</th>
	        <th>이름</th>
	        <th>인증</th>
	        <th>메모</th>
	        <th>스케줄</th>
	        <th>수정/삭제</th>
	      </tr>
	    </thead>	    
	     <tbody>
	     	<c:forEach var="list" items="${map.list}">	     		
	     		<tr>
	     			<td><input type="checkbox" name="bnobox" id="bnobox" value="${list.gno}"/></td>
	     			<td>${list.gno}</td>
	     			<td><a href="javascript:OpenWindow('/project3/excludes/admin/groupMemberDetail?gno=${list.gno}','자료실 상세페이지',800,600)" style="color:blue;">${list.groupMemberCount}명</a></td>
	     			<td>
	     				<a href="javascript:OpenWindow('/project3/excludes/admin/groupFileDetail?gno=${list.gno}','자료실 상세페이지',800,600)" style="color:purple;">${list.groupFileCount}개</a>
	     			</td>
	     			<td>
	     				<a href="javascript:OpenWindow('/project3/excludes/admin/groupChatDetail?gno=${list.gno}','자료실 상세페이지',800,600)" style="color:red;">${list.groupChatCount}개</a>
	     			</td>
	     			<td>
	     				<a href="javascript:OpenWindow('/project3/excludes/admin/groupDetail?gno=${list.gno}','자료실 상세페이지',800,600)">
	     					${list.name}
	     				</a>
	     			</td>
	     			<td>
		     			<a href="javascript:OpenWindow('/project3/excludes/admin/groupBoardDetail?gno=${list.gno}','자료실 상세페이지',800,600)" style="color:brown;">
		     				${list.groupBoardCount}개
		     			</a>
	     			</td>
	     			<td>
		     			<a href="javascript:OpenWindow('/project3/excludes/admin/groupMemoDetail?gno=${list.gno}','자료실 상세페이지',800,600)" style="color:#329da8;font-weight:bold;">
		     				${list.groupMemoCount}<span style="font-weight:normal">개</span>
		     			</a>
	     			</td>
	     			<td>
		     			<a href="javascript:OpenWindow('/project3/excludes/admin/groupScheduleDetail?gno=${list.gno}','자료실 상세페이지',800,600)" style="color:#eab676;font-weight:bold;">
		     				${list.groupScheduleCount}<span style="font-weight:normal">개</span>
		     			</a>
	     			</td>
	     			<td>
						<a href="javascript:OpenWindow('/project3/admin/groupModifyForm?gno=${list.gno}','자료실 수정',800,600);" class="btn btn-primary btn-sm">수정</a>
						<a href="#" class="btn btn-primary btn-sm" onclick="groupdelete('${list.gno}')">삭제</a>
					</td>
	     		</tr>
	     	</c:forEach>
	    </tbody>
	  </table>
	
	  <div class="form-group">
    	<form action="<%=request.getContextPath()%>/admin/groupDeleteList" method="post" onsubmit="return false" id="boardDeleteForm" name="boardDeleteForm">
	  		<input type="hidden" name="curPage" id="curPage" value="${map.pager.curPage}"/>
	  	</form>
	  	<button class="btn btn-primary" href="#" onclick="boardDelete()">방삭제</button>
	  	<a class="btn btn-primary pull-right" href="javascript:OpenWindow('/project3/admin/groupregistForm','자료실 수정',900,600);">방추가</a>
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
	

	});
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
		location.href="<%=request.getContextPath()%>/admin/groupList?curPage="+page
				+"&search_option=${map.search_option}"
				+"&keyword=${map.keyword}";
	}
	function detail(bno){
		location.href="<%=request.getContextPath()%>/notice/detail?bno="+bno;
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
			var code = '<input type="hidden" name="gno" id="gno" value="'+num+'"/>';
			$('#boardDeleteForm').append(code);
		});
		document.boardDeleteForm.action = "<%=request.getContextPath()%>/admin/groupDelete";
		document.boardDeleteForm.submit();
		
	}
	function boardWriteForm(){
		location.href="<%=request.getContextPath()%>/admin/pdsregistForm";
		
	}
	
	
</script>
<%-- <script src="<%=request.getContextPath()%>/resources/js/group.js"></script> --%>
</body>

</html>
