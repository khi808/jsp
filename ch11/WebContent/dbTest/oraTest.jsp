<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html><head><title>데이터베이스 연결</title></head>
<body>
	<h3>데이터베이스 연결 테스트</h3>
<%
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password = application.getInitParameter("password");
	String driver = application.getInitParameter("driver");
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,user,password);
	if(conn!=null){
		out.print("webdb 데이터베이스로 연결했습니다.");
	} else{
		out.print("webdb 데이터베이스 연결 실패입니다.");
	}
	// 연결 해제
	conn.close();
%>
	
	
</body>
</html>