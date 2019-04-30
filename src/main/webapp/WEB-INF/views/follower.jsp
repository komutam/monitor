<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="include/header.jsp" %>

<style>
	pre {
 		white-space: pre-wrap;       /* css-3 */
 		white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */
 		white-space: -pre-wrap;      /* Opera 4-6 */
 		white-space: -o-pre-wrap;    /* Opera 7 */
 		word-wrap: break-word;       /* Internet Explorer 5.5+ */
	}
	.backgroundImgBox{
		width:100%;
		height:170%;
	}
	.backgroundImg{
		width:100%;
		height:100%;
	}
	.topProImg{
		z-index:920;
		position:absolute;
		top:-115px;
		left:10px;
		width:205px;
		height:200px;
	}
	.mymytop{
		width:100%;
		height:100%;
		border:5px solid white;
	}
	.topImage{
		background:#1DA1F2;
		width:100%;
		height:410px;
		overflow:hidden;
	}
	.topBar{
		background:white;
		width:100%;
		height:60px;
		margin-bottom:10px;
		box-shadow: 0px 1px 3px gray;
	}
	.topBarBox{
		width:1200px;
		height:60px;
		margin:0 auto;
		position:relative;
	}
	.monitCount{
		top:8px;
		left:300px;
		position:absolute;
		text-align:center;
	}
	.mediaCount{
		top:8px;
		left:350px;
		position:absolute;
		text-align:center;
	}
	.fwCount{
		top:8px;
		left:405px;
		position:absolute;
		text-align:center;
	}
	.fwerCount{
		top:8px;
		left:460px;
		position:absolute;
		text-align:center;
		border-bottom:3px solid red;
	}
	#proModifyBtn{
		position:absolute;
		border:1px solid gray;
		border-radius:20px;
		right:0;
		top:14px;
	}
	#followBtn{
		position:absolute;
		border:1px solid #1DA1F2;
		border-radius:20px;
		right:0;
		top:14px;
		color:#1DA1F2;
	}
	#followBtnAjax{
		position:absolute;
		border:1px solid #1DA1F2;
		border-radius:20px;
		right:0;
		top:14px;
		color:#1DA1F2;
		display:none;
	}
	#followingBtn{
		position:absolute;
		border:1px solid #1DA1F2;
		border-radius:20px;
		right:0;
		top:14px;
		color:#1DA1F2;
	}
	#followingBtnAjax{
		position:absolute;
		border:1px solid #1DA1F2;
		border-radius:20px;
		right:0;
		top:14px;
		color:#1DA1F2;
		display:none;
	}
	.mainBox{
		width:1200px;
		margin:0 auto;
	}

	.leftSide_Pro{
		width:100%;
		height:auto;
		padding-top:25px;
		margin-bottom:50px;
	}
	.myinfoBox > pre{
		border:none;
		padding:0;
		background:none;
	}
	.leftSide_Etc{
		width:100%;
		margin-top:15px;
	}
	.mmm{
		margin-top:10px;
	}
	.listCount, .imgCount, .followingCount, .followerCount{
		width:40px;
		outline-style:none;
		border:none;
		color:#1DA1F2;
		font-size:19px;
		cursor:pointer;
	}
