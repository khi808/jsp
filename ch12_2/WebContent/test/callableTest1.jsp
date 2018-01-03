<%@page import="java.sql.Types"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
		conn = ds.getConnection();
		// 프로시저 호출
		CallableStatement cstmt = conn.prepareCall("call plus(?,?,?)");
		//biding변수 세팅
		cstmt.setInt(1, 10);
		cstmt.setInt(2, 20);
		// out.parameter 설정
		cstmt.registerOutParameter(3, Types.NUMERIC);
		// 실행
		cstmt.execute();
		// 실행 결과 받기
		int result = cstmt.getInt(3);// plus() 프로시저의 세번째 파라미터 받기
		out.print("프로시저 실행결과:"+result);
	} catch(Exception e){
		out.print(e.getMessage());
	}

%>