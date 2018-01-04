<%@page import="util.CookieBox"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	MemberDao dao = new MemberDao();
	int chk = dao.userCheck(id, password);
	if(chk==1){
		Cookie cookie = CookieBox.createCookie("id", id, 20*60);
		response.addCookie(cookie);
		response.sendRedirect("cookieMain.jsp");
	} else if(chk==0){
		out.print("<script>");
		out.print("alert('패스워드가 맞지 않습니다.');");
		out.print("history.back();"); /* BOM(뒤로 가기) */
		out.print("</script>");
	} else {
		out.print("<script>");
		out.print("alert('해당하는 아이디가 없습니다.');");
		out.print("history.go(-1);"); /* BOM(뒤로 가기) */
		out.print("</script>");
	}
	
	
%>