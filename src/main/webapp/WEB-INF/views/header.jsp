<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<div>
		<div id="logo_area">
			<div class="logo" onclick="location.href='./main'">
				<h1>HOUSCHOOL</h1>
				<h3>내 방이 학교가 되는 곳</h3>
			</div>
		</div>
		<div id="button_menu">
			<a href="#" class="menu-button"> <span></span> <span></span> <span></span>
				<span></span>
			</a>
			<div class="overlay">
				<nav class="menu">
					<ul>
						<li><a href="./main">HOME</a></li>
						<li><a href="./board">BOARD</a></li>
						<!-- <li><a href="./classOfSchool">CLASS</a></li>
						<li><a href="./timetableApplyPage">CLASS APPLY</a></li> -->
						<li><a href="./mediaList">MEDIA CLASS LIST</a></li>
						<!-- <li><a href="#">Contact</a></li>
						<li><a href="./chatroom_list">Chat-Room</a></li> -->
					</ul>
				</nav>
			</div>
		</div>
		<div id="account">
		<c:choose>
			<c:when test="${empty loginUser}">
					<ul>
						<li><input type="button" value="회원가입"
							onclick="location.href='./page_signup'"></li>
						<li><input type="button" value="로그인"
							onclick="location.href='./loginMain'"></li>
					</ul>
				</c:when>
				
				<c:when test="${loginUser.type == 'teacher' }">
					<ul>
						<li>${loginUser.userName } 선생님</li>
						<li><input type="button" value="로그아웃" onclick="location.href='./logout'"></li>
						<li><input type="button" value="마이 페이지" onclick="location.href='./mypageMain'"></li>
					</ul>
				</c:when>
				<c:when test="${loginUser.type eq 'student' }">
					<ul>
						<li>${loginUser.userName } 학생</li>
						<li><input type="button" value="로그아웃" onclick="location.href='./logout'"></li>
						<li><input type="button" value="마이 페이지" onclick="location.href='./mypageMain'"></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul>
						<li>${loginUser.schoolName }</li>
						<li><input type="button" value="로그아웃" onclick="location.href='./logout'"></li>
						<li><input type="button" value="관리자페이지"
							onclick="location.href='./adminMain'"></li>
					</ul>
				</c:otherwise>
		</c:choose>
		</div>
	</div>
</header>