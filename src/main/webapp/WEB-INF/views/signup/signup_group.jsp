<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
		var url = "./school_id_check?userid=" + document.frm.userid.value;
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes,"
				+ " resizable=no, width=450, height=200");

	}
</script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div>
		<form id="signupForm" action="./signup_group" name="frm">
			<h1>학교회원가입</h1>
			<div>
			<input type="hidden" name="userName" value="관리자">
				<ul id="school-search">
					<li>학교명</li>
					<li><input type="text" id="myschool" name="group-name"
						readonly>
						<button type="button" onclick="school_search()"
							style="height: 24px; margin-left: 4px; width: 50px">검색</button></li>
					<li>학교주소</li>
					<li><input type="text" id="myschool-adres" name="group-adres"
						style="width: 400px;" readonly></li>
					<li><input type="hidden" name="type" id="schoolType"></li>
				</ul>

				<ul>
					<li>아이디</li>
					<li><input type="text" class="textblock" name="userid"
						value="${userid }" /> <input type="hidden" name="reid" size="20"
						value="${reid }" /> <input type="button" value="중복체크"
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
				<!-- <ul>
					<li>이름</li>
					<li><input type="text" name="name">
				</ul>
				<ul>
					<li>주소</li>
					<li>
						<ul style="list-style-type: none; margin-left: -40px;"
							class="addr">
							<li><input type="text" id="postcode" placeholder="   (우편번호)"
								name="postcode" /><input type="button" value="우편번호검색"
								id="postcodeSearch" onclick="execDaumPostcode()"
								style="width: 90px; height: 24px; margin-left: 10px;" /></li>
							<li><input type="text" id="addrblock" placeholder="   (주소)"
								name="address" /><input type="text" id="extraAddress"
								placeholder="   (참고항목)" name="referAdd" /></li>
							<li><input type="text" id="detailAddress"
								placeholder="   (상세주소)" name="detailAdd" /></li>

						</ul>
					</li>
				</ul> -->
				<ul>
					<li>전화번호</li>
					<li><input type="text" name="phone">
				</ul>
				<ul>
					<li>개교기념일</li>
					<li><input type="text" name="birth"
						placeholder="   (구분자없이 8자리 입력 (예시) 19730203)">
				</ul>
				<ul>
					<li>이메일</li>
					<li><input type="text" name="email">
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
</body>
<%@include file="../footer.jsp"%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</html>