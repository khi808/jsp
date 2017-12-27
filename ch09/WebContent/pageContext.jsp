<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>PageContext</title>
</head>
<body>
	<h1>PageContext 내장객체 사용하기</h1>
	요청 URI: ${pageContext.request.requestURI}<br>
	요청 URL: ${pageContext.request.requestURL}<br>
</body>
</html>