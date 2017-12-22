package ch05.sevlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/helloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	//서블릿 초기화 메소드
	@Override
	public void init() throws ServletException {
		System.out.println("서블릿 초기화 !! 서블릿 메소드 init()호출");
	}
	// 서비스 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서비스 doGet()메소드 호출");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>Hello</title></head><body>");
		out.print("Hello !!!");
		out.print("</body></html>");
	}

	// 서블릿 종료 메소드
	@Override
	public void destroy() {
		System.out.println("종료메소드 destroy()");
	}

}
