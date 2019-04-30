<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<%@include file="include/header.jsp" %>

<style>
	#mainContainer{
		
	}
	.mainBox{
		width:1200px;
		margin:0 auto;
		margin-top:10px;
	}
	.mainCenter{
		background:white;
	}

/* ---------------------------------------------- rightSide */
	.rightSide_etcBox{
		width:100%;
		height:280px;
		background:white;
		margin-bottom:10px;
		position:relative;
		text-align:center;
	}
	.rightSide_etcBox > img{
		margin-top:17px;
	}
	.rightSide_etcText{
		padding:0 14px 0 14px;
	}
	.rightSide_Box{
		width:100%;
		height:280px;
		background:white;
		margin-bottom:10px;
		padding:13px;
	}
	.rightSide_listBox{
		margin-top:10px;
	}
	.bestUserBox{
		border-bottom:1px solid #e6ecf0;
		position:relative;
		padding:8px 0 8px 0;
	}
	.buiBox{
		width:50px;
		height:50px;
	}
	.bestUserImg{
		width:100%;
		height:100%;
	}
	.bunBox{
		position:absolute;
		top:8px;
		left:55px;
	}
	.buBtn{
		border-radius:18px;
		position:absolute;
		top:30px;
		left:60px;
		background:white;
		border:1px solid #1DA1F2;
		width:90px;
		height:26px;
		color:#1DA1F2;
	}
	.buBtn:hover{
		background:#F6FDFF;
	}
