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
#table-block {
	width: 90%;
	margin: 0 auto;
	text-align: center;
	margin-top: 100px;
	margin-bottom: 100px;
}

#table-block #timetableInClass {
	text-align: center;
	margin: 0 auto;
}

#table-block #timetableInClass tr {
	height: 80px;
	text-align: center;
}

#table-block #timetableInClass td, th {
	width: 100px;
	border: 1px solid black;
}

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
	width: 200px;
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
		if (document.frm.semester.value== "-1") {
			alert('학기를 입력하세요');
			frm.semester.focus();
			return false;
		}
		return true;
	}
</script>
<body>
	<%@ include file='../header.jsp'%>
	<div id="table-block">
		<form action="./tt_show" name="frm">
			<div id="tt_infoBox">
				<input type="text" name="schoolName" placeholder="본인학교의 시간표만 확인가능합니다"
					value="${loginUser.schoolName}" readonly> 
					<%-- <input type="text" value="${loginUser.type}" readonly> --%>
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
				<input type="submit" value="시간표 확인" onclick="return tt_check()" style="width:100px;">
			</div>
		</form>
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
				<td>${tt_mon.subject_mon_1st}<br>${tt_mon.subject_mon_1st_teacher }</td>
				<td>${tt_tue.subject_tue_1st}<br>${tt_tue.subject_tue_1st_teacher }</td>
				<td>${tt_wed.subject_wed_1st}<br>${tt_wed.subject_wed_1st_teacher }</td>
				<td>${tt_tur.subject_tur_1st}<br>${tt_tur.subject_tur_1st_teacher }</td>
				<td>${tt_fri.subject_fri_1st}<br>${tt_fri.subject_fri_1st_teacher }</td>
			</tr>
			<tr>
				<td>2교시</td>
				<td>${tt_mon.subject_mon_2nd}<br>${tt_mon.subject_mon_2nd_teacher }</td>
				<td>${tt_tue.subject_tue_2nd}<br>${tt_tue.subject_tue_2nd_teacher }</td>
				<td>${tt_wed.subject_wed_2nd}<br>${tt_wed.subject_wed_2nd_teacher }</td>
				<td>${tt_tur.subject_tur_2nd}<br>${tt_tur.subject_tur_2nd_teacher }</td>
				<td>${tt_fri.subject_fri_2nd}<br>${tt_fri.subject_fri_2nd_teacher }</td>
			</tr>
			<tr>
				<td>3교시</td>
				<td>${tt_mon.subject_mon_3rd}<br>${tt_mon.subject_mon_3rd_teacher }</td>
				<td>${tt_tue.subject_tue_3rd}<br>${tt_tue.subject_tue_3rd_teacher }</td>
				<td>${tt_wed.subject_wed_3rd}<br>${tt_wed.subject_wed_3rd_teacher }</td>
				<td>${tt_tur.subject_tur_3rd}<br>${tt_tur.subject_tur_3rd_teacher }</td>
				<td>${tt_fri.subject_fri_3rd}<br>${tt_fri.subject_fri_3rd_teacher }</td>
			</tr>
			<tr>
				<td>4교시</td>
				<td>${tt_mon.subject_mon_4th}<br>${tt_mon.subject_mon_4th_teacher }</td>
				<td>${tt_tue.subject_tue_4th}<br>${tt_tue.subject_tue_4th_teacher }</td>
				<td>${tt_wed.subject_wed_4th}<br>${tt_wed.subject_wed_4th_teacher }</td>
				<td>${tt_tur.subject_tur_4th}<br>${tt_tur.subject_tur_4th_teacher }</td>
				<td>${tt_fri.subject_fri_4th}<br>${tt_fri.subject_fri_4th_teacher }</td>
			</tr>
			<tr>
				<td>5교시</td>
				<td>${tt_mon.subject_mon_5th}<br>${tt_mon.subject_mon_5th_teacher }</td>
				<td>${tt_tue.subject_tue_5th}<br>${tt_tue.subject_tue_5th_teacher }</td>
				<td>${tt_wed.subject_wed_5th}<br>${tt_wed.subject_wed_5th_teacher }</td>
				<td>${tt_tur.subject_tur_5th}<br>${tt_tur.subject_tur_5th_teacher }</td>
				<td>${tt_fri.subject_fri_5th}<br>${tt_fri.subject_fri_5th_teacher }</td>
			</tr>
			<tr>
				<td>6교시</td>
				<td>${tt_mon.subject_mon_6th}<br>${tt_mon.subject_mon_6th_teacher }</td>
				<td>${tt_tue.subject_tue_6th}<br>${tt_tue.subject_tue_6th_teacher }</td>
				<td>${tt_wed.subject_wed_6th}<br>${tt_wed.subject_wed_6th_teacher }</td>
				<td>${tt_tur.subject_tur_6th}<br>${tt_tur.subject_tur_6th_teacher }</td>
				<td>${tt_fri.subject_fri_6th}<br>${tt_fri.subject_fri_6th_teacher }</td>
			</tr>
			<tr>
				<td>7교시</td>
				<td>${tt_mon.subject_mon_7th}<br>${tt_mon.subject_mon_7th_teacher }</td>
				<td>${tt_tue.subject_tue_7th}<br>${tt_tue.subject_tue_7th_teacher }</td>
				<td>${tt_wed.subject_wed_7th}<br>${tt_wed.subject_wed_7th_teacher }</td>
				<td>${tt_tur.subject_tur_7th}<br>${tt_tur.subject_tur_7th_teacher }</td>
				<td>${tt_fri.subject_fri_7th}<br>${tt_fri.subject_fri_7th_teacher }</td>
			</tr>
			<tr>
				<td>8교시</td>
				<td>${tt_mon.subject_mon_8th}<br>${tt_mon.subject_mon_8th_teacher }</td>
				<td>${tt_tue.subject_tue_8th}<br>${tt_tue.subject_tue_8th_teacher }</td>
				<td>${tt_wed.subject_wed_8th}<br>${tt_wed.subject_wed_8th_teacher }</td>
				<td>${tt_tur.subject_tur_8th}<br>${tt_tur.subject_tur_8th_teacher }</td>
				<td>${tt_fri.subject_fri_8th}<br>${tt_fri.subject_fri_8th_teacher }</td>
			</tr>
			<tr>
				<td>9교시</td>
				<td>${tt_mon.subject_mon_9th}<br>${tt_mon.subject_mon_9th_teacher }</td>
				<td>${tt_tue.subject_tue_9th}<br>${tt_tue.subject_tue_9th_teacher }</td>
				<td>${tt_wed.subject_wed_9th}<br>${tt_wed.subject_wed_9th_teacher }</td>
				<td>${tt_tur.subject_tur_9th}<br>${tt_tur.subject_tur_9th_teacher }</td>
				<td>${tt_fri.subject_fri_9th}<br>${tt_fri.subject_fri_9th_teacher }</td>
			</tr>
			<tr>
				<td>10교시</td>
				<td>${tt_mon.subject_mon_10th}<br>${tt_mon.subject_mon_10th_teacher }</td>
				<td>${tt_tue.subject_tue_10th}<br>${tt_tue.subject_tue_10th_teacher }</td>
				<td>${tt_wed.subject_wed_10th}<br>${tt_wed.subject_wed_10th_teacher }</td>
				<td>${tt_tur.subject_tur_10th}<br>${tt_tur.subject_tur_10th_teacher }</td>
				<td>${tt_fri.subject_fri_10th}<br>${tt_fri.subject_fri_10th_teacher }</td>
			</tr>
		</table>
	</div>
</body>
<%@ include file='../footer.jsp'%>
</html>