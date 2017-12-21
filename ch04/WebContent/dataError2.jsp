<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!-- 스크립틀릿에서 응답객체의 상태코드 변경 -->
<% response.setStatus(200); %> <!-- 응답코드: 500 => 200 OK로 변경 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>덧셈프로그램 - 에러 발생</title>
</head>
<body>
	잘못된 데이터가 입력되었습니다.<br>
	상세 에러 메시지:<%=exception.getMessage() %>
</body>
</html>