/* ---------------------------------------------- */
	.leftSide_Pro{
		width:100%;
		height:195px;
		background:white;
		position:relative;
	}
	.leftSide_Etc{
		width:100%;
		margin-top:15px;
	}
	.leftSide_Img{
		width:80px;
		height:80px;
		position:absolute;
		top:50px;
		left:15px;
		z-index:900;
	}
	.leftSide_Img > .mymy{
		width:100%;
		height:100%;
		border:4px solid white;
		background:white;
	}
	.leftSide_MyName{
		width:165px;
		position:absolute;
		left:100px;
		margin-top:10px;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	.leftSide_MyName > span{
   		white-space:nowrap;
	}
	.monitCount{
		position:absolute;
		bottom:13px;
		left:13px;
	}
	.listCount{
		width:40px;
		outline-style:none;
		border:none;
		color:#1DA1F2;
		font-size:19px;
	}
	.linkAccount{
		width:80px;
		height:80px;
		position:absolute;
		z-index:910;
	}
/* --------------------------------------------------------------- */

	.mainCenter{
		padding:0;
		background-color:#e6ecf0;
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
		height:100%;
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
	
	
	.postList > li{
		margin-top:2px;
	}
	.postingBox{
		width:100%;
		background-color:white;
		padding:8px;
	}
	.center_posting{
		
	}
	.nameBox{
		position:relative;
	}
	.posting_ProImg{
		width:43px;
		height:43px;
		z-index:500;
		position:absolute;
		top:0;
	}
	.postingName{
		padding-left:50px;
	}
	.contentBox{
		padding-left:50px;
	}
	.contentBox > pre{
		padding:0;
		background-color:white;
		border:none;
		width:auto;
		height:auto;
		overflow-x:hidden;
		white-space:pre-wrap;
	}
	.etcBox{
		width:510px;
		margin-left:50px;
	}
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
	.textArea2{
		width:100%;
		border:none;
		resize:none;
		overflow-y:hidden;
	}
	.postMenu{
		position:absolute;
		top:0;
		right:0;
	}
	#myModal{
		margin-top:100px;
	}
	.likeText{
		padding:0;
		border:none;
	}
	.heart{
		cursor:pointer;
	}
	
	.myhover:hover{
		border:5px solid skyblue;
		cursor:pointer;
	}
	.proImageMenu{
		width:200px;
		background:white;
		padding:5px 0;
		border-radius:7px;
		position:absolute;
		left:-60px;
		display:none;
		box-shadow: 0px 1px 3px gray;
	}
	.file{
		width:0;
		height:0;
	}
	.proUpBtn{
		width:100%;
		height:40px;
		border:none;
		background:white;
	}
	.proUpBtn:hover{
		background:#1DA1F2;
		color:white;
	}
	.proCancel{
		width:100%;
		height:40px;
		border:none;
		background:white;
	}
	.proCancel:hover{
		background:#1DA1F2;
		color:white;
	}
	
	
	.upP{
		width:350px;
		height:350px;
	}
	#modDiv {
		width: 500px;
		height: 450px;
		background-color:white;
		position: absolute;
		top: 10%;
		left: 40%;
		margin-top: -50px;
		margin-left: -150px;
		padding: 10px;
		z-index: 8000;
		border-radius:5px;
	}
	.overlay{
		position: fixed;
		background: black;
		opacity: 0.5;
		display: none;
		top: 0;
		left: 0;
		width: 100%;
		height: 100vh;
		z-index: 7000;
	}
	.modTitle{
	text-align:center;
	}
	.modBtns > button{
		margin-left:5px;
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
	.file4{
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

<script>
	var result = '${msg}';
	if(result == "success"){
		alert('이메일 인증을 해주세요');
	}
</script>


<div id="mainContainer container">
	<div class="mainBox row">
		<div class="leftSide col-sm-3">
			<div class="leftSide_Pro">
				<a href="/monitor/account/${login.userid}" style="width:100%; background:#1DA1F2; height:80px; display:block;">
				</a>
				<div class="leftSide_Img">
					<c:if test="${memberVO.myimg == null}">
						<img src="${ctxpath}/resources/img/cameraicon.png" class="mymy img-circle myhover" alt="Cinque Terre" title="프로필 사진 추가하기">
						<div class="proImageMenu">
							<input type="file" class="file" id="file" onchange="fileInfo(this)"/>
							<button class="proUpBtn">사진 올리기</button>
							<button class="proCancel">취소</button>
						</div>
					</c:if>
					<c:if test="${memberVO.myimg != null}">
						<fmt:formatDate value="${memberVO.myimgdate}" pattern="yyyy/MM/dd" var="myimgdate"/>
						<a href="/monitor/account/${login.userid}" class="linkAccount"></a>
						<img src="<c:url value='/images/${memberVO.userid}/${myimgdate}/${memberVO.myimg}'/>" class="mymy img-circle" alt="Cinque Terre" id="myProimges">
					</c:if>
				</div>
				<div class="leftSide_MyName">
					<c:if test="${memberVO.username == null}">
						<span><b style="font-size:15px;">이름을 등록해주세요</b></span>
					</c:if>
					<c:if test="${memberVO.username != null}">
						<span><b style="font-size:15px;">${memberVO.username}</b></span>
					</c:if>
					<br>
					<span>@${login.userid}</span>
				</div>
				<div class="monitCount">
					<span style="color:gray"><b>모닛</b></span><br>
					<input type="text" class="listCount" readonly="readonly">
				</div>
			</div>
			<div class="leftSide_Etc">
				<a href="/monitor/media/${login.userid}" style="text-decoration:none;">
					<span class="imgCountTxt"><b>업로드 된 사진<input type="text" class="imgListCount" readonly="readonly">개</b></span>
				</a>
				<div class="mediaList">
				</div>
			</div>
		</div>
		
		<div class="mainCenter col-sm-6">
			<div class="center_Post">
				<div class="postBox">
					<div class="center_ProImg">
						<c:if test="${memberVO.myimg == null}">
							<img src="${ctxpath}/resources/img/cameraicon.png" class="mymy2 img-circle" alt="Cinque Terre">
						</c:if>
						<c:if test="${memberVO.myimg != null}">
							<fmt:formatDate value="${memberVO.myimgdate}" pattern="yyyy/MM/dd" var="myimgdate"/>
							<img src="<c:url value='/images/${memberVO.userid}/${myimgdate}/${memberVO.myimg}'/>" class="mymy2 img-circle" alt="Cinque Terre">
						</c:if>
					</div>
					<div class="textBox">
						<textarea id="postTxt" placeholder="What is happening?" style="width:100%; height:100%; resize:none; border:none; outline-style:none; overflow-y:hidden;"></textarea>
					</div>
				</div>
			</div>
			<div class="center_Post2">
				<div class="postBox2">
					<div class="center_ProImg2">
						<c:if test="${memberVO.myimg == null}">
							<img src="${ctxpath}/resources/img/cameraicon.png" class="mymy2 img-circle" alt="Cinque Terre">
						</c:if>
						<c:if test="${memberVO.myimg != null}">
							<fmt:formatDate value="${memberVO.myimgdate}" pattern="yyyy/MM/dd" var="myimgdate"/>
							<img src="<c:url value='/images/${memberVO.userid}/${myimgdate}/${memberVO.myimg}'/>" class="mymy2 img-circle" alt="Cinque Terre">
						</c:if>
					</div>
					<div class="textBox2">
						<textarea id="content" name="content" placeholder="What is happening?" class="textArea" style="outline-style:none;"></textarea>
						<div class="uploadedList"></div>
					</div>
					<div class="centerBar">
						<input type="file" class="file4" id="file4" onchange="fileInfo4(this)"/>
						<button class="imgBtn pull-left" title="이미지 올리기"><span class="glyphicon glyphicon-picture"></span></button>
						<input type="button" name="writeBtn" id="writeBtn" class="btn btn-primary centerBtn pull-right" value="모닛하기">
					</div>
				</div>
			</div>
<%--  			<c:forEach var="postVO" items="${list}">
					<div class="kkk">
						<span>${postVO.pbno}</span>
						<span>${postVO.puserid}</span>
						<span>${postVO.content}</span>
						<span>${postVO.regdate}</span>
						<br><br>
					</div>
				</c:forEach>--%>
				
			<!-- <ul id="listPage"></ul> -->
			
	<!-- ------------------------------------------ 글이 존재하지 않을시 notlist-->
			<div class="notlist" style="display:none;"> 
				<img src="${ctxpath}/resources/img/df.gif">
				<div class="notPage">
					<b style="font-size:20px;">저런~ 아직 글이 없군요</b><br>
					<b style="font-size:29px;">첫 모닛을 작성해보세요!</b><br>
					<p style="font-size:15px;">지금은 타임라인이 비어 있습니다.<br>
					사람들을 팔로우하고 그들의 모닛으로 타임라인을 채워보세요.</p>
				</div>
			</div>
	<!-- ------------------------------------------ -->
			<div class="postList">
			</div>
			
		</div> 
		
		<div class="rightSide col-sm-3">
			<div class="rightSide_etcBox">
				<img src="${ctxpath}/resources/img/etcprom.png" style="width:170px;">
				<div class="rightSide_etcText">
					<span style="font-size:18px;"><b>새로운 모니터를 만나보세요.</b></span><br>
					<span style="color:#657786;">북마크, 어두운 모드, 데이터 세이버 등, 웹에 새롭게 도입되는 기능을 확인해보세요.</span>
				</div>
			</div>
			<div class="rightSide_Box">
				<span style="font-size:18px;"><b>팔로우 추천</b></span>
				<div class="rightSide_listBox">
				</div>
			</div>
		</div>
	</div>
	
<!-- Modal -->	
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="text-align:center; border-bottom:none;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<p class="modal-title" style="color:white;"></p><h4><b>정말로 삭제하시겠습니까?</b></h4>
				</div>
				<div class="modal-body" style="text-align:center;">
					<p>한번 삭제하면 다시는 복구할 수 없습니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger" id="postDeleteBtn">DELETE</button>
				</div>
			</div>
		</div>
	</div>
<!-- Modal end -->

<!-- 프로필 이미지 미리보기 -->
	<div id='modDiv' style="display: none;">
		<button type="button" class="modClose close">&times;</button>
		<div class='modTitle'>
			<h4><b>이미지 미리보기</b></h4>
		</div>
		<div>
			<div class="img_box"></div>
		</div>
		<div class="modBtns">
			<button type="button" id='modSubmit' class="btn btn-primary pull-right">확인</button>
			<button type="button" id="modCancel" class="btn btn-danger pull-right">취소</button>
		</div>
	</div>
	<div class="overlay"></div>
	
<!--detail Modal -->	
	<div class="modal fade" id="detailModal" role="dialog">
		<button type="button" class="close clBtn" data-dismiss="modal">&times;</button>
		<div class="detailBox">
			<img class="modal-img">
			<div class="modalContent">
				<span class="modal-name">${login.username}</span>
				 @<span class="modal-id"></span>
				 ㆍ<span class="modal-date"></span>

				 <pre class="modal-con" style="display:block; border:none; background:none; color:white;"></pre>
			</div>
		</div>
	</div>
<!-- detail Modal end -->
	
</div>

<script><!-- 텍스트 에리어 자동조절 -->
$(document).ready(function() {
    $('.textBox2').on( 'keyup', 'textarea', function (e){
      $(this).css('height', 'auto' );
      $(this).height( this.scrollHeight );
    });
    $('.textBox2').find('textarea' .keyup());
 });
 
$(document).ready(function(){
	$("#postTxt").click(function(){
		$(".center_Post").css("display", "none");
		$(".center_Post2").css("display", "block");
		$("#content").focus();
	});
});

$(function(){ //레이어 위치 계산해서 이외에 곳 클릭하면 사라지게
	$(document).mousedown(function( e ){
        if($(".center_Post2").is(":visible")){
            $(".center_Post2").each(function(){
            	var contentObjs = $("#content");
        		var contents = contentObjs.val();
        		
                var l_position = $(this).offset();
                l_position.right = parseInt(l_position.left) + ($(this).width());
                l_position.bottom = parseInt(l_position.top) + parseInt($(this).height());

                if( ( l_position.left <= e.pageX && e.pageX <= l_position.right )
                    && ( l_position.top <= e.pageY && e.pageY <= l_position.bottom ) || (contents != "") || $('.mini').length ) {
                } else {
                	$(".center_Post").css("display", "block");
            		$(".center_Post2").css("display", "none");
                }
            });
        }
    });
});

</script>
<script><!-- 글 등록 -->
//글 등록 ajax
$(function(){
	$("#writeBtn").click(function(){
		if ($('.mini').length) {
			
			var puserid = "${login.userid}";
			var contentObj = $("#content");
			var content = contentObj.val();
	 		var ss = $(".miniA").attr("href");
			var files = ss.substr(ss.lastIndexOf("/")+1);
			var mediatype = 1;
			
			$.ajax({
				type : 'POST',
				url : '/monitor/',
				headers : {
					"Content-Type" : "application/json",
				    "X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					puserid : puserid,
					content : content,
					files : files,
					mediatype : mediatype
				}),
				success : function(result){
					console.log("result : "+result);
					if(result == 'SUCCESS'){
						alert("등록되었습니다.");
						contentObj.val("");
						getList();
						$(".miniA").parent("div").remove();
					}
				}
			});
		}else{
			
			var puserid = "${login.userid}";
			var contentObj = $("#content");
			var content = contentObj.val();
			var mediatype = 0;
			
			$.ajax({
				type : 'POST',
				url : '/monitor/',
				headers : {
					"Content-Type" : "application/json",
				    "X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					puserid : puserid,
					content : content,
					mediatype : mediatype
				}),
				success : function(result){
					console.log("result : "+result);
					if(result == 'SUCCESS'){
						alert("등록되었습니다.");
						contentObj.val("");
						getList();
						$(".miniA").parent("div").remove();
					}
				}
			});
		}///end else

	});
});
</script>

