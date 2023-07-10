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
	  		<!-- 댓글 입력창 -->
	  	   <small>[작성자]</small> 
	  	   <input type="text" class="form-control" name="cwriter" id="cwriter">
	  	   <small>[글입력칸]</small> 
	  	  <input type="text" class="form-control" id="ccontent" name="ccontent" placeholder="글을 입력하세요" style="width: 100%; height: 100px;">
	  	  <button type="button" id="replyButton" class="btn btn-primary">입력</button>
	  	</div>
	  </div>
	</div>	  	
	   <!-- 댓글창 -->
      <div id="commentList" >      
      </div>

<script>



$("#replyButton").on("click",function(){
	
	
	var cwriter = $("#cwriter").val();
	var ccontent = $("#ccontent").val();
	
	var param = {cwriter:cwriter,ccontent:ccontent};
	
	$.ajax({
		url:"${contextPath}/community/registerCmt",
		type:"post",
		data:JSON.stringify(param),
		contentType:"application/json; charset=UTF-8",
		success:function(result){
			if(result == '성공'){
				alert("등록이 성공하였습니다.")
				showCmtList()
				
			}else{
				alert("등록이 실패하였습니다.");
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