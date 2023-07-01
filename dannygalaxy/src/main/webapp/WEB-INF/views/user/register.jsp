<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../myinclude/myheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="container" style="margin-top:100px">

	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form:form action="${contextPath }/user/register" method="post" modelAttribute="joinUserBean">
						<form:hidden path="userIdExist" />
						<div class="form-group">
							<form:label path="userName">이름</form:label>
							<form:input path="userName" class="form-control" />
							<form:errors path="userName" style="color:red"/>
						</div>
						<div class="form-group">
							<form:label path="userId">아이디</form:label>
							<div class="input-group">
								<form:input path="userId" class="form-control" onkeypress="resetUserIdExist()"/>
								<div class="input-group-append">
									<button type="button" class="btn btn-primary" onclick="checkUserIdExist()">중복확인</button>
								</div>
							</div>
							<form:errors path="userId"  style="color:red"/>
						</div>
						<div class="form-group">
							<form:label path="userPw">비밀번호</form:label>
							<form:password path="userPw" class="form-control" />
							<form:errors path="userPw" style="color:red"/>
						</div>
						<div class="form-group">
							<form:label path="userPw2">비밀번호 확인</form:label>
							<form:password path="userPw2" class="form-control"/>
							<form:errors path="userPw2" style="color:red"/>
						</div>
						<div class="form-group">
							<div class="text-right">
								<form:button class="btn btn-primary">회원가입</form:button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div> 
</div>
<script>
	function checkUserIdExist(){
		var userId = $("#userId").val();
		
		if(userId.length == 0){
			alert("아이디를 입력해주세요");
			return;
		}
		
		$.ajax({
			url:"${contextPath}/user/checkUserIdExist/" + userId,
			type:"get",
			dataType:"text",
			success:function(result){
				if(result.trim() == 'usable'){
					alert("사용할 수 있는 아이디입니다.");
					$("#userIdExist").val("true")
				}else{
					alert("사용할 수 없는 아이디입니다.");
					$("#userIdExist").val("false")
				}
			}//end-success
		})//end-ajax	
		
	}//end-function
	
	function resetUserIdExist(){
		$("#userIdExist").val("false");	
	}
</script>

 
 <%@ include file="../myinclude/footer.jsp" %>
 