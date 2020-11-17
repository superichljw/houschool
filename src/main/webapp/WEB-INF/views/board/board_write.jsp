<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
#board-write-back {
	width: 60%;
	float:right;
	text-align: center;
	margin-right:200px;
}

#board-write-back #board-title-back {
	margin-bottom: 15px;
	text-align: right;
}

#board-write-back form {
	width: 100%
}

#board-write-back table {
	width: 100%
}

#board-write-back table tr td input {
	text-align: left;
}

#board-write-back table td {
	width: 20%;
	height: 31px;
}

#board-write-back table tr .category {
	width: 17%;
}

#board-write-back table tr .title {
	width: 60%;
}

#board-write-back table tr .author {
	width: 20%;
}

#board-write-back table tr .content {
	width: 900px;
}

#board-write-back #category {
	width: 100%;
	height: 31px;
}

#board-write-back #title {
	width: 100%;
	height: 25px;
}

#board-write-back #author {
	width: 100%;
	height: 25px;
}

#board-write-back textarea {
	width: 100%;
	margin: 0 auto;
}

#board-write-back #submitBtn {
	height: 40px;
	width: 130px;
	margin: 30px 0px 30px 0px;
}

#board-write-back #board-rewrite {
	height: 40px;
	width: 130px;
	margin: 30px;
}
</style>
<meta charset="UTF-8">
<title>게시판페이지</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="./js/main.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div id="admin-main">
		<h1>게시판 글쓰기</h1>
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
				<li></li>
			</ul>
		</div>
	</div>
	<div id="board-write-back">
		<form name="frm" action="./board_write" enctype="multipart/form-data"
			method="post">
			<table>
				<tr>
					<td class="category"><select id="category"
						name="board_category">
							<option value="">글분류</option>
							<option value="notice">공지사항</option>
							<option value="homework">과제</option>
					</select></td>
					<td colspan="3" class="title"><input id="title" type="text"
						name="board_title" placeholder="글제목을 입력하세요"></td>
					<td class="author"><input id="author" type="text"
						name="board_author" placeholder="작성자"
						value="${loginUser.schoolName }(${loginUser.userName })"></td>
				</tr>
				<tr>
					<td style="width:150px;border:1px solid black">첨부파일</td>
					<td><input type="file" name="uploadFile"></td>
				</tr>
				<tr>
					<td colspan="5" class="content"><textarea name="board_content"
							rows="30" cols="200" id="content"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="작성완료" id="submitBtn"
				onclick="updateSe();"> <input type="button" value="다시쓰기"
				id="board-rewrite">
		</form>
	</div>
</body>
<%@include file="../footer.jsp"%>

<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "content",
		sSkinURI : "resources/smarteditor2/SmartEditor2Skin.html",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,

			fOnBeforeUnload : function() {

			}
		},
		fOnAppLoad : function() {
			//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			oEditors.getById["content"].exec("PASTE_HTML", [ "" ]);
		},
		fCreator : "createSEditor2"
	});

	//저장버튼 클릭시 form 전송
	function pasteHTML(filepath) {
		alert(filepath);
		var sHTML = '<img src="/resources/upload'+filepath+'">';
		oEditors.getById["content"].exec("PASTE_HTML", [ sHTML ]);
	}

	function updateSe() {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("rev_contents").value를 이용해서 처리한다.

		try {
			document.formm.submit();
		} catch (e) {
		}

	}

	/* function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("q_contents").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	
	function cb(obj) {
		var target = $(obj);
		var srcStr = target.attr('src').split("/")[2];
		target.attr("id", srcStr);
		
		if (confirm("해당 이미지를 삭제하시겠습니까?")) {

			$.post("/deleteEditorFile", {
				fileName : srcStr
			}, function(result) {
				target.remove();
			});

			return;
		}
	}
	
	$(document).ready(function() {

		$("#content").on('input propertychange', function() {

			console.log()
		});

		$('#submitBtn').click(function(event) {
			event.preventDefault();
			if(document.frm.category.value == ""){
	 			alert('글 분류를 선택해주세요');
	 			frm.category.focus();
	 		}else if(document.frm.title.value.length == 0){
	 			alert('글 제목을 입력해주세요');
	 			frm.title.focus();
	 		}else{
	 		// 에디터의 내용이 textarea에 적용된다.
				oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

				// 에디터의 내용에 대한 값 검증은 이곳에서
				var content = document.getElementById("content").value;

				console.log("CONTENT: " + content);

				document.frm.submit();
	 		}
			
		});

	});  */
</script>
</html>