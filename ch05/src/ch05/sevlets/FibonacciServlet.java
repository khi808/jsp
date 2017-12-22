package ch05.sevlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 피보나치 수열 = 첫항과 두번째 항까지 1 그다음 항들은 앞의 두값을 더한값
 * */

@WebServlet("/test/fibonacciServlet")
public class FibonacciServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BigInteger[] arr; // 전역 선언
	// 초기화 메소드
	public void init(ServletConfig config) throws ServletException {
		arr = new BigInteger[100]; // BigInteger 정수형태의 래퍼클래스 (표현범위가 큼)
		arr[0] = new BigInteger("1"); // arr[0] = 1;
		arr[1] = new BigInteger("1"); // arr[1] = 1;
		for(int i=2;i<arr.length;i++) {
			arr[i] = arr[i-2].add(arr[i-1]);
			// arr[i] = arr[i-2] + arr[i-1];
		}
	}
	// 종료 메소드
	public void destroy() {
		
	}
	// 서비스 메소드
	protected void doGet(HttpServletRequest request,
								HttpServletResponse response) 
									throws ServletException, IOException {
		// 파라미터 받기
		String str1 = request.getParameter("num");
		int num = Integer.parseInt(str1);
		if(num>100) num = 100; // 최대값을 100으로 설정
		// 콘텐츠 타입 설정
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>피보나치 수열</title></head><body>");
		for(int i=0;i<num;i++) {
			out.print(arr[i]+" ");
		}
		out.print("</body></html>");
	}
	protected void doPost(HttpServletRequest request,
								HttpServletResponse response) 
									throws ServletException, IOException {
		doGet(request, response);
	}

}
