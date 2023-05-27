<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../myinclude/myheader.jsp" %>

<p class="lead">
 ${date.startDate } ~ ${date.endDate } 총 접근 소행성의 개수 <br>
 ${element_count }개 <br>
 <br>
  <strong>지구 접근 소행성의 정보</strong><small>&nbsp;&nbsp;&nbsp;관찰일: ${date.startDate } </small>
 
</p>

<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">소행성 이름</th>
      <th scope="col">위험성</th>
      <th scope="col">지구 최고 근접 거리(km)</th>
      
    </tr>
  </thead>
  <tbody>
	<%-- break문 --%>
 	
	    <c:forEach var="obj" items="${name}" varStatus="status">
	    <tr>
	 	<td>${obj}</td>
	 	<td>${hazardous[status.index] }</td>
		<td>${kilo[status.index]}</td> 	
 		</tr>
 		</c:forEach>
 	
  </tbody>
</table>


<%@ include file="../myinclude/myfooter.jsp" %>
