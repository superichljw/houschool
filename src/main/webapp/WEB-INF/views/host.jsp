<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>Document</title>
<style>
* {
	font-family: 'NanumSquare';
}

#classRoom {
	width: 1000px;
	height: 600px;
}

#classRoom #prepare {
	position: relative;
	left: 10%;
	top: 10%;
	z-index: -1;
}

#localVideo {
	position: absolute;
	left: 3%;
	top: 3%;
	width: 60%;
	max-height: 500px;
	/* transform: rotateY(180deg);
    -webkit-transform: rotateY(180deg); */
	/* Safari and Chrome */
	/* -moz-transform: rotateY(180deg); */
	/* Firefox */
}

#screenVideo {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 30%;
	max-height: 500px;
	/* transform: rotateY(180deg);
    -webkit-transform: rotateY(180deg); */
	/* Safari and Chrome */
	/* -moz-transform: rotateY(180deg); */
	/* Firefox */
}

#btn-start {
	position: absolute;
	bottom: 20%;
	left: 55%;
	widows: 80px;
	height: 30px;
}

#video-start {
	position: absolute;
	bottom: 20%;
	left: 47%;
	widows: 80px;
	height: 30px;
}

/*메세지 보여주는 창  */
#chat_box {
	position: absolute;
	right: 3%;
	top: 3%;
	width: 25%;
	height: 60%;
	border: 1px solid black;
	overflow: auto;
	background-color: #000;
}

/*메세지 입력칸 */
#msg {
	position: absolute;
	right: 6%;
	top: 65%;
	width: 25.2%;
	height: 20px;
}

/* 메세지 전송 버튼 */
#msg_process {
	position: absolute;
	top: 65%;
	right: 20px;
	width: 4%;
	height: 26px;
}

#chat_box .me {
	color: #F6F6F6;
	text-align: right;
	padding-top: 5px;
	padding-bottom: 5px;
}

#chat_box .other {
	color: yellow;
	text-align: left;
	padding-top: 5px;
	padding-bottom: 5px;
}
</style>
</head>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script defer src="https://unpkg.com/peerjs@1.2.0/dist/peerjs.min.js"></script>
<script src="http://localhost:3000/socket.io/socket.io.js" defer></script>
<body>

	<!-- <div id="video-grid"></div> -->
	<div id="classRoom">
		<video id="localVideo" autoplay></video>
		<!-- <video id="remoteVideo" autoplay></video> -->
		<video id="screenVideo" autoplay></video>
		<button id="video-start">영상공유</button>
		<button id="btn-start">화면공유</button>
		<div id="chat_box"></div>
		<input type="text" id="msg">
		<button id="msg_process">전송</button>
	</div>
	<input type="text" id="myid" value="" readonly style="width: 400px;">

	<input type="text" style="width: 400px;" id="adres-copy" value="">
	<button onclick="adrescopy();">방초대주소복사</button>

</body>

<script>
  // var link = document.location.href.toString();
  // var linknum = link.lastIndexOf('/')
  // link = link.substring(linknum +1)
  // const ROOM_ID = link;
  const Rtype = '${roomType}';


  const ROOM_ID = '${roomId}';
  var address = 'http://localhost:3000/' + ROOM_ID
  $('#adres-copy').val(address)

  function adrescopy() {
    var inviteCode = document.getElementById('adres-copy');

    inviteCode.select();
    document.execCommand("copy");
    alert("초대코드가 복사되었습니다");
  }

</script>

<script>
$(document).ready(function(){
	
const socket = io("http://localhost:3000");
})
//const videoGrid = document.getElementById('video-grid')

const remoteVideo = document.getElementById("remoteVideo");
const screenVideo = document.getElementById('screenVideo')
const localVideo = document.getElementById('localVideo')
const myPeer = new Peer( {
host: 'http://localhost:3000',
port: '3001'
})
//const myVideo = document.createElement('video')
//myVideo.muted = true
const peers = {} 
//이렇게 하니까 방을 만들고 들어가는 접속이 일어날때마다 피어가 2개씩 열리게 된다, 즉 접속할때 create-room 열리고 아래에 있는 join-room 으로 열리게 된다
const Roomtype = Rtype;
if (Roomtype === 'host') {

	io.on('open', id => {
 socket.emit('create or join', ROOM_ID, id)
 navigator.mediaDevices.getUserMedia({
   video: true,
   audio: false
 }).then(stream => {
   addVideoStream(localVideo, stream)

   myPeer.on('call', call => {
     call.answer(stream)
     // const video = document.createElement('video')
     call.on('stream', userVideoStream => {
       addVideoStream(localVideo, userVideoStream)
       // addVideoStream(screenVideo,userVideoStream)
     })
   })

   socket.on('room-created', (userId, roomId) => {
     console.log('user-connected : ' + userId)
     connectHost(userId, stream)
     // connectScreen(userId,stream)
   })

 })
})
} else {
myPeer.on('open', id => {
 socket.emit('create or join', ROOM_ID, id)
 navigator.mediaDevices.getUserMedia({
   video: true,
   audio: false
 }).then(stream => {
   // addVideoStream(remoteVideo, stream)

   myPeer.on('call', call => {
     call.answer(stream)
     // const video = document.createElement('video')
     call.on('stream', userVideoStream => {
       addVideoStream(localVideo, userVideoStream)
       // addVideoStream(screenVideo, userVideoStream)
     })
   })

 })
 socket.on('user-connected', (userId, roomId) => {
   console.log('user-connected : ' + userId)
   connectToNewUser(userId, stream)
   // connectScreen(userId,stream)
 })
})
}





socket.on('user-disconnect', userId => {
if (peers[userId]) peers[userId].close()

})
socket.on('sendId', userId => {
$('#myid').val(userId)
})




