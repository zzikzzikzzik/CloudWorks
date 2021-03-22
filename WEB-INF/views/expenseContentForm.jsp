<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<head><title>지출보고서 상세보기</title>
<script>

function goExpenseList(){
	document.expenseList.submit();
}

function returnDaily(){
	var return_result = prompt("반려 사유를 작성해주세요");

	 $("[name=return_result]").val(return_result);

    if(return_result.split(" ").join("") == ""){
		alert("반려 사유를 다시 작성해주세요")
		returnDaily()
    }

    $.ajax({
		url : "${requestScope.croot}/expenseReturnProc.do",
		type : "post",
		data : $("[name=expenseContentForm]").serialize(),
		success : function(conFirmCnt){
				if(conFirmCnt == 1){
					alert("반려가 되었습니다.")
					document.expenseContent.submit();
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
		url : "${requestScope.croot}/expenseConFirmProc.do",
		type : "post",
		data : $("[name=expenseContentForm]").serialize(),
		success : function(conFirmCnt){
				if(conFirmCnt == 1){
					alert("결재가 되었습니다.")
					document.expenseContent.submit();
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
			<li role="presentation"><a href="${requestScope.croot}/dailyListForm.do" >일일보고서</a></li>
			<li role="presentation"><a href="${requestScope.croot}/salesListForm.do" >영업보고서</a></li>
			<li role="presentation"  class="active"><a href="${requestScope.croot}/expenseListForm.do" >지출보고서</a></li>
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




<form name="expenseContentForm" method="post" action="${requestScope.croot}/expenseContentForm.do">
	<div class="container">
		<div class="jumbotron" style="margin-bottom:70px;">
		<h4 style="text-align: left;">지출 보고서 상세보기</h4>
		<table class="table table1-bordered">
		
			<tr>
			    <th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>작성자</b>
				<td>
					<span>${getExpenseContent.emp_name }</span>
				</td>
			</tr>
		
			<tr>
				<th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>지출제목</b>
				<td>
					<span>${getExpenseContent.report_name }</span>
				</td>
			</tr>
		
			<tr>
				<th bgcolor="lightgray" style="text-align: center; vertical-align:middle;"><b>지출상세</b> 
	            <td>
		           <table class="table table1-bordered" style="margin-bottom:0px; text-align:center;">
		           		<tr>
		           			<th style="text-align:center;">분야</th>
		           			<th style="text-align:center;">비용</th>
		           			<th style="text-align:center;">지출수단</th>
		           			<th style="text-align:center;">영수증번호</th>
		           			<th style="text-align:center;">지출날짜</th>
		           			<th style="text-align:center;">비고</th>
		           		</tr>
		           			
		           		<tr>
		           			<td>${getExpenseContent.expense_field_name }</td>
		           			<td>${getExpenseContent.expense_price }</td>
		           			<td>${getExpenseContent.expense_method_name }</td>
		           			<td>${getExpenseContent.receipt_no }</td>
		           			<td>${getExpenseContent.expense_date }</td>
		           			<td>${getExpenseContent.remarks }</td>
		           		</tr>
		           </table>
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
		           			<td>${getExpenseContent.emp_name }</td>
		           			<td>${getExpenseContent.dep_name }</td>
		           			<td>${getExpenseContent.jikup_name }</td>
		           			<td>${getExpenseContent.sign_name }</td>
		           			<td>${getExpenseContent.sign_date }</td>
		           			<td>${getExpenseContent.return_result }</td>
		           		</tr>
		           		
		           		<c:if test="${!empty getExpenseContent.mgr_emp_name }">
							<tr>
							    <td>${getExpenseContent.mgr_emp_name }</td>
			           			<td>${getExpenseContent.mgr_dep_name }</td>
			           			<td>${getExpenseContent.mgr_jikup_name }</td>
			           			<td>${getExpenseContent.mgr_sign_name }</td>
			           			<td>${getExpenseContent.mgr_sign_date }</td>
			           			<td>${getExpenseContent.mgr_return_result }</td>
							</tr>
						</c:if>	
						
						<c:if test="${!empty getExpenseContent.mgr_mgr_emp_name }">
							<tr>
							    <td>${getExpenseContent.mgr_mgr_emp_name }</td>
			           			<td>${getExpenseContent.mgr_mgr_dep_name }</td>
			           			<td>${getExpenseContent.mgr_mgr_jikup_name }</td>
			           			<td>${getExpenseContent.mgr_mgr_sign_name }</td>
			           			<td>${getExpenseContent.mgr_mgr_sign_date }</td>
			           			<td>${getExpenseContent.mgr_mgr_return_result }</td>
							</tr>
						</c:if>	
						
						
							           		
		           		
		           </table>
	            </td> 
			</tr>
		
	
		</table>
		
		
		<c:if test="${getExpenseUnderSign.sign_code == '1'}">
			<c:if test="${getExpenseContent.my_sign_name == '진행 중'}">
				<input type="button" value="   결재   " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="confirmDaily()">
				<input type="button" value="   반려   " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="returnDaily()">
			</c:if>	
		</c:if>
				
		<c:if test="${empty getExpenseContent.mgr_emp_name && empty getExpenseContent.mgr_mgr_emp_name}">
			<h4>최종 결재가 된 보고서 입니다.</h4>
		</c:if>
		
		
		<c:if test="${getExpenseContent.my_sign_name == '반려' || getExpenseContent.mgr_sign_name == '반려' || getExpenseContent.mgr_mgr_sign_name == '반려'}">
			<h4>반려 된 보고서 입니다.</h4>
		</c:if>	
		
		<c:if test="${getExpenseContent.my_sign_name == '승인' && getExpenseContent.mgr_sign_name == '승인' && getExpenseContent.mgr_mgr_sign_name == '승인'}">
			<h4>최종 결재가 된 보고서 입니다.</h4>
		</c:if>
		
		<c:if test="${empty getExpenseContent.mgr_mgr_sign_name}">
			<c:if test="${getExpenseContent.my_sign_name == '승인' && getExpenseContent.mgr_sign_name == '승인' }">
				<h4>최종 결재가 된 보고서 입니다.</h4>
			</c:if>
		</c:if>
		
		<input type="button" value="   이전 페이지   " class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="goExpenseList()">
		<input type="hidden" name="report_no" value="${param.report_no }">
		<input type="hidden" name="return_result" value="">
		
</form>

<form name="expenseList" method="POST" action="${requestScope.croot}/expenseListForm.do">
	<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
	<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">  
</form>

<form name="expenseContent" method="POST" action="${requestScope.croot}/expenseContentForm.do">
	<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
	<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">  
	<input type="hidden" name="report_no" value="${param.report_no }">
</form>



</body>
</html>