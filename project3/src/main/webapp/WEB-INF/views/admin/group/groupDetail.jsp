<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
        <link href="<%=request.getContextPath()%>/resources/css/styles.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/custom.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/group.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/lecture.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/main.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link href='<%=request.getContextPath() %>/resources/lib/main.css' rel='stylesheet' />
		<link href="<%=request.getContextPath() %>/resources/lib/custom/css/schedule.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/groupChat.css" /> 
		<link href="<%=request.getContextPath() %>/summernote/summernote.min.css" rel="stylesheet">
		<script src="<%=request.getContextPath() %>/summernote/summernote.min.js"></script> 
		<script src="<%=request.getContextPath()%>/resources/lib/custom/js/schedule.js"></script>
		<script src='<%=request.getContextPath() %>/resources/lib/main.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>    
<body>	
<div class="row">
			<div class="col-lg-12 col-xl-12" style = "margin :0 auto;width:100%;">
				<div id="cal_bg" class="card shadow mb-4">
					<div class="card-header d-flex justify-content-between align-items-center" style = "text-align: center;">
						<h6 class="text-primary font-weight-bold m-0">
							<span style="color: #46546e; font-weight: bold; text-align: center;"><span id="postTit" style = "font-size: 25px; margin-left: 5px;">[${gno}]번 방 회원</span></span>
						</h6>
					</div>
					<div class="card-body">
						<div class="cal-area" id="calarea">
							
							<span id = "postNum" hidden = "true">1</span>
							<div class = "row">
								<div class = "col-lg-6">
									<img src="/project3/resources/upload/${group.fileName}" alt="" class="media-object img-circle" style="width:50px;height:50px;border-radius:30px;"/>
									<span id = "id" style="font-size: 18px; font-weight: bolder;">
										<span id = "postDt" style = "margin-top: 7px;font-size: 18px; font-weight: bolder;">조장:</span>
										${group.memberName}
									</span>
									<span id = "ctrgb">(${group.id})</span>
								</div>	
							</div>
							<div class = "row">

							</div>
							<hr>
							<div id = "postCt" style = "width: 90%; max-height:auto;">
									<div id="todoListArea">
										<div id="todoArea">		
											<div style="margin: 10px;">								
												<p id="todoListTitle">
													<span id = "postDt" style = "margin-top: 7px;font-size: 20px; font-weight: bolder;">제목:${group.name}</span>
												</p>
												<p id="todoListRegdate">
													<span id = "postDt" style = "margin-top: 7px;font-size: 20px; font-weight: bolder;">코드:${group.code}</span>
												</p>
											<div style="clear:both;"></div>
												<p id="todoListContent">
													<span id = "postDt" style = "margin-top: 7px;font-size: 20px; font-weight: bolder;">목표:${group.goal}</span>
												</p>
											</div>		
										</div>	
									</div>	
								<div style="clear:both;"></div>		
							</div>
							<div class = "row">
									<div class = "col-lg-4" style = "text-align: center;">
										
									</div>
									<div class = "col-lg-4" style = "text-align: right;">
										<div id = "originShowbtn">
												<input type="button" class="btn btn-danger" value="닫기" id="close">
											<div style="clear:both;"></div>
										</div>
										
								 	</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
<script>
	$(function(){
		$('#close').on('click',function(){
			self.close();
		});
	})
</script>
</body>

















