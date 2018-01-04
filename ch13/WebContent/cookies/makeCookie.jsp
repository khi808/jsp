<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html><head><title>쿠키 생성 하기</title></head>
<body>

<%
	String cookieName = "id";
	String cookieValue = "hong";
	// 쿠키 객체 생성(서버에서 생성)
	Cookie cookie = new Cookie(cookieName,cookieValue);
	cookie.setMaxAge(60*2); // 2분
	cookie.setValue("kim");// setValue(값) - 쿠기값 변경
	// 쿠키 객체 전송
	response.addCookie(cookie);
%>

<h2>쿠키를 생성하는 예</h2>
<p>
	"<%=cookieName %>"쿠키가 생성되었습니다.<br>
	<input type="button" value="쿠키 내용확인" 
 	onclick="javascript:window.location='useCookie.jsp'">

</body>
</html>