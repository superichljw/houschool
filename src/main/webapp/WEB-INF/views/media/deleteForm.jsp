<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
<style>
#updateform-table {
	width: 60%;
	margin: 0 auto;
	margin-top: 50px;
}

#updateform-table tr {
	height: 40px;
}

#updateform-table td {
	width: 150px;
	text-align: center;
	border-top: 1px solid whitesmoke;
	border-bottom: 1px solid whitesmoke;
	border-right: 1px solid whitesmoke;
}

#updateform-table td input {
	width: 160px;
	height: 26px;
}
</style>
<body>
	<%@ include file='../header.jsp'%>
	<form action="./mediaDelete" name="frm" method="post"
		enctype="multipart/form-data">
		<table id="updateform-table">
			<tr style="display: none;">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="4" style="font-size: 30px; height: 40px; border: none;">클래스
					삭제하기</td>
			</tr>
			<tr></tr>
			<tr>
				<td bgcolor="whitesmoke">글번호</td>
				<td><input type="text" name="mediano" value="${mvo.mediano }"
					readonly></td>
				<td bgcolor="whitesmoke">타이틀</td>
				<td><input type="text" name="title" placeholder="title"
					value="${mvo.title }"></td>
			</tr>
			<tr>
				<td bgcolor="whitesmoke" colspan="2">현재썸네일 파일명</td>
				<td style="font-size: 12px" colspan="2">${mvo.poster }</td>

			</tr>

			<tr>
				<td bgcolor="whitesmoke">현재 동영상 파일명</td>
				<td style="font-size: 12px">${mvo.poster }</td>
				<td bgcolor="whitesmoke">현재 동영상 사이즈</td>
				<td style="font-size: 12px">${mvo.filesize }KB</td>
			</tr>

			<tr>
				<td colspan="4"><button type="submit"
						style="height: 30px; width: 150px;">클래스 삭제하기</button></td>
			</tr>
		</table>
	</form>
</body>
<%@include file="../footer.jsp"%>
</html>