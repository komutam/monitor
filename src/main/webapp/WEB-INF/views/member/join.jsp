<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="ctxpath" value="<%=request.getContextPath() %>"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<link rel="stylesheet" href="${ctxpath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${ctxpath}/resources/css/css.css">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="${ctxpath}/resources/bootstrap/css/bootstrap.min.css">

<title>Sign up</title>

<style>
body{
	background:#d3d7df;
}
*{box-sizing:border-box;}
	#joinContainer{
		width:430px;
		margin:0 auto;
		margin-top:100px;
		text-align:center;
	}
	.joinBox{
		background:white;
		padding:20px;
	}
	.joinTitle{
		margin-bottom:30px;
	}
</style>

</head>
<body>

<div id="joinContainer">
	<div class="joinBox">
		<form action="join" name="joinForm" method="POST" onSubmit="return checkJoin();" class="form-horizontal">
			<div class="joinTitle">
				<h1><img src="${ctxpath}/resources/img/monicon.png" style="width:38px; padding-bottom:8px; margin:5px;">Sing Up</h1>
			</div>
			<div class="form-group">
    			<label for="inputEmail3" class="col-sm-3 control-label">Email</label>
  					<div class="col-sm-9">
     				 	<input type="email" class="form-control" name="email" id="email" placeholder="Email">
    				</div>
 			 </div>
 			 <div class="form-group">
    			<label for="inputEmail3" class="col-sm-3 control-label">UserID</label>
  					<div class="col-sm-6">
     				 	<input type="text" class="form-control" name="userid" id="userid" placeholder="아이디를 입력해주세요">
    				</div>
    				<input type="button" class="btn btn-warning" value="CheckID" onClick="insertFunction();">
 			 </div>
 			 <div class="form-group">
    			<label for="inputEmail3" class="col-sm-3 control-label">PassWord</label>
  					<div class="col-sm-9">
     				 	<input type="password" class="form-control" name="userpw" id="userpw" placeholder="비밀번호를 입력해주세요" onkeyup="passwordCheckFunction();">
    				</div>
 			 </div>
 			 <div class="form-group">
    			<label for="inputEmail3" class="col-sm-3 control-label">PW Check</label>
  					<div class="col-sm-9">
     				 	<input type="password" class="form-control" name="userpw2" id="userpw2" placeholder="비밀번호를 한번 더 입력해주세요" onkeyup="passwordCheckFunction();">
    					<h5 style="color:red;" id="passwordCheckMessage" class="chekmss"></h5>
    				</div>
 			 </div>
 			 <div class="form-group">
    			<label for="inputEmail3" class="col-sm-3 control-label">Country</label>
  					<div class="col-sm-9">
     				 	<input type="text" class="form-control" name="country" id="country" placeholder="살고있는 국가를 입력해주세요">
    				</div>
 			 </div> 			 
 			 <div class="form-group" style="margin-top:30px;">
 				<div class="col-sm-5 pull-left">
			   		<input type="button" class="btn btn-danger" onClick="location.href='/monitor'" value="Cancel">
    			</div>
    		 	<div class="col-sm-5 pull-right">
			   		<input type="submit" class="btn btn-primary" value="Submit">
    			</div>
  			</div>
		</form>
	</div>
</div>

<script>
function checkJoin(){
	if(document.joinForm.userid.value == ""){
		alert("아이디를 입력해주세요");
		document.joinForm.userid.focus();
		return false;
	}
	if(document.joinForm.email.value == ""){
		alert("이메일을 입력해주세요");
		document.joinForm.email.focus();
		return false;
	}
	if(document.joinForm.userpw.value == ""){
		alert("비밀번호를 입력해주세요");
		document.joinForm.userpw.focus();
		return false;
	}
	if(document.joinForm.userpw2.value == ""){
		alert("비밀번호를 한번 더 입력해주세요");
		document.joinForm.userpw2.focus();
		return false;
	}
}

function passwordCheckFunction(){
	var userpw = $('#userpw').val();
	var userpw2 = $('#userpw2').val();
	if(userpw != userpw2){
		$('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다");
	}else{
		$('#passwordCheckMessage').html("");
	}
}
</script>

<script>
function insertFunction(){
	$.ajax({
		type : 'POST',
		url : '/monitor/member/checkID',
		data : "userid="+$('#userid').val(),
		dataType : 'JSON',
		success:function(data){
			if(data.check > 0){
				alert("사용중인 ID");
				$("#userid").css("background-color", "#FFCECE");
				$("#userid").focus();
			}else{
				alert("사용 가능한 ID");
				$("#userid").css("background-color", "#B0F6AC");
				$('#userpwd').focus();
			}
		}
	});
}
</script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${ctxpath}/resources/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
</body>
</html>