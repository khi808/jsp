<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="date" value="<%=new Date()%>" />
<html>
	<head>
	
	</head>
	<body>
		서울:<fmt:formatDate value="${date}" type="both"/><br>
		<fmt:timeZone value="asia/Hong_Kong"><br>
			홍콩:<fmt:formatDate value="${date}" type="both" /><br>
		</fmt:timeZone>
		<fmt:timeZone value="Europe/London"><br>
			런던:<fmt:formatDate value="${date}" type="both" /><br>
		</fmt:timeZone>
		<fmt:timeZone value="America/New_York"><br>
			뉴욕:<fmt:formatDate value="${date}" type="both" /><br>
		</fmt:timeZone>
	</body>
</html>