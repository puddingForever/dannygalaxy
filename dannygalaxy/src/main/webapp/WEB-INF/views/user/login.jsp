<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../myinclude/myheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<div class="container" style="margin-top:100px">
	<div class="card-body">
		<c:if test="${fail == true }">
			<div class="alert alert-danger">
				<h3>로그인 실패</h3>
				<p>아이디 비밀번호를 확인해주세요</p>
			</div>
		</c:if>
		<form:form action="${contextPath }/user/login" method="post" modelAttribute="tempLoginUserBean">
			<div class="form-group">
				<form:label path="userId">아이디</form:label>
				<form:input path="userId" class="form-control" />
				<form:errors path="userId" style="color:red" />
			</div>
			<div class="form-group">
				<form:label path="userPw">비밀번호</form:label>
				<form:password path="userPw" class="form-control" />
				<form:errors path="userPw" style="color:red" />
			</div>
			<div class="form-group text-right">
				<form:button class="btn btn-primary">로그인</form:button>
				<a href="${contextPath }/user/register" class="btn btn-danger">회원가입</a>
			</div>
		</form:form>
	</div>
</div>