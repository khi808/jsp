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
	int deptIno = Integer.parseInt(dno);
	PreparedStatement pstmt = null;
	String sql = "select * from dept where deptno=?";
	ResultSet rs = null;
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,deptIno);
		rs = pstmt.executeQuery();
		if(rs.next()){
			// out.print("부서정보는 :"+rs.getInt(1)+rs.getString(2)+rs.getString(3));
			request.setAttribute("deptno", rs.getInt(1));
			request.setAttribute("dname", rs.getString(2));
			request.setAttribute("location", rs.getString(3));
		} else{
			out.print("해당 부서는 없는부서입니다.");
		}
		RequestDispatcher dispatcher 
			= request.getRequestDispatcher("oraTestView.jsp");
		dispatcher.forward(request, response);
		
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