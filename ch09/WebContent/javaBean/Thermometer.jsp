<%@page import="util.Thermometer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Bean 객체 생성
	Thermometer thermo = new Thermometer();
	// request에 객체 저장
	request.setAttribute("t", thermo);
%>
<html><head>
<title>온도 변환</title>
</head>
<body>
	${t.setCelsius("서울",27.3)}
	${t.setCelsius("일본",25.3)}
	${t.setCelsius("북경",30.3)}
	${t.setCelsius("대만",26.3)}
	서울 온도: 섭씨${t.getCelsius("서울")}도 / 화씨${t.getFahrenhiet("서울")}<br>
	북경 온도: 섭씨${t.getCelsius("북경")}도 / 화씨${t.getFahrenhiet("북경")}<br>
	<br>
	정보:${t.getInfo()} <!-- bean에서 get+필드명 으로 메소드를 생성 -->
</body>
</html>