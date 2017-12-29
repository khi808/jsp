<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="date" value="<%=new Date() %>" />
<html>
	<head>
	</head>
	<body>
		[오늘의 날짜]<fmt:formatDate value="${date}"
					 type="date" pattern="yyyy/MM/dd(E)"/><br>
		[현재 시간]<fmt:formatDate value="${date}"
					type="time" pattern="(a)hh:mm:ss" />
	</body>
</html>
