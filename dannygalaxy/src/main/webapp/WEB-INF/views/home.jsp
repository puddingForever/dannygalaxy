<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./myinclude/myheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<div class="container" style="margin-top:100px">	
	<div class="text-center">     
	    <h1 class="mx-auto my-0 text-uppercase">Danny Galaxy</h1>
	    <h2 class="text mx-auto mt-2 mb-5">실시간 우주정보와 우주여행을 바로 예약하세요</h2>
	    <a class="btn btn-primary" href="${contextPath }/user/login">예약하기</a>
	</div>
</div>

<%@ include file="./myinclude/footer.jsp" %>
