<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% /* 파라미터로 넘어온 객체의 문자셋을 현재 페이지에 맞춤 */
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>INFO</title>
</head>
<body>
	include전 name 파라미터 값:<%=request.getParameter("name") %>
	<hr>
	<jsp:include page="page_sub.jsp">
		<jsp:param value="홍길동" name="name"/>
	</jsp:include>
	<hr>
	include후 name 파라미터 값:<%=request.getParameter("name") %>
</body>
</html>