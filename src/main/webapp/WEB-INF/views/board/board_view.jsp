<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
</head>
<style>
#board-write-back {
	width: 70%;
	margin: 0 auto;
}

#board-write-back h1 {
	text-align: center;
}

#board-write-back form {
	width: 100%;
}

#board-write-back table {
	border:1px solid lightgray;
	width: 100%;
}

#board-write-back table tr td input {
	text-align: left;
}

#board-write-back table td {
	width: 100px;
	height: 31px;
	text-align: center;
}

#board-write-back table .content {
	padding-left: 50px;
	text-align: left;
}

</style>
<script>
	
</script>
<body>
	<%@include file="../header.jsp"%>
	<div id="board-write-back">
		<h1>게시판글보기</h1>
		
			<table>
				<tr>
					<td bgcolor="lightblue">분류</td>
					<td class="category">${bView.board_category }</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

				</tr>
				<tr>
					<td bgcolor="lightblue">게시글제목</td>
					<td colspan="3" class="title">${bView.board_title }</td>
					<td bgcolor="lightblue">작성자</td>
					<td class="author">${bView.board_author }</td>
				</tr>
				<tr>
					<td bgcolor="lightblue">첨부파일</td>
					<td colspan="2"><c:if
							test="${bView.board_uuidFileName ne null}">
							<li><a
								href="./board_download?fileName=${bView.board_uuidFileName}">${bView.board_orgFileName}</a></li>
						</c:if></td>
					<td bgcolor="lightblue">작성날짜</td>
					<td colspan="2">${bView.board_date }</td>
				</tr>
				<tr>
					<td colspan="6" bgcolor="lightblue">게시글 내용</td>
				</tr>
				<tr>
					<td colspan="6" class="content">${bView.board_content }</td>
				</tr>
			</table>

	</div>

</body>
<%@include file="../footer.jsp"%>

</html>