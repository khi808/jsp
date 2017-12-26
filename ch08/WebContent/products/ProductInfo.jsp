<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="pinfo" class="model.ProductInfo" scope="request"/>
	코드:<jsp:getProperty name="pinfo" property="code"/><br>
	제품명:<jsp:getProperty name="pinfo" property="name"/><br>
	가격:<jsp:getProperty name="pinfo" property="price"/>
</body>
</html>