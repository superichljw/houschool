<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
#chat_box {
	width: 400px;
	min-width: 400px;
	height: 100px;
	min-height: 100px;
	border: 1px solid black;
	overflow: auto;
}
/*메세지 입력칸 */
#msg {
	width: 400px;
}
/* 메세지 전송 버튼 */
#msg_process {
	width: 90px;
}
/*영상 좌우반전 */
#localVideo {
	transform: rotateY(180deg);
	-webkit-transform: rotateY(180deg); /* Safari and Chrome */
	-moz-transform: rotateY(180deg); /* Firefox */
}

#localVideo {
	width: 300px;
}

#remoteVideo {
	width: 300px;
}

#video-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, 300px);
	grid-auto-rows: 300px;
}

#video-grid video {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transform: rotateY(180deg);
	-webkit-transform: rotateY(180deg);
	/* Safari and Chrome */
	-moz-transform: rotateY(180deg);
	/* Firefox */
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
</head>
<body>
	<%@ include file='./header.jsp'%>
	<div>
		<video id="localVideo" autoplay width="300px"></video>
		<video id="remoteVideo" width="300px" autoplay></video>
	</div>
	<div id="video-grid"></div>

	<h3>chat box</h3>
	<div id="chat_box"></div>
	<input type="text" id="msg">
	<button id="msg_process">전송</button>
	<input type="text" style="width: 400px;" id="adres-copy" value="">
  <button onclick="adrescopy();">방초대주소복사</button>
	
	<script src="http://localhost:3000/socket.io/socket.io.js"></script>
	<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
	<script src="https://unpkg.com/peerjs@1.3.1/dist/peerjs.min.js"></script>
	<!-- <script src="./js/rtc.js"></script> -->
	<script>
	 var link = document.location.href.toString();
	 var linknum = link.lastIndexOf('/')
	 link = link.substring(linknum +1)
	 const ROOM_ID = "http://localhost:3000/" + link;
	 $('#adres-copy').val(ROOM_ID); 
	  function adrescopy() {
	    var inviteCode = document.getElementById('adres-copy');

	    inviteCode.select();
	    document.execCommand("copy");
	    alert("초대코드가 복사되었습니다");
	  }
	$(document).ready(function() {
		var socket = io("http://localhost:3000")
		//msg에서 키를 누를떄
		$("#msg").keydown(function(key) {
			//해당하는 키가 엔터키(13) 일떄
			if (key.keyCode == 13) {
				//msg_process를 클릭해준다.
				msg_process.click();
			}
		});

		//msg_process를 클릭할 때
		$("#msg_process").click(function() {
			//소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
			socket.emit("send_msg", $("#msg").val());
			//#msg에 벨류값을 비워준다.
			$("#msg").val("");
			$("#msg").focus();
		});

		//소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
		socket.on('send_msg', function(msg) {
			//div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
			$('<div></div>').text(msg).appendTo("#chat_box");
			var top = document.getElementById('chat_box');
			top.scrollTop = top.scrollHeight;
		});
	});

	const socket = io('/')
	const videoGrid = document.getElementById('video-grid')

	const myPeer = new Peer(undefined, {
	  host: '/',
	  port: '3001'
	})
	const myVideo = document.createElement('video')
	myVideo.muted = true
	const peers = {}
	navigator.mediaDevices.getUserMedia({
	  video: true,
	  audio: true
	}).then(stream => {
	  addVideoStream(myVideo, stream)

	  myPeer.on('call', call => {
	    call.answer(stream)
	    const video = document.createElement('video')
	    call.on('stream', userVideoStream => {
	      addVideoStream(video, userVideoStream)
	    })
	  })

	  socket.on('user-connected', userId => {
	    console.log('user-connected : ' + userId)
	    connectToNewUser(userId, stream)
	  })
	})

	socket.on('user-disconnected', userId => {
	  if (peers[userId]) peers[userId].close()
	})

	myPeer.on('open', id => {
	  socket.emit('join-room', ROOM_ID, id)
	})

	function connectToNewUser(userId, stream) {
	  const call = myPeer.call(userId, stream)
	  const video = document.createElement('video')
	  call.on('stream', userVideoStream => {
	    addVideoStream(video, userVideoStream)
	  })
	  call.on('close', () => {
	    video.remove()
	  })

	  peers[userId] = call
	}

	function addVideoStream(video, stream) {
	  video.srcObject = stream
	  video.addEventListener('loadedmetadata', () => {
	    video.play()
	  })
	  videoGrid.append(video)
	} 
	
	
	</script>
</body>
<%@include file="./footer.jsp"%>
</html>