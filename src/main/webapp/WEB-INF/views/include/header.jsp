<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>
<c:set var="ctxpath" value="<%=request.getContextPath() %>"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<link rel="stylesheet" href="${ctxpath}/resources/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${ctxpath}/resources/js/bootstrap.js"></script>
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="${ctxpath}/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.1.0/handlebars.js"></script>

<style type="text/css">
	*{box-sizing:border-box;}
	body{
		background-color:#e6ecf0;
	}
	li{
		list-style:none;
	}
	a{
		text-decoration:none;
	}
	img{border:0;}
	#headerBox{
		width:100%;
		background:white;
		height:60px;
	}
	.mainHeader{
		width:100%;
		height:60px;
		background:white;
		position:fixed;
		box-shadow: 0px 1px 3px gray;
		z-index:1000;
	}
	
	.headerBar{
		width:1200px;
		padding-top:13px;
		text-align:center;
		margin:0 auto;
	}
	.headCon{
		width:33px;
	}
	
	.homeBtn{
		background:none;
		color:#1DA1F2;
		font-size:17px;
	}
	.homeBtn:hover{
		background:#1DA1F2;
		color:white;
	}
</style>

<title>monitor page</title>
</head>

<body>
	<header id="headerBox">
		<div class="mainHeader">
			<div class="headerBar">
				<button class="btn pull-left homeBtn" style="margin-left:5px;" onClick="location.href='/monitor'">
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
				</button>
				<a href="" target="_top">
					<img src="${ctxpath}/resources/img/monicon.png" class="headCon">
				</a>

				<c:if test="${login != null}">
					<input type="button" value="로그아웃" class="btn btn-primary pull-right" style="margin-right:5px;" onClick="location.href='/monitor/member/logout'">
				</c:if>
				
				<c:if test="${empty login}">
					<input type="button" value="회원가입" class="btn btn-primary pull-right" style="margin-right:5px;" onClick="location.href='/monitor/member/join'">
					<input type="button" value="로그인" class="btn btn-primary pull-right" style="margin-right:5px;" onClick="location.href='/monitor/member/login'">	
				</c:if>
			</div>
		</div>
	</header>
</body>