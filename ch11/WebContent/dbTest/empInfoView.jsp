<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>View 페이지</title>
</head>
<body>
	<h3>부서 정보</h3>
	<form action="oraDeptUpdateProc.jsp">
		부서번호:<input type="text" value="${deptno}" name="deptno" readonly="readonly" size="2"><br>
		부서명:<input type="text" value="${dname}" name="dname" size="15"><br>
      	위치:<input type="text" value="${loc}" name="loc" size="15"><br>
      <input type="submit" value="전송"><br>
      <a href="oraDeptInsert.jsp"><b>부서정보 추가하기</b></a>
	</form>
</body>
</html>