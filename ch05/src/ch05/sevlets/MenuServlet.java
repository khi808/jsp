package ch05.sevlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select * from menu";
		
		String dbName = getInitParameter("DB_NAME");
		String url = getInitParameter("url");
		String user = getInitParameter("user");
		String password = getInitParameter("password");
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url,user,password);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if(con!=null) {
				out.print("<html><body>접속 성공<br>"
						+ "dbName="+dbName+"<br>"
						+ "url="+url+"<br>"
						+ "user="+user+"<br><hr>");
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				// table생성
				out.print("<table border=1><caption><h3>메뉴</h3></caption>");
				// 데이터 출력
				while(rs.next()) {
					out.print("<tr align=center>");
					out.print("<td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td>");
					out.print("</tr>");
				}
				// html태그 닫기
				out.print("</table></body></html>");
				// 자원 해제
				rs.close();
				pstmt.close();
				con.close();
				
			} else {
				out.print("<html><body>접속 실패</body></html>");
			}
				
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
