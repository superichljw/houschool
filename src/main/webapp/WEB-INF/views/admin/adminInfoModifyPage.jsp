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
		<h1>학교 정보 수정</h1>
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
			<div>
				<form id="signupForm" action="#" name="frm">
					<div>
						<input type="hidden" name="userName" value="관리자">
						<ul id="school-search">
							<li>학교명</li>
							<li><input type="text" id="myschool" name="group-name"
								value="${loginUser.schoolName }" readonly>
								<button type="button" onclick="school_search()"
									style="height: 24px; margin-left: 4px; width: 50px">검색</button></li>
							<li>학교주소</li>
							<li><input type="text" id="myschool-adres"
								name="group-adres" style="width: 400px;"
								value="${loginUser.schoolAdres }" readonly></li>
							<li><input type="hidden" name="type" id="schoolType"></li>
						</ul>

						<ul>
							<li>아이디</li>
							<li><input type="text" class="textblock" name="userid"
								value="${loginUser.userId }"> <input type="hidden"
								name="reid" size="20" value="${reid }" /> <input type="button"
								value="중복체크" onclick="idCheck()" class="idck" /></li>
						</ul>
						<ul>
							<li>비밀번호</li>
							<li><input type="password" name="pw"
								style="font-family: gulim">
						</ul>
						<ul>
							<li>비밀번호 확인</li>
							<li><input type="password" name="pw_check"
								style="font-family: gulim">
						</ul>

						<ul>
							<li>전화번호</li>
							<li><input type="text" name="phone"
								value="${loginUser.userPhone }">
						</ul>
						<ul>
							<c:set var="orgdate" value="${loginUser.userDate }"></c:set>
							<c:set var="subdate" value="${fn:substring(orgdate,0,10 )}"></c:set>
							<c:set var="date" value="${fn:replace(subdate,'-','')}"></c:set>
							<li>개교기념일</li>
							<li><input type="text" name="birth" value="${date }"
								placeholder="   (구분자없이 8자리 입력 (예시) 19730203)">
						</ul>
						<ul>
							<li>이메일</li>
							<li><input type="text" name="email"
								value="${loginUser.userEmail }">
						</ul>

					</div>
					<div class='signup_submit'>
						<input type="submit" onclick="return school_check();" name="apply"
							style="margin-top: 40px; margin-left: 100px; width: 80px; height: 40px;"
							value="가입하기"> <input type="button"
							style="margin-top: 40px; margin-left: 20px; width: 80px; height: 40px;"
							value="취소하기" onclick="window.location.reload(true)">
					</div>
				</form>
			</div>
		</div>

	</div>
	<%@include file="../footer.jsp"%>
</body>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>