/* --------------------------------------------------------------- */

	.mainCenter{
		padding:0;
		overflow:hidden;
	}
	.center_Post{
		width:100%;
		height:60px;
		background-color:#E8F5FD;
	}
	.postBox{
		position:relative;
	}
	.center_ProImg, .center_ProImg2{
		width:37px;
		height:37px;
		position:absolute;
		z-index:500;
		top:12px;
		left:30px;
	}
	.mymy2{
		width:100%;
	}
	.textBox{
		width:510px;
		height:37px;
		position:absolute;
		top:12px;
		left:75px;
		padding:8px 5px 5px 10px;
		background:white;
		border-radius:7px;
		border:1px solid skyblue;
	}
	.center_Post2{
		width:100%;
		background-color:#E8F5FD;
		display:none;
	}
	.postBox2{
		padding-left:80px;
		padding-top:12px;
		position:relative;
	}
	.textBox2{
		width:510px;
		padding:8px 5px 5px 10px;
		background:white;
		border-radius:7px;
		border:2px solid skyblue;
		margin-bottom:10px;
	}
	.textArea {
		width:100%;
		border:none;
		resize:none;
		overflow-y:hidden;
    }
    .centerBar{
    	width:510px;
    	height:40px;
    	padding-right:10px;
    }
	.centerBtn{
		border-radius:18px;
		background:#1DA1F2;
		border:none;
	}
	.kkk{
		width:100%;
		hegiht:80px;
		background:yellow;
		z-index:50;
	}

/* -----------------------------------------------	followingList*/
	.followingList > li{
		float:left;
		margin:0 5px 10px 5px;
		list-style:none;
	}
	.postingBox{
		background:white;
		width:290px;
		height:250px;
		position:relative;
	}
	.center_topBox{
		width:100%;
		height:90px;
		background:#1DA1F2;
		overflow:hidden;
	}
	.center_topImg{
		width:100%;
		height:auto;
	}
	.center_myImgBox{
		width:100px;
		height:100px;
		z-index:500;
		position:absolute;
		top:50px;
		left:10px;
	}
	.center_myImg{
		width:100%;
		height:100%;
		position:absolute;
		border:3px solid white;
	}
	.center_nameBox{
		position:absolute;
		top:100px;
		left:115px;
		z-index:500;
		width:170px;
	}
	.center_nameLess{
		width:170px;
		position:absolute;
	}
	.center_nameOk{
		width:170px;
		position:absolute;
		background:white;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	.center_nameOk > span{
	  width:70px;
      white-space:nowrap;
	}
	.center_myinfoBox{
		width:100%;
		height:90px;
		position:absolute;
		top:160px;
		overflow:hidden;
		padding:0 10px 3px 10px;
	}
	.center_myinfoBox > pre{
		border:none;
		padding:0;
		background:none;
  		overflow:hidden;
	}
/* -----------------------------------------------	*/

	.notlist{
		width:100%;
		height:150px;
		background:white;
		margin-top:2px;
		position:relative;
	}
	.notPage{
		position:absolute;
		top:20px;
		left:180px;
	}
	
	.overlayTopBack{
		position: fixed;
		background: white;
		opacity: 0.5;
		display: none;
		top: 0;
		left: 0;
		width: 100%;
		height: 100vh;
		z-index: 950;
	}
	.modifyProfile{
		display:none;
	}
	.modifyProBack{
		position:absolute;
		top:60px;
		z-index:970;
		background:#2B2F9E;
		width:100%;
		height:410px;
		overflow:hidden;
	}
	.backIconBox{
		width:100%;
		height:100%;
	}
	.backIconBox:hover{
		border:8px solid skyblue;
		cursor:pointer;
	}
	.backIcon{
		position:absolute;
		width:80px;
		left:48%;
		top:35%;
	}
	.modiproMK2{
		width:100%;
		height:auto;
	}
	
	.modifyProBar{
		width:100%;
		height:60px;
		z-index:980;
		position:absolute;
		top:470px;
	}
	.modifyProBarIn{
		width:1200px;
		margin:0 auto;
		height:60px;
	}
	.modifyProBarIn > button{
		border-radius:20px;
		margin-left:10px;
		margin-top:14px;
		border:1px solid gray;
	}
	.modipro{
		width:205px;
		height:200px;
		position:absolute;
		top:-115px;
		left:10px;
		border:6px solid white;
	}
	.modipro:hover{
		border:8px solid skyblue;
		cursor:pointer;
	}
	.modiproMK{
		width:205px;
		height:200px;
		position:absolute;
		top:-115px;
		left:10px;
		border:5px solid white;
	}
	.modifyProImg{
		position:relative;
	}
	.modifyCenter{
		width:100%;
		z-index:970;
		position:absolute;
		top:540px;
	}
	.modidyMyInfo{
		width:1200px;
		margin:0 auto;
	}
	.profileBox{
		width:300px;
		background:#E8F5FD;
		margin-top:22px;
		padding:8px;
	}
	.ininin{
		margin-top:8px;
	}
	#myintro{
		height:35px;
	}
	
	.file2{
		width:0;
		height:0;
	}
	.proImageMenu2{
		width:200px;
		background:white;
		padding:5px 0;
		border-radius:7px;
		position:absolute;
		left:10px;
		display:none;
		box-shadow: 0px 1px 3px gray;
	}
	.proUpBtn2{
		width:100%;
		height:40px;
		border:none;
		background:white;
	}
	.proUpBtn2:hover{
		background:#1DA1F2;
		color:white;
	}
	.proCancel2{
		width:100%;
		height:40px;
		border:none;
		background:white;
	}
	.proCancel2:hover{
		background:#1DA1F2;
		color:white;
	}
	
	.file3{
		width:0;
		height:0;
	}
	.proImageMenu3{
		width:200px;
		background:white;
		padding:5px 0;
		border-radius:7px;
		position:absolute;
		display:none;
		box-shadow: 0px 1px 3px gray;
		left:45%;
		top:50%;
	}
	.proUpBtn3{
		width:100%;
		height:40px;
		border:none;
		background:white;
	}
	.proUpBtn3:hover{
		background:#1DA1F2;
		color:white;
	}
	.proCancel3{
		width:100%;
		height:40px;
		border:none;
		background:white;
	}
	.proCancel3:hover{
		background:#1DA1F2;
		color:white;
	}
	
