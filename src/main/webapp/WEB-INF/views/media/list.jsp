<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
<style type="text/css">
.class-list-title {
	text-align: center;
	height: 100px;
	line-height: 100px;
	font-size: 20px;
}

.class-list-title input {
	width: 100px;
	height: 30px;
	margin-left: 50px;
}

#table-top {
	width: 80%;
	text-align: center;
	margin: 0 auto;
}

.thumnail {
	width: 50px;
	height: 50px;
	margin: 0 auto;
}

.thumnail img {
	max-width: 100%;
	max-height: 100%;
}

#medialist-middle {
	margin: 0 auto;
	text-align: center;
	width: 95%;
}

#medialist-middle .class-info {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-gap: 10px;
}

#medialist-middle .class-info {
	grid-column: 1/4;
	padding-left: 40px;
}

#medialist-middle .td-thumnail {
	width: 300px;
	height: 200px;
	float: left;
	background-color: lightgray;
}

#medialist-middle .td-thumnail img {
	max-width: 100%;
	max-height: 100%;
}

#medialist-middle .td-thumnail img:hover {
	cursor: pointer;
}

.grid-div .outer-div {
	width: 300px;
	height: 30px;
}

.grid-div .outer-div .inner-div-first {
	width: 100px;
	height: 30px;
	line-height: 30px;
	float: left;
	background-color: lightblue;
}

.grid-div .outer-div .inner-div-second {
	width: 199px;
	height: 30px;
	line-height: 30px;
	float: left;
	border-top: 1px solid lightgray;
	border-right: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
}

.outer-div a {
	text-decoration: none;
}
</style>

</head>
<body>
	<%@ include file='../header.jsp'%>
	<div class="class-list-title">
		전체 수업 리스트 
		<!-- <input type="button" value="수업등록하기"
			onclick="location.href='mediaCreate'"> -->
	</div>

	<%-- 	<table id="table-top">
		<tr>
			<th>번호</th>
			<th>썸네일</th>
			<th>제목</th>
			<th>등록일</th>
			<th>영상파일명</th>
			<th>수정/삭제</th>
		</tr>
		<c:forEach var="mvo" items="${list}">
			<tr>
				<td>${mvo.mediano }</td>
				<td><div class="thumnail">
						<img src="./storage/${mvo.poster }">
					</div></td>
				<td><a href="mediaRead?mediano=${mvo.mediano }">${mvo.title }</a></td>
				<td>${mvo.rdate }</td>
				<td>${mvo.filename }<br> <c:set var="filesize"
						value="${mvo.filesize/1024 }"></c:set> <c:set var="filesize"
						value="${fn:substringBefore(filesize, '.')}"></c:set> ${filesize }
					KB
				</td>
				<td><input type="button" value="수정"
					onclick="location.href='mediaUpdate?mediano=${mvo.mediano}'">
					<input type="button" value="삭제"
					onclick="location.href='mediaDelete?mediano=${mvo.mediano}'">
				</td>
			</tr>
		</c:forEach>
	</table> --%>
	<div id="medialist-middle">

		<div class="class-info">
			<c:forEach var="mvo" items="${list}">
				<c:choose>
					<c:when test="${mvo.classType eq '학교수업' }">
						<div class="grid-div">
							<div class="outer-div">
								<div class="inner-div-first">학교명</div>
								<div class="inner-div-second">${mvo.schoolName }</div>
							</div>
							<div class="outer-div">
								<div class="inner-div-first">수업명</div>
								<div class="inner-div-second">
									<a href="mediaRead?mediano=${mvo.mediano }">${mvo.title }</a>
								</div>
							</div>
							<div class="outer-div">
								<div class="inner-div-first">수업타입</div>
								<div class="inner-div-second">${mvo.classType }</div>
							</div>
							<div class="td-thumnail">
								<img src="./storage/${mvo.poster }"
									onclick="location.href='mediaRead?mediano=${mvo.mediano }'">
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="grid-div">
							<div class="outer-div">
								<div class="inner-div-first">선생님</div>
								<div class="inner-div-second">${mvo.userId }</div>
							</div>
							<div class="outer-div">
								<div class="inner-div-first">수업명</div>
								<div class="inner-div-second">
									<a href="mediaRead?mediano=${mvo.mediano }">${mvo.title }</a>
								</div>
							</div>
							<div class="outer-div">
								<div class="inner-div-first">수업타입</div>
								<div class="inner-div-second">${mvo.classType }</div>
							</div>
							<div class="td-thumnail">
								<img src="./storage/${mvo.poster }"
									onclick="location.href='mediaRead?mediano=${mvo.mediano }'">
							</div>
						</div>
					</c:otherwise>
				</c:choose>

			</c:forEach>
		</div>
	</div>



</body>
<%@include file="../footer.jsp"%>
</html>
