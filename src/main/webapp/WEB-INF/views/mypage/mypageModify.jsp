<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style>
#student-detail, #teacher-detail {
	display: none;
	margin-top: 0;
}

#student-detail span {
	padding-left: 20px;
	padding-right: 20px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
<script>
	function idCheck() {
		if (document.frm.userid.value == "") {
			alert('아이디를 입력하여 주십시오.');
			document.frm.userid.focus();
			return;
		}
		var url = "./personal_id_check?userid=" + document.frm.userid.value;
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes,"
				+ " resizable=no, width=450, height=200");

	}
</script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div id="admin-main">
		<h1>개인 정보 수정</h1>
		<div id="admin-left">
			<c:choose>
				<c:when test="${loginUser.type eq 'student' }">
					<ul>
						<li></li>
						<li onclick="location.href='./mypageModify'">개인정보수정</li>
						<li onclick="location.href='./mypageClassOfSchool'">시간표확인</li>
						<li></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul>
						<li></li>
						<li onclick="location.href='./mypageModify'">개인정보수정</li>
						<li onclick="location.href='./mypageStudentInfoPage?schoolName=${loginUser.schoolName}'">학생정보조회</li>
						<li onclick="location.href='./mypageClassOfSchool'">시간표확인</li>
						<li onclick="location.href='./mypageTimetableApply'">시간표등록</li>
						<li onclick="location.href='./board_write_page'">과제등록</li>
						<li onclick="location.href='./mediaCreate'">수업영상등록</li>
						<li></li>
					</ul>
				</c:otherwise>

			</c:choose>
		</div>
	</div>
	<div>
		<form id="signupForm" action="#" name="frm">
			<div>
				<ul>
					<li>개인분류 <select id="personalType" name="type"
						style="height: 24px;" onclick="show_each_detail(this.value)">
							<option value="">분류선택</option>
							<option value="teacher">선생님</option>
							<option value="student">학생</option>
					</select>
					</li>
					<li><input type="hidden" name="type" id="schoolType"></li>
				</ul>
				<c:choose>
					<c:when test="${loginUser.type eq 'student' }">
						<ul id="student-detail">
							<li><span style="padding-left: 0">학년</span><input
								type="text" name="grade" style="width: 100px"> <span>반</span><input
								type="text" name="batch" style="width: 100px"> <span>번호</span><input
								type="text" name="classnum" style="width: 100px"></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul id="teacher-detail">
							<li><span style="padding-right: 20px">담당과목</span><input
								type="text" name="major" style="width: 100px"></li>
						</ul>
						<ul id="teacher-detail">
							<li><span style="padding-right: 20px">담당과목</span><input
								type="text" name="major" style="width: 100px"></li>
						</ul>
					</c:otherwise>
				</c:choose>


				<ul id="school-search">
					<li>학교명</li>
					<li><input type="text" id="myschool" name="group-name"
						value="${loginUser.schoolName}">
						<button type="button" onclick="school_search()"
							style="height: 24px; margin-left: 4px; width: 50px">검색</button></li>
					<li>학교주소</li>
					<li><input type="text" id="myschool-adres" name="group-adres"
						style="width: 400px;" value="${loginUser.schoolAdres}"></li>
				</ul>

				<ul>
					<li>아이디</li>
					<li><input type="text" class="textblock" name="userid"
						value="${loginUser.userId }" /> <input type="hidden" name="reid"
						size="20" value="${reid }" /> <input type="button" value="중복체크"
						onclick="idCheck()" class="idck" /></li>
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
					<li>이름</li>
					<li><input type="text" name="name"
						value="${loginUser.userName}">
				</ul>
				<ul>
					<li>주소</li>
					<li><c:set var="orgAdres" value="${loginUser.userAdres }"></c:set>
						<c:set var="subAdres" value="${fn:substring(orgAdres,0,5 )}"></c:set>
						<c:set var="orgAdresLength" value="${fn:length(orgAdres) }"></c:set>
						<c:set var="restAdres" value="${fn:substring(orgAdres,6,orgAdresLength) }"></c:set>


						<ul style="list-style-type: none; margin-left: -40px;"
							class="addr">
							<li><input type="text" id="postcode" placeholder="   (우편번호)"
								name="postcode" value="${subAdres} " /><input type="button"
								value="우편번호검색" id="postcodeSearch" onclick="execDaumPostcode()"
								style="width: 90px; height: 24px; margin-left: 10px;" /></li>
							<li><input type="text" id="addrblock" placeholder="   (주소)"
								name="address" value="${restAdres }" /><input type="text"
								id="extraAddress" placeholder="   (참고항목)" name="referAdd" /></li>
							<li><input type="text" id="detailAddress"
								placeholder="   (상세주소)" name="detailAdd" /></li>

						</ul></li>
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
					<li>생년월일</li>
					<li><input type="text" name="birth" value="${date }"
						placeholder="   (구분자없이 8자리 입력 (예시) 20060203)">
				</ul>
				<ul>
					<li>이메일</li>
					<li><input type="text" name="email"
						value="${loginUser.userEmail }">
				</ul>

			</div>
			<div class='signup_submit'>
				<input type="submit" onclick="return personal_check();" name="apply"
					style="margin-top: 40px; margin-left: 100px; width: 80px; height: 40px;"
					value="가입하기"> <input type="button"
					style="margin-top: 40px; margin-left: 20px; width: 80px; height: 40px;"
					value="취소하기" onclick="window.location.reload(true)">
			</div>
		</form>
	</div>
</body>
<%@include file="../footer.jsp"%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</html>