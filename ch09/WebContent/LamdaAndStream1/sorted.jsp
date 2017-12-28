<%@page import="java.util.Arrays"%>
<%@page import="model.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>EL 정렬</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	List<Member> memberList = Arrays.asList(
				new Member("홍길동",20),
				new Member("이순신",54),
				new Member("유관순",19),
				new Member("왕건",42)
			);
	request.setAttribute("members", memberList);
%>
	<!-- iterator는 외부 반복자, stream() 내부반복자(향상된 for문) -->
	${sortedMem = members.stream().sorted((m1,m2) -> m1.age.compareTo(m2.age)).toList()}
	${sortedMem}
</body>
</html>