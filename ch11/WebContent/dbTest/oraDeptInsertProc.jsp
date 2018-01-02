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
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "insert into dept values(?, ?, ?)"; //부서정보 입력문
	String sql2 = "select count(*) from dept where deptno=?"; //해당코드의 정보 존재여부 확인
	String sql3 = "select * from dept order by deptno"; // 전체 출력
	// 파라미터 변수
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	// Bean객체들을 저장할 List생성
	List<Dept> list = new ArrayList<>();
	try{ 
		// -1. 피라미터로 입력받은 부서코드 존재 여부확인
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, deptno);
		rs = pstmt.executeQuery();
		// -1.1 부서코드가 존재하면 다시 뒤로 back;
		if(rs.next()){
			if(rs.getInt(1)>0){
				out.print("<script>");
				out.print("alert('존재하는 부서코드입니다.');");
				out.print("history.back();");
				out.print("</script>");
			}
		}
		// -2. 부서코드가 존재하지 않으면 insert작업 실행
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, deptno);
		pstmt.setString(2, dname);
		pstmt.setString(3, loc);
		int result = pstmt.executeUpdate();
		
		if(result>0){
			// 수정된 데이터를 select
			pstmt = conn.prepareStatement(sql3);
			rs = pstmt.executeQuery();
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
			= request.getRequestDispatcher("oraDeptInsertResult.jsp");
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