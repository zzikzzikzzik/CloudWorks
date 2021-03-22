<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<head><title>로그인</title>
<script>
$(document).ready(function(){
	$("[name=emp_pwd]").keydown(function(event){
		if(event.keyCode==13){
			checkLoginForm();
		}
	});

	$("[name=emp_no]").val("1");
	$("[name=emp_pwd]").val("1234");
	$("[name=emp_pwd]").focus();
});

function checkLoginForm(){
	var emp_no = $('[name=emp_no]').val();	
	if(emp_no.split(" ").join("")==""){
		alert("사원번호 입력 요망");
		$('[name=emp_no]').val("");
		return;
	}

	var emp_pwd = $('[name=emp_pwd]').val();	
	if(emp_pwd.split(" ").join("")==""){
		alert("암호 입력 요망");
		$('[name=emp_pwd]').val("");
		return;
	}

	$.ajax({
		url : "${croot}/loginProc.do"
		, type : "post"
		, data : $("[name=loginForm]").serialize()
		, success : function(emp_noCnt){
			if(emp_noCnt==1){
				alert("로그인 성공");	
				location.replace("${requestScope.croot}/dashboard.do");
			}else if(emp_noCnt==2){
				alert("관리자 로그인 성공");
				location.replace("${requestScope.croot}/dashboard.do");
			}else if(emp_noCnt==3){
				alert("아직 가입 승인이 되지 않았습니다.");
				$('[name=emp_no]').val("");
				$('[name=emp_pwd]').val("");
				$('[name=emp_no]').focus();
			}else{
				alert("입력하신 직원번호 또는 암호가 틀립니다.");
				$('[name=emp_no]').val("");
				$('[name=emp_pwd]').val("");
				$('[name=emp_no]').focus();
			}
		}
		, error : function(){
			alert("서버 접속 실패");
		}
		
	});
	
}

</script>
</head>
<body style="background-color: #B0B0B0"><center>


<form name="loginForm" method="post" action="${croot}/loginProc.do">
	<div class="container">
		<div class="col-mg-4" style="padding-top : 180px; width:50%;">
			<div class="jumbotron" style=" margin-bottom:120px;" >
				<h1 style="text-align: center;"><img src="/resources/img/cloudWorks_01.png" width=100%></h1><br><br>
				<div class="form-group">
				<label class="control-label" style="float: left;">직원번호</label>
					<input type="text" class="form-control" placeholder="아이디" name="emp_no" maxlength="20">
				</div>
				
				<div class="form-group">
					<label class="control-label" style="float: left;">비밀번호</label>
					<input type="password" class="form-control" placeholder="비밀번호" name="emp_pwd" maxlength="20">
				</div>
				<br>
				<input type="button" name="login" class="btn btn-default form-control" onClick="checkLoginForm();" value="로그인">
				<div><br></div>
				<input type="button" name="join" class="btn btn-default form-control" onClick="document.joinForm.submit();" value="회원가입">
				
			</div>
		</div>
	</div>
</form>

<form name="dashboardForm" method="post" action="${croot}/dashboard.do"></form>

<form name="joinForm" method="post" action="${croot}/joinForm.do"></form>

</body>
</html>