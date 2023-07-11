<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../myinclude/myheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	
<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form action="${contextPath }/boards/register_pro" method="post">
						<div class="form-group">
							<label for="board_writer_name">작성자</label>
							<input type="text" id="bwriter" name="bwriter" class="form-control"/>
						</div> 
						<div class="form-group">
							<label for="board_subject">제목</label>
							<input type="text" id="btitle" name="btitle" class="form-control"/>
						</div>
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea id="bcontent" name="bcontent" class="form-control" rows="10" style="resize:none"></textarea>
						</div>
						<div class="form-group">
							<label for="board_file">첨부 이미지</label>
							<input type="file" id="upload_file" name="upload_file" class="form-control" accept="image/*"/>
						</div>
						<div class="form-group">
							<div class="text-right">
								<button type="submit" class="btn btn-primary">작성하기</button>
							</div>
						</div>	
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

			



<%@ include file="../myinclude/footer.jsp" %>