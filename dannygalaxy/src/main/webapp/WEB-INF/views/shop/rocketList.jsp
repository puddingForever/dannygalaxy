<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../myinclude/myheader.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<div class="container">

<%-- 카테고리 선택 --%>
		<div class="btn-group" style="margin-top:20px" role="group" aria-label="Basic radio toggle button group">
		  <label class="btn btn-outline-primary" for="btnradio1">인기판매순</label>
		  <label class="btn btn-outline-primary" for="btnradio2">낮은가격순</label>
		  <label class="btn btn-outline-primary" for="btnradio2">높은가격순</label>  
		</div>

<%-- 로켓 리스트 화면 --%>
<div id="resultList">
	<c:forEach var="rocket" items="${rocketList }">
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">${rocket.rocketId }</li>
		  <li class="list-group-item">로켓이름 : ${rocket.rocketName }</li>
		  <li class="list-group-item">로켓가격 : ${rocket.rocketPrice }</li>
		  <li class="list-group-item">로켓특징 : ${rocket.rocketSpecial }</li>
		</ul>	
	</c:forEach>
</div>



	
</div>

<script>

	
	
	
	
	
	
	
</script>
<%@ include file="../myinclude/footer.jsp" %>