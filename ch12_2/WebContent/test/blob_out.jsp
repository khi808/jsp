<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Blob"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html><head><title>?</title></head>
<body>
<%
Connection conn = null;
BufferedOutputStream bos = null;
InputStream is = null;
String sql = "select photo from testblob where id =?";
try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
	conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	String id = request.getParameter("id");
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		// DB로 부터 이미지 객체 읽어서 생성
		Blob blob = rs.getBlob(1);
		// 충돌방지
		out.clear();
		out=pageContext.pushBody();
		// 출력 스트림 생성
		bos = new BufferedOutputStream(response.getOutputStream());
		// 시리얼 라이즈
		is = blob.getBinaryStream();
		// 이미지 크기
		int length = (int)blob.length();
		// 버퍼
		byte[] buffer = new byte[length];
		// write 작업
		while((length=is.read(buffer))!=-1){
			bos.write(buffer);
		}
	}
	bos.close();
	is.close();
	pstmt.close();
	conn.close();
} catch(Exception e){
	out.print(e.getMessage());
}
	
%>
</body>
</html>