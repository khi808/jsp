<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie("name","홍");
	cookie.setMaxAge(60*60); // 1시간 쿠키 유호
	response.addCookie(cookie);
%>
<html><head>쿠키 유효시간 설정</head>
	<body>
		유효기간 1시간 인 name 쿠키 생성<br>
		<a href="deleteCookie.jsp?name=name">쿠키제거</a>
	</body>
</html>