function connectHost(userId, stream) {
const call = myPeer.call(userId, stream)
// const video = document.createElement('video')
call.on('stream', userVideoStream => {
 addVideoStream(localVideo, userVideoStream)
 // addVideoStream(screenVideo, userVideoStream)
})
call.on('close', () => {
 localVideo.remove()
 // screenVideo.remove()
})
peers[userId] = call;
}

function connectToNewUser(userId, stream) {
const call = myPeer.call(userId, stream)
// const video = document.createElement('video')
call.on('stream', userVideoStream => {
 addVideoStream(remoteVideo, userVideoStream)
 // addVideoStream(screenVideo, userVideoStream)
})
call.on('close', () => {
 remoteVideo.remove()
 // screenVideo.remove()
})

peers[userId] = call;

}
function connectScreen(userId, stream) {
const call = myPeer.call(userId, stream)
// const video = document.createElement('video')
call.on('stream', userVideoStream => {
 addVideoStream(screenVideo, userVideoStream)
})
call.on('close', () => {
 screenVideo.remove()
})

peers[userId] = call;

}
function addVideoStream(video, stream) {
video.srcObject = stream
video.addEventListener('loadedmetadata', () => {
 video.play()
})
// videoGrid.append(video)
}

$(document).ready(function () {

//msg에서 키를 누를떄
$("#msg").keydown(function (key) {
 //해당하는 키가 엔터키(13) 일떄
 if (key.keyCode == 13) {
   //msg_process를 클릭해준다.
   msg_process.click();
 }
});

//msg_process를 클릭할 때
$("#msg_process").click(function () {
 //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
 var content = $("#myid").val() + " : " + $("#msg").val();
 socket.emit("send_msg", content, ROOM_ID);
 //#msg에 벨류값을 비워준다.
 $("#msg").val("");
 $("#msg").focus();
});

//소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
socket.on('send_msg', function (msg) {
 //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다
 var id = msg.split(':')[0].toString().trim();
 var myMsg = msg.split(':')[1].toString().trim();

 if (id == $("#myid").val()) {
   $("#chat_box").append("<div class='me'>나 : " + myMsg + "</div>");
 } else {
   $("#chat_box").append("<div class='other'>" + id + " : " + myMsg + "</div>");
 }
 // $('<div></div>').text(msg).appendTo("#chat_box");
 var top = document.getElementById('chat_box');
 top.scrollTop = top.scrollHeight;
});

$('#btn-start').click(function () {
 const screenHandler = new ScreenHandler();
 function onLocalStream(stream) {
   console.log('onLocalStream', stream);

   setVideoStream({
     el: screenVideo,
     stream: stream,
   });
 }
 function setVideoStream(data) {
   const video = data.el;
   video.srcObject = data.stream;
 }
 screenHandler.start((stream) => {
   onLocalStream(stream);
 });
})
$('#video-start').click(function () {
 
 navigator.mediaDevices.getUserMedia({
   video: true,
   audio: false
 }).then(stream => {
   // addVideoStream(localVideo, stream)

   myPeer.on('call', call => {
     call.answer(stream)
     // const video = document.createElement('video')
     call.on('stream', userVideoStream => {
       addVideoStream(localVideo, userVideoStream)
       // addVideoStream(screenVideo,userVideoStream)
     })
   })

   socket.on('user-connected', (userId, roomId) => {
     console.log('user-connected : ' + userId)
     connectToNewUser(userId, stream)
     // connectScreen(userId,stream)
   })

 })

})
});


/**
* ScreenHandler
* @constructor
*/

function ScreenHandler() {
console.log('Loaded ScreenHandler', arguments);

// REF https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints#Properties_of_shared_screen_tracks
const constraints = {
 video: {
   width: 1980, // 최대 너비
   height: 1080, // 최대 높이
   frameRate: 10, // 최대 프레임
 }, audio: true
};
// let localStream = null;

/**
* 스크린캡쳐 API를 브라우저 호환성 맞게 리턴합니다.
* navigator.mediaDevices.getDisplayMedia 호출 (크롬 72 이상 지원)
* navigator.getDisplayMedia 호출 (크롬 70 ~ 71 실험실기능 활성화 or Edge)
*
* @returns {*}
*/
function getCrossBrowserScreenCapture() {
 if (navigator.getDisplayMedia) {
   return navigator.getDisplayMedia(constraints);
 } else if (navigator.mediaDevices.getDisplayMedia) {
   return navigator.mediaDevices.getDisplayMedia(constraints);
 }
}
var screenStream = null;
/**
* 스크린캡쳐 API를 호출합니다.
* @param callback
*/
function start(callback) {
 getCrossBrowserScreenCapture().then(
   (stream) => {
     console.log('Success getDisplayMedia', stream);
     // const video = document.createElement('video')
     // myPeer.on('open', id => {
     //   socket.emit('join-room', ROOM_ID, id)
     // })
     screenStream = stream;
     // addVideoStream(screenVideo, screenStream);

     socket.on('screen-share', (userId, roomId) => {
       console.log('screen-connected : ' + userId)

       connectToNewUser(userId, screenStream)
       // connectScreen(userId,screenStream)
     })

     callback(screenStream);
   },
   (error) => {
     console.error('Error getDisplayMedia', error);
   }
 );
}

/**
* 스트림의 트렉을 stop() 시켜 더이상 스트림이 전송되는것을 중지합니다.
* @param callback
*/
function end(callback) {
 screenStream.getTracks().forEach((track) => {
   track.stop();
 });

 callback && callback();
}

/**
* extends
*/
this.start = start;
this.end = end;
}
</script>

</html>