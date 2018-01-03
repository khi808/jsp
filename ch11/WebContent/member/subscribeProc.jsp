<%@page import="model.Member"%>
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
	
	// 1,2단계 드라이버 로딩 및 연결
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);
	//
	PreparedStatement pstmt = null;
	String sql1 = "insert into member(id,password,name,birth) " 
					+" values(?,?,?,?)";
	String sql2 = "insert into memberInfo(id,address,tel,email)" 
					+" values(?,?,?,?)";
	String sql3 = "select * from member where id=?";
	// 피라미터 받기
	Member member = new Member();
	member.setId(request.getParameter("id"));
	member.setPassword(request.getParameter("password"));
	member.setName(request.getParameter("name"));
	member.setAddress(request.getParameter("address"));
	member.setEmail(request.getParameter("email"));
	member.setTel(request.getParameter("tel"));
	member.setBirth(request.getParameter("birth"));
	try{
		pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1, member.getId());
		int result2 = pstmt.executeUpdate();
		if(result2>0){
			out.print("<script>");
			out.print("alert('이미 존재하는 id입니다.');");
			out.print("window.location.href='subscribe.jsp';");
			out.print("</script>");
		}
		// 3단계 -1. 쿼리 객체 생성
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getPassword());
		pstmt.setString(3, member.getName());
		pstmt.setString(4, member.getBirth());
		
		int result = pstmt.executeUpdate();
		if(result > 0){
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getAddress());
			pstmt.setString(3, member.getTel());
			pstmt.setString(4, member.getEmail());
			
			result = pstmt.executeUpdate();
			out.print("<script>");
			out.print("alert('회원가입을 축하드립니다.');");
			out.print("window.location.href='loginform.html';");
			out.print("</script>");
		} else{
			out.print("<script>");
			out.print("alert('입력실패!');");
			out.print("</script>");
		}
	} catch(Exception e){
		out.print(e.getMessage());
	} finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch(Exception e){
			out.print(e.getMessage());
		}
	}
 %>