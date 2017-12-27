<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html><head>
<title>익스프레션 언어 연산자 연습</title>
</head>
<body>
	<h1>EL Operations</h1>
	x = ${param.num},y = ${param.num2}<br><br>
	<!-- 사칙 연산 -->
	x + y = ${param.num + param.num2}<br>
	x - y = ${param.num - param.num2}<br>
	x * y = ${param.num * param.num2}<br>
	x / y = ${param.num / param.num2}<br>
	x % y = ${param.num % param.num2}<br>
	<!-- 비교 연산 -->
	x가 y보다 큽니까? ${param.num - param.num2 > 0}<br>
	y가 x보다 큽니까? ${param.num - param.num2 < 0}<br>
	x와 y가 모두 양수입니까? ${(param.num>0) && (param.num2>0)}<br>
	<!-- 삼항 연산 -->
	x와 y가 같습니까? ${param.num == param.num2 ? "예" : "아니오"}<br>
	
</body>
</html>