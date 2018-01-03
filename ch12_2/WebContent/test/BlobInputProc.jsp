<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.sun.org.apache.xml.internal.security.Init"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	String sql = "insert into testblob(id,pwd,name,photo) values(?,?,?,?)";
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
		conn = ds.getConnection();
		// 자동 커밋 해제
		conn.setAutoCommit(false);
		File file = new File("C:/images/Desert.jpg");
		InputStream is = new FileInputStream(file);
		int filesize = (int)file.length();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "aa");
		pstmt.setString(2, "1234");
		pstmt.setString(3, "사막");
		// 이미지 파일 셋팅
		pstmt.setBinaryStream(4, is, filesize);
		// 실행
		int result = pstmt.executeUpdate();
		if(result > 0){
			conn.commit();
		} else {
			conn.rollback();
		}
		is.close();
		pstmt.close();
		conn.setAutoCommit(true);
		conn.close();
		out.print("입력 처리 완료");
	} catch(Exception e){
		out.print(e.getMessage());
	}
	


%>