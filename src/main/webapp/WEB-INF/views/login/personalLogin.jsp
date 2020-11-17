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
#login-section {
	width: 40%;
	margin: 0 auto;
	margin-bottom: 200px;
	margin-top: 100px;
}

#login-section ul li {
	height: 26px;
}

#login-section ul li input {
	width: 203px;
	height: 20px;
}
</style>
<script>
	function loginCheck() {
		if (document.frm.userid.value.length == 0) {
			alert("아이디를 써주세요");
			frm.userid.focus();
			return false;
		}
		if (document.frm.pwd.value == "") {
			alert("암호는 반드시 입력해야 합니다.");
			frm.pwd.focus();
			return false;
		}
		return true;
	}
</script>
<body>
	<%@include file="../header.jsp"%>
	<div id="login-section">
		<h1>로그인</h1>
		<form action="./personalLogin" name="frm">
			<div>
				<ul>
					<li>아이디</li>
					<li><input type="text" name="id">
				</ul>
				<ul>
					<li>비밀번호</li>
					<li><input type="password" name="pw" style="font-family:gulim">
				</ul>
				<ul>
					<li><input type="submit" value="로그인"
						style="width: 100px; height: 40px; margin-top: 20px; margin-bottom: 100px; font-size: 18px"
						onclick="return loginCheck()"><input type="button"
						value="취소"
						style="width: 100px; height: 40px; margin-left: 10px; margin-top: 20px; margin-bottom: 100px; font-size: 18px;"
						onclick="window.location.reload(true)"></li>
				</ul>
			</div>
		</form>
	</div>
</body>
<%@include file="../footer.jsp"%>

</html>