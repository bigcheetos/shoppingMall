
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>

<html>

<style>

.top_tbl {
	padding-top: 20px;
	background: #f3ebe6;
	height: 60px;
}
.top_tbl td {
    padding-left: 30px;
    padding-top: 10px;
    background: #f3ebe6;
    height: 30px;
 	float: inherit;
 }
.top_tbl td.title {
    font-size: 20px;
    color: #333333;
    letter-spacing: -0.5px;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 60%;
    padding-right: 0;
}
.top_tbl .clfix .date {
    float: left;
    font-size: 17px;
    color: #666666;
    padding-right: 12px;
    border-right: 1px solid #b2b2b2;
    width: 40%;
    text-align: right;
    line-height: 100%;
    margin-top: 21.5px;
}
.sub {
    padding-left: 30px;
    padding-right: 30px;
    background: #f3ebe6;
    height: 60px;
}
.sns {
    float: right;
    padding-right: 13px;
    padding-top: 10px;
}
.tag-wrap em {
	display: inline-block;
	background: #b5aaa4;
	height: 22px;
	line-height: 22px;
	width: 50px;
	border-radius: 10px;
	color: #ffffff;
	text-align: center;
	font-size: 14px;
	margin-right: 10px;
}
.blank20 {
    display: block;
    height: 50px;
}
.blank50 {
    display: block;
    height: 50px;
}

#tagString a {
	display: inline-block;
	color: #999999;
	font-size: 14px;
	line-height: 120%;
	vertical-align: baseline;
}
.btn {
    text-indent: -9999px;
    cursor: pointer;
    overflow: hidden;
    display: inline-block;
}
.riply-list tbody tr {
    border-top: 1px solid #e6e6e6;
    border-bottom: 1px solid #e6e6e6;
}
.reply_td1 {
    text-align: left;
    font-size: 15px;
    color: #333333;
    letter-spacing: -0.5px;
    line-height: 23px;
    padding: 10px 0;
    left:10px;
    min-width:800px;
}
.reply_td2 {
    margin: 0;
    padding: 0;
    font-size: 100%;
    vertical-align: middle;
    background: transparent;
    text-decoration: none;
    color: #333;
    width: 10px;
}
.reply_td3 {
	height: 75px;
    line-height: 75px;
    text-align: center;
    font-size: 13px;
    color: #999999;
    letter-spacing: -0.5px;
	width: 100px;
}
.reply_td4 {
    height: 75px;
    line-height: 75px;
    text-align: center;
    font-size: 13px;
    color: #999999;
    letter-spacing: -0.5px;
    padding: 10px 0;
    left:10px;
    min-width:1080px;
}
</style>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>EventDetail</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/css/base.css" type="text/css">
     
    <link rel="stylesheet" href="/css/food/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/food/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/food/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/style.css" type="text/css"> 

</head>
<body>
    <!-- Header Section Begin -->
      <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainHeader.jsp"/> 
  
    <!-- Header Section End -->
    
