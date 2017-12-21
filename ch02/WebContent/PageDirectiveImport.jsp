<%@page import="java.util.GregorianCalendar"%><!-- 지시자부분에 import됨 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>날짜와 시간 정보</title>
</head>
<body>
<%/* 스크리립틀릿 */
   /* Crtl + space 하면 자동으로 import 됨 */
	GregorianCalendar now = new GregorianCalendar();
	String date = String.format("%TF",now);
	String time = String.format("%TT",now);
%>
오늘의 날짜:<%=date %><br>
현재의 시각:<%=time %>
</body>
</html>