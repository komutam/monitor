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

<title>Sign up check</title>

</head>
<body>

<script type="text/javascript">
	var emailCheck = "${emailCheck}";
	if(emailCheck == 1){
		alert("인증이 완료되었습니다. 이제 로그인이 가능합니다.")
		self.location = "/monitor";
	}else{
		alert("인증이 잘 못되었습니다.")
		self.location = "/monitor";
	}
</script>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${ctxpath}/resources/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>

</body>
</html>