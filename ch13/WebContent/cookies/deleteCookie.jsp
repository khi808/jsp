<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){// 쿠키 배열에서
			if(cookies[i].getName().equals(name)){// 쿠키의 이름이 파라미터 값과 같은 쿠키 선택
				Cookie cookie = new Cookie(name,"");// 쿠키명에 해당하는 값 삭제
				// 쿠키 삭제 처리 -- 유효기간을 0으로 설정
				cookie.setMaxAge(0);
				// 접속한 브라우저로 쿠키 객체 전송
				response.addCookie(cookie);
			}
		}
	}
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>