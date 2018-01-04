<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html><head><title>로그인 화면</title></head>
<script type="text/javascript">
function chk(){
	var id = document.forms[0].id;
	var password = document.getElementById('password');
	if(id.value.length==0){
		alert('id를 입력하세요');
		id.focus();
		return false;
	}
	if(password.value.length==0){
		alert('패스워드를 입력하세요');
		password.focus();
		return false;
	}
	return true;
}
</script>
<body>
	<h2>로그인 화면</h2>
	<form action="cookieLoginPro.jsp" method="post" onsubmit="return chk()">
		<table border="1" bgcolor="yellow">
			<caption><h2>로그인</h2></caption>
			<tr><th>아이디</th><td><input type="text" name="id" id="id"></td></tr>
			<tr><th>패스워드</th><td><input type="password" name="password" id="password"></td></tr>
			<tr align="center"><td colspan="2"><input type="submit" value="전송">
			 <input type="reset" value="취소">
			 <input type="button" value="회원가입"
	  	                onclick="javascript:location.href='insertMemberForm.jsp'"></td></tr>
		</table>
	</form>
</body>
</html>