/* ----------------------------- */
	.imgBtn{
		border:none;
		font-size:21px;
		border-radius:5px;
		height:33px;
		line-height:33px;
		background:none;
		color:#1DA1F2;
	}
	.imgBtn:hover{
		border:1px solid #1DA1F2;
		box-shadow: inset 0 0 5px skyblue;
	}
	.mini{
		background:#F7F7F7;
		border-top:1px solid #EDEDED;
		padding-top:8px;
	}
	.file5{
		width:0;
		height:0;
	}
	.getImgBox{
		margin-left:50px;
		overflow:hidden;
	}
	.getImgBox2{

	}
	.getImg{
		width:100%;
		height:auto;
	}
/*----------------------*/
	.mediaList{
		overflow:hidden;
		height:180px;
	}
	.mediaList > .imgPostLi{
		display:inline-block;
		margin-right:3px;
		margin-top:3px;
	}
	.imgPostingBox{
		width:84px;
		height:84px;
		overflow:hidden;
		border-radius:5px;
	}
	.getImgpost{
		width:100%;
		height:84px;
	}
	.imgCountTxt{
		color:#1DA1F2;
		font-size:15px;
	}
	.imgListCount{
		width:20px;
		outline-style:none;
		border:none;
		color:#1DA1F2;
		font-size:15px;
		text-align:right;
		background:none;
		cursor:pointer;
	}
	
	#detailModal{
		z-index:10000;
		text-align:center;
	}
	.detailBox{
		margin-top:10px;
		margin-bottom:10px;
	}
	.modal-img{
		max-height:100vh;
 		width:auto;
	}
	
	#detailModal img{
		display:block;
	}
	#detailModal div {
		position: relative;
		display: inline-block;
		*display: inline;
		zoom: 1;
	}
	#detailModal .modalContent{
		position: absolute;
		left: 0;
		bottom: 0;
		width: 100%;
		background: #000;
		background: rgba(0,0,0,.5);
		display:none;
	}
	.clBtn{
		color:white;
		font-size:70px;
		margin-right:20px;
	}
	.modalContent{
		color:white;
		float:left;
		text-align:left;
		padding:10px;
	}
