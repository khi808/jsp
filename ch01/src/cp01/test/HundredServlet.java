package cp01.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(description = "1부터100까지 합산하는 서블릿", urlPatterns = { "/HundredServlet" })
public class HundredServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1부터 100까지 합을 구하는 서블릿
		int sum = 0;
		int toNum = Integer.parseInt(request.getParameter("num"));
		for(int i=1; i<=toNum; i++) {
			sum = sum+i;
		}
		// setContentType()은 응답을 받는 브라우저의 문자셋에 맞춤
		response.setContentType("text/html;charset=utf-8");
		// 출력 객체 생성
		PrintWriter out = response.getWriter();
		// 콘텐츠 생성
		out.print("<html><body>1부터 "+toNum+"까지의 합은 : ");
		out.print(sum+"</body></html>");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp); //POST -> GET 메소드 호출
	}

}
