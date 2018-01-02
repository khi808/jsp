<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<form action="BookInfoResult.jsp">
	<fieldset>
		<legend>북 정보 조회</legend>
		<select name="chB">
		<option value="title">제목</option>
		<option value="writer">글쓴이</option>
		<option value="total" selected="selected">전체</option>
		</select>
			<input type="text" name="join">
		<input type="submit" value="조회">
	</fieldset>
</form>

<c:if test="${empty list}">
	<h3>조회 내용이 없습니다.</h3>
</c:if>
<c:if test="${!empty list}">
	<table border="1" bgcolor="yellow">
		<tr align="center"><th>코드</th><th>제목</th><th>글쓴이</th><th>가격</th></tr>
		<c:forEach var="book" items="${list}">
			<tr align="center"><td>${book.code}</td><td>${book.title}</td><td>${book.writer}</td><td>${book.price}</td></tr>
		</c:forEach>
	</table>
</c:if>