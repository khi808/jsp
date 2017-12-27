<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	HashMap<String,String> map = new HashMap<>();
	/* map.put("park","목동");
	map.put("Jesica","크라이스트 처치");
	map.put("Susan","시드니"); */
	map.put(request.getParameter("k1"),request.getParameter("v1"));
	map.put(request.getParameter("k2"),request.getParameter("v2"));
	map.put(request.getParameter("k3"),request.getParameter("v3"));
	/*	String val1 = request.getParameter("val1");
		int pos = val1.indexOf(".");
		String temp1 = val1.substring(0,pos);
		String temp2 = val1.substring(pos+1);
		map.put(temp1,temp2);
	*/
	
	// request객체에 저장
	request.setAttribute("address", map);
	// 경로 설정
	RequestDispatcher dispatcher
		= request.getRequestDispatcher("mapView.jsp?name=park");
	dispatcher.forward(request, response);
	
	
%>
</body>
</html>