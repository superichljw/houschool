<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
#signupForm ul {
	list-style-type: none;
}
#signupForm{
width:40%;
padding-left:200px;
padding-top:30px;
padding-bottom:50px;
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
	var url = "./id_check?userid="
			+ document.frm.userid.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes,"
			+ " resizable=no, width=450, height=200");

}
</script>
</head>
<body>
	<%@include file="./header.jsp"%>
	<div>
		<form id="signupForm" action="./signup" name="frm">
			<h1>회원가입</h1>
			<div>
				<ul>
					<li>아이디</li>
					<li><input type="text" name="id">
					<li><input type="text" class="textblock" name="userid"
					value="${userid }" /> <input type="hidden" name="reid" size="20"
					value="${reid }" /></li>
				<li><input type="button" value="중복체크" onclick="idCheck()"
					class="idck" /></li>
				</ul>
				<ul>
					<li>비밀번호</li>
					<li><input type="password" name="pw">
				</ul>
				<ul>
					<li>비밀번호 확인</li>
					<li><input type="password" name="pw_check">
				</ul>
				<ul>
					<li>이름</li>
					<li><input type="text" name="name">
				</ul>
				<ul>
					<li>주소</li>
					<li><input type="text" name="address">
					<li class="addr">
						<ul style="list-style-type: none; margin-left: -20px;">
							<li class="addr-1"><input type="text" id="postcode"
								placeholder="(우편번호)" name="postcode" /></li>
							<li class="addr-1"><input type="button" value="우편번호검색"
								id="postcodeSearch" onclick="execDaumPostcode()" /></li>
							<li><input type="text" id="addrblock" placeholder="(주소)"
								name="address" /></li>
							<li><input type="text" id="extraAddress"
								placeholder="(참고항목)" name="referAdd" /><input type="text"
								id="detailAddress" placeholder="(상세주소)" name="detailAdd" /></li>

						</ul>
					</li>
				</ul>
				<ul>
					<li>전화번호</li>
					<li><input type="text" name="phone">
				</ul>
				<ul>
					<li>생년월일</li>
					<li><input type="text" name="birth">
				</ul>
				<ul>
					<li>이메일</li>
					<li><input type="text" name="email">
				</ul>
				<ul>
					<li>학교</li>
					<li><input type="text" id="myschool-adres" name="school-adres" style="width:400px"></li>
					<li><input type="text" id="myschool" name="school">
					<button type="button" onclick="popup()">검색</button>
				</ul>
			</div>
			<div>
				<input type="submit" onclick="return check()" name="apply">
			</div>
		</form>
	</div>
</body>
<%@include file="./footer.jsp"%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</html>