<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup_main</title>
 <style>
        #signup_main {
            list-style-type: none;           
            text-align: center;
            margin-top:100px;
            margin-bottom:100px;
        }

        #signup_main li {       
            display: inline-block;
            width: 200px;
            height: 200px;
            margin: 30px;
        }
        #signup_main li div{
            width: 200px;
            height: 200px;
            padding-top: 77px;
            font-size: 30px;
            text-align: center;
        }
        #signup_main li:nth-child(1){
            background-color: lightblue;
        }
        #signup_main li:nth-child(2){
            background-color: lightgrey;
        }
        #signup_main li:nth-child(3){
            background-color: lightpink;
        }
        #signup_main li a{
            text-decoration: none;
        }
        #signup_main li div:hover{
            cursor: pointer;
        }
    </style>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/main.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<ul id="signup_main">
        <li><div onclick="location.href='./page_signup_group'">단체가입</div></li>
        <li><div onclick="location.href='./page_signup_personal'">개인가입</div></li>
    </ul>
</body>
<%@include file="../footer.jsp"%>
</html>