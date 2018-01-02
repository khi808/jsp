<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	// DB작업 3단계 쿼리 작업
	String sql = "select password from member where id=? and password=?";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	// 파라미터
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");
	try{
		// 쿼리 객체 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		rs = pstmt.executeQuery();
		
		if(rs.next()){/* 입력받은 id로 조회시 패스워드 결과 */
			if(rs.getString(1).equals(pwd)){ /* id와 패스워드가 맞을 때 */
				out.print("<script>");
				out.print("alert('로그인 성공')");
				out.print("</script>");
			} else if(rs.getString(1).equals("")){ /* id는 맞지만 패스워드가 틀릴 때 */
				out.print("<script>");
				out.print("alert('비밀번호가 틀렸습니다.')");
				out.print("history.back();");
				out.print("</script>");
			}
		
		} else {/* id로 조회 결과가 없으면 .. id가 없는 상태 */
			out.print("<script>");
			out.print("alert('없는 id 입니다')");
			out.print("history.back();");
			out.print("</script>");
		}
			
	} catch(Exception e){
		out.print(e.getMessage());
	} finally{
		try{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch(Exception e){
			out.print(e.getMessage());
		}
	}
	
%>