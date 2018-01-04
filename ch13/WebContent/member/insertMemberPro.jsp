<%@page import="java.util.Date"%>
<%@page import="dao.MemberDao"%>
<%@page import="model.Member1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="model.Member1"/>
<jsp:setProperty property="*" name="member"/>
<% 
	member.setReg_data(new Date());
	MemberDao dao = new MemberDao();
	if(dao.insertMember(member)>0){
		%>
		<jsp:getProperty property="id" name="member"/>님 회원가입을 축하드립니다.
		<%
	}
%>