<!-- 포스팅 Template -->
<script id="listTemplate" type="myTemplate">
<li class="postLi" data-pbno={{pbno}}>
	<div class="postingBox">	
		<div class="center_Posting">
			<div class="nameBox">
				<div class="posting_ProImg">
					<c:if test="${memberVO.myimg == null}">
						<img src="${ctxpath}/resources/img/cameraicon.png" class="mymy2 img-circle" alt="Cinque Terre">
					</c:if>
					<c:if test="${memberVO.myimg != null}">
						<fmt:formatDate value="${memberVO.myimgdate}" pattern="yyyy/MM/dd" var="myimgdate"/>
						<img src="<c:url value='/images/${memberVO.userid}/${myimgdate}/${memberVO.myimg}'/>" class="mymy2 img-circle" alt="Cinque Terre">
					</c:if>
				</div>
				<div class="postingName">
					<c:if test="${memberVO.username == null}">
						<b style="font-size:15px;">이름을 등록해주세요</b>
					</c:if>
					<c:if test="${memberVO.username != null}">
						<b style="font-size:15px;">${memberVO.username}</b>
					</c:if>
					@{{puserid}} <span style="color:gray;">· {{regdate}}<span>
				</div>
				<div class="postMenu">
					<button type="button" class="postDeleteBtn close" aria-label="Close" data-target="#myModal" data-toggle="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>	
			</div>

        	<div class="contentBox">
				<pre>{{content}}</pre>
			</div>

			{{#if files}}
				<div class="getImgBox">
					<div class="getImgBox2">
						<img src="<c:url value='/images/{{puserid}}/{{regdate}}/{{files}}'/>" class="getImg">
					</div>
				</div>
			{{/if}}
			
        	<div class="etcBox">
				<div class="postLike">
					<a style="font-size:17px; color:#F86E6E;" class="heart" title="좋아요!">
						<label for="heartss" class="heartss" style="cursor:pointer;">❤  
						<input type="text" class="likeText" value="{{good}}" readonly="readonly">
						</label>
					</a>
				</div>
			</div>

		</div>
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

<!-- 추천유저 Template -->
<script id="bestUserTemplate" type="myTemplate">
<li class="userLi">
	<div class="bestUserBox">
	  <a href="/monitor/account/{{userid}}" style="cursor:pointer;">
		<div class="buiBox">
			<img src="<c:url value='/images/{{userid}}/{{myimgdate}}/{{myimg}}'/>" class="bestUserImg img-circle">
		</div>
		<div class="bunBox">
			<span><b>{{username}}</b> @{{userid}}</span>
		</div>
	  </a>
		<button class="buBtn">팔로우</button>
	</div>
</li>
</script>

<script>
var userid="${login.userid}";
function getList(){ //목록 만들기 함수
	$.getJSON("/monitor/all/"+userid, function(data){
		var template = document.querySelector("#listTemplate").innerHTML;
		var bindTemplate = Handlebars.compile(template);
		var resultHTML = data.reduce(function(prev,next){
	        return prev + bindTemplate(next);
	    }, "");
		var postList = document.querySelector(".postList");
		postList.innerHTML = resultHTML;
		
		/* var pbno = [];
		$(".postList .postLi").each(function(index){
			pbno.push($(this).attr("data-pbno"));
			$.getJSON("/monitor/getImgFile/"+pbno[index], function(data){
				var source = $("#listTemplate").html();
				if(data != ""){
					alert("jajsj : "+data);
				}
			});
		}); */

	});
	$.ajax({//목록 갯수 확인
		type : 'POST',
		url : '/monitor/listCheck/',
		data : "userid="+"${login.userid}",
		dataType : 'JSON',
		success:function(data){
			var listCount = data.listCheck;
			$(".listCount").val(listCount);
			if(data.listCheck > 0){
				$(".notlist").css("display", "none");
			}else{
				$(".notlist").css("display", "block");
			}
		}
	});
	
//-------------------------------이미지 목록
	$.getJSON("/monitor/all/"+userid, function(data){
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
		data : "userid="+"${login.userid}",
		dataType : 'JSON',
		success:function(data){
			var imgListCount = data.imgListCheck;
			$(".imgListCount").val(imgListCount);
		}
	});
	
//-------------------------------추천 유저 목록
	$.getJSON("/monitor/bestUser", function(data){
		var templateU = document.querySelector("#bestUserTemplate").innerHTML;
		var bindTemplateU = Handlebars.compile(templateU);
		var resultHTMLU = data.reduce(function(prev,next){
	        return prev + bindTemplateU(next);
	    }, "");
		var bestUserList = document.querySelector(".rightSide_listBox");
		bestUserList.innerHTML = resultHTMLU;
	});
}
$(function(){ //들어오자마자 페이지 보이기 함수
	$(".postList").html(function(){
		getList();
	});
});
</script>

<script>
$(function(){//모달 이벤트 처리
	$(".postList").on("click", ".postLi", function(event){
		var post = $(this);
		$(".modal-title").html(post.attr("data-pbno"));
	});
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

<script type="text/javascript">
$(function(){//글 삭제 ajax 스크립트
	$("#postDeleteBtn").click(function(){
		var pbno = $(".modal-title").html();
		$.ajax({
			type : 'DELETE',
			url : '/monitor/delete/'+pbno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "DELETE" },
			dataType:'text',
			success : function(result){
				if(result == 'SUCCESS'){
					alert("삭제 되었습니다");
					 /* $("#myModal").removeClass("in");
					 $(".modal-backdrop").remove();
					 $("#myModal").hide(); */
					 $('.modal').remove();
					 $('.modal-backdrop').remove();
					 $('body').removeClass("modal-open");
					 getList();
				}
			}
		});
	});
});
</script>
<script>
$(function(){
	$(document).on('click','.heart',function(){//클릭 스크립트 실행 안될경우 이줄 사용
		var thats = $(this);
		var pbno = $(".modal-title").html();
		var guserid = "${login.userid}";
		
		/* var heart = $(".likeText").val(); */
		/* alert("a : "+pbno+", userid : "+guserid); */
		/* alert("a : "+pbno+", userid : "+userid+", heart : "+heart);	 */
		
  		$.ajax({
			type: 'POST',
			url: '/monitor/heart/'+pbno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			data:JSON.stringify({guserid:guserid}),
			success: function(data){
				if(data.heart == 1) {
					$(this).html(thats.find(".likeText").val(data.goodCount));
                }
                else{
                	$(this).html(thats.find(".likeText").val(data.goodCount));
                }
			}
		});  
	});
});

</script>

<!-- <script>
$(function(){
	$.ajax({
		type : 'POST',
		url : '/monitor/listCheck/',
		data : "userid="+"${login.userid}",
		dataType : 'JSON',
		success:function(data){
			if(data.listCheck > 0){
				$(".notlist").css("display", "none");
			}else{
				$(".notlist").css("display", "block");
			}
		}
	});
});
</script> -->

<!--test List Script-->
<!-- <script type="text/javascript">
		var userid="${login.userid}";
		function getList(){ //댓글목록 만들기 함수
			$.getJSON("/monitor/all/"+userid, function(data){
				var str="";
				
				$(data).each(function(){
					str += "<li data-pbno='"+this.pbno+"' class='replyLi'>" + this.pbno + ":" + this.puserid + ":" + this.content + ":" + "<button>MOD</button></li>";
				});
				$("#listPage").html(str);
			});
		}
		$(function(){ //들어오자마자 페이지 보이기 함수
			$("#listPage").html(function(){
				getList();
			});
		});
</script> -->

<script>
$(function(){
	$(".proUpBtn").click(function(){ //프로필 사진 클릭 이벤트
		event.preventDefault();
		$(".file").click();
	});
	$(".myhover").click(function(){
		event.preventDefault();
		$(".proImageMenu").css("display", "block");
	});
	$(".proCancel").click(function(){
		event.preventDefault();
		$(".proImageMenu").css("display", "none");
	});
});
</script>

<script>
function fileInfo(f){//프로필 사진 미리보기 스크립트
	var files = f.files; 
	if(files[0].size > 1024 * 1024){
		alert('1MB 이하의 파일만 올려주세요');
		return;
	}
	else if(files[0].type.indexOf('image') < 0){ // 선택한 파일이 이미지인지 확인
		alert('이미지 파일만 선택하세요');
		return;
	}

	var reader = new FileReader(); // FileReader 객체 사용
	reader.onload = function(rst){
		$(".proImageMenu").css("display", "none");
		$("#modDiv").show("slow");
		$('.overlay').fadeToggle(700);
		$('.img_box').append('<img src="' + rst.target.result + '" class="upP img-circle">');
	}
	reader.readAsDataURL(files[0]); // 파일을 읽는다
	
	$("#modSubmit").click(function(){
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
	    			/* $("#modDiv, .overlay").css("display", "none");
	    			$("#myProimges").html(); */
	    			location.reload();
	    		}
	    	}
	    });
	});
}
$(function(){
	$(".overlay, #modCancel, .modClose").click(function () {
	    self.location="/monitor/";
	});
});
</script>