</style>

<title>Insert title here</title>
</head>
<body>
	
<div id="mainContainer container">
	<div class="topBox">
		<div class="topImage">
			<c:if test="${memberVO.mybackground == null}">
				
			</c:if>
			<c:if test="${memberVO.mybackground != null}">
				<div class="backgroundImgBox">
					<fmt:formatDate value="${memberVO.mybackgrounddate}" pattern="yyyy/MM/dd" var="mybackgrounddate"/>
					<img src="<c:url value='/images/${memberVO.userid}/${mybackgrounddate}/${memberVO.mybackground}'/>" class="backgroundImg">
				</div>
			</c:if>
		</div>
		<div class="topBar">
			<div class="topBarBox">
				<div class="topProImg">
					<c:if test="${memberVO.myimg == null}">
						<img src="${ctxpath}/resources/img/cameraicon.png" class="mymytop img-circle" alt="Cinque Terre">
					</c:if>
					<c:if test="${memberVO.myimg != null}">
						<fmt:formatDate value="${memberVO.myimgdate}" pattern="yyyy/MM/dd" var="myimgdate"/>
						<img src="<c:url value='/images/${memberVO.userid}/${myimgdate}/${memberVO.myimg}'/>" class="mymytop img-circle" alt="Cinque Terre">
					</c:if>
				</div>
				<a class="monitCount" href="/monitor/account/${memberVO.userid}" style="text-decoration:none;">
					<span style="color:gray;"><b>모닛</b></span><br>
					<input type="text" class="listCount" readonly="readonly" style="text-align:center;">
				</a>
				<a class="mediaCount" href="/monitor/media/${memberVO.userid}" style="text-decoration:none;">
					<span style="color:gray;"><b>미디어</b></span><br>
					<input type="text" class="imgCount" readonly="readonly" style="text-align:center;">
				</a>
				<a class="fwCount" href="/monitor/following/${memberVO.userid}" style="text-decoration:none;">
					<span style="color:gray;"><b>팔로잉</b></span><br>
					<input type="text" class="followingCount" readonly="readonly" style="text-align:center;" value="${followingCount}">
				</a>
				<a class="fwerCount" href="/monitor/follower/${memberVO.userid}" style="text-decoration:none;">
					<span style="color:gray;"><b>팔로워</b></span><br>
					<input type="text" class="followerCount" readonly="readonly" style="text-align:center;" value="${followerCount}">
				</a>
				<c:if test="${login != null}">
					<c:if test="${login.userid != memberVO.userid}">
						<div class="followBtnBox">
							<c:if test="${checkFriend == 1}">
								<button id="followingBtn" class="btn btn-default"><b>Following!</b></button>
							</c:if>
							<c:if test="${checkFriend == 0}">
								<button id="followBtn" class="btn btn-default"><b>Follow</b></button>				
							</c:if>
							<button id="followBtnAjax" class="btn btn-default"><b>Follow</b></button>
							<button id="followingBtnAjax" class="btn btn-default"><b>Following!</b></button>
						</div>
					</c:if>
				</c:if>
				<c:if test="${memberVO.userid == login.userid}">
					<button id="proModifyBtn" class="btn btn-default">프로필 변경</button>
				</c:if>
			</div>				
		</div>
	</div>
	<div class="mainBox row">
		<div class="leftSide col-sm-3">
			<div class="leftSide_Pro">
				<div class="leftSide_MyName">
					<c:if test="${memberVO.username == null}">
						<span><b style="font-size:22px;">이름을 등록해주세요</b></span>
					</c:if>
					<c:if test="${memberVO.username != null}">
						<span><b style="font-size:22px;">${memberVO.username}</b></span>
					</c:if>
					<br>
					<span style="color:gray;">@${memberVO.userid}</span>
				</div>
				<div class="mmm myinfoBox">
					<pre>${memberVO.myintro}</pre>
				</div>
				<div class="mmm" style="color:gray;">
					<span>지역 : ${memberVO.country}</span>
				</div>
				<div class="mmm" style="color:gray;">
					<span>가입일 : <fmt:formatDate value="${memberVO.regdate}" pattern="yyyy년 M월 dd일"/></span>
				</div>
			</div>
			<div class="leftSide_Etc">
				<a href="/monitor/media/${memberVO.userid}" style="text-decoration:none;">
					<span class="imgCountTxt"><b>업로드 된 사진<input type="text" class="imgListCount" readonly="readonly">개</b></span>
				</a>
				<div class="mediaList">
				</div>
			</div>
		</div>
				
		<div class="mainCenter col-sm-9">
				
		<!-- ------------------------------------------ 글이 존재하지 않을시 notlist-->
				<div class="notlist" style="display:none;"> 
					<img src="${ctxpath}/resources/img/df.gif">
					<div class="notPage">
						<b style="font-size:20px;">이런~ 아무도 팔로우를 하지않았군요</b><br>
						<b style="font-size:29px;">먼저 상대방을 등록해 보세요!</b><br>
						<p style="font-size:15px;">그럼 상대방도 등록하여 서로 친구가 되요!<br>
						사람들을 팔로우하고 그들의 모닛도 확인해 보세요.</p>
					</div>
				</div>
		<!-- ------------------------------------------ -->
			
			<div class="followingList">
			</div>
		</div>
	</div>

