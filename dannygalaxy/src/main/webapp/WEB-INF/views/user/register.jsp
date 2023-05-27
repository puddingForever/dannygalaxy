<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../myinclude/myheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

     <div class="card">
      <h2 class="card-header">
		회원가입을 해주세요
      </h2>
      <div class="card-body">
        <form:form action="${contextPath }/user/register" method="post" modelAttribute="registerUserBean">
          <div class="form-group">
            <form:label path="user_id">아이디</form:label>
            <form:input path="user_id" class="form-control" placeholder="아이디를 입력하세요"/>
             <form:label path="user_name">이름</form:label>
            <form:input path="user_name" class="form-control" placeholder="아이디를 입력하세요"/>
            <form:label path="user_email">이메일</form:label>
            <form:input path="user_email" class="form-control" aria-describedby="emailHelp" placeholder="이메일을 입력하세요"/>
            <small id="emailHelp" class="form-text text-muted">이메일의 정보는 공유되지 않습니다.</small>
          </div>
          <div class="form-group">
            <form:label path="user_password">비밀번호</form:label>
            <form:password path="user_password" class="form-control" placeholder="비밀번호를 입력하세요"/>
          </div>
          <div class="form-group">
            <form:label path="user_pw_confirm">비밀번호 확인</form:label>
            <form:password path="user_pw_confirm" class="form-control" placeholder="비밀번호를 입력하세요"/>
          </div>
          <button type="submit" class="btn btn-primary">등록</button>
        </form:form>
      </div>
    </div>
 
 <%@ include file="../myinclude/myfooter.jsp" %>
 