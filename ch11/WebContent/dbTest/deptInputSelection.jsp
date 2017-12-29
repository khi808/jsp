<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	String dno = request.getParameter("deptno");
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password = application.getInitParameter("password");
	String driver = application.getInitParameter("driver");
	// 1단계 드라이버 로딩
	Class.forName(driver);
	// 2단계 연결
	Connection conn = DriverManager.getConnection(url,user,password);
	// 3단계 작업
	PreparedStatement pstmt = null;
	String sql = "select deptno, dname from dept";
	ResultSet rs = null;
	try{
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		%><form action="oraEmp.jsp">
		<select name="deptno"><%
		while(rs.next()){%>
			<option value="<%=rs.getInt(1)%>"><%=rs.getInt(1)%>.<%=rs.getString(2) %>
		<%
		}
		%>
		</select>
		<input type="submit" value="확인">
		</form>
		<%
		} catch(Exception e){
			out.print(e.getMessage());
		}
		//4. 연결 해제
		rs.close();
		pstmt.close();
		conn.close();
%>
</body>
</html>