<!--detail Modal -->	
	<div class="modal fade" id="detailModal" role="dialog">
		<button type="button" class="close clBtn" data-dismiss="modal">&times;</button>
		<div class="detailBox">
			<img class="modal-img">
			<div class="modalContent">
				<span class="modal-name">${memberVO.username}</span>
				 @<span class="modal-id"></span>
				 ㆍ<span class="modal-date"></span>

				 <pre class="modal-con" style="display:block; border:none; background:none; color:white;"></pre>
			</div>
		</div>
	</div>
<!-- detail Modal end -->	

<!-- 프로필 수정화면 -->
<div class="overlayTopBack"></div>
<div class="modifyProfile">
	<div class="modifyProBack">
		<div title="헤더 사진 추가하기" class="backIconBox">
			<img src="${ctxpath}/resources/img/camera2.png" class="backIcon">
		</div>
		<div class="proImageMenu3">
			<input type="file" class="file3" id="file3" onchange="fileInfo3(this)"/>
			<button class="proUpBtn3">사진 올리기</button>
			<button class="proCancel3">취소</button>
		</div>
	</div>
	<div class="modifyProBar">
		<div class="modifyProBarIn">
			<div class="modifyProImg">
				<img src="${ctxpath}/resources/img/cameraicon.png" class="modipro img-circle" alt="Cinque Terre" title="프로필 사진 추가하기">
				<div class="proImageMenu2">
					<input type="file" class="file2" id="file2" onchange="fileInfo2(this)"/>
					<button class="proUpBtn2">사진 올리기</button>
					<button class="proCancel2">취소</button>
				</div>
			</div>
			<button id="modiSubmit" class="btn btn-default pull-right">프로필 변경완료</button>
			<button id="modiCancel" class="btn btn-default pull-right">취소</button>
		</div>
	</div>
	<div class="modifyCenter">
		<div class="modidyMyInfo">
			<div class="profileBox">
				
					<c:if test="${memberVO.username == null}">
						<input type="text" class="form-control ininin" name="username" id="username" placeholder="이름등록 필요">
					</c:if>
					<c:if test="${memberVO.username != null}">
						<input type="text" class="form-control ininin" name="username" id="username" placeholder="이름등록 필요" value="${memberVO.username}">
					</c:if>
						
	 			 	<span style="color:#1DA1F2;">@${memberVO.userid}</span>
	 			 	
	 			 	<div class="myintroBox">
		 			 	<c:if test="${memberVO.myintro == null}">
							<textarea class="form-control" name="myintro" id="myintro" style="resize:none; outline-style:none; overflow-y:hidden; margin-top:8px;" placeholder="자기소개"></textarea>
						</c:if>
						<c:if test="${memberVO.myintro != null}">
							<textarea class="form-control" name="myintro" id="myintro" style="resize:none; outline-style:none; overflow-y:hidden; margin-top:8px;" placeholder="자기소개">${memberVO.myintro}</textarea>
						</c:if>
					</div>
					
					<c:if test="${memberVO.country == null}">
						<input type="text" class="form-control ininin" name="country" id="country" placeholder="국적 or 위치">
					</c:if>
					<c:if test="${memberVO.country != null}">
						<input type="text" class="form-control ininin" name="country" id="country" placeholder="국적 or 위치" value="${memberVO.country}">
					</c:if>
				
			</div>
		</div>
	</div>
