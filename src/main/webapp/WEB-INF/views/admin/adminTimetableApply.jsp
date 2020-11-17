<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/tt_apply.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
<script src="./js/tt_apply.js"></script>
</head>
<style>
#tt_infoBox {
	margin-bottom: 50px;
}

#tt_infoBox select {
	height: 40px;
	width: 140px;
	text-align: center;
	margin-left: 20px;
}

#tt_infoBox input {
	height: 40px;
	width: 140px;
	text-align: center;
	margin-left: 20px;
}
</style>
<script>
	function tt_check() {
		if (document.frm.grade.value == "-1") {
			alert('학년을 입력하세요');
			frm.grade.focus();
			return false;
		}
		if (document.frm.batch.value == "-1") {
			alert('반을 입력하세요');
			frm.batch.focus();
			return false;
		}
		if (document.frm.semester.value == "-1") {
			alert('학기를 입력하세요');
			frm.semester.focus();
			return false;
		}
		return true;
		alert('시간표 등록이 완료되었습니다');
	}
</script>
<body>
	<%@ include file='../header.jsp'%>
	<div id="admin-main">
		<h1>시간표 입력하기</h1>
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
	<div id="table-block">
		<form action="./tt_apply" name="frm">
			<div id="tt_infoBox">
				<input type="text" name="schoolName" placeholder="'학교명' 을 입력하세요"
					value="${loginUser.schoolName}"> <input type="text"
					value="${loginUser.type}">
				<c:choose>
					<c:when test="${loginUser.type eq '초등학교' }">
						<select name="grade">
							<option value="-1">학년 선택</option>
							<option value="1">1학년</option>
							<option value="2">2학년</option>
							<option value="3">3학년</option>
							<option value="4">4학년</option>
							<option value="5">5학년</option>
							<option value="6">6학년</option>
						</select>
					</c:when>
					<c:when test="${loginUser.type eq '중학교' }">
						<select name="grade">
							<option value="-1">학년 선택</option>
							<option value="1">1학년</option>
							<option value="2">2학년</option>
							<option value="3">3학년</option>
						</select>
					</c:when>
					<c:when test="${loginUser.type eq '고등학교' }">
						<select name="grade">
							<option value="-1">학년 선택</option>
							<option value="1">1학년</option>
							<option value="2">2학년</option>
							<option value="3">3학년</option>
						</select>
					</c:when>
					<c:otherwise>
						<select name="grade">
							<option value="-1">학년 선택</option>
							<option value="1">1학년</option>
							<option value="2">2학년</option>
							<option value="3">3학년</option>
						</select>
					</c:otherwise>
				</c:choose>

				<select name="batch">
					<option value="-1">학급 선택</option>
					<option value="1">1반</option>
					<option value="2">2반</option>
					<option value="3">3반</option>
					<option value="4">4반</option>
					<option value="5">5반</option>
					<option value="6">6반</option>
					<option value="7">7반</option>
					<option value="8">8반</option>
					<option value="9">9반</option>
					<option value="10">10반</option>

				</select> <select name="semester">
					<option value="-1">학기 선택</option>
					<option value="1">1학기</option>
					<option value="2">2학기</option>
				</select>
			</div>

			<table id="timetableInClass">
				<tr>
					<th></th>
					<th>MON</th>
					<th>TUE</th>
					<th>WED</th>
					<th>TUR</th>
					<th>FRI</th>
				</tr>
				<tr>
					<td>1교시</td>
					<td><input type="text" name="subject_mon_1st"
						placeholder="과목명 입력" id="subject_mon_1st"> <input
						type="text" name="subject_mon_1st_teacher" placeholder="담당선생님 입력"
						id="subject_mon_1st_teacher"></td>
					<td><input type="text" name="subject_tue_1st"
						placeholder="과목명 입력" id="subject_tue_1st"> <input
						type="text" name="subject_tue_1st_teacher" placeholder="담당선생님 입력"
						id="subject_tue_1st_teacher"></td>
					<td><input type="text" name="subject_wed_1st"
						placeholder="과목명 입력" id="subject_wed_1st"> <input
						type="text" name="subject_wed_1st_teacher" placeholder="담당선생님 입력"
						id="subject_wed_1st_teacher"></td>
					<td><input type="text" name="subject_tur_1st"
						placeholder="과목명 입력" id="subject_tur_1st"> <input
						type="text" name="subject_tur_1st_teacher" placeholder="담당선생님 입력"
						id="subject_tur_1st_teacher"></td>
					<td><input type="text" name="subject_fri_1st"
						placeholder="과목명 입력" id="subject_fri_1st"> <input
						type="text" name="subject_fri_1st_teacher" placeholder="담당선생님 입력"
						id="subject_fri_1st_teacher"></td>
				</tr>
				<tr>
					<td>2교시</td>
					<td><input type="text" name="subject_mon_2nd"
						placeholder="과목명 입력" id="subject_mon_2nd"> <input
						type="text" name="subject_mon_2nd_teacher" placeholder="담당선생님 입력"
						id="subject_mon_2nd_teacher"></td>
					<td><input type="text" name="subject_tue_2nd"
						placeholder="과목명 입력" id="subject_tue_2nd"> <input
						type="text" name="subject_tue_2nd_teacher" placeholder="담당선생님 입력"
						id="subject_tue_2nd_teacher"></td>
					<td><input type="text" name="subject_wed_2nd"
						placeholder="과목명 입력" id="subject_wed_2nd"> <input
						type="text" name="subject_wed_2nd_teacher" placeholder="담당선생님 입력"
						id="subject_wed_2nd_teacher"></td>
					<td><input type="text" name="subject_tur_2nd"
						placeholder="과목명 입력" id="subject_tur_2nd"> <input
						type="text" name="subject_tur_2nd_teacher" placeholder="담당선생님 입력"
						id="subject_tur_2nd_teacher"></td>
					<td><input type="text" name="subject_fri_2nd"
						placeholder="과목명 입력" id="subject_fri_2nd"> <input
						type="text" name="subject_fri_2nd_teacher" placeholder="담당선생님 입력"
						id="subject_fri_2nd_teacher"></td>
				</tr>
				<tr>
					<td>3교시</td>
					<td><input type="text" name="subject_mon_3rd"
						placeholder="과목명 입력" id="subject_mon_3rd"> <input
						type="text" name="subject_mon_3rd_teacher" placeholder="담당선생님 입력"
						id="subject_mon_3rd_teacher"></td>
					<td><input type="text" name="subject_tue_3rd"
						placeholder="과목명 입력" id="subject_tue_3rd"> <input
						type="text" name="subject_tue_3rd_teacher" placeholder="담당선생님 입력"
						id="subject_tue_3rd_teacher"></td>
					<td><input type="text" name="subject_wed_3rd"
						placeholder="과목명 입력" id="subject_wed_3rd"> <input
						type="text" name="subject_wed_3rd_teacher" placeholder="담당선생님 입력"
						id="subject_wed_3rd_teacher"></td>
					<td><input type="text" name="subject_tur_3rd"
						placeholder="과목명 입력" id="subject_tur_3rd"> <input
						type="text" name="subject_tur_3rd_teacher" placeholder="담당선생님 입력"
						id="subject_tur_3rd_teacher"></td>
					<td><input type="text" name="subject_fri_3rd"
						placeholder="과목명 입력" id="subject_fri_3rd"> <input
						type="text" name="subject_fri_3rd_teacher" placeholder="담당선생님 입력"
						id="subject_fri_3rd_teacher"></td>
				</tr>
				<tr>
					<td>4교시</td>
					<td><input type="text" name="subject_mon_4th"
						placeholder="과목명 입력" id="subject_mon_4th"> <input
						type="text" name="subject_mon_4th_teacher" placeholder="담당선생님 입력"
						id="subject_mon_4th_teacher"></td>
					<td><input type="text" name="subject_tue_4th"
						placeholder="과목명 입력" id="subject_tue_4th"> <input
						type="text" name="subject_tue_4th_teacher" placeholder="담당선생님 입력"
						id="subject_tue_4th_teacher"></td>
					<td><input type="text" name="subject_wed_4th"
						placeholder="과목명 입력" id="subject_wed_4th"> <input
						type="text" name="subject_wed_4th_teacher" placeholder="담당선생님 입력"
						id="subject_wed_4th_teacher"></td>
					<td><input type="text" name="subject_tur_4th"
						placeholder="과목명 입력" id="subject_tur_4th"> <input
						type="text" name="subject_tur_4th_teacher" placeholder="담당선생님 입력"
						id="subject_tur_4th_teacher"></td>
					<td><input type="text" name="subject_fri_4th"
						placeholder="과목명 입력" id="subject_fri_4th"> <input
						type="text" name="subject_fri_4th_teacher" placeholder="담당선생님 입력"
						id="subject_fri_4th_teacher"></td>
				</tr>
				<tr>
					<td>5교시</td>
					<td><input type="text" name="subject_mon_5th"
						placeholder="과목명 입력" id="subject_mon_5th"> <input
						type="text" name="subject_mon_5th_teacher" placeholder="담당선생님 입력"
						id="subject_mon_5th_teacher"></td>
					<td><input type="text" name="subject_tue_5th"
						placeholder="과목명 입력" id="subject_tue_5th"> <input
						type="text" name="subject_tue_5th_teacher" placeholder="담당선생님 입력"
						id="subject_tue_5th_teacher"></td>
					<td><input type="text" name="subject_wed_5th"
						placeholder="과목명 입력" id="subject_wed_5th"> <input
						type="text" name="subject_wed_5th_teacher" placeholder="담당선생님 입력"
						id="subject_wed_5th_teacher"></td>
					<td><input type="text" name="subject_tur_5th"
						placeholder="과목명 입력" id="subject_tur_5th"> <input
						type="text" name="subject_tur_5th_teacher" placeholder="담당선생님 입력"
						id="subject_tur_5th_teacher"></td>
					<td><input type="text" name="subject_fri_5th"
						placeholder="과목명 입력" id="subject_fri_5th"> <input
						type="text" name="subject_fri_5th_teacher" placeholder="담당선생님 입력"
						id="subject_fri_5th_teacher"></td>
				</tr>
				<tr>
					<td>6교시</td>
					<td><input type="text" name="subject_mon_6th"
						placeholder="과목명 입력" id="subject_mon_6th"> <input
						type="text" name="subject_mon_6th_teacher" placeholder="담당선생님 입력"
						id="subject_mon_6th_teacher"></td>
					<td><input type="text" name="subject_tue_6th"
						placeholder="과목명 입력" id="subject_tue_6th"> <input
						type="text" name="subject_tue_6th_teacher" placeholder="담당선생님 입력"
						id="subject_tue_6th_teacher"></td>
					<td><input type="text" name="subject_wed_6th"
						placeholder="과목명 입력" id="subject_wed_6th"> <input
						type="text" name="subject_wed_6th_teacher" placeholder="담당선생님 입력"
						id="subject_wed_6th_teacher"></td>
					<td><input type="text" name="subject_tur_6th"
						placeholder="과목명 입력" id="subject_tur_6th"> <input
						type="text" name="subject_tur_6th_teacher" placeholder="담당선생님 입력"
						id="subject_tur_6th_teacher"></td>
					<td><input type="text" name="subject_fri_6th"
						placeholder="과목명 입력" id="subject_fri_6th"> <input
						type="text" name="subject_fri_6th_teacher" placeholder="담당선생님 입력"
						id="subject_fri_6th_teacher"></td>
				</tr>
				<tr>
					<td>7교시</td>
					<td><input type="text" name="subject_mon_7th"
						placeholder="과목명 입력" id="subject_mon_7th"> <input
						type="text" name="subject_mon_7th_teacher" placeholder="담당선생님 입력"
						id="subject_mon_7th_teacher"></td>
					<td><input type="text" name="subject_tue_7th"
						placeholder="과목명 입력" id="subject_tue_7th"> <input
						type="text" name="subject_tue_7th_teacher" placeholder="담당선생님 입력"
						id="subject_tue_7th_teacher"></td>
					<td><input type="text" name="subject_wed_7th"
						placeholder="과목명 입력" id="subject_wed_7th"> <input
						type="text" name="subject_wed_7th_teacher" placeholder="담당선생님 입력"
						id="subject_wed_7th_teacher"></td>
					<td><input type="text" name="subject_tur_7th"
						placeholder="과목명 입력" id="subject_tur_7th"> <input
						type="text" name="subject_tur_7th_teacher" placeholder="담당선생님 입력"
						id="subject_tur_7th_teacher"></td>
					<td><input type="text" name="subject_fri_7th"
						placeholder="과목명 입력" id="subject_fri_7th"> <input
						type="text" name="subject_fri_7th_teacher" placeholder="담당선생님 입력"
						id="subject_fri_7th_teacher"></td>
				</tr>
				<tr>
					<td>8교시</td>
					<td><input type="text" name="subject_mon_8th"
						placeholder="과목명 입력" id="subject_mon_8th"> <input
						type="text" name="subject_mon_8th_teacher" placeholder="담당선생님 입력"
						id="subject_mon_8th_teacher"></td>
					<td><input type="text" name="subject_tue_8th"
						placeholder="과목명 입력" id="subject_tue_8th"> <input
						type="text" name="subject_tue_8th_teacher" placeholder="담당선생님 입력"
						id="subject_tue_8th_teacher"></td>
					<td><input type="text" name="subject_wed_8th"
						placeholder="과목명 입력" id="subject_wed_8th"> <input
						type="text" name="subject_wed_8th_teacher" placeholder="담당선생님 입력"
						id="subject_wed_8th_teacher"></td>
					<td><input type="text" name="subject_tur_8th"
						placeholder="과목명 입력" id="subject_tur_8th"> <input
						type="text" name="subject_tur_8th_teacher" placeholder="담당선생님 입력"
						id="subject_tur_8th_teacher"></td>
					<td><input type="text" name="subject_fri_8th"
						placeholder="과목명 입력" id="subject_fri_8th"> <input
						type="text" name="subject_fri_8th_teacher" placeholder="담당선생님 입력"
						id="subject_fri_8th_teacher"></td>
				</tr>
				<tr>
					<td>9교시</td>
					<td><input type="text" name="subject_mon_9th"
						placeholder="과목명 입력" id="subject_mon_9th"> <input
						type="text" name="subject_mon_9th_teacher" placeholder="담당선생님 입력"
						id="subject_mon_9th_teacher"></td>
					<td><input type="text" name="subject_tue_9th"
						placeholder="과목명 입력" id="subject_tue_9th"> <input
						type="text" name="subject_tue_9th_teacher" placeholder="담당선생님 입력"
						id="subject_tue_9th_teacher"></td>
					<td><input type="text" name="subject_wed_9th"
						placeholder="과목명 입력" id="subject_wed_9th"> <input
						type="text" name="subject_wed_9th_teacher" placeholder="담당선생님 입력"
						id="subject_wed_9th_teacher"></td>
					<td><input type="text" name="subject_tur_9th"
						placeholder="과목명 입력" id="subject_tur_9th"> <input
						type="text" name="subject_tur_9th_teacher" placeholder="담당선생님 입력"
						id="subject_tur_9th_teacher"></td>
					<td><input type="text" name="subject_fri_9th"
						placeholder="과목명 입력" id="subject_fri_9th"> <input
						type="text" name="subject_fri_9th_teacher" placeholder="담당선생님 입력"
						id="subject_fri_9th_teacher"></td>
				</tr>
				<tr>
					<td>10교시</td>
					<td><input type="text" name="subject_mon_10th"
						placeholder="과목명 입력" id="subject_mon_10th"> <input
						type="text" name="subject_mon_10th_teacher" placeholder="담당선생님 입력"
						id="subject_mon_10th_teacher"></td>
					<td><input type="text" name="subject_tue_10th"
						placeholder="과목명 입력" id="subject_tue_10th"> <input
						type="text" name="subject_tue_10th_teacher" placeholder="담당선생님 입력"
						id="subject_tue_10th_teacher"></td>
					<td><input type="text" name="subject_wed_10th"
						placeholder="과목명 입력" id="subject_wed_10th"> <input
						type="text" name="subject_wed_10th_teacher" placeholder="담당선생님 입력"
						id="subject_wed_10th_teacher"></td>
					<td><input type="text" name="subject_tur_10th"
						placeholder="과목명 입력" id="subject_tur_10th"> <input
						type="text" name="subject_tur_10th_teacher" placeholder="담당선생님 입력"
						id="subject_tur_10th_teacher"></td>
					<td><input type="text" name="subject_fri_10th"
						placeholder="과목명 입력" id="subject_fri_10th"> <input
						type="text" name="subject_fri_10th_teacher" placeholder="담당선생님 입력"
						id="subject_fri_10th_teacher"></td>
				</tr>
			</table>
			<button type="submit" onclick="return tt_check();"
				style="margin-top: 50px; height: 50px">시간표 등록하기</button>
		</form>
	</div>
</body>
<%@ include file='../footer.jsp'%>
</html>