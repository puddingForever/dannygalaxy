<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../myinclude/myheader.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<div class="container" style="margin-top:50px">
<!-- 게시글 리스트 -->
<div class="container" style="margin-top:100px">
	<div class="card shadow">
		<div class="card-body">
			<div class="header" style="margin-bottom:5px">
				<h4 class="card-title">커뮤니티</h4>	
			</div>
			
			<!-- 게시판 -->
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
				<!-- 게시판 -->
				<tbody>
					<c:forEach var="board" items="${boardList}">	
						<tr>
							<td class="text-center d-none d-md-table-cell">${board.bno }</td>
							<td><a href='#'>${board.btitle }</a></td>
							<td class="text-center d-none d-md-table-cell">${board.bwriter }</td>
							<td class="text-center d-none d-md-table-cell"><fmt:formatDate pattern='yyyy/MM/dd HH:mm:ss' value='${board.bregDate }'/></td>	
							<td class="text-center d-none d-md-table-cell">${board.bviewsCnt }</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="text-right">
				<a href="${contextPath}/boards/register" class="btn btn-primary">글쓰기</a>
			</div>
			
			
		</div>
	</div>
</div>
	
	
	
	
</div>

<%@ include file="../myinclude/footer.jsp" %>
    
    