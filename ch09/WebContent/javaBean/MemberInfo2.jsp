<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 표준액션태그를 이용한 bean생성과 사용
    	model.Member minfo = new Member(); -->
<jsp:useBean id="minfo" class="model.Member" scope="request"/>
<!-- <jsp:setProperty property="name" name="minfo" param="name"/>
<jsp:setProperty property="age" name="minfo" param="age"/>
<jsp:forward page="MemberInfoView.jsp"/> -->
<jsp:setProperty property="*" name="minfo"/>
<jsp:forward page="MemberInfoView.jsp"/>