<!-- ------------------------------------------------------ 포스트 이미지 업로드 -->
<script>
//이미지 드롭할 경우
$("#content").on("dragenter dragover", function(event) {
    event.preventDefault();
});

$("#content").on("drop", function(event) {
    event.preventDefault();
    var userid = "${login.userid}";
    var files = event.originalEvent.dataTransfer.files;
    var file = files[0];
    //console.log(file);
    if(files[0].type.indexOf('image') < 0){ 
		alert('이미지 파일만 선택하세요');
		return;
	}
    
    var formData = new FormData();
    formData.append("file", file);

    $.ajax({
  	 url: '/monitor/uploadPostImg/'+userid,
  	 data: formData,
  	 dataType: 'text',
  	 processData: false,
  	 contentType: false,
  	 type: 'POST',
  	 success:function(data){
  		  var str="";
  		 if(data != null){
  			if(checkImageType(data)){
  	  			 str="<div class='mini'>"+"<a class='miniA' target='_blank' href=displayFile?fileName="+getImageLink(data)+">"
  	  			 +"<img src=displayFile?fileName="+data+">"+"</a>"
  	  			 +"<small data-src="+data+" class='badge del' style='cursor:pointer;'>X</small>"+"</div>";
  	  		}
  		 }
  		$(".uploadedList").append(str);
  	 }
   });
});
function checkImageType(fileName){//이미지일 경우
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);   
}
function getImageLink(fileName){//클릭시 원본 이미지 보이게하는 함수(섬네일 이미지 문자열 잘라서 원본 이름 불러옴)
	if(!checkImageType(fileName)){
		return;
	}
	var front = fileName.substr(0, fileName.lastIndexOf("_"));
	var end = fileName.substr(fileName.lastIndexOf("_s")+2);
	return front + end;
}

