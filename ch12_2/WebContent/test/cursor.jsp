<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = null;
	String sql = "select * from member order by id";
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
		conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql,
										ResultSet.TYPE_SCROLL_SENSITIVE,
										ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = pstmt.executeQuery();
		rs.last(); // 커서의 마지막으로 이동
		out.print(rs.getString(1)+","+rs.getString(2)+","+"<br>");
		
		
	} catch(Exception e){
		out.print("<h3>데이터 가져오기 실패</h3>");
		e.printStackTrace();
	}
%>