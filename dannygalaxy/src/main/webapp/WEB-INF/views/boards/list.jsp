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
		
				<!--  페이징 처리  -->
			
			
			<div class="text-right">
				<a href="${contextPath}/boards/register" class="btn btn-primary">글쓰기</a>
			</div>
			
		</div>
	</div>
</div>

<%@ include file="../myinclude/myfooter.jsp" %>
