<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!-- Bean객체 선언 : ClothInfo pinfo = new ClothInfo(); -->
<jsp:useBean id="pinfo" class="model.ClothInfo" scope="request"/>
<jsp:setProperty property="code" name="pinfo" param="code"/>
<jsp:setProperty property="name" name="pinfo" param="name"/>
<jsp:setProperty property="price" name="pinfo" param="price"/>
<jsp:setProperty property="size" name="pinfo" param="size"/>
<jsp:setProperty property="color" name="pinfo" param="color"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의류 정보</title>
</head>
<body>
	의류정보가 저장되었습니다.<br>
	<hr><br>
	<h3>의류 개략 정보</h3><br>
	<jsp:include page="ProductInfo.jsp"/>
	사이즈:<jsp:getProperty property="size" name="pinfo"/><br>
	색상:<jsp:getProperty property="color" name="pinfo"/><br>
</body>
</html>