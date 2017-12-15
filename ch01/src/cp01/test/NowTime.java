package cp01.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/NowTime")
public class NowTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 문자셋 정의
				response.setContentType("text/html;charset=utf-8");
				
				// 출력
				PrintWriter out = response.getWriter();
				// java에서는 println()이 적용되지만
				// HTML에서는 println()이 적용되지 않음.
				out.print("<html>");
				out.print("<head><title>현재시간</title></head>");
				out.print("<body>");
				out.print("현재시간은 ");
				out.print(new Date());
				out.print("입니다.");
				out.print("</body></html>");
	}

}
