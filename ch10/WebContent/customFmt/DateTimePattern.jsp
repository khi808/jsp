<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="date" value="<%=new Date()%>"/>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	[오늘의 날짜]<fmt:formatDate value="${date}"/><br>
	[현재의 시각]<fmt:formatDate value="${date}" type="time"/>
</body>
</html>