<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Pet 정보</h3>
	아이디:${param.id}<br><!-- 하나의 파라미터를 받을때 param객체 -->
	선택한 동물:${paramValues.animal[0]} <!-- 속성값 출력 배열타입의 파라미터 받을 때 paramValues -->
			  ${paramValues.animal[1]} <!-- null인 경우 값 출력 안됨 -->
			  ${paramValues.animal[2]}
</body>
</html>