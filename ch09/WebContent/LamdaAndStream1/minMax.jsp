<%@page import="java.util.Arrays"%>
<%@page import="model.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>EL 정렬</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	List<Member> memberList = Arrays.asList(
				new Member("홍길동",20),
				new Member("이순신",54),
				new Member("유관순",19),
				new Member("왕건",42)
			);
	request.setAttribute("members", memberList);
%>
<!-- EL버전 3.0에 추가된 부분 ${A;B} 처리는 A와 B가 되지만 출력은 B가 됨-->
${maxAgeMem = members.stream().max((M1,M2)->M1.age.compareTo(M2.age));'' }
나이가 제일 많은 회원:${maxAgeMem.get().name}(${maxAgeMem.get().age}세)<br>
${minAgeMem = members.stream().min((M1,M2)->M1.age.compareTo(M2.age));'' }
나이가 제일 적은 회원:${minAgeMem.get().name}(${minAgeMem.get().age}세)<br>
<hr>
${vals = [20,17,30,2,9,23];'' }
최소값:${vals.stream().min().get()}<hr>
배열 리스트:
${vals = [20,17,30,2,9,23]}<br>
정렬된 리스트:${sortedVals = vals.stream().sorted().toList() }
<hr>
<!-- {A;B} A와 B가 처리된 후 출력은 B -->
${vals = [20,17,30,2,9,23];sortedVals = vals.stream().sorted().toList()}<br>
<hr>
${vals = [20,17,30,2,9,23];sortedVals = vals.stream().sorted((x1,x2)->x1<x2?1:-1).toList()}<br>

</body>
</html>