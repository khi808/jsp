<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Book Info</title>
</head>
<body>
<c:if test="${empty list}">
	<h3>조회 내용이 없습니다.</h3>
</c:if>
<c:if test="${!empty list}">
	<table border="1" bgcolor="yellow">
		<tr align="center"><th>코드</th><th>제목</th><th>글쓴이</th><th>가격</th></tr>
		<c:forEach var="book" items="${list}">
			<tr align="center"><td>${book.code}</td><td>${book.title}</td><td>${book.writer}</td><td>${book.price}</td></tr>
		</c:forEach>
	</table>
</c:if>
</body>
</html>