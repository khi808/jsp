<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	FileReader reader = null;
	String path = request.getParameter("path");
	try{
		reader = new FileReader(getServletContext().getRealPath(path));
%>
<pre>
소스코드=<%=path%>
<c:out value="<%=reader %>" escapeXml="true"/>
</pre>
<% } catch(IOException ex){
%>
에러:<%=ex.getMessage() %>
<%
	} finally{
		if(reader!=null){
			try{
				reader.close();
			}catch(Exception e){
				out.print(e.getMessage());
			}
		}
	}
%>
</body>
</html>