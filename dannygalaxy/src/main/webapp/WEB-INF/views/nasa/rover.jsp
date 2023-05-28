<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rover사진</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
</head>
<body>


<div class="container-fluid" style="padding:50px">

	<blockquote class="blockquote">
	  <p>Rover가 화성에서 촬영한 사진들을 검색해보세요</p>
	  <p>Rover의 화성 도착일 1sol 부터 1000sol까지의 화성 사진들을 보여줍니다.</p>
	  <p>Sol? 화성의 하루는 Sol이라는 단위를 쓰며,지구보다 24시간 37분 22초 정도 느립니다.</p> 
	</blockquote>

	 <div class="form-group">
	 	<form name="frmMarsSol">
	          <label class="col-form-label col-form-label-lg">화성의 하루(1~1000사이의 숫자를 입력해주세요 )</label>
	          	<input class="form-control form-control-lg" type="number" name="marsSol" min="0" max="1000"/> 
		            <button type="button" class="btn btn-primary btn-lg" onclick="inputValidate()">확인</button>
	     </form>
	</div>
		
	 <div class="row" style="margin-bottom: 2em">
	 	<c:choose>
	 		<c:when test="${not empty roverData.photos }" >
				<c:forEach var="photos" items="${roverData.photos}" >
					<div class="col-sm">
				   		<img src="${photos.img_src}" width="400px" style="padding:10px"/>
				   </div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				 <label class="col-form-label col-form-label-lg">Rover가 쉬는 날이였습니다!<br> 다른 날을 검색하세요</label>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<script>
	function inputValidate(){
		
		var frmMarsSol = document.frmMarsSol;
		
		var marsSol = frmMarsSol.marsSol.value;
		
		if(marsSol.length==0){
			alert("1에서 1000사이의 숫자를 입력해주세요");
			frmMarsSol.marsSol.focus();
			return;
		}else if(marsSol>1000){
			alert("1에서 1000사이의 숫자를 입력해주세요");
			frmMarsSol.marsSol.focus();
			return;
		}else if(marsSol<=0){
			alert("1에서 1000사이의 숫자를 입력해주세요");
			frmMarsSol.marsSol.focus();
			return;
		}
		
		frmMarsSol.method="GET";
		frmMarsSol.action="${contextPath}/news/rover";
		frmMarsSol.submit();
	}
</script>
</body>
</html>