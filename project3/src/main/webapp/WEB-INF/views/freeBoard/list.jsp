<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	table th{
		display: none;
	}
</style>
<body>
        <h2 class="mt-4">자유게시판</h2>
        <!-- Navbar Search-->
        <form action="<%=request.getContextPath() %>/freeBoard/list" method="get" name="form1" class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-5 my-2 my-md-0" style="text-align: center">
             <div class="input-group">
              <select class="form-control" name="search_option" style="width:100px;">
              <c:choose>
	              <c:when test="${map.search_option =='all'}">
	              	<option value="all" selected>전체</option>
					  <option value="title">제목</option>
					  <option value="content">내용</option>
	              </c:when>
	              <c:when test="${map.search_option =='title'}">
	              	<option value="all">전체</option>
					  <option value="title" selected>제목</option>
					  <option value="content">내용</option>
	              </c:when>
	               <c:when test="${map.search_option =='content'}">
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
        <table class="table table-bordered" style="width:100%;">
        <colgroup>

	        <col width="20%">
	
	        <col width="45%">
	
	        <col width="15%">
	
	        <col width="15%">
	
	        <col width="5%">
			<col width="0">
	    </colgroup>
	    <thead>
	      <tr>
	        <th>글번호</th>
	        <th>제목</th>
	        <th>작성자</th>
	        <th>날짜</th>
	        <th>조회<th>
	      </tr>
	    </thead>
	    <tbody>
	       	<c:choose>
	    		<c:when test="${map.list == '[]'}">
	    			 <table class="table table-borderless" style="margin-top: -15px;">
		     		 	 <colgroup>
					        <col width="20%">
					        <col width="45%">
					        <col width="15%">
					        <col width="15%">
					        <col width="10%">
							<col width="0">
					    </colgroup>
			      		<tr>
			    			<td style="border:0;"><span style="font-size:15px;font-weight:bold;">게시물이 존재하지않습니다</span></td>
			     			<td style="border:0;"></td>
			     			<td style="border:0;"></td>
			     			<td style="border:0;"></td>
			     			<td style="border:0;"></td>
			    		</tr>
		    		</table>
	    		</c:when>
	    		<c:otherwise>
		    		<c:forEach var="list" items="${map.list}">
			     		<tr>
			     			<td>${list.bno}</td>
			     			<td>
				     			<a href="#" onclick="detail('${list.bno}')">
				     			<c:if test="${list.ref_level>0}">
				     				<c:forEach begin="1" end="${list.ref_level}">
				     					&nbsp;&nbsp;
				     				</c:forEach>
				     				<span style="color:red;">[답변]</span>
				     			</c:if>
				     			${list.title}
				     			</a>
			     			</td>
			     			<td>${list.name}</td>
			     			<td>${list.regdate}</td>
			     			<td>${list.hit}</td>
			     		</tr>
	     		   </c:forEach>
	    		</c:otherwise>
	    	</c:choose>
	    </tbody>
	  </table>
	  <div class="form-group"><a class="btn btn-primary" href="<%=request.getContextPath()%>/freeBoard/registForm">글등록</a></div>
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

<style>
	table th:nth-child(6){
		display: none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function list(page){
		location.href="<%=request.getContextPath()%>/freeBoard/list?curPage="+page
				+"&search_option=${map.search_option}"
				+"&keyword=${map.keyword}";
	}
	function detail(bno){
		location.href="<%=request.getContextPath()%>/freeBoard/detail?bno="+bno;
	}
</script>
</body>

</html>
