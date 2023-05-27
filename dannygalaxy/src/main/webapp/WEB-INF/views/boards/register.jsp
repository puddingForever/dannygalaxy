<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../myinclude/myheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }/" />

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form action="${contextPath}/boards/register" method="post" name="frmBoard">
						<div class="form-group">
							<label>제목</label>
							<input name="btitle" class="form-control" />
						</div>
						<div class="form-group">
							<label>내용</label>	
							<textarea name="bcontent" class="form-control" rows="10" style="resize:none"></textarea>			
						</div>
						<div class="form-group">
							<label>작성자</label>
							<input name="bwriter" class="form-control" />
						</div>
						<div class="form-group">
							<div class="text-right">
								<button class="btn btn-primary">작성하기</button>
								<button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/boards/list'">취소</button>
							</div>
						</div>
						
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
<%@ include file="../myinclude/myfooter.jsp" %>

