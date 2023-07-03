<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../myinclude/myheader.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<div class="container">

<%-- 로켓 모델  --%>

<div class="rocketModel" style="margin-top:20px">
<div class="row">
	<div class="col-4">
		
<label>New Shepard</label>
</div>
<div class="col-4">
<label>Nuri</label>
</div>
<div class="col-4">
<label>spaceX</label>
</div>
</div>
<div class="row">
	<div class="col-4">	
		<img src="${contextPath }/resources/image/newshap.jpg"  style="width:300px; height:300px">
	</div>
	<div class="col-4">
		
		<img src="${contextPath }/resources/image/nuri.jpg" style="width:300px; height:300px">
	</div>
	<div class="col-4">	
		<img src="${contextPath }/resources/image/starx.jpeg" style="width:300px; height:300px">
	</div>
	</div>
</div>

<div class="row" style="margin-top:20px" >

<form method="get" action="${contextPath}/shop/rocketList">
<div class="col-4">
<label>로켓을 선택해주세요</label>
<select class="form-select" name="rocketName" aria-label="Default select example">
  <option value="NewShepard">New Shepard</option>
  <option value="Nuri">Nuri</option>
  <option value="spaceX">spaceX</option>
</select>
</div>
<div class="col-4">
<label>날짜를 선택해주세요</label>
 <input type="date" id="boardDate" name="boardingDate" />
 </div>
 <div class="col-4">
 	<button type="submit" class="btn btn-primary">검색</button>
 </div>
</form>

</div>

<%-- 카테고리 선택   --%>
		<div class="btn-group" style="margin-top:20px" role="group" aria-label="Basic radio toggle button group">
		  <button class="btn btn-outline-primary"  type="button" id="highSpeed">엔진추력 높은순</button>
		  <button class="btn btn-outline-primary"  type="button"  id="lowPrice">낮은가격순</button>
		  <button class="btn btn-outline-primary" type="button" id="highPrice">높은가격순</button>  
		</div>

<%-- 로켓 리스트 화면 https://ko.wikipedia.org/wiki/%EB%A1%9C%EC%BC%93_%EC%97%94%EC%A7%84_%EB%B9%84%EA%B5%90 --%>
<div id="resultList">
	<c:forEach var="rocket" items="${rocketList }">
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">${rocket.rkNo }</li>
		  <li class="list-group-item">로켓이름 : ${rocket.rkName }</li>
		  <li class="list-group-item">탑승비용 : ${rocket.rkPrice }원</li>
		  <li class="list-group-item">엔진 추력 : ${rocket.rkEngine } kN</li>
		  <li class="list-group-item">출발일 : ${rocket.rkAvailDate }</li>
		  <li class="list-group-item">탑승인원수 : ${rocket.rkPeopleCnt }</li>		 
		</ul>	
		 <button class="btn btn-primary">예약하기</button>
	</c:forEach>
</div>
	
</div>

 <!-- jQuery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

$("#highSpeed").on("click",function(){
	
	var highSpeed = 1;
	
	$.ajax({
		url:"${contextPath}/shop/rocketSpeed/"+highSpeed,
		dataType:"json",
		type:"get",
		success:function(rocketList){
			
			
			$("#resultList").empty();
			
			for(var i=0; i<rocketList.length; i++ ){
				$("#resultList").append('<ul class="list-group list-group-flush">');
				$("#resultList").append(' <li class="list-group-item"> '+rocketList[i].rkNo+'</li>');
				$("#resultList").append(' <li class="list-group-item">로켓이름 : '+rocketList[i].rkName+'</li>');
				$("#resultList").append(' <li class="list-group-item">탑승비용 : '+rocketList[i].rkPrice+'원 </li>');
				$("#resultList").append(' <li class="list-group-item">엔진 추력 :'+rocketList[i].rkEngine+'kN </li>');
				$("#resultList").append(' <li class="list-group-item">출발일 :'+rocketList[i].rkAvailDate+'</li>');
				$("#resultList").append(' <li class="list-group-item">탑승인원수 :'+rocketList[i].rkPeopleCnt+'</li>');
				$("#resultList").append(' </ul> ');
				$("#resultList").append(' <button class="btn btn-primary">예약하기</button> ');
			}
		}
	}) //end-ajax
	
	
	
})


$("#highPrice").on("click",function(){
	var highPrice = 1;
	$.ajax({
		url:"${contextPath}/shop/rocketOrderHigh/"+highPrice,
		dataType:"json",
		type:"get",
		success:function(rocketList){
			$("#resultList").empty();		
			for(var i=0; i<rocketList.length; i++ ){
				$("#resultList").append('<ul class="list-group list-group-flush">');
				$("#resultList").append(' <li class="list-group-item"> '+rocketList[i].rkNo+'</li>');
				$("#resultList").append(' <li class="list-group-item">로켓이름 : '+rocketList[i].rkName+'</li>');
				$("#resultList").append(' <li class="list-group-item">탑승비용 : '+rocketList[i].rkPrice+'원 </li>');
				$("#resultList").append(' <li class="list-group-item">엔진 추력 :'+rocketList[i].rkEngine+'kN </li>');
				$("#resultList").append(' <li class="list-group-item">출발일 :'+rocketList[i].rkAvailDate+'</li>');
				$("#resultList").append(' <li class="list-group-item">탑승인원수 :'+rocketList[i].rkPeopleCnt+'</li>');
				$("#resultList").append(' </ul> ');
				$("#resultList").append(' <button class="btn btn-primary">예약하기</button> ');
			}
		}
	})//end-ajax
})
	

$("#lowPrice").on("click",function(){
	var lowPrice = 2;
	$.ajax({
		url:"${contextPath}/shop/rocketOrderLow/"+lowPrice,
		dataType:"json",
		type:"get",
		success:function(rocketList){
			$("#resultList").empty();			
			for(var i=0; i<rocketList.length; i++ ){
				$("#resultList").append('<ul class="list-group list-group-flush">');
				$("#resultList").append(' <li class="list-group-item"> '+rocketList[i].rkNo+'</li>');
				$("#resultList").append(' <li class="list-group-item">로켓이름 : '+rocketList[i].rkName+'</li>');
				$("#resultList").append(' <li class="list-group-item">탑승비용 : '+rocketList[i].rkPrice+'원 </li>');
				$("#resultList").append(' <li class="list-group-item">엔진 추력 :'+rocketList[i].rkEngine+'kN </li>');
				$("#resultList").append(' <li class="list-group-item">출발일 :'+rocketList[i].rkAvailDate+'</li>');
				$("#resultList").append(' <li class="list-group-item">탑승인원수 :'+rocketList[i].rkPeopleCnt+'</li>');
				$("#resultList").append(' </ul> ');
				$("#resultList").append(' <button class="btn btn-primary">예약하기</button> ');
			}
		}
	})
	
	
})
	

	
	
</script>
<%@ include file="../myinclude/footer.jsp" %>