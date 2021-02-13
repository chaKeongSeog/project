<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	table th{
		display: none;
	}
</style>
<body>
        <h2 class="mt-4">FAQ</h2>
        <!-- Navbar Search-->
        <form action="<%=request.getContextPath() %>/faq/list" method="get" name="form1" class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-5 my-2 my-md-0" style="text-align: center">
             <div class="input-group">
              <select class="form-control" name="search_option" style="width:100px;">
              	<c:choose>
	              <c:when test="${map.search_option eq 'all'}">
	              	<option value="all" selected>전체</option>
<!-- 					  <option value="title">제목</option> -->
<!-- 					  <option value="content">내용</option> -->
	              </c:when>
	              <c:when test="${map.search_option eq 'title'}">
	              	<option value="all" selected>전체</option>
<!-- 					  <option value="title" selected>제목</option> -->
<!-- 					  <option value="content">내용</option> -->
	              </c:when>
	               <c:when test="${map.search_option eq 'content'}">
	              	<option value="all" selected>전체</option>
<!-- 					  <option value="title">제목</option> -->
<!-- 					  <option value="content" selected>내용</option> -->
	              </c:when>
	           </c:choose>
			  </select>
                 <input class="form-control" type="text" name="keyword" value="${map.keyword}"placeholder="검색어를 입력해주세요" aria-label="Search" aria-describedby="basic-addon2" style="width:199px;"/>
                 <div class="input-group-append">
                     <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                 </div>
             </div>
         </form>  
<div id="accordion"> 
	<c:choose>
		<c:when test="${map.list == '[]'}">
		  <table class="table table-borderless">
		       	<colgroup>
			        <col width="90%">
			        <col width="10%">
			    </colgroup>
			    <tr>
			    	<td>
			    		<span style="font-size:15px;font-weight:bold;">게시물이 존재하지않습니다</span>
			    	</td>
			    </tr>	
	      </table>
		</c:when>
		<c:otherwise>
			<c:forEach var="list" items="${map.list}">
				  <div class="card" id="card">
				    <div class="card" id="heading${list.bno}" style="background-color: white;height:49px;border-top:0px;" data-toggle="collapse" data-target="#collapse${list.bno}" aria-expanded="true" aria-controls="collapseOne">
		                <table class="table table-borderless">
					       	 <colgroup>
						        <col width="90%">
						        <col width="10%">
						    </colgroup>
						    <tr>
						    	<td>
						    		&nbsp;
						    		<img src="<%=request.getContextPath() %>/resources/images/icon_Q.gif" alt="" style="width:32.5px;height:32.5px;vertical-align: middle"/>
						    		&nbsp;&nbsp;
						    		<span id="qnaTitle">${list.title}</span>
						    	</td>
						    	<td>
						    	  	<c:if test="${user.authority == 'admin'}">
								      	<p style="float:right;">
								      		<button type="button" class="btn  btn-sm" onclick="qmodify('${list.bno}',this)">수정</button>
								      		<button type="button" class="btn  btn-sm" onclick="qdelete('${list.bno}')">삭제</button>
								      	</p>
							      	</c:if>
							    </td>  	
						    </tr>	
				      </table>
				    </div>
				    <div id="collapse${list.bno}" class="collapse" aria-labelledby="heading${list.bno}" data-parent="#accordion">
				      <div class="card-body">
				      	<div id="qnaContentArea">
				      		<img src="<%=request.getContextPath() %>/resources/images/icon_A.gif" alt="" style="width:32.5px;height:32.5px;vertical-align: middle"/>
				        	&nbsp;&nbsp;&nbsp;${list.replyList[0].content}
				        </div>
				      </div>
				    </div>
				  </div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
	  <c:if test="${user.authority == 'admin'}">
	  	<div class="form-group"><a class="btn btn-primary" href="<%=request.getContextPath()%>/faq/registForm">글등록</a></div>
	  </c:if>
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
	
<!-- 인증 게시판 수정 모달창 -->
  <!-- The Modal -->
  <div class="modal fade" id="qnaModifyModal">
    <div class="modal-dialog modal-lg" style="max-width: 100%; width: auto; display: table;">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">글 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <form id="qnaModifyForm" action="<%=request.getContextPath()%>/faq/modify" method="post" name="qnaModifyForm" onsubmit="return false;" style="width:500px;">
		   		<input type="hidden" name="bno" id="bno" value=""/>
			    <div class="form-group">
			      <label for="usr">내용</label>
			      <textarea class="form-control" id="qnaTitle" name="title" rows="5"></textarea><br>
			    </div>
	                     
			</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button class="btn btn-default pull-right" type="button" id="qnaModify">수정</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>	
<style>
	table th:nth-child(6){
		display: none;
	}
	#qna_icon01{
		width:40px;
		height:30px;
		
	}
	#qna_icon02{
		width:40px;
		height:30px;
		
	}
</style>
<script>
	$(function(){
		$('#qnaContent').summernote({
			height:300,
			width:700
		});
		$('#qnaModify').on('click',function(){
			var form = $('#qnaModifyForm');
			var title = form.find('#qnaTitle').val();
			if(title == ""){
				alert('내용을 입력해주세요');
				return false;
			}
			document.qnaModifyForm.submit();
		});
		

	})
	function list(page){
		location.href="<%=request.getContextPath()%>/faq/list?curPage="+page
				+"&search_option=${map.search_option}"
				+"&keyword=${map.keyword}";
	}
	
	function qmodify(bno,t){
		var title = $(t).parents('#card').find('#qnaTitle').html();
		$('#qnaModifyForm').find('#bno').val(bno);
		$('#qnaModifyForm').find('#qnaTitle').val(title);
		$('#qnaModifyModal').modal('show');
	}
	
	function qdelete(bno){
		location.href="<%=request.getContextPath()%>/faq/faqdelete?bno="+bno;
	}
	
</script>
</body>

</html>
