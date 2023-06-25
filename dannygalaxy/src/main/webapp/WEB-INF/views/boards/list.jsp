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
			
			
		<div style="text-align: center;">		<%--  페이지네이션 --%>
	<div class="d-none d-md-block">
				<ul class="pagination justify-content-center">
				<c:if test="${pagingCreator.prev}">
				<li class="page-item disabled">
					<a href="${contextPath }/boards/list?pageNum=1" class="page-link">처음</a>
				</li>
				</c:if>
				<c:if test="${pagingCreator.prev}">
				<li class="page-item disabled">
					<a href="${contextPath }/boards/list?pageNum=${pagingCreator.startPagingNum-1}" class="page-link">prev</a>
				</li>
				</c:if>
				
				<c:forEach var="pagePlace" begin="${pagingCreator.startPagingNum }" end="${pagingCreator.endPagingNum }">
					<c:choose>
					<c:when test="${pagePlace == pagingCreator.boardPagingDTO.pageNum }">					
					<li class="page-item active">
						<a href="${contextPath}/boards/list?pageNum=${pagePlace}" class="page-link">${pagePlace }</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${contextPath }/boards/list?pageNum=${pagePlace}" class="page-link">${pagePlace }</a>
					</li>
					</c:otherwise>		
					</c:choose>
				</c:forEach>
				
				<c:if test="${pagingCreator.next}">
				<li class="page-item disabled">
					<a href="${contextPath }/boards/list?pageNum=${pagingCreator.lastPageNum}" class="page-link">마지막</a>
				</li>
				</c:if>
				<c:if test="${pagingCreator.next}">
				<li class="page-item disabled">
					<a href="${contextPath }/boards/list?pageNum=${pagingCreator.endPagingNum + 1}" class="page-link">다음</a>
				</li>
				</c:if>				
			</ul>	
		</div>
		
		</div>		
		
		</div>			<%--  페이지네이션 끝 --%>		
			
			<div class="text-right">
				<a href="${contextPath}/boards/register" class="btn btn-primary">글쓰기</a>
			</div>
			
		</div>
	</div>
	
	





<%@ include file="../myinclude/footer.jsp" %>
