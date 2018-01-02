<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Book"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
	String sql = "select * from book";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String chb = request.getParameter("chB");
	switch(chb){
	case "title":
		sql += " where title like ? order by code";
		break;
	case "writer": 
		sql += " where writer like ? order by code";
		break;
	default: 
		sql += " where writer || title like ? order by code";
		break;
	}
	String join = request.getParameter("join");
	join = "%"+join+"%";
	List<Book> list = new ArrayList<>();
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, join);
		rs = pstmt.executeQuery();
		while(rs.next()){
			Book book = new Book();
			book.setCode(rs.getInt(1));
			book.setTitle(rs.getString(2));
			book.setWriter(rs.getString(3));
			book.setPrice(rs.getInt(4));
			list.add(book);
		}
		request.setAttribute("list", list);
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("BookInfoInput.jsp");
		dispatcher.forward(request, response);
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