//섬네일 이미지와 원본이미지 삭제
$(".uploadedList").on("click","small", function(event){
	var that = $(this);
	
	$.ajax({
		url: "/monitor/deleteFile",
		type: "POST",
		data: {fileName:$(this).attr("data-src")},
		dataType: "text",
		success:function(result){
			if(result == 'deleted'){
				that.parent("div").remove();
			}
		}
	});
});

//이미지 버튼 클릭할 경우
$(function(){
	$(".imgBtn").click(function(){ 
		event.preventDefault();
		$(".file4").click();
	});
});
function fileInfo4(ff){
	
    var files = ff.files;
    var userid = "${login.userid}";
    
    if(files[0].type.indexOf('image') < 0){ 
		alert('이미지 파일만 선택하세요');
		return;
	}
    
    var file = files[0];
    var formData = new FormData();
    formData.append("file", file);

    $.ajax({
  	 url: '/monitor/uploadPostImg/'+userid,
  	 data: formData,
  	 dataType: 'text',
  	 processData: false,
  	 contentType: false,
  	 type: 'POST',
  	 success:function(data){
  		  var str="";
  		 if(data != null){
  			if(checkImageType(data)){
  	  			 str="<div class='mini'>"+"<a class='miniA' target='_blank' href=displayFile?fileName="+getImageLink(data)+">"
  	  			 +"<img src=displayFile?fileName="+data+">"+"</a>"
  	  			 +"<small data-src="+data+" class='badge' style='cursor:pointer;'>X</small>"+"</div>";
  	  		}
  		 }
  		$(".uploadedList").append(str);
  	 }
   });
}
</script>
<!-- ------------------------------------------------------ 포스트 이미지 업로드 end -->

<!-- ------------------------------------------------------ 경계선 -->
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