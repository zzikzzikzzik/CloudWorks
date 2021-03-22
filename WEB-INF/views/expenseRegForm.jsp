<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<head><title>지출보고서 등록</title>
<script>
$(document).ready(function(){ 
	var exp_year = $(".exp_year");
    insertYear(exp_year, 1960);
    
    var exp_month = $(".exp_month");
    insertMonth(exp_month); 

    var exp_day = $(".exp_day");
    insertDate(exp_day); 

    inputData("[name=exp_year]", "${expenseDTO.exp_year}");
    inputData("[name=exp_month]", "${expenseDTO.exp_month}");
    inputData("[name=exp_day]", "${expenseDTO.exp_day}");
    

	$(".exp_year , .exp_month , .exp_day").change( function () {
		
		var exp_year  = $(".exp_year").val();
		var exp_month = $(".exp_month").val();
		var exp_day   = $(".exp_day").val();
	});

	

 });//끝

//--------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------
function checkDate(){
	var exp_year = $(".exp_year").val();
    var exp_month = $(".exp_month").val();
    var exp_day = $(".exp_day").val();

    
    var begin_date = new Date(
        parseInt(exp_year, 10),
        parseInt(exp_month, 10)-1,
        parseInt(exp_day, 10)
    );

    var today = new Date();

    if(today.getTime() < begin_date.getTime()){
    	alert("현재날짜보다 미래를 선택하셨습니다.")
        $(".exp_year").val("");
    	$(".exp_month").val("");
    	$(".exp_day").val("");
        return;
    }

  
    if((exp_month==04 || exp_month==06 || exp_month==09 || exp_month==11) && exp_day==31){
    	alert("없는 날짜를 선택하셨습니다.")
    	$(".exp_year").val("");
    	$(".exp_month").val("");
    	$(".exp_day").val("");
    	return;
    }

    else if(exp_month == 02){
		var yoondal = (exp_year % 4 == 0 && (exp_year % 100 != 0 || exp_year % 400 == 0));
		if(exp_day > 29 || (exp_day==29 && !yoondal)){
			alert("없는 날짜를 선택하셨습니다.")
	    	$(".exp_year").val("");
	    	$(".exp_month").val("");
	    	$(".exp_day").val("");
	    	return;
		}
    }    
}
function checkExpenseRegForm(){
	
	if( checkEmpty( "[name=report_name]", "지출제목을 입력해주세요.") ){ 
		$("[name=report_name]").focus();
		return; 	
	}

	if(isEmpty($("[name=expense_field_code]"))){
		alert("결제분야를 선택해주세요.")
		$("[name=expense_field_code]").focus();
		return;
	}

	if( checkEmpty( "[name=expense_price]", "비용을 입력해주세요.") ){ 
		$("[name=expense_price]").focus();
		return; 	
	}
	
	if(isEmpty($("[name=expense_method_code]"))){
		alert("결제수단을 선택해주세요.")
		$("[name=expense_method_code]").focus();
		return;
	}
	
	if( checkEmpty( "[name=receipt_no]", "영수증 번호를 입력해주세요.") ){ 
		$("[name=receipt_no]").focus();
		return; 	
	}

	if( checkEmpty("[name=exp_year]"   , "지출 연을 선택해 주세요" 	 ) ){return;}
	if( checkEmpty("[name=exp_month]"  , "지출 월을 선택해 주세요" 	 ) ){return;}
	if( checkEmpty("[name=exp_day]"  , "지출 일을 선택해 주세요" 	 ) ){return;}
		
	if(confirm("정말 등록 하시겠습니까?")==false){return;}
		
		
		$.ajax({
			url:"${requestScope.croot}/expenseRegProc.do" 
			, type:"post"
			,data : $('[name=expenseRegForm]').serialize()
			, success : function(expenseRegCnt){
				if(expenseRegCnt==1){    
					alert("보고서가 등록 되었습니다.");
					goExpenseList();
				}
				else {
					alert("보고서가 등록되지 못 했습니다.관리자에게 문의 바랍니다.");
				}
			}
			, error : function(){
				alert("인터넷 연결 상태를 확인 해 주세요");
			}
		});
	 }

	function goExpenseList(){
		document.expenseList.submit();
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





<form name="expenseRegForm" method="post" action="${requestScope.croot}/expenseRegForm.do">
	<div class="container">
		<div class="jumbotron" style="margin-bottom:70px;">
		<h4 style="text-align: left;">지출 보고서 등록</h4>
		<table class="table table1-bordered">
		
			<tr>
			    <th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>작성자</b>
				<td style="vertical-align:middle;">
					<span>${getExpenseReg.emp_name } ${getExpenseReg.jikup_name } </span>
				</td>
			</tr>
			
			<tr>
			    <th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>지출제목</b>
				<td style="vertical-align:middle;">
					<input type="text" name="report_name" size="20" > 
				</td>
			</tr>
		
			<tr>
				<th  bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>결재 내역</b>
				
				<td style="vertical-align:middle;">
					
					<table  class="table table1-bordered" style="margin-bottom:0px; text-align:center;">
						<tr>
							<th style="text-align:center;">분야
							<th style="text-align:center;">비용
							<th style="text-align:center;">수단
							<th style="text-align:center;">영수증번호
							<th style="text-align:center;">지출일
							<th style="text-align:center;"> 비고
						</tr>


						<tr>
							<td>
								<select name="expense_field_code"  class="expense_field_code form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;">
									  <option value="">--선택--</option>
									  <option value="1">식대</option>
									  <option value="2">회식비</option>
									  <option value="3">접대비</option>
									  <option value="4">비품</option>
									  <option value="5">기자재</option>
									  <option value="6">사무기구</option>
									  <option value="7">교통비</option>
									  <option value="8">경조사비</option>
									  <option value="9">숙박비</option>
									  <option value="10">의료비</option>
									  <option value="11">도서비</option>
									  <option value="12">홍보비</option>
									  <option value="13">기타</option>
									  
								</select>
								
							</td>

						<td>
							<input type="text" name="expense_price" class="expense_price" size="10" maxlength="50" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						</td>


						<td>
							<select name="expense_method_code"  class="expense_method_code form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;">
								  <option value="">--선택--</option>
								  <option value="1">법인카드</option>
								  <option value="2">개인카드</option>
								  <option value="3">현금</option>
								  <option value="4">기타</option>
							</select>
						</td>


						<td>
							<input type="text" name="receipt_no" class="receipt_no" size="10" maxlength="50" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'> 
						</td>
						
					<!---------------------------------------------->
					
						 <td>
						 	<span class="Date" id="Date">
							   <select name="exp_year" class="exp_year form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;"> 
								   <option value=""> - 선택 - </option>
							   </select>  년
								
							   <select name="exp_month" class="exp_month form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;">
									<option value=""> - 선택 - </option>
							   </select>  월
							   
							   <select name="exp_day" class="exp_day form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onchange="checkDate()">
									<option value=""> - 선택 - </option>
							   </select>  일
							</span>
						 </td>

						 <td>
							<input type="text" name="remarks" class="remarks" size="10" maxlength="50"> 
						</td>
						
					</table>
				</td>
			</tr>
		
		
			<c:if test="${!empty getExpenseReg.mgr_emp_name }">
				<tr>
				    <th bgcolor="lightgray"style="text-align: center; vertical-align:middle;"><b>다음 결재자</b>
					<td style="vertical-align:middle;">
						<span>${getExpenseReg.mgr_emp_name } ${getExpenseReg.mgr_jikup_name } </span>
					</td>
				</tr>
			</c:if>		
			
		</table>
		
		<input type="button" value="   등록   " class="save_expense btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="checkExpenseRegForm()">&nbsp;
		<input type="button" value="  이전 페이지  "  class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;" onClick="goExpenseList()">&nbsp;
		<input type='reset' value='   초기화   ' class="btn btn-default" style="padding:0px; white-space:pre; height:25px; font-size:12px;">
		
</form>

<form name="expenseList" method="POST" action="${requestScope.croot}/expenseListForm.do">
	<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
	<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">  
</form>

</body>
</html>