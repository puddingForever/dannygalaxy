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


<script type="text/javascript" src="${contextPath }/resources/js/mycomment.js"></script>
<script>

var bnoValue ='<c:out value="${board.bno}"/>' ;

//myCommentClsr

/* myCommentClsr.removeCmtReply (
	{bno: bnoValue, rno: 6} ,
	
	function(result) {
		alert(result) ;
	} ,
	
	function(err) {
		alert("오류로 인한 삭제 취소.\r" + err) ;
	}
	

) ; */

/*
myCommentClsr.modifyCmtReply(
	{bno: bnoValue, rno: 2, rcontent: "JS클로저답글댓글수정===="} ,
	function(result){
		alert(result) ;
	}
);



myCommentClsr.getCmtReply(
	{bno: bnoValue, rno: 1},
	function(data){
		console.log(data) ;
	}
);


myCommentClsr.registerReply(
	{bno: bnoValue, rcontent:"JS댓글의 답글등록1", rwriter:"user7", prno: 1} ,
	function(result){
		console.log("서버 등록 결과: " + result) ;
	}
);


myCommentClsr.registerCmt(
	{bno: bnoValue, rcontent:"JS댓글등록1", rwriter:"user7"} ,
	function(result){
		console.log("서버 등록 결과: " + result) ;
	}
);


*/

myCommentClsr.getCmtList(
		{bno: bnoValue} ,
		
		function (replyList) {
			for(var i = 0, len = replyList.length || 0 ; i < len ; i++){
				console.log(replyList[i]) ;
			}
		},
		
		function(err) {
			alert("오류" + err) ;
		}
		
);






</script>


<%@ include file="../myinclude/footer.jsp" %>