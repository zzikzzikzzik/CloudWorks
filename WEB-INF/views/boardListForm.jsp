<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<%@ page import = "java.util.*"%>
<head><title>공지사항 검색 조건</title>
	<script>
	$(document).ready(function(){
		

		$('[name=boardRegForm],[name=boardContentForm]').hide();

		$('[name=rowCntPerPage]').change(function(){
			search_when_pageNoClick();                  
		});
		
	    inputData(".keyword1" ,"${requestScope.boardSearchDTO.keyword1}");
		inputData(".selectPageNo" ,"${requestScope.boardSearchDTO.selectPageNo}");   
		inputData(".rowCntPerPage" ,"${requestScope.boardSearchDTO.rowCntPerPage}");

		<c:forEach items="${boardSearchDTO.date}" var="date"> 
			inputData("[name=boardListForm] [name=date]","${date}");     
		</c:forEach>
		
		$(".pagingNumber").html(
				getPagingNumber ( 
					"${requestScope.boardListAllCnt}" 					
					, "${requestScope.boardSearchDTO.selectPageNo}"   	      
					, "${requestScope.boardSearchDTO.rowCntPerPage}"  	
					,"10"												
					,"search_when_pageNoClick()"						
				)
		);
		/* setTableTrBgColor(
			"boardTable"		
			, "lightpink"		
			, "white"			
			, "lightgray"		
			, "lightblue"		
		);
		
		inputBlank_to_tdth(".boardTable" , 3); */
		
	}); //$(document).ready(function(){ 함수 끝 부분
