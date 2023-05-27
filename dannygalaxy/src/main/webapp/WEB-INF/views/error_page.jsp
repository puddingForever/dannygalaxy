<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html lang="en">


    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>404에러</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>


    <body>
        <div class="d-flex align-items-center justify-content-center vh-100">
            <div class="text-center">
                <h1 class="display-1 fw-bold">404 에러발생</h1>
                <p class="fs-3">없는 페이지입니다.</p>
                <p class="lead">
						찾으시려는 페이지가 없습니다. 주소를 다시 확인해주세요 
                  </p>
                <a href="${contextPath }/" class="btn btn-primary">홈으로 돌아가기</a>
            </div>
        </div>
    </body>


</html>
<%@ include file="./myinclude/myfooter.jsp" %>