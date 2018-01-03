<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html><head><title>회원 목록</title>
</head>
<body>
	회원 테이블의 내용
	<table width="100%" border="1">
		<tr>
			<td>이름</td><td>아이디</td><td>비번</td>
		</tr>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			try{
				String driver = "jdbc:apache:commons:dbcp:";
				String sql = "select a.id id, a.name name, b.email email from member a, memberInfo b where a.id=b.id order by id";
				conn = DriverManager.getConnection(driver);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()){
		%>
				<tr>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("id") %></td>
					<td><%=rs.getString("password") %></td>
				</tr>
		<%
				}
		
			} catch(Exception e){
				out.print(e.getMessage());
			} finally{
				try{
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
				} catch(Exception e){
					out.print(e.getMessage());
				}
			}
		
		%>
	</table>
</body>
</html>