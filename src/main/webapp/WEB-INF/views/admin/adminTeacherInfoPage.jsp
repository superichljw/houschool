<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
.teacher-info-table td {
	border: 1px solid lightgray;
	text-align:center;
}
.teacher-info-table td:nth-child(1){
	width:80px;
}
.teacher-info-table td:nth-child(2){
	width:80px;
}
.teacher-info-table td:nth-child(3){
	width:80px;
}
.teacher-info-table td:nth-child(4){
	width:120px;
}
.teacher-info-table td:nth-child(5){
	width:200px;
}
.teacher-info-table td:nth-child(6){
	width:400px;
}

</style>
<script>
	function idCheck() {
		if (document.frm.userid.value == "") {
			alert('아이디를 입력하여 주십시오.');
			document.frm.userid.focus();
			return;
		}
		var url = "./school_id_check?userid=" + document.frm.userid.value;
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes,"
				+ " resizable=no, width=450, height=200");

	}
</script>
<body>
	<%@ include file='../header.jsp'%>
	<%-- <%@ include file='./adminSideMenu.jsp'%> --%>
	<div id="admin-main">
		<h1>선생님 리스트</h1>
		<div id="admin-left">
			<ul>
				<li></li>
				<li onclick="location.href='./adminInfoModifyPage'">개인정보수정</li>
				<li onclick="location.href='./adminTeacherInfoPage?schoolName=${loginUser.schoolName}'">교사정보조회</li>
				<li onclick="location.href='./adminStudentInfoPage?schoolName=${loginUser.schoolName}'">학생정보조회</li>
				<li onclick="location.href='./adminClassOfSchool'">시간표확인</li>
				<li onclick="location.href='./adminTimetableApply'">시간표등록</li>
				<li onclick="location.href='./board_write_page'">공지사항등록</li>
				<li onclick="location.href='./adminSlideChangePage'">메인슬라이드수정</li>
				<li onclick="location.href='./mediaCreate'">수업영상등록</li>
				<li></li>
			</ul>
		</div>
		<div id="admin-right">
			<%-- <form action="#" name="frm">
				<input type="text" name="schoolName"
					value="${loginUser.schoolName }"> <select
					name="teacher_subject">
					<option>과목</option>
					<option value="english">영어</option>
					<option value="korean">국어</option>
					<option value="math">수학</option>
					<option value="science">과학</option>
					<option value="society">사회</option>
				</select> <select name="teacher_name">
					<option></option>
				</select> <input type="submit" value="검색">
			</form> --%>
			<table class="teacher-info-table">
				<tr>
					<td>분류</td>
					<td>담당과목</td>
					<td>이름</td>
					<td>연락처</td>
					<td>이메일</td>
					<td>주소</td>
				</tr>
				<c:forEach items="${teacher_list }" var="teacher_list">
					<tr>
						<td>${teacher_list.type }</td>
						<td>${teacher_list.major }</td>
						<td>${teacher_list.userName }</td>
						<td>${teacher_list.userPhone }</td>
						<td>${teacher_list.userEmail }</td>
						<td>${teacher_list.userAdres }</td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>