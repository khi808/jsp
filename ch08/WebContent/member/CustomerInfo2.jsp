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
	// 자바빈 클래스 생성
	Customer customer = new Customer();
	// 자바빈 클래스의 메소드 사용 - 값 저장
	customer.setName("홍길동");
	customer.setGender('M');
	customer.setAge(new Integer(25));
	// request객체에 속성으로 자바빈(객체) 저장
	request.setAttribute("customerInfo", customer);
%>
<h2>회원정보</h2>
<%
	Customer custInfo = (Customer)request.getAttribute("customerInfo");
%>
이름:<%=custInfo.getName() %><br>
성별:<%=custInfo.getGender() %><br>
나이:<%=custInfo.getAge() %><br>
</body>
</html>