/**
 * 
 */

// main화면의 메뉴버튼 클릭시 작동하는 기능
$(function() {
	$('.menu-button').on('click', function(event) {
		event.preventDefault();

		$(this).toggleClass('active');
		$('.overlay').toggleClass('visible');

	});
});

// 다음 주소검색

function execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("extraAddress").value = extraAddr;

			} else {
				document.getElementById("extraAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("addrblock").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailAddress").focus();
		}
	}).open();
}

// signup 유효성 검사
function school_check() {
	if (document.frm.group-name.value.length == 0) {
		alert("학교를 입력하세요");
		frm.group-name.focus();
		return false;
	}
	if (document.frm.pw.value.length == 0) {
		alert("비밀번호를 입력하세요");
		frm.pw.focus();
		return false;
	}
	if (document.frm.pw.value != document.frm.pw_check.value) {
		alert("비밀번호가 일치하지 않습니다");
		frm.pw.focus();
		return false;
	}
	if (document.frm.id.value.length == 0) {
		alert("아이디를 입력하세요");
		frm.id.focus();
		return false;
	}
	
	if (document.frm.phone.value.length == 0) {
		alert("전화번호를 입력하세요");
		frm.phone.focus();
		return false;
	}
	if (document.frm.birth.value.length == 0) {
		alert("개교기념일을 입력하세요");
		frm.birth.focus();
		return false;
	}
	if (document.frm.email.value.length == 0) {
		alert("이메일을 입력하세요");
		frm.email.focus();
		return false;
	}
	return true;
	alert("회원가입이 완료되었습니다");
}
function personal_check() {
	
	if (document.frm.group-name.value.length == 0) {
		alert("학교를 입력하세요");
		frm.group-name.focus();
		return false;
	}
	if (document.frm.id.value.length == 0) {
		alert("아이디를 입력하세요");
		frm.id.focus();
		return false;
	}
	if (document.frm.pw.value.length == 0) {
		alert("비밀번호를 입력하세요");
		frm.pw.focus();
		return false;
	}
	if (document.frm.pw.value != document.frm.pw_check.value) {
		alert("비밀번호가 일치하지 않습니다");
		frm.pw.focus();
		return false;
	}
	if(document.frm.name.value.length==0){
		alert("이름을 입력하세요");
		from.name.focus();
		return false;
	}
	if (document.frm.postcode.value.length == 0) {
		alert("주소를 입력하세요");
		frm.postcode.focus();
		return false;
	}
	if (document.frm.phone.value.length == 0) {
		alert("전화번호를 입력하세요");
		frm.phone.focus();
		return false;
	}
	if (document.frm.birth.value.length == 0) {
		alert("생년월일을 입력하세요");
		frm.birth.focus();
		return false;
	}
	if (document.frm.email.value.length == 0) {
		alert("이메일을 입력하세요");
		frm.email.focus();
		return false;
	}
	return true;
	alert("회원가입이 완료되었습니다");
}

// 학교검색

function school_search() {
	var url = "./school_search"
	var name = "school_search"
	var option = "width=600, height=400, left=200, top = 200"
	window.open(url, name, option);
}
function search() {
	var word = document.getElementById("word").value;
	var region = document.getElementById("school-region").value;
	var gubun = document.getElementById("gubun").value;
	var encodeWord = encodeURI(word);
	console.log(word);
	console.log(encodeWord);
	// start Ajax

	$
			.ajax({
				type : 'GET',
				dataType : 'json',
				async : false,
				url : "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=8203be7adb0e335cf7d0a92ada4e1e5a"
						+ "&svcType=api&svcCode=SCHOOL&contentType=json&gubun="
						+ gubun
						+ "&region="
						+ region
						+ "&searchSchulNm="
						+ word,
				error : function(err) {
					console.log("실행중 오류가 발생하였습니다.");
				},
				success : function(data) {
					$("#schoolList").empty();
					var checkWord = $("#word").val(); // 검색어 입력값
					var campus = $("#gubun").val();
					if (campus == "univ_list") {
						if (checkWord.length > 0
								&& data.dataSearch.content.length > 0) {
							data.dataSearch.content.forEach(function(element) {
								$("#school-list").append(
										"<li><input type='button' onclick='schoolApply(this)' value='"
												+ element.schoolName + "  -  "
												+ element.adres + "'>" + "<br>"
												+ "캠퍼스 : " + element.campusName
												+ "<br>" + "지역 : "
												+ element.region + "<br>"
												+ "주소 : " + element.adres
												+ "<br></li>");
							})
						}
					} else {
						if(campus=="elem_list")
							campus = "초등학교";
						else if(campus=="midd_list")
							campus = "중학교";
						else if (campus=="high_list")
							campus = "고등학교";
						if (checkWord.length > 0
								&& data.dataSearch.content.length > 0) {
							data.dataSearch.content.forEach(function(element) {
								if (element.campusName == undefined)
									element.campusName = "";
								$("#school-list").append(
										"<li><input type='button' onclick='schoolApply(this)' value='"
												+ element.schoolName + "  -  "
												+ element.adres + " - " + campus + "'>" + "<br>"
												+ "학교명 : " + element.schoolName
												+ "<br>" + "지역 : "
												+ element.region + "<br>"
												+ "주소 : " + element.adres
												+ "<br>"+"구분 : " + campus + "</li>");
							})
						}
					}
				}
			});// end Ajax
}

