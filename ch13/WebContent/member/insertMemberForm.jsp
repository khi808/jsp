<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입</title>
</head>
<body>
<h2>회원가입</h2>
	<form action="insertMemberPro.jsp" method="post">
		<table border="1" bgcolor="yellow">
		<caption><h3>회원가입</h3></caption>
			<tr>
				<th>아이디</th><td><input type="text" name="id" id="id" maxlength="12"></td>
			</tr>
			<tr>
				<th>패스워드</th><td><input type="password" name="password" id="password" maxlength="12"></td>
			</tr>
			<tr>
				<th>이름</th><td><input type="text" name="name" maxlength="12" id="name"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="전송">
								<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>