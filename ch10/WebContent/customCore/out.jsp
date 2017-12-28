<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>HTML 문법 설명</title>
</head>
<body>
	<h3> font 태그 </h3>
	<c:out value="<font size=7>커다란 글씨</font>는 다음과 같이 출력을 합니다." />
	<c:out value="<font size=7>커다란 글씨</font>" escapeXml="false"/>
</body>
</html>