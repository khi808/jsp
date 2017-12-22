package ch05.sevlets;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/test/greetingServlet")
public class GreetingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter logFile;
	// 초기화 메소드
	public void init(ServletConfig config) throws ServletException {
		try {
			logFile = new PrintWriter(new FileWriter("c:/data/log.txt"));
		} catch (IOException ioe) {
			throw new ServletException(ioe);
		}
	}
	// 종료 메소드
	// - 어플리케이션 제거 혹은 tomcat 종료시 기록됨.
	public void destroy() {
		if(logFile!=null) logFile.close(); // 자원 해제
	}
	// 서비스 메소드
	protected void doGet(HttpServletRequest request,
							HttpServletResponse response) 
									throws ServletException, IOException {
		// 파라미터로 넘어온 객체의 문자셋을 현재 페이지의 문자셋으로 설정
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String greeting = "";
		if(name!=null && !"".equals(name)) {
			greeting = name + "님 방가여!!";
		}
		if(logFile!=null) {
			GregorianCalendar now = new GregorianCalendar();
			// 로그파일에 기록.
			logFile.printf("%TF %TT - %s %n", now,now,name);
		} else {
			System.out.println("로그파일이 존재하지 않습니다.");
		}
		// 출력되는 페이지의 문자셋에 맞춰 문자셋 설정
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>인사하기</title></head><body>");
		out.print(greeting);
		out.print("</body></html>");
		
		
	}
	protected void doPost(HttpServletRequest request,
							HttpServletResponse response) 
									throws ServletException, IOException {
		doGet(request, response);
	}

}
