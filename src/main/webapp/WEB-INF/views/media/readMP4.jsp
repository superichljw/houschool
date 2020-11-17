<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>readMP4.jsp</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
<style type="text/css">
.mediaclass-detail-show {
	width: 70%;
	margin: 0 auto;
	margin: 0 auto;
}

.mediaclass-detail-show input {
	height: 30px;
	width: 100px;
	margin-left: 10px;
}

.mediaclass-detail-show tr {
	height: 30px;
}

.mediaclass-detail-show td {
	width: 150px;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file='../header.jsp'%>
	<%-- <div class="title">영상보기</div>
	<p>${mvo.schoolName }소속${mvo.schoolAdres }</p>
	<div class="content">
		${mvo.title }<br> <img src="./storage/${mvo.poster}" width="400">
		<br>
		<div class="video-screen">
			<video src="./storage/${mvo.filename }"
				poster="./storage/${mvo.poster }" width="500" controls>
		</div>
		</video>
		<!-- autoplay : 자동재생 -->
	</div>
	<div class="bottom">
		<input type="button" value="수업목록" onclick="location.href='mediaList'">
		<input type="button" value="수정"
			onclick="location.href='mediaUpdate?mediano=${mvo.mediano}'">
		<input type="button" value="삭제"
			onclick="location.href='mediaDelete?mediano=${mvo.mediano}'">
	</div> --%>

	<table class="mediaclass-detail-show">
		<tr style="display: none;">
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td bgcolor="lightblue">타이틀</td>
			<td>${mvo.title }</td>
			<td bgcolor="lightblue">메뉴</td>
			<td colspan="3"><input
				type="button" value="수업목록" onclick="location.href='mediaList'">
				<input type="button" value="수정"
				onclick="location.href='mediaUpdate?mediano=${mvo.mediano}'">
				<input type="button" value="삭제"
				onclick="location.href='mediaDelete?mediano=${mvo.mediano}'"></td>
		</tr>
		<tr>
			<td bgcolor="lightblue">학교</td>
			<td>${mvo.schoolName }</td>
			<td bgcolor="lightblue">학교주소</td>
			<td colspan="3">${mvo.schoolAdres }</td>
		</tr>
		<tr>
			<td colspan="6" bgcolor="lightblue">강의영상보기</td>
		</tr>
		<tr>
			<td colspan="6" ><video
					src="./storage/${mvo.filename }" poster="./storage/${mvo.poster }"
					width="600" controls></td>
		</tr>

	</table>
</body>
<%@include file="../footer.jsp"%>
</html>