function schoolApply(name) {
	var str = name.value.split('-');
	opener.document.getElementById("myschool").value = str[0].trim();
	opener.document.getElementById("myschool-adres").value = str[1].trim();
	opener.document.getElementById("schoolType").value = str[2].trim();
	self.close();

}

// 회원가입시 단체분류를 통한 메뉴 보여주기 기능
// function show_school(value) {
// if (value == 'school') {
// document.getElementById('school-search').style.display = 'inline-block';
// document.getElementById('group-name').style.display = 'none';
// document.getElementById('group-adres').style.display = 'none';
// } else {
// document.getElementById('school-search').style.display = 'none';
// document.getElementById('group-name').style.display = 'inline-block';
// document.getElementById('group-adres').style.display = 'inline-block';
// }
// }

// 방만들기

window.onload = function() {
	getRoom();
	createRoom();
}

function getRoom() {
	commonAjax('./getRoom', "", 'post', function(result) {
		createChatingRoom(result);
	});
}

function goRoom(number, name,id) {
	var url = "http://localhost:3000/roomName=" + name + "&roomNumber="
			+ number + "&id=" + id;
	var name = 'test';
	var option = 'width=1100, height = 700, top = 300, left = 150';
	window.open(url, name, option);
}

function createRoom() {
	$("#createRoom").click(function() {
		var msg = {
			roomName : $('#roomName').val(),
			userId : $('#userid').val()
		};

		commonAjax('./createRoom', msg, 'post', function(result) {
			createChatingRoom(result);
		});
		commonAjax('./getRoom', msg, 'post', function(result) {
			result.forEach(function(d,idx){
				var rn = d.roomName;
				var id = d.userid;
				var roomNumber = d.roomNumber;
				var url = "http://localhost:3000/roomName=" + rn + "&roomNumber=" + roomNumber+"&id=" + id;
				var name = 'test';
				var option = 'width=1100, height = 700, top = 300, left = 150';
				window.open(url, name, option);
				self.close();
				
			})
		});

		$("#roomName").val("");
		
	});
}
function createChatingRoom(res) {
	if (res != null) {
		var tag = "<tr><th class='num'>순서</th><th class='room'>방 이름</th><th class='go'></th></tr>";
		res.forEach(function(d, idx) {
			var rn = d.roomName;
			var id = d.userid;
			var roomNumber = d.roomNumber;
			tag += "<tr>" + "<td class='num'>" + (idx + 1) + "</td>"
					+ "<td class='room'>" + rn + id + "</td>"
					+ "<td class='go'><button type='button' onclick='goRoom(\""
					+ roomNumber + "\", \"" + rn + "\"" + id + "\")'>참여</button></td>" + "</tr>";
		});
		$("#roomList").empty().append(tag);
	}
}

function commonAjax(url, parameter, type, calbak, contentType) {
	$.ajax({
		url : url,
		data : parameter,
		type : type,
		contentType : contentType != null ? contentType
				: 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(res) {
			calbak(res);
		},
		error : function(err) {
			console.log('error-11');
			calbak(err);
		}
	});
}
// 방만들때 팝업창 - 미구현상태
function createRoomPopup() {
	var url = "./createChatroomPopup"
	var name = "createChatroomPopup"
	var option = 'width=530, height = 100, top = 350, left = 300';
	window.open(url, name, option);
}

//로그인 유효성 검사
