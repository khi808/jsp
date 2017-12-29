<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	request.setAttribute("num1", new Integer(num1));
	request.setAttribute("num2", num2);/* auto-boxing */
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<table border="1" bgcolor="yellow">
	<caption>구구단</caption>
	<c:forEach var="i" begin="1" end="9">
		<tr>
		<c:forEach var="j" begin="${num1}" end="${num2}">
			<td>${j}x${i}=${j*i}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</table>
</body>
</html>