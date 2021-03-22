<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<head><title>마이페이지</title>

</head>
<script>

var before_emp_pwd = ${mypage.emp_pwd};


$(document).ready(function(){

});

function checkUpdateProc(){
	var emp_pwd = $("[name=myPageForm] [name=emp_pwd]").val();
	var new_emp_pwd = $("[name=myPageForm] [name=new_emp_pwd]").val();
	var is_new_emp_pwd = $("[name=myPageForm] [name=is_new_emp_pwd]").val();

	
	if( checkEmpty( "[name=myPageForm] [name=emp_pwd]", "변경전 비밀번호를 입력해주세요.") ){ 
		$("[name=myPageForm] [name=emp_pwd]").focus();
		return; 	
	}
	
	if( checkEmpty( "[name=phone_num]", "휴대전화번호를 입력해주세요.") ){ 
		$("[name=phone_num]").focus();
		return; 	
	}
	if(checkPattern("[name=phone_num]", /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/ , "정확한 휴대폰 번호를 입력해 주세요." ) ){
		$("[name=phone_num]").focus();
		return;
	}
	
	if( checkEmpty( "[name=email]", "이메일을 입력해주세요.") ){
		$("[name=email]").focus();
		return; 
	}	
	if( checkPattern( "[name=email]", /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/, "정확한 이메일을 입력해주세요.")  ){ 
		$("[name=email]").focus();
		return; 	
	}
	
	if(new_emp_pwd!=is_new_emp_pwd){
		alert("변경할 비밀번호와 비밀번호확인이 맞지 않습니다.");
		$("[name=myPageForm] [name=new_emp_pwd]").val("");
		$("[name=myPageForm] [name=is_new_emp_pwd]").val("");
		return;
	}

	if(confirm("정말 수정하시겠습니까?")==false){return;}		

	if(emp_pwd!=before_emp_pwd){
		alert("비밀번호가 맞지 않습니다.!");
		return;
	}

	
	$.ajax({
		url : "${requestScope.croot}/mypageUpProc.do"
		, type : "post"
		, processData: false
		, contentType: false 
		, data : new FormData($("[name=myPageForm]").get(0))  //$("[name=myPageForm]").serialize()
		, success : function(updateMypageCnt){			
			if(updateMypageCnt==1){
				alert("수정 성공!");
				document.myPageForm.submit();	
			}else if(updateMypageCnt==-1)
				alert("사원이 존재하지 않습니다.");
			else{
				alert("수정 실패!");
			}
		}
		, error : function(){
			alert("서버 접속 실패")
		}
	});
}

</script>
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
			<li role="presentation" class="active"><a href="${requestScope.croot}/myPageForm.do" >마이페이지</a></li>
			<c:if test="${sessionScope.emp_no == '10001'}">
				<li role="presentation"><a href="${requestScope.croot}/employeeListForm.do" >관리자페이지</a></li>
			</c:if>
	     </ul>
	    <ul class="nav nav-tabs navbar-right" style="border-bottom:0px;">
			<li><a href="${requestScope.croot}/logout.do" >로그아웃</a></li>
		</ul>
	</div>
	
</nav>


<form name="myPageForm" method="post" action="${requestScope.croot}/myPageForm.do">
<div class="container">
<div class="jumbotron" style="padding-top : 10px; margin-bottom:70px;">

<h3> 내 정보 </h3><br><br>   <!-- height: 380px; width: 450px" -->

<div class="row">
<div class="col-md-12">
	<table width=100%>
		<tr>
			<td rowspan=3 valign="top" align=center>
				<div class="form-group" style="float:none;">
					<label class="col-md-10 control-label" style="float:none;">사진</label><br>
					<div class="col-md-10">
						<c:if test="${empty mypage.pic}">
							<input type="hidden" name="pic">
						</c:if>
						<c:if test="${!empty mypage.pic}">
							<input type="hidden"  name="pic" value="${mypage.pic}">
							<img src="/resources/img/${mypage.pic}" width="40%" style="float:none;">		
						</c:if>
					</div>
				</div>
			<td align=center>
				<div class="form-group" style="float:none;">
				
					<label class="col-md-10 control-label" style="float:none;">이름</label>
					<div class="col-md-10" style="float:none;">
						<input type="text"  class="form-control" value="${mypage.emp_name}" name="emp_name" maxlength="20" readonly>
					</div>
				
				</div>
			<td align=center>
				<div class="form-group"  style="float:none;">
					<label class="col-md-10 control-label"  style="float:none;">사번</label>
					<div class="col-md-10" style="float:none;">
						<input type="text" class="form-control" value="${mypage.emp_no}" name="emp_no" maxlength="20" readonly>
					</div>
				</div>
		<tr>
			<td align=center>
				<div class="form-group" style="float:none;">
					<label class="col-md-10 control-label" style="float:none;">전화번호</label>
					<div class="col-md-10" style="float:none;">
						<input type="text" class="form-control" value="${mypage.phone_num}" name="phone_num" maxlength="20">
					</div>
				</div>
			<td align=center>
				<div class="form-group" style="float:none;">
					<label class="col-md-10 control-label" style="float:none;">이메일</label>
					<div class="col-md-10" style="float:none;">
						<input type="text" class="form-control" value="${mypage.email}" name="email" maxlength="20">
					</div>
				</div>
		<tr>			
			<td align=center>
				<div class="form-group" style="float:none;">
					<label class="col-md-10 control-label" style="float:none;">새로운 암호</label>
					<div class="col-md-10" style="float:none;">
						<input type="password" class="form-control" placeholder="변경할 암호입력" name="new_emp_pwd" maxlength="20">
					</div>
				</div>
			<td align=center >
				<div class="form-group" style="float:none;">
					<label class="col-md-10 control-label" style="float:none;">새로운 암호 확인</label>
					<div class="col-md-10" style="float:none;">
						<input type="password" class="form-control" placeholder="변경할 암호확인" name="is_new_emp_pwd" maxlength="20">
					</div>
				</div>
		<tr>
			<td align=center>
				<div class="form-group" style="float:none;">
					<input type="file" name="pic2">
				</div>
			<td align=center>
				<div class="form-group"  style="float:none;">
					<label class="col-md-10 control-label" style="float:none;">암호</label>
					<div class="col-md-10" style="float:none;">
						<input type="password" class="form-control" placeholder="변경전 암호입력" name="emp_pwd" maxlength="20">
					</div>
				</div>
				
			<td align=center>
				<div class="form-group"  style="float:none;">
				<label class="col-md-10 control-label" style="float:none;">&nbsp;</label>
				<div class="col-md-10" style="float:none;">
					<input type="button" class="btn btn-default form-control" onClick="checkUpdateProc();" value="  프로필 업데이트  "  > 
				</div>
				</div>
	</table>
</div>
</div>
</div>
</div>
</form>	
		
 
</body>
</html>