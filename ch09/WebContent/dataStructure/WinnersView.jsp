<%@ page contentType="text/html; charset=UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<title> 우승자 명단</title>
</head>
<body>
  <h2>우승자 명단</h2>
  1등:${winnwers[0]}<br> <!-- 배열로 넘어온 객체의 접근 : 객체명[index] -->
  2등:${winnwers[1]}<br>
  3등:${winnwers[2]}<br>
</body>
</html>