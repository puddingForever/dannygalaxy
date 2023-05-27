<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../myinclude/myheader.jsp" %>
<c:set var='contextPath' value='${pageContext.request.contextPath }' />




<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<div class="form-group">
						<label>작성자</label>
						<input type="text" name="bwriter" class="form-control" value="${board.bwriter}"  disabled="disabled"/>
					</div>
					<div class="form-group">
						<label>작성날짜</label>
						<input type="text" name="bregDate" class="form-control" value="<fmt:formatDate value='${board.bregDate }' pattern='yyyy/MM/dd HH:mm:ss' />" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label>제목</label>
						<input type="text" name="btitle" class="form-control" value="${board.btitle}" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea name="bcontent" class="form-control" rows="10" style="resize:none" disabled="disabled">${board.bcontent}</textarea>
					</div>
					
					<div class="form-group">
						<div class="text-right">
							<a href="${contextPath}/boards/list" class="btn btn-primary">목록으로 돌아가기</a>
							<a href="${contextPath}/boards/modify?bno=${board.bno}" class="btn btn-info">수정하기</a>
							<a href="${contextPath}board/delete?bno=${board.bno}" class="btn btn-danger">삭제하기</a>
						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>


<%@ include file="../myinclude/myfooter.jsp" %>