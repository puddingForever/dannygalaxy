<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../myinclude/myheader.jsp" %>
<c:set var='contextPath' value="${pageContext.request.contextPath }"/>

<!-- 게시글 리스트 -->
<div class="container" style="margin-top:100px">
	<div class="card shadow">	
		<div class="card-body">
			<h4 class="card-title">&nbsp;후기게시판</h4>	
			<table class="table table-hover" id='board_list'>
				<thead>
					<tr>
						<th class="text-center d-none d-md-table-cell">글번호</th>
						<th class="w-50">제목</th>
						<th class="text-center d-none d-md-table-cell">작성자</th>
						<th class="text-center d-none d-md-table-cell">작성날짜</th>
						<th class="text-center d-none d-md-table-cell">조회수</th>
						
					</tr>
				</thead>
				<tbody>

<c:forEach var='obj' items="${boardList}">
	<c:choose>
		<c:when test="${obj.bdelFlag == 1}">
			<tr style="background-color: Moccasin; text-align: center">
			    <td>${obj.bno }</td>
			    <td colspan="4"><em>작성자에 의해서 삭제된 게시글입니다.</em></td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
			<td class="text-center d-none d-md-table-cell">${obj.bno }</td>
			<td><a href='${contextPath }/boards/detail?bno=${obj.bno}'>${obj.btitle}</a></td>
			<td class="text-center d-none d-md-table-cell">${obj.bwriter}</td>
			<td class="text-center d-none d-md-table-cell"><fmt:formatDate value="${obj.bregDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td class="text-center d-none d-md-table-cell">${obj.bviewsCnt}</td>
			</tr>
	</c:otherwise>
	</c:choose>
</c:forEach>
			</tbody>
			</table>
			
			
		<div style="text-align: center;">		
					
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		  	<c:if test="${pagingCreator.prev }">
		  	    <li class="page-item prev"><a class="page-link" href="1">&laquo;</a></li>
		  	</c:if>
		  	<c:if test="${pagingCreator.prev }">
		  	    <li class="page-item prev"><a class="page-link" href="${pagingCreator.startPagingNum-1 }">prev</a></li>
		  	</c:if>
		  	<c:forEach var="pageNum" begin="${pagingCreator.startPagingNum }" end="${pagingCreator.endPagingNum }">
		  			    <li class='page-item ${pagingCreator.boardPagingDTO.pageNum == pageNum ? "active" :"" }'>
		  			    <a class="page-link" href="${pageNum }">${pageNum }</a>
		  			    </li>
		  	</c:forEach>
		    <c:if test="${pagingCreator.next}">
		  	    <li class="page-item next"><a class="page-link" href="${pagingCreator.endPagingNum + 1 }">next</a></li>
		  	</c:if>
		  	<c:if test="${pagingCreator.next }">
		  	    <li class="page-item next"><a class="page-link" href="${pagingCreator.lastPageNum }}">&laquo;</a></li>
		  	</c:if>
		  </ul>
		</nav>
	</div>				
			
			<div class="text-right">
				<a href="${contextPath}/boards/register" class="btn btn-primary">글쓰기</a>
			</div>
			
		</div>
	</div>
	
	<form id="frmSendValue">
		<input type='hidden' name='pageNum' value='${pagingCreator.boardPagingDTO.pageNum }'>
		<input type='hidden' name='rowAmountPerPage' value='${pagingCreator.boardPagingDTO.rowAmountPerPage }'>
		<input type='hidden' name='lastPageNum' value='${pagingCreator.lastPageNum }'>
	</form>
</div>


<script>


const link = document.querySelectorAll(".page-link");

function handleLink(event){
	event.preventDefault();
	var frmSendValue = document.getElementById("frmSendValue"); 
	frmSendValue.querySelector("input[name='pageNum']").value;
	frmSendValue.method="get";
	frmSendValue.action="${contextPath}/boards/list";
	frmSendValue.submit();	
}

link.forEach((element)=>{
	
	element.addEventListener("click",handleLink);
})







</script>

<%@ include file="../myinclude/myfooter.jsp" %>
