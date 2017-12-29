<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 사원번호, 사원명, 입사일자, 부서코드 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty emplist}">
	<h2>해당 부서의 사원이 없습니다.</h2>
</c:if>
<c:if test="${!empty emplist}">
	<table border="1" bgcolor="yellow">
	<caption><h2>부서별 회원 정보</h2></caption>
	<tr><th>사원번호</th><th>사원명</th><th>입사일자</th><th>부서코드</th></tr>
	<c:forEach var="emp" items="${emplist}">
		<tr>
			<td>${emp.empno}</td><td>${emp.ename}</td><td>${emp.hiredate}</td><td>${emp.deptno}</td>
		</tr>
	</c:forEach>
	</table>
</c:if>