<section class="event-detail">
   	<div class="container">
		<p class="title">이벤트</p>
		<p>자연이랑에서 진행 중인 이벤트와 혜택을 놓치지 마세요!</p>
			
			<table class="top_tbl">
				<colgroup>
					<col width="690px">
					<col width="360px">
				</colgroup>
				<tbody>
					<tr>
						<td class="title">${event.eventTitle }<span class="count">[${replyCount }]</span></td>
						<td class="sub clfix">
							<p class="date">${event.eventDate }</p>
							<div class="sns clfix">
								<a href="#" class="btn" style="background: url(/images/item_detail/facebook.png) no-repeat center center;">facebook</a>
								<a href="#" class="btn" style="background: url(/images/item_detail/twitter.png) no-repeat center center;">twitter</a>
								<a href="#" class="btn" style="background: url(/images/item_detail/twitter.png) no-repeat center center;">twitter</a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="editor-contents">
				<div style="text-align: center;">
					<div class="clear-line"></div>
						<c:forEach var="imgPath" items="${imgPathList }" varStatus="status">
							<c:choose>
								<c:when test="${linkList[status.index] ne '#'}"> <!--  -->
									<a href=${linkList[status.index]}>
										<img src="${imgPath }" style="width: 720px;" />
									</a>
								</c:when>
								<c:otherwise>
									<img src="${imgPath }" style="width: 720px;" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</div>
			</div>
			
			<div class="blank20"></div>
			
			<!-- 태그 넣는 곳 -->
			<div class="tag-wrap clifx">
				<em class="noDrag">태그</em>
				<span id="tagString">
					<c:forEach var="tag" items="${tagList }" varStatus="status">
						<!-- href에 tag랑 연결된 검색 창 구현 (http://~?tagSeq=${tag.tagSeq }) -->
						<a rel="tag" href="#">${tag.tagName }</a>
						<c:if test="${not status.last}">, </c:if>
					</c:forEach>
				</span>
			</div>
			
			<div class="blank50"></div>
			
			<!-- 댓글 다는 곳 -->
			<div id="divBasicomments">
				<div class="input-box">
					<div>
						<textarea class="ripple_input" name="commentContent" id="commentContent"
						 onfocus="" placeholder="글을 남기시려면 로그인 하십시오."
						 style="resize: none; overflow:hidden; width:90%; box-sizing:border-box; border: 1px solid #e4e4e4; 
						 height:60px; padding:10px; font-size:14px"></textarea>
						<button onclick="comment_button_onclick();" style="float: right; width:90px; height:60px; line-height:60px; 
						text-align: center; background:#333333; color:#ffffff">등록</button>
					</div>
				</div>
				
				<div class="blank20"></div>
				
				<!-- 댓글 보는 곳 -->
				<div class="view-wrap">
					<table class="riply-list">
						<colgroup>
				            <col width="30%">
				            <col width="40%">
				            <col width="30%">
			          	</colgroup>
			          	<tbody id="riply-list-tbody">
			          		<%-- <c:forEach var="reply" items="${replyList }" varStatus="status">
							<tr>
								<td class="reply_td1">${reply.replyContent }
			          			</td>
			          			<td class="reply_td2">${reply.memSeq }
			          			</td>
			          			<td class="reply_td3">${reply.replyDate }
			          			</td>
			          		</tr>	
							</c:forEach> --%>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="blank50"></div>
	</div>
</section>
    <!-- Footer Section Begin -->
        <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainFooter.jsp"/> 
    
    <!-- Footer Section End -->
<script>
	var eventSeq = ${event.eventSeq};
	
	// 댓글 목록 읽어오기
	function readReplyList() {
		var xhr = new XMLHttpRequest();
		xhr.responseType = 'json';
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4) {
				if(xhr.status === 200) {
					console.log("통신 성공");
					var response = xhr.response;
					console.log(response);
					
					refreshReply();
					appendReplyList(response);
				} else 	{
					//console.log("통신 실패");
					console.log("댓글 불러오기 실패");
				}
			}
		};
			
		xhr.open("POST", "/cmm/main/home/eventDetailGetReplyList.do?eventSeq="+eventSeq, true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send();
	}
	
	// 댓글 등록
	function registerReply(commentContent) {
		var xhr = new XMLHttpRequest(); 
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4) {
				if(xhr.status === 200) {
					console.log("통신 성공");
					
					readReplyList();
				} else 	{
					//console.log("통신 실패");
					console.log("댓글등록실패!");
				}
			}
		};
			
		xhr.open("POST", "/cmm/main/home/eventDetailRegisterReply.do?eventSeq="+eventSeq+"&replyContent="+commentContent.value, true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send();
	}
	
	// 댓글 동적 생성
	function appendReplyList(response) {
		var appendText = "";
		
		for(i in response) {
			appendText += "<tr><td class='reply_td1'>"+response[i].replyContent
						+ "</td><td class='reply_td2'>"+response[i].memSeq
						+ "</td><td class='reply_td3'>"+response[i].replyDate
						+ "</td></tr>"
		}
		
		document.getElementById("riply-list-tbody").insertAdjacentHTML("beforeend", appendText);
	}
	
	// 댓글 리프레쉬
	function refreshReply() {
		var replyTbody = document.getElementById("riply-list-tbody");
		while(replyTbody.hasChildNodes()) {
			replyTbody.removeChild(replyTbody.firstChild);
		}
	}
	
	// 댓글 달기 버튼 클릭시
	function comment_button_onclick() {
		
		var commentContent = document.getElementById('commentContent')
		if(commentContent.value.length != 0) {
			if(confirm("댓글을 등록하시겠습니까?")) {
				registerReply(commentContent);
				document.getElementById("commentContent").value='';
			}
		} else {
			this.alert("댓글에 등록된 내용이 없습니다.");
		}
	}
	
	// 이벤트 디테일 열릴 때
	window.onload = function() {
		readReplyList();
	}
</script>
    <!-- Js Plugins -->
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.nice-select.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.slicknav.js"></script>
    <script src="/js/mixitup.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/main.js"></script>
</body>

</html>