<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<c:set var="ctxpath" value="<%=request.getContextPath() %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<link rel="stylesheet" href="${ctxpath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${ctxpath}/resources/css/css.css">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="${ctxpath}/resources/bootstrap/css/bootstrap.min.css">

<style type="text/css">
	body{
		background:#d3d7df;
	}
	*{
		box-sizing:border-box;
	}
	.loginBox{
	width:400px;
	margin:0 auto;
	background:white;
	padding:10px 25px 25px 25px;
	margin-top:60px;
	}
	.loginTitle, .bs{
		text-align:center;
	}
</style>

<title>Monitor Login</title>
</head>
<body>
	<div id="login-container">
		<div class="loginBox">
			<div class="loginTitle">
				<h1><img src="${ctxpath}/resources/img/monicon.png" style="width:38px; padding-bottom:8px; margin:5px;">LOGIN</h1>
			</div>
			<form action="<c:url value='/member/loginPost'/>" method="POST">
				<div class="form-group">
					<label>ID</label>
					<input type="text" class="form-control" name="userid" id="userid" placeholder="Please enter a user ID">
				</div>
				<div>
					<label>PASSWORD</label>
					<input type="password" class="form-control" name="userpw" id="userpw" placeholder="Please enter your Password">
				</div>
				<div class="form-group">
					<label style="margin-top:10px;">
						<input type="checkbox" name="useCookie"> remember me
					</label>
				</div>
				<div class="bs">
					<input type="submit" value="Login" class="btn btn-primary">
					<input type="button" value="Sing Up" class="btn btn-primary" onClick="location.href='/monitor/member/join'">
				</div>
			</form>
		</div>
	</div>
	
<script>
	var result = '${msg}';
	if(result == "success"){
		alert('이메일 인증을 해주세요');
	}
</script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${ctxpath}/resources/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
</body>
</html>