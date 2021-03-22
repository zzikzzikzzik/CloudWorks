<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<%@include file="common.jsp" %>


<head><title>공지사항 수정 및 삭제</title>
<script>
	$(document).ready(function(){
		$("[name=boardListForm]").hide();
		
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",				// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	
	          
		}); 
		

		 <c:forEach items="${paramValues.date}" var="date"> 
	 		$("[name=boardListForm] [name=date]").filter("[value=${date}]").prop("checked",true);
		</c:forEach> 
	});
	
	function checkBoardUpDelForm(upDel){
		if(upDel=='del'){
			if( checkEmpty( "[name=pwd]"     , "암호를 입력해 주세요" 	 ) ){return;}
			if(confirm("정말 삭제하시겠습니까?")==false){return;}
		}
		
		else if(upDel =='up'){
			if( checkEmpty( "[name= subject]" , "제목을 입력해 주세요" 	 ) ){return;}
			if( checkEmpty( "[name= content]" , "내용을 입력해 주세요" 	 ) ){return;}
			if( checkEmpty( "[name= pwd]"     , "암호를 입력해 주세요" 	 ) ){return;}
		
			if(confirm("정말 수정하시겠습니까?")==false){return;}
		}
		
		$("[name= upDel]").val(upDel);
		
		$.ajax({
			url:"${requestScope.croot}/boardUpDelProc.do" 
			, type:"post"
			,data : $('[name=boardUpDelForm]').serialize()
			, success : function(upDelCnt){
				
				if(upDel=="up"){
					if(upDelCnt==1){
						alert("수정 성공");
						document.boardListForm.submit();
					}
					else if(upDelCnt==-1){
						alert("게시물이 삭제되어 수정할 수 없습니다.");
						document.boardListForm.submit();
					}
					else if(upDelCnt==-2){
						alert("비밀번호가 잘 못 입력 되었습니다.");
					}
					else{
						alert("수정할 수 없습니다. 관리자에게 문의 하세요");
					}
					
				}
				
				else if(upDel=="del"){
					if(upDelCnt==1){
						alert("삭제 성공");
						document.boardListForm.submit();
					}
					else if(upDelCnt==-1){
						alert("게시물이 이미 삭제되어 삭제할 수 없습니다.");
						document.boardListForm.submit();
					}
					else if(upDelCnt==-2){
						alert("비밀번호가 잘 못 입력 되었습니다.");
					}
					else{
						alert("삭제할 수 없습니다. 관리자에게 문의 하세요");
					}
				}
			}
			, error : function(){
				alert("인터넷 연결 상태를 확인 해 주세요");
			}
		});
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
<form name="boardUpDelForm" method = "post" >
	<div class="container">
		<div class="jumbotron" style="padding-top:10px; margin-bottom:70px;">
		
		<h3 style="text-align: center;">수정 / 삭제</h3><br>
		
		

		<table class="tbcss1"  border=1  bordercolor="${requestScope.thBgcolor}" cellpadding=5 align=center>
			
			<tr>
				<input type="text" class="form-control" placeholder="제목" name="subject" value="${requestScope.board.subject}">
			</tr>
			
			<tr>
			<hr>
				<div class="form-group">
				
					<textarea id= "summernote" name="content" class="form-control" placeholder="내용을 입력해주세요" rows="13" cols="40"  maxlength=300>${requestScope.board.content}</textarea>
					
				</div>
				<div style="width: 100px; text-align: left">
				
					<input type="password" class="form-control" placeholder="비밀번호" name="pwd" maxlength="4" style="text-align: left">
					
				</div>
			</tr>
			
			<input type="hidden" size="10" name="writer" maxlength=10 value="">
			
		</table><br>
			
		<!-------------------------->
		<div style="height:6"></div>
		<!-------------------------->
		<input type="hidden" name="b_no" value="${requestScope.board.b_no}">
		<input type="hidden" name="upDel" value="up">
		
		<input type="button" value="    수정    " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick = "checkBoardUpDelForm('up')">
		<input type="button" value="    삭제    " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick = "checkBoardUpDelForm('del')">
		<input type="button" value="  목록 보기  " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="document.boardListForm.submit();">
		</div>
	</div>
</form>
		

<form name = "boardListForm" method = "post" action="${requestScope.croot}/boardListForm.do">
	<input type="hidden" name="selectPageNo"  value="${param.selectPageNo}">
	<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
	<input type="hidden" name="keyword1" 	  value="${param.keyword1}">
	<input type="checkbox" name="date" value="오늘">
	<input type="checkbox" name="date" value="어제">
</form>

</body>
</html>