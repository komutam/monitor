<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<footer id="mainFooter">
		<div>
			<strong>Copyright &copy; 2014-2016 Almsaeed Studio.</strong> All rights reserved.<b>Version</b> 2.4.0
		</div>
	</footer>
<script>
var authStatus = "${login.authStatus}";
if(authStatus == 0){
	alert("이메일 인증을 해주세요");
	self.location = "/monitor/member/logout";
}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${ctxpath}/resources/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
</body>
</html>