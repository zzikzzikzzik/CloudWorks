
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<%--

<%
	String admin_id = (String)session.getAttribute("admin_id");
	String msg = "";
	if(admin_id==null){msg="로그인 화면으로 이동합니다.";}
	else {msg="로그아웃 완료!";}
	// HttpSession 객체에 저장된 로그인 아이디 삭제
	session.removeAttribute("admin_id");
%>
<script>
	alert("<%=msg%>");
	location.replace("${croot}/loginForm.do");
</script>


 --%>



<c:if test="${sessionScope.emp_no==null}">
	<script>
		alert("로그인 화면으로 이동합니다.");
		location.replace("${croot}/loginForm.do");
	</script>
</c:if>
<c:if test="${sessionScope.emp_no!=null}">
	<%
		session.removeAttribute("emp_no");
	%>
	<script>
		alert("로그아웃 완료!");
		location.replace("${croot}/loginForm.do");
	</script>
</c:if>






