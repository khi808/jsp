<%@page import="java.sql.Statement"%>
<%@page import="model.Dept"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "delete dept where deptno in ("; //부서정보 입력문
	String sql2 = "select * from dept order by deptno";
	// 파라미터 변수
	String[] deptno = request.getParameterValues("deptno");
	List<Dept> list = new ArrayList<>();
	
	for(int i=0;i<deptno.length;i++){
		if(i==(deptno.length-1))
			sql += deptno[i]+")";
		else
			sql += deptno[i]+",";
	}
	System.out.println("sql="+sql);
	try{
		stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);// 삭제 작업 처리후 결과 받기
		if(result>0){
			// 수정된 데이터를 select 처리
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql2);
			while(rs.next()){
				Dept dept = new Dept();
				dept.setDeptno(rs.getInt(1));
				dept.setDname(rs.getString(2));
				dept.setLoc(rs.getString(3));
				list.add(dept);
			}
		}
		request.setAttribute("list", list);
		// 페이지 이동
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("deptDeleteResult.jsp");
		dispatcher.forward(request, response);
	} catch(Exception e){
		out.print(e.getMessage());
	} finally{
		try{ // 자원 해제 (연결 해제)
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}catch(Exception e){
			out.print(e.getMessage());
		}
	}
	
%>