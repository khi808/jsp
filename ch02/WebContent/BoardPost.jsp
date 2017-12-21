<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 지시자 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기 결과</title>
</head>
<body>
	<h2>글쓰기 내용</h2>
	<%	
		/* 파라미터로 넘어온 객체의 문자셋 현재의 페이지에 맞게 설정*/
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		// 저장 파일명에 날짜 시간 이름 붙이기
		Date date = new Date(); // 현재의 시스템 타임을 사용
		Long time = date.getTime(); // 시간
		String fileName = time + ".txt"; // 파일명이 현재시간으로 저장됨
		// 파일 저장 경로 설정
		String filePath 
			= application.getRealPath("WEB-INF/board/"+fileName);
		FileWriter writer = new FileWriter(filePath);
		try{
			// 저장할 문자열 생성
			String str = "제목: "+title+'\n';
			str+="글쓴이: "+name+'\n';
			str+="내용: "+content+'\n';
			// 파일 저장
			writer.write(str);
			out.print("저장 완료!");
		} catch(IOException ioe){
			out.print("파일에 데이터를 쓸 수 없습니다.");
		} finally {
			try{
				// 자원 해제
				writer.close();
			} catch(Exception e){
				System.out.print(e.getMessage());
			}
		}
		
		
	%>
</body>
</html>