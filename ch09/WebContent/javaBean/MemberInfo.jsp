<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	int intAge = Integer.parseInt(age);
	
	Member member = new Member(name,intAge);
	
	request.setAttribute("memInfo", member);
	
	RequestDispatcher dispatcher
		= request.getRequestDispatcher("MemberInfoView.jsp");
	dispatcher.forward(request, response);
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>