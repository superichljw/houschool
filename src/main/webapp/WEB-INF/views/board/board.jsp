<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.board {
	width: 80%;
	margin: 0 auto;
	margin-top: 60px;
}

.board ul {
	list-style: none;
}

.board ul li {
	display: inline-block;
	text-align: center;
	padding-top: 10px;
	padding-bottom: 10px;
}

.board li:nth-child(1) {
	width: 10%;
}

.board li:nth-child(2) {
	width: 50%;
}

.board li:nth-child(3) {
	width: 15%;
}

.board li:nth-child(4) {
	width: 10%;
}

.board li:nth-child(5) {
	width: 10%;
}

#board-back {
	width: 80%;
	margin: 0 auto;
}

#board-back a {
	text-decoration: none;
}

#board-back input {
	height: 26px;
}

#board-back table {
	margin: 0 auto;
}

#board-back table tr th {
	height: 30px;
	font-weight: normal;
	background-color: lightblue;
}

#board-back table tr th:nth-child(1) {
	width: 100px;
}

#board-back table tr th:nth-child(2) {
	width: 100px;
}

#board-back table tr th:nth-child(3) {
	width: 500px;
}

#board-back table tr th:nth-child(4) {
	width: 150px;
}

#board-back table tr th:nth-child(5) {
	width: 180px;
}

#board-back table tr td {
	text-align: center;
	height: 25px;
	font-size: 15px;
	background-color:#f6f6f6;
	font-size: 15px;
}

#board-back table td th:nth-child(1) {
	width: 100px;
}

#board-back table td th:nth-child(2) {
	width: 100px;
}

#board-back table td th:nth-child(3) {
	width: 500px;
}

#board-back table td th:nth-child(4) {
	width: 150px;
}

#board-back table td th:nth-child(5) {
	width: 180px;
}
/* 보드 페이징 */
.board-pageNum {
	text-align: center;
	padding: 30px 0px;
}

.board-pageNum ul {
	list-style-type: none;
	margin-left: -40px;
}

.board-pageNum li {
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-left: 10px;
}

.board-pageNum li:hover {
	background-color: #22a8f1;
	color: white;
	cursor: pointer;
}

.board-pageNum a {
	text-decoration: none;
}
</style>
<meta charset="UTF-8">
<title>게시판페이지</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div id="board-back">
		<!-- <input type="button" value="공지사항 글쓰기"
			onclick="location.href='./board_write_page'"> -->
		<table>
			<tr>
				<th>글번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>게시날짜</th>
				<th>게시자</th>
			</tr>
			<c:forEach items="${board_list }" var="board_list">
				<tr>
					<td><a href="./board_content_view?board_num=${board_list.board_num }">${board_list.board_num }</a></td>
					<td>${board_list.board_category }</td>
					<td><a href="./board_content_view?board_num=${board_list.board_num }">${board_list.board_title }</a></td>
					<td>${board_list.board_date }</td>
					<td>${board_list.board_author }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="board-pageNum">
			<tr>
				<td colspan="5"><a
					href="./board?page=${board_page.firstPageNum }
			&pageDataCount=${board_page.pageDataCount}">
						◀◀맨앞으로 </a>&nbsp;&nbsp; <a
					href="./board?page=${board_page.prevPageNum }
			&pageDataCount=${board_page.pageDataCount}">
						◀앞으로 </a>&nbsp;&nbsp; <c:forEach var="i"
						begin="${board_page.startPageNum }"
						end="${board_page.endPageNum }" step="1">
						<c:choose>
							<c:when test="${i eq board_page.currentPageNum }">
								<a style="font-weight: bold; color: blue"
									href="./board?page=${i }
				&pageDataCount=${board_page.pageDataCount}">${i }
								</a>&nbsp;&nbsp;
			</c:when>
							<c:otherwise>
								<a
									href="./board?page=${i }
			&pageDataCount=${board_page.pageDataCount}">${i }
								</a>&nbsp;&nbsp;
			</c:otherwise>
						</c:choose>
					</c:forEach> <a
					href="./board?page=${board_page.nextPageNum }
			&pageDataCount=${board_page.pageDataCount}">뒤로▶
				</a>&nbsp;&nbsp; <a
					href="./board?page=${board_page.lastPageNum }
			&pageDataCount=${board_page.pageDataCount}">맨뒤로▶▶
				</a></td>
			</tr>
		</div>
	</div>
</body>
<%@include file="../footer.jsp"%>
</html>