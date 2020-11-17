<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>readMP3.jsp</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<%@ include file='../header.jsp'%>
	<div class="title">음악듣기</div>
	<div class="content">
		${mvo.title }<br> <img src="./storage/${mvo.poster}" width="400">
		<br>
		<audio src="./storage/${mvo.filename }" controls autoplay></audio>
		<!-- autoplay : 자동재생 -->
	</div>
	<div class="bottom">
		<input type="button" value="음원목록" onclick="location.href='mediaList'">
		<input type="button" value="수정"
			onclick="location.href='mediaUpdate?mediano=${mvo.mediano}'">
		<input type="button" value="삭제"
			onclick="location.href='mediaDelete?mediano=${mvo.mediano}'">
	</div>
</body>
<%@include file="../footer.jsp"%>
</html>
