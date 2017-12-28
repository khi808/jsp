<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String path = "use_if_tag.jsp";
	request.setAttribute("path", path);
%>
<jsp:forward page="use_out_tag.jsp"/>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>