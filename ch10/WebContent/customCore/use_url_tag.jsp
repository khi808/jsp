<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:url value="http://search.daum.net/search" var = "searchUrl">
		<c:param name="${name1}" value="${param1}"/>
		<c:param name="${name2}" value="${param2}"/>
	</c:url>
	
	<ul>
		<li>통합검색<a href=${searchUrl}>찾기</a></li>
		<li><c:url value="/use_if_tag.jsp"/></li>
		<li><c:url value="./use_if_tag.jsp"/></li>
	</ul>
	
</body>
</html>