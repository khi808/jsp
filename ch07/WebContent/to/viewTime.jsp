<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		// request의 속성으로 넘어온 time의 값을 받음.
		Calendar cal = (Calendar)request.getAttribute("time"); // object -> Calendar
	%>
	현재 시간은<%=cal.get(Calendar.HOUR_OF_DAY) %>시
			<%=cal.get(Calendar.MINUTE) %>분
			<%=cal.get(Calendar.SECOND) %>초 입니다.
</body>
</html>