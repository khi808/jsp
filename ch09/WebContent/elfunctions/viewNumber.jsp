<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix = "elfunc" uri="/WEB-INF/tlds/elFunctions.tld" %>
<%@ page import="util.FormatUtil" %>
<%
	request.setAttribute("price",12345L);
%>
<html><head><title>EL 사용자 정의 함수 호출</title>
</head>
<body>
	  입력한 숫자는 <b>${elfunc:formatNum(price,'#,##0')}</b>입니다.<br><br>
	  입력한 숫자는 <em>${FormatUtil.number(price,'#,##0')}</em>원입니다.
</body>
</html>