<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>msgView.jsp</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
<style type="text/css">

</style>

</head>
<body>
<%@ include file='../header.jsp'%>
	<div class="title">알림</div>
	<div class="content">
		<dl>
			<dd>${msg1 !=null ? img : "" }${msg1 }</dd>
			<dd>${msg2 !=null ? img : "" }${msg2 }</dd>
			<dd>${msg3 !=null ? img : "" }${msg3 }</dd>
		</dl>
		<p>${link1 } ${link2 } ${link3 }</p>
	</div>
</body>
<%@include file="../footer.jsp"%>
</html>

