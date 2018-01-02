<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${list==null}">
	<h3>정보가 존재하지 않습니다.</h3>
</c:if>
<c:if test="${list!=null}">
	<table border="1" bgcolor="yellow">
	<caption><b>부서 정보</b></caption>
	<tr><th>부서코드</th><th>부서명</th><th>근무지</th></tr>
	<c:forEach var="d" items="${list}">
		<tr><td>${d.deptno}</td><td>${d.dname}</td><td>${d.loc}</td></tr>
	</c:forEach>
	</table>
</c:if>