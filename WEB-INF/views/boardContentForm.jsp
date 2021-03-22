<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<%@include file="common.jsp" %>

<head><title>공지사항 내용</title>
<script>
	//*****************************************************
	// body 태그 안의 모든 태그를 읽어들인 후 실행할 자스 코딩 설정
	//*****************************************************
	$(document).ready(function(){
		$("[name=boardForm]").hide();

		<c:forEach items="${paramValues.date}" var="date"> 
	 		$("[name=boardForm] [name=date]").filter("[value=${date}]").prop("checked",true);
		</c:forEach> 
		
		//inputBlank_to_tdth(".boardTable" , 3);
	});
		
		function goBoardUpDelForm(){
			document.boardForm.action="${requestScope.croot}/boardUpDelForm.do";
			document.boardForm.submit();
		}
		
		function goBoardListForm(){
			document.boardForm.action="${requestScope.croot}/boardListForm.do";
			document.boardForm.submit();
		}
	</script>
</head>

<body style="background-color: #B0B0B0"><center>
<nav class="navbar navbar-default" style="margin-bottom:100px; padding-top:10px;">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
			data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="${requestScope.croot}/dashboard.do" style="padding: 10px 15px;"><img src="/resources/img/cloudWorks_02.png" width=40px;></a>
	</div>
	
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	
		<ul class="nav nav-tabs">
			<li role="presentation"><a href="${requestScope.croot}/dashboard.do">대시보드</a></li>
			<li role="presentation" class="active"><a href="${requestScope.croot}/boardListForm.do" >공지사항</a></li>
			<li role="presentation"><a href="${requestScope.croot}/dailyListForm.do" >일일보고서</a></li>
			<li role="presentation"><a href="${requestScope.croot}/salesListForm.do" >영업보고서</a></li>
			<li role="presentation"><a href="${requestScope.croot}/expenseListForm.do" >지출보고서</a></li>
			<li role="presentation"><a href="${requestScope.croot}/calendarForm.do" >일정관리</a></li>
			<li role="presentation"><a href="${requestScope.croot}/myPageForm.do" >마이페이지</a></li>
			<c:if test="${sessionScope.emp_no == '10001'}">
				<li role="presentation"><a href="${requestScope.croot}/employeeListForm.do" >관리자페이지</a></li>
			</c:if>
	     </ul>
	    <ul class="nav nav-tabs navbar-right" style="border-bottom:0px;">
			<li><a href="${requestScope.croot}/logout.do" >로그아웃</a></li>
		</ul>
	</div>
	
</nav>

	<div class="container">
		<div class="jumbotron" style="padding-top:10px; margin-bottom:70px;">
	<h3 style="text-align: center;"> 공지사항</h3><br>
	
	<table class ="table table1-bordered">
		<tr align ="center">
			<th  width = 60 bgcolor="lightgray" style="text-align: center; vertical-align:middle;"> 글번호
			<td width = 150 style="vertical-align:middle;"> ${requestScope.board.b_no}
			<th width = 60 bgcolor="lightgray" style="text-align: center; vertical-align:middle;"> 조회수
			<td width = 150 style="vertical-align:middle;">${requestScope.board.readcount} 
			
		<tr align ="center">
			<th width = 60 bgcolor="lightgray" style="text-align: center; vertical-align:middle;"> 작성자
			<td width = 150 style="vertical-align:middle;">${requestScope.board.writer} 
			<th width = 60 bgcolor="lightgray" style="text-align: center; vertical-align:middle;"> 작성일
			<td width = 150 style="vertical-align:middle;">${requestScope.board.reg_date} 
		<tr>
			<th bgcolor="lightgray" style="text-align: center; vertical-align:middle;"> 글 제목
			<td width = 150 colspan=3 style="vertical-align:middle;">${requestScope.board.subject}
		<tr>
			<th bgcolor="lightgray" style="text-align: center; vertical-align:middle;"> 글 내용
			<td width = 150 colspan=3>
				<textarea name ="content" style="width:100%;height:100;border:1;overflow:visible;text-overflow:ellipsis;" readonly>${requestScope.board.content}</textarea>

	</table><br>
	
	<!-- <input type ="button" value ="   수정/삭제   " class="btn btn-default contactSearch" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="goBoardUpDelForm();">&nbsp; --> 
	
	 <c:if test ="${sessionScope.emp_no=='10001'}"> 
		<input type ="button" value ="   수정/삭제   " class="btn btn-default contactSearch" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="goBoardUpDelForm();">&nbsp;
	 </c:if> 
	
	<input type ="button" value ="   글 목록 보기   " class="btn btn-default contactSearch" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="goBoardListForm();">
	

	<form name ="boardForm" method ="post" >
<%-- 	<input type="hidden" name="emp_no"  	  value="달러{sessionScope.emp_no}"> --%>
		<input type="hidden" name="b_no" value="${param.b_no}">
		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
		<input type="hidden" name="keyword1" value="${param.keyword1}">
		<input type="checkbox" name="date" value="오늘">
		<input type="checkbox" name="date" value="어제">
	</form>
</body>
</html>