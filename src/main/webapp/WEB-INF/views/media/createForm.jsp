<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
<style>
#createform-table {
	width: 70%;
	margin: 0 auto;
	text-align: center;
}

#createform-table tr {
	height: 30px;
}

#createform-table td {
	width: 150px;
}
</style>
<script type="text/javascript">
	function mediaTypeCheck(){
		if(document.frm.classType.value.length==0){
			alert('수업타입을 선택해야 합니다');
			frm.classType.focus();
			return false;
		}
		return true;
	}
</script>
<body>
	<%@ include file='../header.jsp'%>

	<form action="./mediaCreate" name="frm" method="post"
		enctype="multipart/form-data">
		<div>
			<table id="createform-table">
				<tr style="display: none;">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4"><h1>업로드폼</h1></td>
				</tr>
				<tr>
					<td>수업타입</td>
					<td><select name="classType" id="classType">
							<option value="">수업타입선택</option>
							<option value="학교수업">학교수업</option>
							<option value="일반수업">일반수업</option>
					</select></td>
				</tr>
				<tr>
					<td bgcolor="lightblue">학교명</td>
					<td style="text-align: left;"><input type="text"
						name="schoolName" value="${loginUser.schoolName }"
						style="height: 26px"></td>
					<td bgcolor="lightblue">학교주소</td>
					<td colspan="2" style="text-align: left;"><input type="text"
						name="schoolAdres" value="${loginUser.schoolAdres }"
						style="height: 26px; width: 400px;" readonly></td>
				</tr>
				<tr>
					<td bgcolor="lightblue">수업명</td>
					<td colspan="2" style="text-align: left;"><input type="text"
						name="title" placeholder="title"
						style="height: 26px; width: 400px;"></td>
					<td bgcolor="lightblue">게시자</td>
					<td style="text-align: left;"><input type="text" name="userId"
						value="${loginUser.userId }" style="height: 26px; width: 180px;"
						readonly></td>
				</tr>
				<tr>
					<td colspan="2" bgcolor="lightblue">썸네일 이미지</td>
					<td colspan="3"><input type="file" name="posterMF" size="50"></td>
				</tr>
				<tr>
					<td colspan="2" bgcolor="lightblue">수업영상</td>
					<td colspan="3"><input type="file" name="filenameMF" size="50"></td>
				</tr>
				<tr style="height: 10px"></tr>
				<tr>
					<td colspan="5"><button type="submit" onclick="return mediaTypeCheck()"
							style="width: 150px; height: 26px">수업업로드</button></td>
				</tr>
			</table>
		</div>
	</form>
</body>
<%@include file="../footer.jsp"%>
</html>