<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//초기화 파일 (web.xml)의 db 설정값을 읽어옴.
	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password = application.getInitParameter("password");
	// 드라이버 로딩 및 연결
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);
	
	// 수정작업 변수
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "update dept set dname =?, loc=? where deptno=?";
	String sql2 = "select * from dept where deptno=?";
	// 파라미터 변수
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dname);
		pstmt.setString(2, loc);
		pstmt.setInt(3, deptno);
		
		int result = pstmt.executeUpdate(); // 수정된 행(row)의 수 리턴
		if(result>0){
			// 수정된 데이터를 select 처리
			pstmt = conn.prepareStatement(sql2); // 쿼리 객체 생성
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			while(rs.next()){
				request.setAttribute("deptno", rs.getInt(1));
				request.setAttribute("dname", rs.getString(2));
				request.setAttribute("loc", rs.getString(3));
			}
		} else {
			out.print("수정 실패!");
		}
		// 페이지 이동
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("oraDeptUpdateResult.jsp");
		dispatcher.forward(request, response);
	} catch(Exception e){
		out.print(e.getMessage());
	} finally{
		try{ // 자원 해제 (연결 해제)
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(Exception e){
			out.print(e.getMessage());
		}
	}
	
%>