<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<head><title>직원관리</title>

<script>

	$(document).ready(function(){

 		$("[name=rowCntPerPage]").change(function(){
			search_when_pageNoClick();
		});
 		
		inputData(".keyword1", "${requestScope.employeeSearchDTO.keyword1}");
		inputData(".selectPageNo", "${requestScope.employeeSearchDTO.selectPageNo}");
		inputData(".rowCntPerPage", "${requestScope.employeeSearchDTO.rowCntPerPage}");
		inputData(".selectDepNo", "${requestScope.employeeSearchDTO.selectDepNo}");
		inputData(".rowCntPerPage", "${requestScope.employeeSearchDTO.selectJikupCode}");
		inputData(".orderby", "${requestScope.employeeSearchDTO.orderby}");

		<c:if test="${empty employeeSearchDTO.orderby}">
			$(".emp_no_th").text("사번");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == 'emp_no desc'}">
			$(".emp_no_th").text("사번▼");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == 'emp_no asc'}">
			$(".emp_no_th").text("사번▲");
		</c:if>
	
		$(".emp_no_th").click(function(){
	
			var txt = $(this).text();
	
			if(txt!="사번"&&$(".orderby").val()!=""){
				$(".orderby").val("");
				$(".orderby").val("emp_no desc");
			}
	
			if(txt=="사번"){
				$(".orderby").val("emp_no desc");
			}else if(txt=="사번▼"){
				$(".orderby").val("emp_no asc");
			}else if(txt=="사번▲"){
				$(".orderby").val("");
			}	
			document.employeeListForm.submit();
		});
		//------------------------------------------------------------------------
		<c:if test="${empty employeeSearchDTO.orderby}">
			$(".emp_name_th").text("이름");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == 'emp_name desc'}">
			$(".emp_name_th").text("이름▼");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == 'emp_name asc'}">
			$(".emp_name_th").text("이름▲");
		</c:if>
	
		$(".emp_name_th").click(function(){
	
			var txt = $(this).text();
	
			if(txt!="이름"&&$(".orderby").val()!=""){
				$(".orderby").val("");
				$(".orderby").val("emp_name desc");
			}
	
			if(txt=="이름"){
				$(".orderby").val("emp_name desc");
			}else if(txt=="이름▼"){
				$(".orderby").val("emp_name asc");
			}else if(txt=="이름▲"){
				$(".orderby").val("");
			}	
			document.employeeListForm.submit();
		});
		//------------------------------------------------------------------------
		<c:if test="${empty employeeSearchDTO.orderby}">
			$(".jik_name_th").text("직급");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == 'jikup_code desc'}">
			$(".jik_name_th").text("직급▼");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == 'jikup_code asc'}">
			$(".jik_name_th").text("직급▲");
		</c:if>
	
		$(".jik_name_th").click(function(){
	
			var txt = $(this).text();
	
			if(txt!="직급"&&$(".orderby").val()!=""){
				$(".orderby").val("");
				$(".orderby").val("jikup_code desc");
			}
	
			if(txt=="직급"){
				$(".orderby").val("jikup_code desc");
			}else if(txt=="직급▼"){
				$(".orderby").val("jikup_code asc");
			}else if(txt=="직급▲"){
				$(".orderby").val("");
			}	
			document.employeeListForm.submit();
		});
		//------------------------------------------------------------------------
		<c:if test="${empty employeeSearchDTO.orderby}">
			$(".dep_name_th").text("부서");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == 'dep_no desc'}">
			$(".dep_name_th").text("부서▼");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == 'dep_no asc'}">
			$(".dep_name_th").text("부서▲");
		</c:if>
	
		$(".dep_name_th").click(function(){
	
			var txt = $(this).text();
	
			if(txt!="부서"&&$(".orderby").val()!=""){
				$(".orderby").val("");
				$(".orderby").val("dep_no desc");
			}
	
			if(txt=="부서"){
				$(".orderby").val("dep_no desc");
			}else if(txt=="부서▼"){
				$(".orderby").val("dep_no asc");
			}else if(txt=="부서▲"){
				$(".orderby").val("");
			}	
			document.employeeListForm.submit();
		});
		//------------------------------------------------------------------------
		
		<c:if test="${empty employeeSearchDTO.orderby}">
			$(".mgr_emp_no_th").text("직속상관번호");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == 'mgr_emp_no desc'}">
			$(".mgr_emp_no_th").text("직속상관번호▼");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == 'mgr_emp_no asc'}">
			$(".mgr_emp_no_th").text("직속상관번호▲");
		</c:if>
	
		$(".mgr_emp_no_th").click(function(){
	
			var txt = $(this).text();
	
			if(txt!="직속상관번호"&&$(".orderby").val()!=""){
				$(".orderby").val("");
				$(".orderby").val("mgr_emp_no desc");
			}
	
			if(txt=="직속상관번호"){
				$(".orderby").val("mgr_emp_no desc");
			}else if(txt=="직속상관번호▼"){
				$(".orderby").val("mgr_emp_no asc");
			}else if(txt=="직속상관번호▲"){
				$(".orderby").val("");
			}	
			document.employeeListForm.submit();
		});
		//------------------------------------------------------------------------
		<c:if test="${empty employeeSearchDTO.orderby}">
			$(".mgr_emp_name_th").text("직속상관이름");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == '(select to_char(e2.emp_name) from employee e2 where e1.mgr_emp_no=e2.emp_no) desc'}">
			$(".mgr_emp_name_th").text("직속상관이름▼");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == '(select to_char(e2.emp_name) from employee e2 where e1.mgr_emp_no=e2.emp_no) asc'}">
			$(".mgr_emp_name_th").text("직속상관이름▲");
		</c:if>
	
		$(".mgr_emp_name_th").click(function(){
	
			var txt = $(this).text();
	
			if(txt!="직속상관이름"&&$(".orderby").val()!=""){
				$(".orderby").val("");
				$(".orderby").val("(select to_char(e2.emp_name) from employee e2 where e1.mgr_emp_no=e2.emp_no) desc");
			}
	
			if(txt=="직속상관이름"){
				$(".orderby").val("(select to_char(e2.emp_name) from employee e2 where e1.mgr_emp_no=e2.emp_no) desc");
			}else if(txt=="직속상관이름▼"){
				$(".orderby").val("(select to_char(e2.emp_name) from employee e2 where e1.mgr_emp_no=e2.emp_no) asc");
			}else if(txt=="직속상관이름▲"){
				$(".orderby").val("");
			}	
			document.employeeListForm.submit();
		});
		//------------------------------------------------------------------------
		<c:if test="${empty employeeSearchDTO.orderby}">
			$(".phone_num_th").text("전화번호");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == 'phone_num desc'}">
			$(".phone_num_th").text("전화번호▼");
		</c:if>
	
		<c:if test="${employeeSearchDTO.orderby == 'phone_num asc'}">
			$(".phone_num_th").text("전화번호▲");
		</c:if>
	
		$(".phone_num_th").click(function(){
	
			var txt = $(this).text();
	
			if(txt!="전화번호"&&$(".orderby").val()!=""){
				$(".orderby").val("");
				$(".orderby").val("phone_num desc");
			}
	
			if(txt=="전화번호"){
				$(".orderby").val("phone_num desc");
			}else if(txt=="전화번호▼"){
				$(".orderby").val("phone_num asc");
			}else if(txt=="전화번호▲"){
				$(".orderby").val("");
			}	
			document.employeeListForm.submit();
		});



	
 		$(".pagingNumber").html(
				getPagingNumber(
					"${requestScope.employeeListAllCnt}"		// 검색 결과 총 갯수
					, "${requestScope.employeeSearchDTO.selectPageNo}"		// 선택된 현재 페이지 번호
					, "${requestScope.employeeSearchDTO.rowCntPerPage}"		// 페이지 당 출력 행의 갯수
					, "10"						// 페이지 당 보여줄 페이지 번호 갯수
					, "search_when_pageNoClick();"				// 페이지 번호 클릭 후 실행할 자스코드
					 
				)
		);
 

	});
	

	function goEmployeeUpDelForm(emp_no){
	 	$("[name=employeeUpDelForm] [name=selectPageNo]").val($("[name=employeeListForm] [name=selectPageNo]").val());
		$("[name=employeeUpDelForm] [name=rowCntPerPage]").val($("[name=employeeListForm] [name=rowCntPerPage]").val());
		$("[name=employeeUpDelForm] [name=keyword1]").val($("[name=employeeListForm] [name=keyword1]").val());
		$("[name=employeeUpDelForm] [name=selectJikupCode]").val($("[name=employeeListForm] [name=selectJikupCode]").val());
		$("[name=employeeUpDelForm] [name=selectDepNo]").val($("[name=employeeListForm] [name=selectDepNo]").val());


		$("[name=employeeUpDelForm] [name=emp_no]").val(emp_no);
 
 		
		//location.replace("${requestScope.croot}/employeeUpDelForm.do");
		document.employeeUpDelForm.submit();
	}
	
	function search(){
		if(isEmpty($("[name=keyword1]")) && isEmpty($("[name=selectDepNo]"))&&isEmpty($("[name=selectJikupCode]"))){
			alert("검색 조건이 비어 있어 검색할 수 없습니다");
			$("[name=keyword1]").val("");
			return;
		}
		var keyword1 = $("[name=keyword1]").val();	
		//--------------------------------------------
		// 키워드의 앞뒤 공백을 제거하기
		keyword1 = $.trim(keyword1);

		
		$("[name=keyword1]").val(keyword1); 
	
		
		document.employeeListForm.submit();

		
	}

	function searchAll(){
		$("[name=selectPageNo]").val("1");
		//--------------------------------------------
		// 키워드 비우기
		$("[name=keyword1]").val("");
		$("[name=selectDepNo]").val("");
		$("[name=selectJikupCode]").val("");
		document.employeeListForm.submit();
	}

	function search_when_pageNoClick() {
		// 입력한 키워드 얻기
		var keyword1 = $("[name=keyword1]").val();

		// 입력한 키워드가 비어 있지 않으면
		if(keyword1!=null && keyword1.split(" ").join("")!=""){
			// 입력한 키워드 앞뒤 공백 제거하기
			keyword1 = $.trim(keyword1);
			
			// name=keyword1 을가진 입력 양식에 앞뒤 공백 제거한 키워드 넣어주기
			$("[name=keyword1]").val(keyword1);
		}
		
		document.employeeListForm.submit();
	}

	function goEmployeeListForm_beforeAllow(){

	 	$("[name=employeeListForm_beforeAllow] [name=selectPageNo]").val($("[name=employeeListForm] [name=selectPageNo]").val());
		$("[name=employeeListForm_beforeAllow] [name=rowCntPerPage]").val($("[name=employeeListForm] [name=rowCntPerPage]").val());
		
		$("[name=selectPageNo]").val("1");		
		//--------------------------------------------
		// 키워드 비우기
		$("[name=keyword1]").val("");
		$("[name=selectDepNo]").val("");
		$("[name=selectJikupCode]").val("");
		

		//location.replace("${croot}/employeeListForm_beforeAllow.do");
		document.employeeListForm_beforeAllow.submit();
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
			<li role="presentation"><a href="${requestScope.croot}/expenseListForm.do" >지출보고서</a></li>
			<li role="presentation"><a href="${requestScope.croot}/calendarForm.do" >일정관리</a></li>
			<li role="presentation"><a href="${requestScope.croot}/myPageForm.do" >마이페이지</a></li>
			<c:if test="${sessionScope.emp_no == '10001'}">
				<li role="presentation" class="active"><a href="${requestScope.croot}/employeeListForm.do" >관리자페이지</a></li>
			</c:if>
	     </ul>
	    <ul class="nav nav-tabs navbar-right" style="border-bottom:0px;">
			<li><a href="${requestScope.croot}/logout.do" >로그아웃</a></li>
		</ul>
	</div>
	
</nav>

<!------------------------------------------->
<div class="container">
	<div class="jumbotron" style="padding-top : 10px; margin-bottom:70px;" >
		<h3 style="text-align: center;"> 직원관리 </h3>
		<br>
		<form name="employeeListForm" method="post" action="${requestScope.croot}/employeeListForm.do">
			
			<table border=0 width=100%>
				<tr align="center"><td>
					<strong>키워드</strong> : <input type="text" name="keyword1" class="keyword1">&nbsp;&nbsp;&nbsp;
					<input type="hidden" name="selectPageNo" class="selectPageNo">
					<select name="selectDepNo" class="selectDepNo form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;">
							<option value="">소속부서
							<option value="1">총무부
							<option value="2">영업부
							<option value="3">자재부
							<option value="4">홍보부
							<option value="5">미정
					</select>&nbsp;&nbsp;&nbsp;
					<select name="selectJikupCode" class="selectJikupCode form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;">
							<option value="">직급
							<option value="1">사장
							<option value="2">부장
							<option value="3">차장
							<option value="4">과장
							<option value="5">대리
							<option value="6">주임
							<option value="7">사원
							<option value="8">미정				
					</select>&nbsp;&nbsp;&nbsp;
					<input type="hidden" name="orderby" class="orderby">
					<input type="button" style='cursor:pointer; padding:0px; white-space:pre; height:25px; font-size:12px;' value="    검색    " class="contactSearch btn btn-default" onClick="search();">&nbsp;
					<input type="button" style='cursor:pointer; padding:0px; white-space:pre; height:25px; font-size:12px;' value="      모두검색      " class="contactSearchAll btn btn-default" onClick="searchAll();">
				<tr><td><br>
					검색된 총 개수 : <span><strong>${requestScope.employeeListAllCnt}</strong></span>
					<select name="rowCntPerPage" class="rowCntPerPage form-control" style=" width:auto; height:auto; margin-bottom:10px; float:right;">
							<option value="10">10 행
							<option value="15">15 행
							<option value="20">20 행
							<option value="25">25 행
							<option value="30">30 행
					</select>
				<tr align="center"><td>
					<table class="table table-striped table-hover" >
						<tr>
							<!-- <td align="center">번호<td align="center">사번<td align="center">이름<td align="center">직급<td align="center">부서<td align="center">직속상관번호<td align="center">직속상관이름<td align="center">전화번호<td align="center">가입상태 -->
							<th style="text-align:center;">번호
							<th class="emp_no_th" name="emp_no_th" style="cursor:pointer; text-align:center;">사번
							<th class="emp_name_th" name="emp_name_th" style="cursor:pointer; text-align:center;">이름
							<th class="jik_name_th" name="emp_no_th" style="cursor:pointer; text-align:center;">직급
							<th class="dep_name_th" name="emp_no_th" style="cursor:pointer; text-align:center;">부서
							<th class="mgr_emp_no_th" name="mgr_emp_no_th" style="cursor:pointer; text-align:center;">직속상관번호
							<th class="mgr_emp_name_th" name="mgr_emp_name_th" style="cursor:pointer; text-align:center;">직속상관이름
							<th class="phone_num_th" name="phone_num_th" style="cursor:pointer; text-align:center;">전화번호
							<th style="text-align:center;">가입상태
						
						<c:forEach items="${requestScope.employeeList}" var="employee" varStatus="loopTagStatus">
							<tr style="cursor:pointer" onClick="goEmployeeUpDelForm(${employee.emp_no});">
								<td align="center">${employeeListAllCnt-(boardSearchDTO.selectPageNo*boardSearchDTO.rowCntPerPage-boardSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1 }
								<td align="center">${employee.emp_no}
								<td align="center">${employee.emp_name}
								<td align="center">${employee.jikup_name}
								<td align="center">${employee.dep_name}
								<td align="center">${employee.mgr_emp_no}
								<td align="center">${employee.mgr_emp_name}
								<td align="center">${employee.phone_num}
								<td align="center">${employee.allow_code}								
						</c:forEach>
						<c:if  test="${empty requestScope.employeeList}">
							<tr><td colspan="9" style="text-align:center"><h3>검색 조건에 맞는 데이터가 없습니다.</h3>
						</c:if>
						
					</table>				
				<tr align="center"><td>
						<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div><br>
				<tr align="center"><td>
						<input type="button" onClick="goEmployeeListForm_beforeAllow();" value="     가입 관리     "  class="btn btn-default" style='cursor:pointer; padding:0px; white-space:pre; height:25px; font-size:12px;'>							
			</table>
				
		</form>
	</div>
</div>

<form name="employeeUpDelForm" method="post" action="${requestScope.croot}/employeeUpDelForm.do">	
	<input type="hidden" name="emp_no" value="${requestScope.employee.emp_no}">
		
	<input type="hidden" name="selectPageNo" value="${param.selectPageNo }">
	<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage }">
	<input type="hidden" name="keyword1" value="${param.keyword1 }">
	
	<input type="hidden" name="selectDepNo" value="${param.selectDepNo }">
	<input type="hidden" name="selectJikupCode" value="${param.selectJikupCode }">
	
	<input type="hidden" name="is_allowed" value="true">
</form>

<form name="employeeListForm_beforeAllow" method="post" action="${requestScope.croot}/employeeListForm_beforeAllow.do">		
		
		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
		<input type="hidden" name="keyword1" value="${param.keyword1}">
		
		
		
		<input type="hidden" name="selectJikupCode" value="${param.selectJikupCode}">
		<input type="hidden" name="selectDepNo" value="${param.selectDepNo}">
</form>
</body>
</html>