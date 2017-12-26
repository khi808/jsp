<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	char gender = request.getParameter("gender").charAt(0);
	int age = Integer.parseInt(request.getParameter("age"));
	// 자바빈 클래스 생성
	Customer customer = new Customer();
	// 자바빈 클래스의 메소드 사용 - 값 저장
	customer.setName(name);
	customer.setGender(gender);
	customer.setAge(age);
	// request객체에 속성으로 자바빈(객체) 저장
	request.setAttribute("customerInfo", customer);
	// request객체에 속성으로 저장
	request.setAttribute("name", name);
	request.setAttribute("gender", gender);
	request.setAttribute("age", age);
%>
<h2>회원정보</h2>
<%
	Customer custInfo = (Customer)request.getAttribute("customerInfo");
	String name2 = (String)request.getAttribute("name");
	char gender2 = (char)request.getAttribute("gender");
	int age2 = (int)request.getAttribute("age");
%>
이름:<%=custInfo.getName() %><br>
성별:<%=custInfo.getGender() %><br>
나이:<%=custInfo.getAge() %><br>
<hr>
이름:<%=name2 %><br>
성별:<%=gender2 %><br>
나이:<%=age2 %><br>
</body>
</html>