<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../myinclude/myheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
  <head>
    <title>Login</title>  
  
  
     <script>
      $(function () {
	    $("#registerBtn").click(function () {
	      	location.href = '${contextPath}/user/register';
	    });
      });
    </script>
  </head>
  <body>
  
  
	<div class="container" style="margin-top:100px">
		
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
					    <c:if test="${fail ==true }">
						<div class="alert alert-danger">
							<h3>로그인 실패</h3>
							<p>아이디 비밀번호를 확인해주세요</p>
						</div>
						</c:if>
						<form:form action="${contextPath }/user/login" method="post" modelAttribute="tempLoginUserBean">
							<div class="form-group">
								<form:label path="user_id">아이디</form:label>
								<form:input path="user_id" class="form-control"/>
							</div>
							<div class="form-group">
								<form:label path="user_password">비밀번호</form:label>
								<form:password path="user_password" class="form-control" />
							</div>
							<div class="form-group text-right">
								<form:button class="btn btn-primary">로그인</form:button>
								<a href="${contextPath}/user/register" class="btn btn-danger">회원가입</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

  </body>
</html>