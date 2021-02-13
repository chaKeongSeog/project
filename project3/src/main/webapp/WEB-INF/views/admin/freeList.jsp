<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	table th{
		display: none;
	}
</style>
<body>
        <h2 class="mt-4">게시판 관리</h2>
        <!-- Navbar Search-->
        <form action="<%=request.getContextPath() %>/admin/freeList" method="get" name="form1" style="text-align: center;width:700px;">
             <div class="input-group">
             	<select class="form-control col-md-5" name="boardType" id="boardType">
             		<c:choose>
             		  <c:when test="${map.boardType eq 'notice'}">
			             	<option value="notice" selected>공지사항</option>
							<option value="free">자유게시판</option>
							<option value="eval">수강후기</option>
							<option value="pds">자료실</option>
	              	  </c:when>
             		   <c:when test="${map.boardType eq 'free'}">
			             	<option value="notice">공지사항</option>
							<option value="free" selected>자유게시판</option>
							<option value="eval">수강후기</option>
							<option value="pds">자료실</option>
	              	  </c:when>
             	      <c:when test="${map.boardType eq 'eval'}">
			             	<option value="notice">공지사항</option>
							<option value="free">자유게시판</option>
							<option value="eval" selected>수강후기</option>
							<option value="pds">자료실</option>
	              	  </c:when>
	              	   <c:when test="${map.boardType eq 'pds'}">
			             	<option value="notice">공지사항</option>
							<option value="free">자유게시판</option>
							<option value="eval">수강후기</option>
							<option value="pds" selected>자료실</option>
	              	  </c:when>
             		</c:choose>
				</select>
              <select class="form-control col-md-3" name="search_option">
              	<c:choose>
	              <c:when test="${map.search_option eq 'all'}">
	              	<option value="all" selected>전체</option>
					  <option value="title">제목</option>
					  <option value="content">내용</option>
	              </c:when>
	              <c:when test="${map.search_option eq 'title'}">
	              	<option value="all">전체</option>
					  <option value="title" selected>제목</option>
					  <option value="content">내용</option>
	              </c:when>
	               <c:when test="${map.search_option eq 'content'}">
	              	<option value="all">전체</option>
					  <option value="title">제목</option>
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
	        <col width="10%">
	        <col width="45%">
	        <col width="10%">
			<col width="20%">
			
			
	    </colgroup>
	    <thead>
	      <tr>
	      	<th></th>
	        <th>글번호</th>
	        <th>분류</th>
	        <th>제목</th>
	        <th>작성자</th>
	        <th>날짜</th>
	        <th>수정/삭제</th>
	        
	      </tr>
	    </thead>
	     <tbody>
	     	<c:forEach var="list" items="${map.list}">
	     		<tr>
	     			<td><input type="checkbox" name="bnobox" id="bnobox" value="${list.bno}"/></td>
	     			<td>${list.bno}</td>
	     			<td>${list.brd_gb}</td>
	     			<td>
	     				<a href="javascript:OpenWindow('/project3/excludes/admin/freeDetail?bno=${list.bno}','자유게시판 상세보기',800,600);">
	     					${list.title}
	     				</a></td>
	     			<td>${list.name}</td>
	     			<td>
	     				<a href="javascript:OpenWindow('/project3/admin/freeModifyForm?bno=${list.bno}','자유게시판 상세보기',900,600);" class="btn btn-primary btn-sm">수정</a>
	     				<a href="#" class="btn btn-primary btn-sm" onclick="freedelete('${list.bno}')">삭제</a>
	     			</td>
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
	  	<button class="btn btn-primary" href="#" onclick="boardDelete()" style="margin-left:5px;">글삭제</button>
	  	<a class="btn btn-primary pull-right" href="javascript:OpenWindow('/project3/admin/freeregistForm?eno=${list.eno}','자료실 상세페이지',800,600)">글작성</a>
	  	
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
		$('#boardType').on('change',function(){
			var boardType = $('#boardType').val();
			var page = 1;
			if(boardType == "notice"){
				location.href="<%=request.getContextPath()%>/admin/noticeList?curPage="+page
				+"&search_option=${map.search_option}"
				+"&keyword=${map.keyword}"+"&boardType=${map.boardType}";
			}else if(boardType == "free"){
				location.href="<%=request.getContextPath()%>/admin/freeList?curPage="+page
				+"&search_option=${map.search_option}"
				+"&keyword=${map.keyword}"+"&boardType=free";
			}else if(boardType == "eval"){
				location.href="<%=request.getContextPath()%>/admin/evalList?curPage="+page
				+"&search_option=${map.search_option}"
				+"&keyword=${map.keyword}"+"&boardType=eval";
			}else if(boardType == "pds"){
				location.href="<%=request.getContextPath()%>/admin/pdsList?curPage="+page
				+"&search_option=${map.search_option}"
				+"&keyword=${map.keyword}"+"&boardType=pds";
			}
		});
	});
	function list(page){
		location.href="<%=request.getContextPath()%>/admin/freeList?curPage="+page
				+"&search_option=${map.search_option}"
				+"&keyword=${map.keyword}"+"&boardType=${map.boardType}";
	}
	function detail(bno){
		location.href="<%=request.getContextPath()%>/notice/detail?bno="+bno;
	}
	
	function boardWriteForm(){
		
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
			var code = '<input type="hidden" name="bno" id="bno" value="'+num+'"/>';
			$('#boardDeleteForm').append(code);
		});
		document.boardDeleteForm.action = "<%=request.getContextPath()%>/admin/freeDelete";
		document.boardDeleteForm.submit();
	}
	
	function freedelete(bno){
		$.ajax({
			url:'<%=request.getContextPath()%>/admin/FreeDelete',
			type:'post',
			data:{"bno":bno},
			success:function(res){
				alert('삭제하였습니다');
				list('${map.pager.curPage}');
			},error:function(req){
				alert('상태:'+req.status);
			},dataType:'json'
		})
	}
	  //팝업창들 뛰우기
	  //새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
	  function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	  	winleft = (screen.width - WinWidth) / 2;
	  	wintop = (screen.height - WinHeight) / 2;
	  	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
	  							+"height="+ WinHeight +", top="+ wintop +", left=" 
	  							+ winleft +", resizable=yes, status=yes"  );
	  	win.focus() ; 
	  }

	  //팝업창 닫기
	  function CloseWindow(){
	  	if(window.opener)window.opener.location.reload(true);
	  	window.close();
	  }	
	
	
</script>
</body>

</html>