</div>

</div>

<!-- 팔로잉 Template -->
<script id="followingTemplate" type="myTemplate">
<li class="followingLi">
	<div class="postingBox">
	  <a href="/monitor/account/{{userid}}" style="cursor:pointer;">
		<div class="center_topBox">
			{{#if mybackground}}
				<img src="<c:url value='/images/{{userid}}/{{mybackgrounddate}}/{{mybackground}}'/>" class="center_topImg">
			{{/if}}
		</div>
		<div class="center_myImgBox">
			<img src="${ctxpath}/resources/img/cameraicon.png" class="center_myImg img-circle" alt="Cinque Terre">
			{{#if myimg}}
				<img src="<c:url value='/images/{{userid}}/{{myimgdate}}/{{myimg}}'/>" class="center_myImg img-circle" alt="Cinque Terre">
			{{/if}}
		</div>
		<div class="center_nameBox">
			<div class="center_nameLess">
				<span><b style="font-size:20px;">Nameless</b></span><br>
				<span><b style="color:gray;">@{{userid}}</b></span>
			</div>
			{{#if username}}
				<div class="center_nameOk">
					<span><b style="font-size:20px;">{{username}}</b></span><br>
					<span><b style="color:gray;">@{{userid}}</b></span>
				</div>
			{{/if}}
		</div>
		<div class="center_myinfoBox">
			{{#if myintro}}
				<pre>{{myintro}}</pre>
			{{/if}}
		</div>
	  </a>
	</div>
</li>
</script>

<!-- 미디어 Template -->
<script id="imgTemplate" type="myTemplate">
{{#if files}}
<li class="imgPostLi" data-pbno={{pbno}} data-id={{puserid}} data-date={{regdate}} data-con={{content}}>
	<div class="imgPostingBox">
		<a class="lplp" data-target="#detailModal" data-toggle="modal" style="cursor:pointer;">
			<img src="<c:url value='/images/{{puserid}}/{{regdate}}/{{files}}'/>" class="getImgpost">
		</a>
		<pre class="preContent" style="display:none;">{{content}}</pre>
	</div>
</li>
{{/if}}
</script>

<script>
var userid="${memberVO.userid}";
function getList(){ //목록 만들기 함수
	$.ajax({//글 목록 갯수 확인
		type : 'POST',
		url : '/monitor/account/listCheck/',
		data : "userid="+"${memberVO.userid}",
		dataType : 'JSON',
		success:function(data){
			var listCount = data.listCheck;
			$(".listCount").val(listCount);
		}
	});
//-------------------------------이미지 목록
	$.getJSON("/monitor/account/all/"+userid, function(data){
		var templateS = document.querySelector("#imgTemplate").innerHTML;
		var bindTemplateS = Handlebars.compile(templateS);
		var resultHTMLS = data.reduce(function(prev,next){
	        return prev + bindTemplateS(next);
	    }, "");
		var imgpostList = document.querySelector(".mediaList");
		imgpostList.innerHTML = resultHTMLS;
	});
	
	$.ajax({//이미지 목록 갯수 확인
		type : 'POST',
		url : '/monitor/imgListCheck',
		data : "userid="+"${memberVO.userid}",
		dataType : 'JSON',
		success:function(data){
			var imgListCount = data.imgListCheck;
			$(".imgListCount").val(imgListCount);
			$(".imgCount").val(imgListCount);
		}
	});
	
	//-------------------------------팔로워 목록
	$.getJSON("/monitor/follower/all/"+userid, function(data){
		var template = document.querySelector("#followingTemplate").innerHTML;
		var bindTemplate = Handlebars.compile(template);
		var resultHTML = data.reduce(function(prev,next){
	        return prev + bindTemplate(next);
	    }, "");
		var followingList = document.querySelector(".followingList");
		followingList.innerHTML = resultHTML;
	});
	$.ajax({//팔로잉 목록 갯수 확인
		type : 'POST',
		url : '/monitor/followerCheck',
		data : "userid="+"${memberVO.userid}",
		dataType : 'JSON',
		success:function(data){
			var followerCount = data.followerCheck;
			$(".followerCount").val(followerCount);
			if(data.followerCheck > 0){
				$(".notlist").css("display", "none");
			}else{
				$(".notlist").css("display", "block");
			}
		}
	});
}

$(function(){
	$(".mediaList, .followingList").html(function(){
		getList();
	});
});
</script>

<script>
$(function(){//모달 이벤트 처리
	$(".mediaList").on("click", ".imgPostLi", function(event){
		var post = $(this);
		$(".modal-id").html(post.attr("data-id"));
		$(".modal-date").html(post.attr("data-date"));
		
		var imgurl = post.find(".getImgpost").attr("src");
		$(".modal-img").attr("src", imgurl);
		
		var pe = post.find(".preContent").text();
		$(".modal-con").text(pe);
	});
	
	//이미지에 마우스 올렸을 때 이벤트
	$(".modal-img").mouseenter(function(){
		$(".modalContent").fadeIn();
	});
	$(".modal-img").mouseleave(function(){
		$(".modalContent").css("display", "none");
	});
});
</script>

<!-- 프로필 수정 이벤트 -->
<script>
$(function(){
	var userid = '${login.userid}';
	$("#proModifyBtn").click(function(){
		$('.overlayTopBack').show();
		$('.modifyProfile').show();
	});
	$("#modiCancel").click(function(){
		/* $('.overlayTopBack').hide();
		$('.modifyProfile').hide(); */
		self.location="/monitor/account/"+userid;
	});
});

//프로필 수정 - 자기소개 창크기 자동조절
$(document).ready(function() {
    $('.myintroBox').on( 'keyup', 'textarea', function (e){
      $(this).css('height', 'auto' );
      $(this).height( this.scrollHeight );
    });
    $('.myintroBox').find('textarea' .keyup());
 });
 
$(function(){
	$("#modiSubmit").click(function(){
		var userid = "${login.userid}";
		var username = $("#username").val();
		var myintro = $("#myintro").val();
		var country = $("#country").val();
		
		$.ajax({
			type : 'POST',
			url : '/monitor/member/myinfoUpdate/'+userid,
			headers : {
				"Content-Type" : "application/json",
			    "X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				username : username,
				myintro : myintro,
				country : country
			}),
			success : function(result){
				console.log("result : "+result);
				if(result == 'SUCCESS'){
					location.reload();
				}
			}
		});
	});
});
</script>

<script>
$(function(){//프로필 사진 수정 클릭 이벤트
	$(".proUpBtn2").click(function(){ 
		event.preventDefault();
		$(".file2").click();
	});
	$(".modipro").click(function(){
		event.preventDefault();
		$(".proImageMenu2").css("display", "block");
	});
	$(document).on('click','.proCancel2',function(){
		event.preventDefault();
		$(".proImageMenu2").css("display", "none");
	});
});

function fileInfo2(f){
	var files = f.files; 
	if(files[0].size > 1024 * 1024){
		alert('1MB 이하의 파일만 올려주세요');
		return;
	}
	else if(files[0].type.indexOf('image') < 0){
		alert('이미지 파일만 선택하세요');
		return;
	}

	var reader = new FileReader();
	reader.onload = function(rst){
		$(".proImageMenu2").css("display", "none");
		$(".modipro").css("display", "none");
		$('.modifyProImg').append('<img src="' + rst.target.result + '" class="modiproMK img-circle">');
	}
	reader.readAsDataURL(files[0]);
	
	$("#modiSubmit").click(function(){
		var userid = "${login.userid}";
		var file = files[0];
		var formData = new FormData();
	    formData.append("file", file);

	    $.ajax({
	    	url: '/monitor/uploadMyImage/'+userid,
	    	data: formData,
	    	dataType: 'text',
	    	processData: false,
	    	contentType: false,
	    	type: 'POST',
	    	success:function(data){
	    		if(data != null){
	    			location.reload();
	    		}
	    	}
	    });
	});
}
</script>
<script>
$(function(){//헤더 사진 수정 클릭 이벤트
	$(".proUpBtn3").click(function(){ 
		event.preventDefault();
		$(".file3").click();
	});
	$(".backIconBox").click(function(){
		event.preventDefault();
		$(".proImageMenu3").css("display", "block");
	});
	$(document).on('click','.proCancel3',function(){
		event.preventDefault();
		$(".proImageMenu3").css("display", "none");
	});
});

function fileInfo3(f){
	var files = f.files; 
	if(files[0].size > 1024 * 1024){
		alert('1MB 이하의 파일만 올려주세요');
		return;
	}
	else if(files[0].type.indexOf('image') < 0){ 
		alert('이미지 파일만 선택하세요');
		return;
	}

	var reader = new FileReader(); 
	reader.onload = function(rst){
		$(".proImageMenu3").css("display", "none");
		$(".backIconBox").css("display", "none");
		$('.modifyProBack').append('<img src="' + rst.target.result + '" class="modiproMK2">');
	}
	reader.readAsDataURL(files[0]);
	
	$("#modiSubmit").click(function(){
		var userid = "${login.userid}";
		var file = files[0];
		var formData = new FormData();
	    formData.append("file", file);

	    $.ajax({
	    	url: '/monitor/uploadMyTop/'+userid,
	    	data: formData,
	    	dataType: 'text',
	    	processData: false,
	    	contentType: false,
	    	type: 'POST',
	    	success:function(data){
	    		if(data != null){
	    			location.reload();
	    		}
	    	}
	    });
	});
}
</script>

<!-- --------------------------------팔로우 하기 -->
<script>
$("#followBtn, #followBtnAjax").click(function(){//등록
	var userid = "${login.userid}";
	var following = "${memberVO.userid}"	
	$.ajax({
		type : 'POST',
		url : '/monitor/account/addFriend',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			userid : userid,
			following : following
		}),
		success : function(result){
			console.log("result : "+result);
			if(result == 'SUCCESS'){
				$("#followBtn").remove();
				$("#followBtnAjax").css("display", "none");
				$("#followingBtnAjax").css("display", "block");
			}
		}
	});
});
$("#followingBtn, #followingBtnAjax").click(function(){//삭제
	var userid = "${login.userid}";
	var following = "${memberVO.userid}"	
	$.ajax({
		type : 'POST',
		url : '/monitor/account/deleteFriend',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			userid : userid,
			following : following
		}),
		success : function(result){
			console.log("result : "+result);
			if(result == 'SUCCESS'){
				$("#followingBtn").remove();
				$("#followingBtnAjax").css("display", "none");
				$("#followBtnAjax").css("display", "block");
			}
		}
	});
});
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${ctxpath}/resources/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
</body>
</html>