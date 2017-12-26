<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="2kb" %><!-- 버퍼 사이즈를 2kb로 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fromBufferOF.jsp의 페이지</title>
</head>
<body>
	<%
		for(int i=0;i<512;i++){
			out.print(i);
			out.print(i);
		}
	%>
	<jsp:forward page="/to/to.jsp" />
</body>
</html>