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
	String code = request.getParameter("code");
	String viewPageURI = null;
	
	if("A".equals(code)){
		viewPageURI = "/viewModule/a.jsp";
	} else if("B".equals(code)){
		viewPageURI = "/viewModule/b.jsp";
	} else if("C".equals(code)){
		viewPageURI = "/viewModule/c.jsp";
	}
%>
<jsp:forward page="<%=viewPageURI %>"/>
</body>
</html>