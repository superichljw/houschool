<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
</head>
<style>
#gubun, #school-region {
	height: 25px;
	margin-left: 10px;
}

#btn-search {
	height: 25px;
}

#word {
	height: 21px;
	margin-left: 10px;
}

#school-sel {
	margin: 0 auto;
	text-align: left;
}

#school-list li {
	margin-top: 4px;
	font-size: 10px;
	margin-bottom: 5px;
}
#school-list li input{
	margin-bottom: 4px;
}
</style>
<body>
	<div id="school-sel">
		<select id="gubun">
			<option value="">학교구분</option>
			<option value="elem_list">초등학교</option>
			<option value="midd_list">중학교</option>
			<option value="high_list">고등학교</option>
			<option value="univ_list">대학교</option>
			<option value="seet_list">특수/기타학교</option>
			<option value="alte_list">대안학교</option>
		</select> <select id="school-region">
			<option value="">지역선택</option>
			<option value="100260">서울</option>
			<option value="100267">부산</option>
		</select> <input type="text" id="word" placeholder="학교명을 입력하세요">
		<button type="button" id="btn-search" onclick="search();">검색</button>

		<ul id="school-list"></ul>
	</div>

</body>
</html>