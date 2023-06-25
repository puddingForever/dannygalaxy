<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../myinclude/myheader.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />


<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form role="form" method="post" id="frmModify" name="frmModify" >
						<div class="form-group">
						    <label>글번호</label>
						    <input class="form-control" name="bno" value="${board.bno }" readonly="readonly">
						</div>
						<div class="form-group">
							<label>작성자</label> <!--  -->
							<input name="bwriter" value="${board.bwriter }" class="form-control" readonly="readonly" />
						</div>						
						<div class="form-group">
							<label>최종수정일</label>[등록일시: <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board.bregDate}"/>]							
							<input class="form-control" name="bmodDate"
			   				value='<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board.bmodDate}"/>'
			  				 disabled="disabled" />
						</div>
						<div class="form-group">
							<label>제목</label>
							<input name="btitle" value="${board.btitle }" class="form-control" />
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="10" name="bcontent" style="resize:none">
								${board.bcontent }
							</textarea>
						</div>
			
						<div class="form-group">
							<div class="text-right">
								<button type="button" class="btn btn-primary" id="btnModify" data-oper="modify">수정</button>
								<button type="button" class="btn btn-danger" id="btnRemove" data-oper="remove">삭제</button>
								<button type="button" class="btn btn-info" id="btnList" data-oper="list">취소</button>

							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

<script>
	var frmModify = $("#frmModify");
	
	$("button").on("click",function(){
		
		var operation = $(this).data("oper");
		alert("operation: " + operation);
		
		if(operation == "modify"){
			frmModify.attr("action","${contextPath}/boards/modify");	
		}else if(operation == "remove"){
			frmModify.attr("action","${contextPath}/boards/delete");
		}else if(operation == "list"){
			frmModify.attr("action","${contextPath}/boards/list").attr("method","get");
			frmModify.empty();
		}
		frmModify.submit();
	});

</script>

<%@ include file="../myinclude/footer.jsp" %>