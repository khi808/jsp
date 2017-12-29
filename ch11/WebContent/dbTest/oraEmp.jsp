<%@page import="model.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 사원번호, 사원명, 입사일자, 부서코드 -->
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%--<jsp:useBean id="emp" class="model.Emp"/> --%>
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
	String sql = "select empno, ename, hiredate, deptno from emp where deptno=?";
	ResultSet rs = null;
	List<Emp> list = new ArrayList<>();
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,deptno);
		rs = pstmt.executeQuery();
		while(rs.next()){
			// Bean 객체 생성
			Emp emp = new Emp();
			// 속성 저장
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setHiredate(rs.getDate(3));
			emp.setDeptno(rs.getInt(4));
			// list에 Bean객체 저장
			list.add(emp);
		}
		// request객체에 저장
		request.setAttribute("emplist", list);
		// 경로 설정
		RequestDispatcher dispatcher 
			= request.getRequestDispatcher("oraEmpView.jsp");
		// 포워드
		dispatcher.forward(request, response);
	}catch(Exception e){
		out.print(e.getMessage());
	}
	// 4단계 해제
	rs.close();
	pstmt.close();
	conn.close();
%>
</body>
</html>