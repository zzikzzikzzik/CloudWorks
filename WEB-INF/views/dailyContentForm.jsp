<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

<%@include file="common.jsp" %>
<head><title>일일보고서 상세보기</title>
<script>

function goDailyList(){
	document.dailyList.submit();
}

function returnDaily(){
	 var return_result = prompt("반려 사유를 작성해주세요");

	 $("[name=return_result]").val(return_result);

     if(return_result.split(" ").join("") == ""){
		alert("반려 사유를 다시 작성해주세요")
		returnDaily()
     }

     $.ajax({
 		url : "${requestScope.croot}/dailyReturnProc.do",
 		type : "post",
 		data : $("[name=dailyContentForm]").serialize(),
 		success : function(conFirmCnt){
 				if(conFirmCnt == 1){
 					alert("반려가 되었습니다.")
 					document.dailyContent.submit();
 				}
 				else
 					alert("반려를 실패 했습니다.")
 			},
 		error : function(){
 				alert("서버 접속 실패")
 			}


 		});
	
}

function confirmDaily(){


	if(confirm("정말 결재를 하시겠습니까?")==false){return;}

	$.ajax({
		url : "${requestScope.croot}/dailyConFirmProc.do",
		type : "post",
		data : $("[name=dailyContentForm]").serialize(),
		success : function(conFirmCnt){
				if(conFirmCnt == 1){
					alert("결재가 되었습니다.")
					document.dailyContent.submit();
				}
				else
					alert("결재를 실패 했습니다.")
			},
		error : function(){
				alert("서버 접속 실패")
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
			<li role="presentation"><a href="${requestScope.croot}/boardListForm.do" >공지사항</a></li>
			<li role="presentation" class="active"><a href="${requestScope.croot}/dailyListForm.do" >일일보고서</a></li>
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





<form name="dailyContentForm" method="post" action="${requestScope.croot}/dailyContentForm.do">
	
	<div class="container">
		<div class="jumbotron" style="margin-bottom:70px;">
		<h4 style="text-align: left;">일일업무 보고서 상세보기</h4>
		<table class="table table1-bordered">
		
			<tr>
			    <th bgcolor="lightgray" style="text-align: center; vertical-align:middle;"><b>작성자</b>
				<td style="vertical-align:middle;">
					<span>${getDailyContent.emp_name }</span>
				</td>
			</tr>
		
			<tr>
				<th bgcolor="lightgray" style="text-align: center; vertical-align:middle;"><b>업무분야</b>
				<td style="vertical-align:middle;">
					<span>${getDailyContent.busi_type_name }</span>
				</td>
			</tr>
		
			<tr>
				<th bgcolor="lightgray" style="text-align: center; vertical-align:middle;"><b>시간</b> 
	            <td style="vertical-align:middle;">
		           <span>${getDailyContent.busi_start_date } ~ ${getDailyContent.busi_end_date }</span>
	            </td> 
			</tr>
			
		
			<tr>
			    <th bgcolor="lightgray" style="text-align: center; vertical-align:middle;"><b>업무내용</b>
				<td>
					<textarea name="content" rows="13" cols="70" style="border:0; margin: 10px" readonly>${getDailyContent.busi_content }</textarea>
				</td>
			</tr>

			<tr>
				<th bgcolor="lightgray" style="text-align: center; vertical-align:middle;"><b>결재내역</b> 
				 
	            <td>
		           <table class="table table1-bordered" style="margin-bottom:0px; text-align:center;">
		           		<tr> 
		           			<th style="text-align:center;">결재자 이름</th>
		           			<th style="text-align:center;">결재자 부서</th>
		           			<th style="text-align:center;">결재자 직급</th>
		           			<th style="text-align:center;">결재여부</th>
		           			<th style="text-align:center;">결재일</th>
		           			<th style="text-align:center;">반려사유</th>
		           		</tr>

		           		<tr>
		           			<td>${getDailyContent.emp_name }</td>
		           			<td>${getDailyContent.dep_name }</td>
		           			<td>${getDailyContent.jikup_name }</td>
		           			<td>${getDailyContent.sign_name }</td>
		           			<td>${getDailyContent.sign_date }</td>
		           			<td>${getDailyContent.return_result }</td>
		           		</tr>
		           		
		           		<c:if test="${!empty getDailyContent.mgr_emp_name }">
							<tr>
							    <td>${getDailyContent.mgr_emp_name }</td>
			           			<td>${getDailyContent.mgr_dep_name }</td>
			           			<td>${getDailyContent.mgr_jikup_name }</td>
			           			<td>${getDailyContent.mgr_sign_name }</td>
			           			<td>${getDailyContent.mgr_sign_date }</td>
			           			<td>${getDailyContent.mgr_return_result }</td>
							</tr>
						</c:if>	
						
						<c:if test="${!empty getDailyContent.mgr_mgr_emp_name }">
							<tr>
							    <td>${getDailyContent.mgr_mgr_emp_name }</td>
			           			<td>${getDailyContent.mgr_mgr_dep_name }</td>
			           			<td>${getDailyContent.mgr_mgr_jikup_name }</td>
			           			<td>${getDailyContent.mgr_mgr_sign_name }</td>
			           			<td>${getDailyContent.mgr_mgr_sign_date }</td>
			           			<td>${getDailyContent.mgr_mgr_return_result }</td>
							</tr>
						</c:if>	
		           		
		           		
		           </table>
	            </td> 
			</tr>
		</table>
		
		
		<c:if test="${getDailyUnderSign.sign_code == '1'}">
			<c:if test="${getDailyContent.my_sign_name == '진행 중'}">
				<input type="button" value="   결재   " class="btn btn-default contactSearch" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="confirmDaily()">&nbsp;
				<input type="button" value="   반려   " class="btn btn-default contactSearch" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="returnDaily()">
			</c:if>	
		</c:if>
				
		<c:if test="${empty getDailyContent.mgr_emp_name && empty getDailyContent.mgr_mgr_emp_name}">
			<h4>최종 결재가 된 보고서 입니다.</h4>
		</c:if>
		
		
		<c:if test="${getDailyContent.my_sign_name == '반려' || getDailyContent.mgr_sign_name == '반려' || getDailyContent.mgr_mgr_sign_name == '반려'}">
			<h4>반려 된 보고서 입니다.</h4>
		</c:if>	
		
		<c:if test="${getDailyContent.my_sign_name == '승인' && getDailyContent.mgr_sign_name == '승인' && getDailyContent.mgr_mgr_sign_name == '승인'}">
			<h4>최종 결재가 된 보고서 입니다.</h4>
		</c:if>
		
		<c:if test="${empty getDailyContent.mgr_mgr_sign_name}">
			<c:if test="${getDailyContent.my_sign_name == '승인' && getDailyContent.mgr_sign_name == '승인' }">
			<h4>최종 결재가 된 보고서 입니다.</h4>
			</c:if>
		</c:if>

		<input type="button" value="   이전 페이지   "  class="btn btn-default contactSearch" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="goDailyList()">
		<input type="hidden" name="report_no" value="${param.report_no }">
		<input type="hidden" name="return_result" value="">
		
				
</form>

<form name="dailyList" method="POST" action="${requestScope.croot}/dailyListForm.do">
	<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
	<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">  
</form>

<form name="dailyContent" method="POST" action="${requestScope.croot}/dailyContentForm.do">
	<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
	<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">  
	<input type="hidden" name="report_no" value="${param.report_no }">
</form>



</body>
</html>