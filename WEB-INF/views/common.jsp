<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="croot" value="<%=request.getContextPath()%>" scope="request"/>
<c:set var = "bodyBgcolor" value="#f6f6f6" scope="request" />
<c:set var = "thBgcolor" value="lightgray" scope="request" />

<link href="${requestScope.croot}/resources/common.css?ver=<%=Math.random()%>" rel="stylesheet" type="text/css">
<script src="${requestScope.croot}/resources/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${requestScope.croot}/resources/common.js?ver=<%=Math.random()%>" type="text/javascript"></script>
<script src="${requestScope.croot}/resources/css/bootstrap.js" type="text/javascript"></script>

<link href="${requestScope.croot}/resources/css/bootstrap.css" rel="stylesheet" type="text/css">


<script src="${requestScope.croot}/resources/js/summernote/summernote-lite.js"></script>
<script src="${requestScope.croot}/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="${requestScope.croot}/resources/css/summernote/summernote-lite.css">