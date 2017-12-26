<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- request는 페이지간 이동 객체, 이전 페이지에서 속성으로 name을 추가 -->
body_sub에서 name파라미터 값:<%=request.getParameter("name") %>
<ul>
	<%
		String[] names = request.getParameterValues("name");
		for(String name : names){
	%>
	<li><%=name %></li>
	<%
		}
	%>
</ul>
</body>
</html>