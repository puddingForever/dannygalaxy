<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../myinclude/myheader.jsp" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
    
    
    <small><strong>글작성&nbsp;</strong></small> 
	 <!-- 댓글시작 -->
	<div class="card" style="margin-top:20px">
	  <div class="card-body">
	  	<div id="inputReply">
	  		<form id="uploadForm" enctype="multipart/form-data">
	  		<!-- 댓글 입력창 -->
	  	   <small>[작성자]</small> 
	  	   <input type="text" class="form-control" name="cwriter" id="cwriter">
	  	   <small>[글입력칸]</small> 
	  	  <input type="text" class="form-control" id="ccontent" name="ccontent" placeholder="글을 입력하세요" style="width: 100%; height: 100px;">
	  	 <small>[이미지입력칸]</small> 
	  	 	<input type="file" name="imageFile" id="imageFile">
	  	  <button type="button" id="replyButton" class="btn btn-primary">입력</button>
	  	  </form>
	  	</div>
	  </div>
	</div>	  	
	   <!-- 댓글창 -->
      <div id="commentList" >      
      </div>

<script>

//입력 버튼을 클릭하면
$("#replyButton").on("click",function(){
	
	// 폼 데이터를 formData 객체에 담는다
	var formData = new FormData($("#uploadForm")[0]);
	
	// ajax로 컨트롤러에 요청을 보낸다
	$.ajax({
		url:"${contextPath}/community/registerCmt", // 요청 URL
		type:"post", // 요청 방식
		data:formData, // 요청 데이터
		contentType:"multipart/form-data",
		processData:false, // 데이터를 쿼리스트링으로 변환하지 않는다
		success:function(result){ // 성공적으로 응답을 받으면
			if(result == '성공'){ // 결과가 성공이면
				alert("등록이 성공하였습니다.") // 알림창을 띄우고
				showCmtList() // 댓글 목록을 갱신한다
				
			}else{ // 결과가 실패이면
				alert("등록이 실패하였습니다."); // 알림창을 띄운다
			}
			
		}//end-success
		
	})//end-ajax
	
})//end-replyButton

	
	
function showCmtList(){
	$.ajax({
		url:"${contextPath}/community/showCmtList",
		type:"get",
		success:function(result){
		
			var commentStr = "";
			
			for(var i=0; i<result.length; i++){
				commentStr += '<ul class="list-group list-group-flush">';
				commentStr += '	 <li class="list-group-item">작성자: '+result[i].cwriter+'&nbsp;작성날짜:'+result[i].cregDate+ '</li>';
				commentStr += '	 <li class="list-group-item">'+result[i].ccontent+'</li>';
				commentStr += '</ul>'
			}//end-for
			
			$("#commentList").html(commentStr);
			
		}//end-success
		
	})//ajax-end		
}//end-showCmtList()	


$(document).ready(function(){
 	showCmtList();
})
</script>    
<%@ include file="../myinclude/footer.jsp" %>