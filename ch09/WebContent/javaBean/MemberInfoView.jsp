<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<title>회원정보</title>
</head>
<body>
	<h3>회원정보</h3>
	이름:${memInfo.name}<br>
	나이:${memInfo.age }<br>
</body>
</html>