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
	int number = 10;
%>
<!-- 디렉티브에서 선언한 include는 페이지 컴파일시 통합하여 하나의 페이지로 만들어서 컴파일함 -->
<%@ include file="/includee.jspf" %>
공통변수 DATAFOLDER = "<%=dataFolder %>"

</body>
</html>