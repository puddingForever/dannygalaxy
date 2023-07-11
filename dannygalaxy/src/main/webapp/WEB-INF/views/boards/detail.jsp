<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="../myinclude/myheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />


<div class="container" style="margin-top:50px">
		<!-- 상세페이지 -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="board_writer_name">작성자</label>
							<input type="text" id="board_writer_name" name="board_writer_name" class="form-control" value="${boardDetail.tvcBwriter }" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="board_date">작성날짜</label>
							<input type="text" id="board_date" name="board_date" class="form-control" value="<fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' value='${boardDetail.tvcBregDate }'/>" disabled="disabled"/>
						</div>   
						<div class="form-group">
							<label for="board_date">수정날짜</label>
							<input type="text" id="board_date" name="board_date" class="form-control" value="<fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' value='${boardDetail.tvcBmodDate }'/>" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="board_subject">제목</label>
							<input type="text" id="board_subject" name="board_subject" class="form-control" value="${boardDetail.tvcBtitle }" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea id="board_content" name="board_content" class="form-control" rows="10" style="resize:none" disabled="disabled">${boardDetail.tvcBcontent }</textarea>
						</div>
						<div class="form-group">
							<label for="board_file">첨부 이미지</label>
							<img src="<spring:url value='/commuimage/${boardDetail.boardFile }'/>" width="100%"/>						
						</div>
						<div class="form-group">
							<div class="text-right">
								<a href="${contextPath }/community/list?tvcCatId=${boardDetail.tvcCatId}" class="btn btn-primary">목록보기</a>
								<a href="${contextPath }/community/modify?tvcCatId=${boardDetail.tvcCatId}&tvcBno=${boardDetail.tvcBno}" class="btn btn-info">수정하기</a>
								<a href="${contextPath }/community/delete?tvcCatId=${boardDetail.tvcCatId}&tvcBno=${boardDetail.tvcBno}" class="btn btn-danger">삭제하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		<div class="col-sm-3"></div>
	</div>	<!--  상세페이지 끝  -->

	<small><strong>댓글&nbsp;[댓글수 : 1]</strong></small> 
	


	
</div>

<%@ include file="../myinclude/footer.jsp" %>    
    
    
    