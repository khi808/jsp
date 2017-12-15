package cp01.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 브라우저에서 넘어오는 파라미터는 문자열 타입
		String str1 = request.getParameter("number1");
		String str2 = request.getParameter("number2");
		String op = request.getParameter("op");
		int num1 = Integer.parseInt(str1);
		int num2 = Integer.parseInt(str2);
		int result = 0;
		// op값에 따라 +,-,x,/
		switch (op) {
			case "-": result = num1 - num2;
				break;
			case "*": result = num1 * num2;
				break;
			case "/'": result = num1 / num2;
				break;
			default : result = num1 + num2; op = "+"; break;
		}
		//contentType지정
		//text중분류/html소분류; charset = utf-8 <= 브라우저의 character Set에 맞추기
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><body><h1>두 수의 합</h1>");
		out.print(num1+op+num2+"="+result);
		out.print("</body></html>");
		out.close();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
