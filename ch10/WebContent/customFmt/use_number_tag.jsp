<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html><head><title>numberFormat 태그 사용</title>
</head>
<body>
	<c:set var="price" value="10000"/>
	<fmt:formatNumber value="${price}" type="number" var="numberType"/>
	<br>
	통화:<fmt:formatNumber value="${price}" 
						type="currency" currencySymbol="원" /><br>
	퍼센트:<fmt:formatNumber value="${price}" 
						type="percent" groupingUsed="false" /><br>
	숫자:${numberType}<br>
	패턴:<fmt:formatNumber value="${price}" pattern="00000.00"/><br>
	
	<c:set var="num1" value="1234500" />
	패턴2:<fmt:formatNumber value="${num1}" pattern="#,###.##"/><br>
	<c:set var="num2" value="3.14159"/>
	패턴3:<fmt:formatNumber value="${num2}" pattern="#.##"/><br>
	<c:set var="num3" value="10.5"/>
	패턴:<fmt:formatNumber value="${num3}" pattern="#.00"/><br>
	<hr>
	<h4>숫자 포맷</h4>
	금액:<fmt:formatNumber value="100000" type="currency" currencySymbol="￦"/><br>
	퍼센트:<fmt:formatNumber value="0.99" type="percent" /><br>

</body>
</html>