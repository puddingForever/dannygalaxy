<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../myinclude/myheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<div class="container" style="margin-top:10px;">
<h3><strong>지구 접근 소행성 정보</strong><small>&nbsp;&nbsp;&nbsp;[관측일:  ${date.startDate } ]</small></h3>
</div>
<div class="container" style="margin-top:20px; display: flex;">

	<div class="card" style="width: 18rem; margin-top:100px" > <%--화성사진 --%>
	  <img src="${contextPath}/resources/image/rover.jpg" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title">화성 둘러보기</h5>
	    <p class="card-text">Rover가 촬영한 화성 사진들을 구경해보세요!</p>
	    <a href="${contextPath}/nasa/rover" class="btn btn-primary">이동</a>
	  </div>
	</div>
	
	<table class="table"> <%-- 소행성 --%>
	  <thead class="thead-primary">
	    <tr>
	      <th scope="col">소행성 이름</th>
	      <th scope="col">위험성</th>
	      <th scope="col">지구 최고 근접 거리(km)</th>	      
	    </tr>
	  </thead>
	  <tbody>	 	
		    <c:forEach var="obj" items="${name}" varStatus="status">
		    <tr>
		 	<td>${obj}</td>
		 	<td>${hazardous[status.index] }</td>
			<td>${kilo[status.index]} (km)</td> 	
	 		</tr>
	 		</c:forEach>
	 	
	  </tbody>
	</table>
</div>



<%@ include file="../myinclude/footer.jsp" %>
