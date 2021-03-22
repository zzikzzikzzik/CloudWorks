<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>


<%@include file="common.jsp" %>
<head><title>직원관리 수정 및 삭제</title>
<script>
//	$("[name=dep_no]").val("${requestScope.employee.dep_no}");
//	$("[name=jikup_code]").val("${requestScope.employee.jikup_code}");
//	$("[name=allow_code]").val("${requestScope.employee.allow_code}");
	
//	$("[name=dep_no]").val(${requestScope.employee.dep_no});
	
	
	
	$(document).ready(function(){

		$("[name=dep_no]").val(${requestScope.employee.dep_no});
		$("[name=jikup_code]").val(${requestScope.employee.jikup_code});
		$("[name=allow_code]").val(${requestScope.employee.allow_code});
		$("[name=select_dep_no]").val("");
		/* if(${requestScope.employee.mgr_emp_no}==""){
			$("[name=mgr_emp_no] option:eq(0)").prop("selected", ture);
		} */
		
		$("[name=mgr_emp_no]").val(${requestScope.employee.mgr_emp_no});

		/* if(${requestScope.select_dep_no}>0){

		} */
		
		 		
	//	$("[name=employeeListForm] [name=selectPageNo]").val(${requestScope.employeeSarchDTO.selectPageNo});
	//	$("[name=employeeListForm] [name=rowCntPerPage]").val(${requestScope.employeeSarchDTO.rowCntPerPage});
		$("[name=employeeListForm] [name=keyword1]").val(${requestScope.employeeSarchDTO.keyword1});
		
	/*  	 $("[name=dep_no]").change(function(){


		 	 

	//		$("[name=select_dep_no]").val($("[name=dep_no]").val());

			
	//		alert($("[name=select_dep_no]").val());
			// 부서가 바뀌었을떄 직속상관 부서 바꾸기
			
			
		//	document.employeeUpDelForm.submit();

		//	alert("부서 체인지");  

			



			
		});   */

		var select_dep_no = $("[name=dep_no]").val();
		var select_jikup_code = $("[name=jikup_code]").val();
		
		$.ajax({
			url : "${croot}/selectMgrProc.do"
			,type : "post"
			,data : "dep_no=" + select_dep_no + "&jikup_code=" + select_jikup_code
			,success : function(selectMgrList){
				//alert(selectMgrList[0].selectMgr);
				//$("[name=mgr_emp_no]").empty();
				var arr = [];

				if(selectMgrList.length == 0){
					if(select_dep_no == 0 && select_jikup_code == 8){arr.push("<option>직속상관 선택</option>");}
					else{arr.push("<option value='0'>직급이 높은 직원이 없습니다.</option>");}
				}
				else{	
					arr.push("<option value='0'>직속상관 선택</option>");
				}
				for(var i=0 ; i<selectMgrList.length ; i++){
					arr.push("<option value=" + selectMgrList[i].mgr_emp_no + ">" + selectMgrList[i].selectMgr + "</option>");
				}

				$("[name=mgr_emp_no]").html(arr.join(""));
			}
			,error : function(){
				alert("서버 접속 실패");
			}
		});		
		

		$("[name=mgr_emp_no]").click(function(){	
			var select_dep_no = $("[name=dep_no]").val();
			var select_jikup_code = $("[name=jikup_code]").val();
					
			if(select_dep_no == "0"){alert("소속부서를 먼저 선택해주세요.");return;}
			if(select_jikup_code == "0"){alert("직급을 먼저 선택해주세요.");return;}
			//else if(select_jikup_code == "1"){alert("선택된 직급보다 높은 직급이 없습니다.");return;}
		});

			
		$("[name=jikup_code]").change(function(){
			$("[name=mgr_emp_no]").empty();

			var select_dep_no = $("[name=dep_no]").val();
			var select_jikup_code = $("[name=jikup_code]").val();
			
			$.ajax({
				url : "${croot}/selectMgrProc.do"
				,type : "post"
				,data : "dep_no=" + select_dep_no + "&jikup_code=" + select_jikup_code
				,success : function(selectMgrList){
					//alert(selectMgrList[0].selectMgr);
					//$("[name=mgr_emp_no]").empty();
					//if(selectMgrList.length == 0){alert("선택된 부서에 선택된 직급보다 높은 직급인 직원이 없습니다.");return;}
					
					var arr = [];

					if(selectMgrList.length == 0){
						arr.push("<option value='0'>직급이 높은 직원이 없습니다.</option>");
					}
					else{	
						arr.push("<option value='0'>직속상관 선택</option>");
					}
					for(var i=0 ; i<selectMgrList.length ; i++){
						arr.push("<option value=" + selectMgrList[i].mgr_emp_no + ">" + selectMgrList[i].selectMgr + "</option>");
					}
					
					$("[name=mgr_emp_no]").html(arr.join(""));
				}
				,error : function(){
					alert("서버 접속 실패");
				}
			});		
			
		});
		
		$("[name=dep_no]").change(function(){
			$("[name=mgr_emp_no]").empty();

			var select_dep_no = $("[name=dep_no]").val();
			var select_jikup_code = $("[name=jikup_code]").val();
			
			$.ajax({
				url : "${croot}/selectMgrProc.do"
				,type : "post"
				,data : "dep_no=" + select_dep_no + "&jikup_code=" + select_jikup_code
				,success : function(selectMgrList){
					//alert(selectMgrList[0].selectMgr);
					//$("[name=mgr_emp_no]").empty();
					//if(selectMgrList.length == 0){alert("선택된 부서에 선택된 직급보다 높은 직급인 직원이 없습니다.");return;}
					
					var arr = [];

					if(selectMgrList.length == 0){
						arr.push("<option value='0'>직급이 높은 직원이 없습니다.</option>");
					}
					else{	
						arr.push("<option value='0'>직속상관 선택</option>");
					}
					for(var i=0 ; i<selectMgrList.length ; i++){
						arr.push("<option value=" + selectMgrList[i].mgr_emp_no + ">" + selectMgrList[i].selectMgr + "</option>");
					}
					
					$("[name=mgr_emp_no]").html(arr.join(""));
				}
				,error : function(){
					alert("서버 접속 실패");
				}
			});		
			
		});



 		
 

	});


	function checkUpDelProc(upDel){
		
		if(upDel=='del'){
			
			var is_pwd = $("[name=employeeUpDelForm] [name=is_pwd]").val();
			var new_emp_pwd = $("[name=employeeUpDelForm] [name=new_emp_pwd]").val();
			var is_new_emp_pwd = $("[name=employeeUpDelForm] [name=is_new_emp_pwd]").val();
			
			if(new_emp_pwd!=is_new_emp_pwd){
				alert("비밀번호와 비밀번호확인이 맞지 않습니다.")
				$("[name=employeeUpDelForm] [name=new_emp_pwd]").val("");
				$("[name=employeeUpDelForm] [name=is_new_emp_pwd]").val("");
				return;
			}

			if(confirm("정말 삭제 하시겠습니까?")==false){return;}

			

			if(is_pwd==""){
				alert("관리자 비밀번호를 입력해주세요");
				return;
			}

			$("[name=is_pwd]").val(is_pwd);
			
			
			
		}else if(upDel=='up'){

		

			/*
			if($("[name=employeeUpDelForm] [name=mgr_emp_no]").val()=="직속상관 선택"){
				alert("직속상관을 입력해주세요");
				return;
			}
			*/
					
			if($("[name=employeeUpDelForm] [name=dep_no]").val()=="부서 선택"){
				alert("부서를 입력해주세요");
				return;
			}
			
			if($("[name=employeeUpDelForm] [name=jikup_code]").val()=="직급 선택"){
				alert("직급을 입력해주세요");
				return;
			}

			var new_emp_pwd = $("[name=employeeUpDelForm] [name=new_emp_pwd]").val();
			var is_new_emp_pwd = $("[name=employeeUpDelForm] [name=is_new_emp_pwd]").val();

			if(new_emp_pwd!=is_new_emp_pwd){
				alert("비밀번호와 비밀번호확인이 맞지 않습니다.")
				$("[name=employeeUpDelForm] [name=new_emp_pwd]").val("");
				$("[name=employeeUpDelForm] [name=is_new_emp_pwd]").val("");
				return;
			}

			if(confirm("정말 수정 하시겠습니까?")==false){return;}
			
			var is_pwd = $("[name=employeeUpDelForm] [name=is_pwd]").val();

			if(is_pwd==""){
				alert("관리자 비밀번호를 입력해주세요");
				return;
			}
			
			$("[name=is_pwd]").val(is_pwd);
			

		//	alert($("[name=is_pwd]").val());
			
			
			
			
			
		}

		$("[name=upDel]").val(upDel);

		$.ajax({
			url : "${requestScope.croot}/employeeUpDelProc.do"
			, type : "post"
			, data : $("[name=employeeUpDelForm]").serialize()
			, success : function(upDelCnt){
				if(upDel=="up"){
					if(upDelCnt==1){
						alert("수정 성공!");
						goEmployeeListForm(${param.is_allowed});				
					}else if(upDelCnt==-1)
						alert("관리자 비밀번호가 틀렸습니다.");
				//		$("[name=employeeUpDelForm] [name=is_pwd]").val("");
				//		$("[name=employeeUpDelForm] [name=is_pwd]").focus();
					else{
						alert("연동실패");
					}
					
				}else if(upDel=="del"){
					if(upDelCnt==1){
						alert("삭제성공");
						goEmployeeListForm(${param.is_allowed});	
					}else if(upDelCnt==-1){
						alert("관리자 비밀번호가 틀렸습니다.");
					}else if(upDelCnt==-2){
						alert("부하직원이 존재합니다.\n부하직원의 직속상관을 먼저 다 수정해주세요");
					}else{
						alert("연동실패");
					}
					
				}

			}
			, error : function(){
				alert("서버 접속 실패");
			}

		});

		

		return;
	}

	/*
	function goEmployeeListForm_beforeAllow(){

		$("[name=selectPageNo]").val("1");
		//--------------------------------------------
		// 키워드 비우기
		$("[name=keyword1]").val("");
		$("[name=selectDepNo]").val("");
		$("[name=selectJikupCode]").val("");
		

		location.replace("${croot}/employeeListForm_beforeAllow.do");
	}

	function goEmployeeListForm(){
		$("[name=selectPageNo]").val("1");
		//--------------------------------------------
		// 키워드 비우기
		$("[name=keyword1]").val("");
		$("[name=selectDepNo]").val("");
		$("[name=selectJikupCode]").val("");
		

		location.replace("${croot}/employeeListForm.do");
	}
	*/
	
	function goEmployeeListForm(is_allowed){
		if(is_allowed == "true"){
			document.employeeListForm.submit();
		}
		else{
			document.employeeListForm_beforeAllow.submit();
		}
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



<!-------------------------------------------------------------->

<div class="container">
	<div class="jumbotron" style="padding-top : 10px; margin-bottom:70px;" >
	<h3> 직원 정보 수정 </h3><br><br>
	
	
	<div class="row">
    <div class="col-md-12">
	<form name="employeeUpDelForm" method="post">
	<table  border=0 width=100%;>
		<tr>
			<td align=center>
				<div class="form-group">
					<label class="col-md-10 control-label" style="float:none;">이름</label>
					<div class="col-md-10" style="float:none;" >
						<input type="text" class="form-control" value="${requestScope.employee.emp_name}" name="emp_name" maxlength="20">
					</div>
				</div>
			<td align=center>
				<div class="form-group" >
					<label class="col-md-10 control-label" style="float:none;">사번</label>
					<div class="col-md-10" style="float:none;">
						<input type="text" class="form-control" value="${requestScope.employee.emp_no}" name="emp_no" maxlength="20" readonly>
					</div>
				</div>
		<tr>
			<td align=center>
				<div class="form-group">
					<label class="col-md-10 control-label" style="float:none;">새로운 암호</label>
					<div class="col-md-10" style="float:none;">
						<input type="password" class="form-control" placeholder="변경할 암호" name="new_emp_pwd" maxlength="20">
					</div>	
				</div>
			<td align=center>
				<div class="form-group">
					<label class="col-md-10 control-label" style="float:none;">새로운 암호 확인</label>
					<div class="col-md-10" style="float:none;">
						<input type="password" class="form-control" placeholder="변경할 암호확인" name="is_new_emp_pwd" maxlength="20">
					</div>
				</div>
		<tr>
			<td align=center>
				<div class="form-group">
					<label class="col-md-10 control-label" style="float:none;">주민등록번호</label>
					<div class="col-md-10" style="float:none;">
						<input type="text" class="form-control" value="${requestScope.employee.jumin_num}" name="jumin_num" maxlength="20">
					</div>
				</div>
			<td align=center>
				<div class="form-group">
					<label class="col-md-10 control-label" style="float:none;">이메일</label>
					<div class="col-md-10" style="float:none;">
						<input type="text" class="form-control" value="${requestScope.employee.email}" name="email" maxlength="20">
					</div>
				</div>
		<tr>
			<td align=center>
				<div class="form-group">
					<label class="col-md-10 control-label" style="float:none;">소속부서</label>
					<div class="col-md-10" style="float:none;">
						<select class="form-control" name="dep_no">
					      <option value="0">소속부서 선택</option>
						  <option value="1" >총무부</option>
						  <option value="2" >영업부</option>
						  <option value="3" >자재부</option>
						  <option value="4" >홍보부</option>
						</select>
					</div>
				</div>
			<td align=center>	
				<div class="form-group">
					<label class="col-md-10 control-label" style="float:none;">직급</label>
					<div class="col-md-10" style="float:none;">
						<select class="form-control" name="jikup_code">
						  <option value="8">직급 선택</option>
						  <option value="1">사장</option>
						  <option value="2">부장</option>
						  <option value="3">차장</option>
						  <option value="4">과장</option>
						  <option value="5">대리</option>
						  <option value="6">주임</option>
						  <option value="7">사원</option>
						</select>
					</div>
				</div>
		<tr>
			<td align=center>
			
				<div class="form-group">
					<label class="col-md-10 control-label" style="float:none;">직속상관 선택</label>
					<div class="col-md-10" style="float:none;">
						<select class="form-control" name="mgr_emp_no">						
							<!-- <option>직속상관 선택</option>	
												
						  <c:forEach items="${requestScope.mgrList}" var="mgrList">
						  	<option value="${mgrList.mgr_emp_no}">${mgrList.dep_name} ${mgrList.mgr_emp_name} ${mgrList.jikup_name}</option>
						  </c:forEach>
						   --> 
						</select>
					</div>
				</div>
			<td align=center>
				<div class="form-group">
					<label class="col-md-10 control-label" style="float:none;">전화번호</label>
					<div class="col-md-10" style="float:none;">
						<input type="text" class="form-control" value="${requestScope.employee.phone_num}" name="phone_num" maxlength="20">
					</div>
				</div>
		<tr>
			<td align=center>
				<div class="form-group">
					<label class="col-md-10 control-label" style="float:none;">가입상태</label>
					<div class="col-md-10" style="float:none;">
						<select class="form-control" name="allow_code">
						  <option value="1">승인완료</option>
						  <option value="2">가입대기</option>
						</select>
					</div>
				</div>
			<td align=center>
				<div class="form-group">
					<label class="col-md-10 control-label" style="float:none;">관리자 암호 확인</label>
					<div class="col-md-10" style="float:none;">
						<input type="password" class="form-control" placeholder="관리자 암호 확인" name="is_pwd" maxlength="20">
					</div>
				</div>
	</table>
	
	<input type="hidden" name="emp_no" value="${requestScope.employee.emp_no}">
	
	<input type="hidden" name="upDel" value="up">
	
	<!-- <input type="hidden" name="select_dep_no"> -->

	<!-- <input type="hidden" name="change_dep_no"> -->
	<!-- <input type="hidden" name="is_pwd"> -->
	</form>
	</div>
	</div>
	
	
	<br>
	<table  width=90%;>
		<tr>
			<td>
				<div class="form-group" style="margin:0px 10px 0px 0px;">
				<input type="button" class="btn btn-default form-control" onClick="checkUpDelProc('up');" value="  직원수정  "  > 
				</div>
			<td>
				<div class="form-group" style="margin:0px 10px 0px 10px;">
				<input type="button" class="btn btn-default form-control" onClick="checkUpDelProc('del');" value="  직원삭제  "  > 
				</div>
			<td>
				<div class="form-group" style="margin:0px 0px 0px 10px;">
				<input type="button" class="btn btn-default form-control"  onClick="goEmployeeListForm('${param.is_allowed}');" value="  목록보기  " >
				</div>
	</table>
	
	
	
	</div>
</div>

	<form name="employeeListForm" method="post" action="${requestScope.croot}/employeeListForm.do">
		
		
		<%-- value="${param.selectPageNo} value="${param.rowCntPerPage}"  value="${param.keyword1}"--%>
		
		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
		<input type="hidden" name="keyword1" value="${param.keyword1}">
		
		
		
		<input type="hidden" name="selectJikupCode" value="${param.selectJikupCode}">
		<input type="hidden" name="selectDepNo" value="${param.selectDepNo}">
		
		
		
	</form>
	
	<form name="employeeListForm_beforeAllow" method="post" action="${requestScope.croot}/employeeListForm_beforeAllow.do">
		
		<!------------------------------------------------------------>
		<!-- /boardContentForm.do 로 접속하면서 가져왔던 파라미터명의 파라미터 값을 hidden 태그의 value 값으로 삽입하기 -->
		<!-- <방법1> request.getParameter("파라미터명") -->
		<!-- 		request에 HttpServletRequest 객체의 메위주가 저장되어 있다. JSP 에서 제공하는 변수이다. -->
		<!-- <방법2> 달러기호{param.파라미터명} -->
		<!-- 		EL 문법을 써서 쉽게 꺼낼수 있다. 값이 null이면 출력되지 않는다 -->
		<!------------------------------------------------------------>
		<%-- value="${param.selectPageNo} value="${param.rowCntPerPage}"  value="${param.keyword1}"--%>
		
		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
		<input type="hidden" name="keyword1" value="${param.keyword1}">
		
		
		
		<input type="hidden" name="selectJikupCode" value="${param.selectJikupCode}">
		<input type="hidden" name="selectDepNo" value="${param.selectDepNo}">
		
		
		
	</form>
</body>
</html>