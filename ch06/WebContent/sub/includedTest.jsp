<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name = request.getParameter("name");
%>
포함되는 페이지 includedTest.jsp입니다.<p>
<b><%=name %></b> 님 방가여 ...
<hr>
</body>
</html>