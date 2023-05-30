<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%-- css 설정 --%>

<!DOCTYPE html>
<html lang="ko">

<head>
<link rel="shortcut icon" href="${contextPath}/resources/image/logo.png" type="image/x-icon">
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">   
<link href="${contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

</head>

<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <!-- Container wrapper -->
  <div class="container">
    <!-- Navbar brand -->
    <a class="navbar-brand me-2" href="${contextPath }/user/login">
      <img
        src="${contextPath }/resources/image/logo.png"
        height="38"
        alt="MDB Logo"
        style="margin-top: -1px;"
      />
    </a>

    <!-- Toggle button -->
    <button
      class="navbar-toggler"
      type="button"
      data-mdb-toggle="collapse"
      data-mdb-target="#navbarButtonsExample"
      aria-controls="navbarButtonsExample"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <i class="fas fa-bars"></i>
    </button>

    <!-- Collapsible wrapper -->
    <div class="collapse navbar-collapse" id="navbarButtonsExample">
      <!-- Left links -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="#">소개</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="${contextPath}/nasa/asteroids">실시간 소식</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="${contextPath}/user/login">로그인</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="#">상품예약</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="${contextPath}/boards/list">후기게시판</a>
        </li>
      </ul>
    </div>
    <!-- Collapsible wrapper -->
  </div>
  <!-- Container wrapper -->
</nav>
<!-- Navbar -->
