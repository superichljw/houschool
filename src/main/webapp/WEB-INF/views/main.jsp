<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
</head>
<style>
#main-middle {
	text-align: center;
}

#main-middle ul {
	list-style-type: none;
	margin-left: -40px;
}

#main-middle ul li {
	width: 44.7%;
	height: 400px;
	margin-top: 20px;
	border: 1px solid black;
	display: inline-block;
	border: 1px solid black;
}

#main-middle #timetable {
	width: 80%;
	margin: 0 auto;
	text-align: center;
}

#main-middle #timetable tr th {
	width: 100px;
	height: 50px;
}

#medialist-middle {
	margin: 0 auto;
	text-align: center;
	width: 95%;
}

#medialist-middle .medialist-middle-title {
	text-align: center;
	height: 100px;
	line-height: 100px;
	font-size: 20px;
	width: 250px;
	margin-left: 50px;
	display: inline-block;
	float: left;
}

#medialist-middle .more-school-class {
	height: 100px;
	line-height: 100px;
	font-size: 15px;
	width: 250px;
	display: inline-block;
	margin-right: 200px;
}

#medialist-middle .more-school-class:hover {
	cursor: pointer;
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

#medialist-middle .grid-div {
	width: 301px;
	height: 301px;
}

#medialist-middle .grid-div .outer-div {
	width: 300px;
	height: 30px;
}

#medialist-middle .grid-div .outer-div .inner-div-first {
	width: 100px;
	height: 30px;
	line-height: 30px;
	float: left;
	background-color: lightblue;
}

#medialist-middle .grid-div .outer-div .inner-div-second {
	width: 199px;
	height: 30px;
	line-height: 30px;
	float: left;
	border-top: 1px solid lightgray;
	border-right: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
}

#medialist-middle .outer-div a {
	text-decoration: none;
}

#medialist-public {
	margin: 0 auto;
	text-align: center;
	width: 95%;
}

#medialist-public .medialist-middle-title {
	text-align: center;
	height: 100px;
	line-height: 100px;
	font-size: 20px;
	width: 250px;
	margin-left: 50px;
	display: inline-block;
	float: left;
}

#medialist-public .more-school-class {
	height: 100px;
	line-height: 100px;
	font-size: 15px;
	width: 250px;
	display: inline-block;
	margin-right: 200px;
}

#medialist-public .more-school-class:hover {
	cursor: pointer;
}

#medialist-public .class-info {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-gap: 10px;
}

#medialist-public .class-info {
	grid-column: 1/4;
	padding-left: 40px;
}

#medialist-public .td-thumnail {
	width: 300px;
	height: 200px;
	float: left;
	background-color: lightgray;
}

#medialist-public .td-thumnail img {
	max-width: 100%;
	max-height: 100%;
}

#medialist-public .td-thumnail img:hover {
	cursor: pointer;
}

#medialist-public .grid-div {
	width: 301px;
	height: 301px;
}

#medialist-public .grid-div .outer-div {
	width: 300px;
	height: 30px;
}

#medialist-public .grid-div .outer-div .inner-div-first {
	width: 100px;
	height: 30px;
	line-height: 30px;
	float: left;
	background-color: lightblue;
}

#medialist-public .grid-div .outer-div .inner-div-second {
	width: 199px;
	height: 30px;
	line-height: 30px;
	float: left;
	border-top: 1px solid lightgray;
	border-right: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
}

#medialist-public .outer-div a {
	text-decoration: none;
}
</style>
<body>
	<%@ include file='./header.jsp'%>

	<section>
		<div class="slide">
			<c:choose>
				<c:when test="${empty loginUser }">
					<ul>
						<li><img src="./slide/mainSlide1_kor.jpg"></li>
						<li><img src="./slide/mainSlide1_eng.jpg"></li>
						<li><img src="./slide/mainSlide2_kor.jpg"></li>
						<li><img src="./slide/mainSlide2_eng.jpg"></li>
					</ul>
				</c:when>
				<c:otherwise>

					<ul>
						<li><img src="./slide/${slide1.slideImg }"></li>
						<li><img src="./slide/${slide2.slideImg }"></li>
						<li><img src="./slide/${slide3.slideImg }"></li>
						<li><img src="./slide/${slide4.slideImg }"></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
	<section>
		<!-- <div id="main-middle">
			<ul>
				<li><h3>우리학교 게시판</h3></li>
				<li>
					<h3>나의 시간표</h3>
					<table id="timetable">
						<tr>
							<th>시간표</th>
							<th>MON</th>
							<th>TUE</th>
							<th>WED</th>
							<th>THU</th>
							<th>FRI</th>
						</tr>
					</table>
				</li>
			</ul>
		</div> -->
		<c:choose>
			<c:when test="${empty loginUser }">
				<div id="medialist-middle">
					<div class="medialist-middle-title">HOUSCHOOL 신규 학교 수업</div>
					<div class="more-school-class"
						onclick="location.href='./mediaList'">+ 클래스 더보기</div>
					<div class="class-info">
						<c:forEach var="mvo" items="${list}">
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
						</c:forEach>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div id="medialist-middle">
					<div class="medialist-middle-title">HOUSCHOOL 신규 학교 수업</div>
					<div class="more-school-class"
						onclick="location.href='./mediaList'">+ 클래스 더보기</div>
					<div class="class-info">
						<c:forEach var="msl" items="${myschoolList}">
							<div class="grid-div">
								<div class="outer-div">
									<div class="inner-div-first">학교명</div>
									<div class="inner-div-second">${msl.schoolName }</div>
								</div>
								<div class="outer-div">
									<div class="inner-div-first">수업명</div>
									<div class="inner-div-second">
										<a href="mediaRead?mediano=${msl.mediano }">${msl.title }</a>
									</div>
								</div>
								<div class="outer-div">
									<div class="inner-div-first">수업타입</div>
									<div class="inner-div-second">${msl.classType }</div>
								</div>
								<div class="td-thumnail">
									<img src="./storage/${msl.poster }"
										onclick="location.href='mediaRead?mediano=${msl.mediano }'">
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:otherwise>
		</c:choose>


		<div id="medialist-public">
			<div class="medialist-middle-title">HOUSCHOOL 신규 교양 수업</div>
			<div class="more-school-class" onclick="location.href='./mediaList'">+
				클래스 더보기</div>
			<div class="class-info">
				<c:forEach var="plist" items="${publicList}">
					<div class="grid-div">
						<div class="outer-div">
							<div class="inner-div-first">선생님</div>
							<div class="inner-div-second">${plist.userId }</div>
						</div>
						<div class="outer-div">
							<div class="inner-div-first">수업명</div>
							<div class="inner-div-second">
								<a href="mediaRead?mediano=${plist.mediano }">${plist.title }</a>
							</div>
						</div>
						<div class="outer-div">
							<div class="inner-div-first">수업타입</div>
							<div class="inner-div-second">${plist.classType }</div>
						</div>
						<div class="td-thumnail">
							<img src="./storage/${plist.poster }"
								onclick="location.href='mediaRead?mediano=${plist.mediano }'">
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- <section>
		<div class="item-list">
			<ul>
				<li style="background-image: url('./img/main_slide01.png')"></li>
				<li style="background-image: url('./img/main_slide02.png')"></li>
				<li style="background-image: url('./img/main_slide03.png')"></li>
				<li style="background-image: url('./img/main_slide04.png')"></li>
			</ul>
		</div>
	</section> -->
</body>
<%@include file="./footer.jsp"%>
</html>