//*********************************************************************************************

	function goBoardRegForm(){
		
		$("[name=boardRegForm] [name=selectPageNo]").val(
				
			$("[name=boardListForm] [name=selectPageNo]").val()
		);	
		
		$("[name=boardRegForm] [name=rowCntPerPage]").val(
				$("[name=boardListForm] [name=rowCntPerPage]").val()
		);
		
		$("[name=boardRegForm] [name=keyword1]").val(
				$("[name=boardListForm] [name=keyword1]").val()
		);
		
		$( "[name=boardListForm] [name=date]").filter(":checked").each(function(){
			var value = $(this).val();
			$("[name=boardRegForm] [name=date]").filter("[value=" + value + "]").prop("checked",true);
		});
		
		document.boardRegForm.submit();
	}

	function goContentForm(b_no){
		
		$("[name=boardContentForm] [name=selectPageNo]").val(
			$("[name=boardListForm] [name=selectPageNo]").val()
		);	
		
		$("[name=boardContentForm] [name=rowCntPerPage]").val(
				$("[name=boardListForm] [name=rowCntPerPage]").val()
		);
		
		$("[name=boardContentForm] [name=keyword1]").val(
				$("[name=boardListForm] [name=keyword1]").val()
		);
		
		$("[name = boardContentForm] [name=b_no]").val(b_no)
		
		$("[name=boardListForm] [name=date]").filter(":checked").each(function(){
			var value = $(this).val();
			$("[name=boardContentForm] [name=date]").filter("[value=" + value + "]").prop("checked",true);
		});

		document.boardContentForm.submit();		
	}
	
	function search_when_pageNoClick(){
		var keyword1 = $("[name =keyword1]").val();
		if(keyword1 != null && keyword1.split(" ").join("") !="" ){
			keyword1 = $.trim(keyword1);
			$("[name =keyword1]").val(keyword1);
		}
		document.boardListForm.submit();
	}
	
	function search(){
		if( isEmpty( $("[name =keyword1]") ) && isEmpty( $("[name=date]") ) ){
			alert("검색조건이 비어 있어 검색할 수 없습니다.");
			$("[name=keyword1]").val("");
			return;
		}
		var keyword1 = $("[name=keyword1]").val();
	    keyword1 = $.trim(keyword1);
	    $("[name=keyword1]").val(keyword1);
	    document.boardListForm.submit();
	}
	
	function searchAll(){
		$("[name=selectPageNo]").val("1");
		$("[name=keyword1]").val("");
		$("[name=date]").prop("checked" , false);
	    document.boardListForm.submit();
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



<form name="boardListForm" method="post" action="${requestScope.croot}/boardListForm.do" style="color: black;">   
    <div class="container">
		<div class="jumbotron" style="padding-top : 10px; margin-bottom:70px;">
					<h3 style="text-align: center;"> 공지사항 </h3>
			<table class="table table-striped table-hover">
				<div style="text-align: right">
				
				<select name="rowCntPerPage" class="rowCntPerPage form-control" style=" width:auto; height:auto; margin-bottom:10px; float:right;" >
					<option value="10">10 행</option>
					<option value="15">15 행</option>
					<option value="20">20 행</option>
					<option value="25">25 행</option>
					<option value="30">30 헹</option>
				</select>
				
				<div class="boardListAllCnt" style="text-align: left">총 게시글 수 : <strong>${requestScope.boardListAllCnt}</strong></div>
				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">글쓴이</th>
					<th style="text-align: center;">등록일</th>
					<th><span class="readCnt" name="readCnt">조회수</span>
				<c:forEach items = "${requestScope.boardList}" var ="board" varStatus="loopTagStatus">
					<tr style = "cursor:pointer" onClick = "goContentForm(${board.b_no});">
						<td align = center>
							${requestScope.boardListAllCnt - (requestScope.boardSearchDTO.selectPageNo*requestScope.boardSearchDTO.rowCntPerPage-requestScope.boardSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1}
						
						<td>
							<c:if test = "${board.print_level>0}">
								<c:forEach begin ="0" end= "${board.print_level}">
									&nbsp;&nbsp;
								</c:forEach>
								ㄴ
							</c:if>
							${board.subject}
						<td align = center>${board.writer}	
						<td align = center>${board.reg_date}
						<td align = center>${board.readcount}
				</c:forEach>
							
			</table>
			
			<c:if test = "${empty requestScope.boardList}">
				<h3>검색 조건에 맞는 데이터가 없습니다.</h3>
			</c:if>
			
			<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div><br>
			
			
			키워드 : <input type="text" name="keyword1" class="keyword1">&nbsp;&nbsp;&nbsp;
					
			
					 <input type ="checkbox" name = "date" class ="date" value = "오늘" style="margin:5px 5px;">오늘
					 <input type ="checkbox" name = "date" class ="date" value = "어제" style="margin:5px 5px;">어제
			
			<input type="button" value="  검색  " class="btn btn-default contactSearch" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="search( );">&nbsp;
			<input type="button" value="     모두검색     " class="btn btn-default contactSearchAll" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="searchAll( );">&nbsp;
			
			<!-- <a href="javascript:goBoardRegForm( );"  name="new">[새글쓰기]</a> -->
			
			 <c:if test ="${sessionScope.emp_no=='10001'}"> 
				<a href="javascript:goBoardRegForm( );"  name="new">[새글쓰기]</a>
			 </c:if>
			
			
			<input type="hidden" name="selectPageNo" class ="selectPageNo">	
		</div>
	</div>
</form>

<form name = "boardRegForm" method = "post" action="${requestScope.croot}/boardRegForm.do">
<%-- 	<input type="hidden" name="emp_no"  	  value="달러{sessionScope.emp_no}"> --%>
	<input type="hidden" name="b_no">
	<input type="hidden" name="selectPageNo">
	<input type="hidden" name="rowCntPerPage">
	<input type="hidden" name="keyword1">
	<input type="checkbox" name="date" value="오늘">
	<input type="checkbox" name="date" value="어제">
</form>

<form name = "boardContentForm" method = "post" action="${requestScope.croot}/boardContentForm.do">
<%-- 	<input type="hidden" name="emp_no"  	  value="달러{sessionScope.emp_no}"> --%>
	<input type="hidden" name="b_no">
	<input type="hidden" name="selectPageNo">
	<input type="hidden" name="rowCntPerPage">
	<input type="hidden" name="keyword1">
	<input type="checkbox" name="date" value="오늘">
	<input type="checkbox" name="date" value="어제">
</form>



</body>
</html>