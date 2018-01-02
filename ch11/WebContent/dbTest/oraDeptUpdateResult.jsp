<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<title>View 페이지</title>
</head>
<body>
	<h3>부서 정보 수정 결과</h3>
	부서번호:${deptno}<br>
	부서명:${dname}<br>
	근무지:${loc}<br>
	<a href="oraDeptInput.html">처음으로 돌아가기</a>
</body>
</html>