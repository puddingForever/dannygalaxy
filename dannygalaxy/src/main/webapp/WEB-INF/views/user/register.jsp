<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../myinclude/myheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container" style="margin-top:100px">

     <div class="card">
      <h2 class="card-header">
		회원가입
      </h2>
      <div class="card-body">
        <form:form action="${contextPath }/user/register" method="post" modelAttribute="registerUserBean">
          <div class="form-group">
            <form:label path="user_id">아이디</form:label>
            <form:input path="user_id" class="form-control" placeholder="아이디를 입력하세요"/>
            <div class="input-group-append">
				<button type="button" class="btn btn-primary" onclick='checkUserIdExist()'>중복확인</button>
			</div>
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
</div>

<script>
	function checkUserIdExist(){
		var user_id = $("#user_id").val();
		
		if(user_id.length==0){
			alert("아이디를 입력해주세요");
			return
		}//end-if
		
		$.ajax({
			url:'${contextPath}/user/checkUserIdExist/'+user_id,
			type:'get',
			dataType : 'text',
			success: function(result){
					 console.log(result);
					 if(result.trim()=='usable'){
						 alert('사용할 수 있는 아이디입니다.');
						 
					 }else{
						 alert('사용할 수 없는 아이디입니다.');
					 }
				
			}//end-success
			
		})//end-ajax
		
	}//end-checkUserIdExist

</script>
 
 <%@ include file="../myinclude/myfooter.jsp" %>
 