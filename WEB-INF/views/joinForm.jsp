<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<%@include file="common.jsp" %>
<head><title>회원가입</title>
<script>
function checkJoinForm(){
	if( checkEmpty( "[name=emp_name]", "이름을 입력해주세요.") ){ 
		$("[name=emp_name]").focus();
		return; 	
	}	
	if( checkPattern( "[name=emp_name]", /^[가-힣]{2,6}$/, "이름을 2~6글자 한글로 입력해주세요.")  ){ 
		$("[name=emp_name]").focus();
		return; 	
	}
	
	if( checkEmpty( "[name=emp_pwd]", "비밀번호를 입력해주세요.") ){ 
		$("[name=emp_pwd]").focus();
		return; 	
	}	
	if( checkPattern( "[name=emp_pwd]", /^[a-z0-9]{5,10}$/, "암호는 5~10 글자로 영어소문자 또는 숫자를 입력해주세요.")  ){ 
		$("[name=emp_pwd]").focus();
		return; 	
	}
	
	if( checkEmpty( "[name=emp_pwd_check]", "비밀번호 확인을 입력해주세요.") ){ 
		$("[name=emp_pwd_check]").focus();
		return;	
	}	
	if($("[name=emp_pwd]").val() != $("[name=emp_pwd_check]").val()){
		alert("비밀번호와 일치하지 않습니다.")
		$("[name=emp_pwd_check]").val("")
		$("[name=emp_pwd_check]").focus();
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
	
	if( checkEmpty( "[name=jumin_num]", "주민등록번호를 - 포함하여 입력해주세요.") ){ 
		$("[name=jumin_num]").focus();
		return; 
	}	
	if(checkPattern("[name=jumin_num]", /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/ , 
			"정확한 주민등록번호를 - 포함하여 입력해 주세요." ) ){
		$("[name=jumin_num]").focus();
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

	if(confirm("정말 가입하시겠습니까?")==false){return;};
	
	$.ajax({
		url : "${croot}/joinProc.do",
		type: "post",
		data : $("[name=joinForm]").serialize(),
		success : function(joinCnt){
			if(joinCnt == 1){
				
				$.ajax({
					url : "${croot}/emp_noProc.do",
					type: "post",
					data : $("[name=joinForm]").serialize(),
					success : function(emp_no){
						alert("회원가입 성공!\n" + $("[name=emp_name]").val() + "님의 직원번호는 " + emp_no + "입니다.\n관리자 승인 후 로그인해주세요.");
						document.loginForm.submit();
					},
					error : function(){
						alert("서버 접속 실패")
					}
				});
				
			}			
			else{
				alert("회원가입 실패")
			}
		},
		error : function(){
			alert("서버 접속 실패")
		}
	});
} 	
</script>
</head>
<body style="background-color: #B0B0B0"><center>


<form name="joinForm"> <!--  method="post" action="${requestScope.croot}/joinProc.do"> -->
	<div class="container">
		<div class="col-mg-4" style="padding : 120px 0px 100px; width:50%;">
			<div class="jumbotron" style="padding-top : 20px;" >
				<h1 style="text-align: center; color: white"><img src="/resources/img/cloudWorks_01.png" width=100%></h1><br><br>
				<div class="form-group">
					<label class="control-label" style="float: left;">이름</label>
					<!-- <div style="text-align: left;">이름</div> -->
					<input type="text" class="form-control" placeholder="이름" name="emp_name" maxlength="20">
				</div>
				
				<div class="form-group">
					<label class="control-label" style="float: left;">비밀번호 (암호는 5~10 글자로 영어소문자 또는 숫자를 입력해주세요.)</label>
					<input type="password" class="form-control" placeholder="비밀번호" name="emp_pwd" maxlength="20">
				</div>
				
				<div class="form-group">
					<label class="control-label" style="float: left;">비밀번호 확인</label>
					<input type="password" class="form-control" placeholder="비밀번호 확인" name="emp_pwd_check" maxlength="20">
				</div>
				
				<div class="form-group">
					<label class="control-label" style="float: left;">휴대전화번호</label>
					<input type="text" class="form-control" placeholder="휴대전화번호" name="phone_num" maxlength="13">
				</div>
				
				<div class="form-group">
					<label class="control-label" style="float: left;">주민등록번호 ( - 포함)</label>
					 <input type="text" class="form-control" placeholder="주민등록번호" name="jumin_num" size="12" maxlength="14"></input>
				</div>
				<div class="form-group">
					<label class="control-label" style="float: left;">이메일</label>
					<input type="email" class="form-control" placeholder="이메일" name="email" maxlength="20">
				</div>
				<br>
				<input type="button" name="join" class="btn btn-default form-control" value="회원가입" onclick="checkJoinForm();">
				<div><br></div>
				<input type="button" name="login" class="btn btn-default form-control" value="로그인으로 이동" onClick="document.loginForm.submit();">

			</div>
		</div>
	</div>
</form>

<form name="loginForm" method="post" action="${requestScope.croot}/loginForm.do"></form>
</body>
</html>