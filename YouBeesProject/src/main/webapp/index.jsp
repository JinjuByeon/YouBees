<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YouBees</title>
<link rel="icon" href="${path}/resources/favicon.ico" type="image/x-icon">
</head>
<body>
	<jsp:forward page="WEB-INF/views/main.jsp"/>
</body>
</html>