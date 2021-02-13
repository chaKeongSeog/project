<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<style>
	.jokboInnerContent{
		width:1000px;
		margin: 0 auto;
		border:1px solid #dfdfdf;
		border-radius:10px;
		background-color: #F7F7F7;
	}
	.gList{
		border:1px solid #afafaf;
		border-radius:10px;
		cursor:pointer;
		margin:10px 0;
	}
	.gList:hover{
		border:1px solid #003E74;
	}
	#list{
		color:#212529;
	}
	.listh4{
		width:1000px;
		margin: 0 auto;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<div class="listh4">
	<h4 id="list">그룹방 목록</h4>
</div>  
<div class="jokboInnerContent">
    <div class="form-group" style="margin-top: 5px;">
    <form action="<%=request.getContextPath()%>/group/list" method="post" id="groupsearchForm">
        <div class="input-group">
       		<input type="hidden" name="id" id="id" value="${user.id}"/>
	        <input type="text" id="name" name="name" placeholder="그룹방 이름" class="form-control">
	            <div id="autocomplete" class="dropdown-menu">
	                <a href="#" class="dropdown-item">
	                  <b></b><span></span></a>
	            </div> 
	        <button type="submit" class="btn btn-outline-success" style="width: 80px;">검색</button>
        </div>
        </form>
    </div> 
    <hr> 
    <c:choose>
    	<c:when test="${map.list == '[]'}">
	    	<div id="accordion" style="margin-top:10px;">
				<div class="card" style="border:0;">
					 <div class="card-header" style="background-color: #F7F7F7;border:0;">
					 	<div class="row">
					 		<div class="col-8 text-left;">
			    				<span style="font-size:15px;font-weight: bold;">스터디 그룹이 존재하지않습니다</span>
			    			</div>
					 	</div>
					 </div>
					
	     		</div>
	     	</div>	
    	
    	</c:when>
    	<c:otherwise>
    		 <c:forEach var="list" items="${map.list}">
		    	<div class="gList" id="gList" onclick="groupJoin(this)">
		    		<form action="/project3/group/detail" method="post" name="groupDetailForm" id="groupDetailForm">
		    			<input type="hidden" name="gno" id="gno" value="${list.gno}"/>
				    	<div class="jokboInfo"><span style="color:#343A40;font-weight:bold;">(${list.gno}번)</span>이름:${list.name}</div> 
			        	<div class="jokboCategory">만든이:${list.id}</div>
		        	</form>
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
</div>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
</body>
</html>