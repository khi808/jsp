<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%! // 선언부
	private PrintWriter logFile;
	public void jspInit(){
		String fileName = "c:/data/datatime_log.txt"; // 로그파일
		try{
			logFile = new PrintWriter(new FileWriter(fileName));
		}catch(IOException e){
			System.out.printf("%TT - %s파일을 열수 없습니다. %n", new GregorianCalendar(),fileName);
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재의 날짜와 시간</title>
</head>
<body>
	<%
	GregorianCalendar now = new GregorianCalendar();
	String date = String.format("현재날짜:%TY년%Tm월%Te일", now,now,now);
	String time = String.format("현재시간:%TI시%TM분%TS초", now,now,now);
	out.print(date+"<br>");
	out.print(time+"<br>");
	if(logFile!=null){
		logFile.printf("%TF %TT에 호출되었습니다.%n",now,now);
	}
	%>
</body>
</html>
<%!
	public void jspDestroy(){
		if(logFile!=null){
		logFile.close(); // 자원 해제
		}
	}
%>