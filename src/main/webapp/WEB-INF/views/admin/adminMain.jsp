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
		<h1>관리자 페이지 메인</h1>
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
	</div>
	<%@include file="../footer.jsp"%>
</body>

</html>