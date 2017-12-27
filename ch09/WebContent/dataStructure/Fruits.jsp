<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String> items = new ArrayList<>();
	items.add(request.getParameter("f1"));
	items.add(request.getParameter("f2"));
	items.add(request.getParameter("f3"));
	// request객체에 저장
	request.setAttribute("fruits", items);
	// 페이지 이동
	RequestDispatcher dispatcher
		= request.getRequestDispatcher("FruitsView.jsp");
	dispatcher.forward(request, response);
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>