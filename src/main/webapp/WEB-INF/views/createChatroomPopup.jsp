<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
button {
	background-color: #FFBB00;
	font-size: 14px;
	color: #000;
	border: 1px solid #000;
	border-radius: 5px;
	padding: 3px;
	margin: 3px;
}

.inputTable th {
	padding: 5px;
}

.inputTable input {
	width: 330px;
	height: 25px;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<body>
	<div>
		<table class="inputTable">
			<tr>
				<th>방 제목</th>
				<th><input type="text" name="roomName" id="roomName"></th>
				<th><input type="text" name="userid" id="userid" value="${loginUser.userId }"></th>
				<th><button id="createRoom">방 만들기</button></th>
			</tr>
		</table>
	</div>
	<script src="./js/main.js"></script>
</body>
</html>