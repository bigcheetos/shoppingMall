
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>
<style>
.news-wrap {
	position: relative;
    width: 1050px;
    margin: 0 auto;
}

.clfix {
	display: block;
}

.news-list .news-content {
	float: left;
    box-sizing: border-box;
    width: 250px;
    height: 396px;
    margin-bottom: 40px;
    margin-right: 16px;
    border: 1px solid #f4f4f4;
    overflow: hidden;
}

.event-status-badge {
    position: absolute;
    top: 10px;
    right: 11px;
    padding: 10px;
/*     background-color: #BD9B6A;
    color: #ffffff; */
    border: 1px solid #6c5447;
    font-size: 15px;
}

.news-list .news-content .img-wrap {
	position: relative;
    width: 100%;
    height: 298px;
    overflow: hidden;
    border-bottom: 1px solid #f4f4f4;
}
.news-list .news-content .text-wrap {
    position: relative;
    background: #ffffff;
    padding: 0 15px;
    box-sizing: border-box;
    height: 96px;
    overflow: hidden;
}

.news-list .news-content .text-wrap .title {
	font-size: 14px;
    color: #333333;
    letter-spacing: -0.5px;
    height: 30;
    padding: 0px 0 0;
    margin-bottom: 11px;
    line-height: 23px;
    box-sizing: border-box;
    text-overflow: ellipsis;
    overflow: hidden;
}

.news-list .news-content .text-wrap .title.p .date {
    font-size: 15px;
    color: #999999;
    line-height: 100%;
}
.blank50 {
	disply: block;
	height: 50px;
}
</style>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Event</title>

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
    <section class = "event">
    	<div class="container">
			<p class="title">이벤트</p>
			<p>자연이랑에서 진행 중인 이벤트와 혜택을 놓치지 마세요!</p>
			<div class="clear-line"></div>
			<div class="news-wrap">
				<div class="blank50"></div>
				<ul class="news-list clfix">
					<c:forEach var="event" items="${eventList }" varStatus="status">
						
					<li class="news-content">
					    <a href="${linkList[status.index] }">
							<div class="img-wrap">
						        <div class="event-status-badge" style="${statusBadgeList[status.index]}">${event.eventStatus }</div>
						        <img class="imgsize150" alt="상품 이미지" style="width:248px;height:298px;" src="${imgPathList[status.index] }"/>
							</div>
							<div class="text-wrap">
								<p class="title">${event.eventTitle }<span class="count">${replyList.count }</span></p>
								<p class="date" style="float:left;">${event.eventDate }</p>
								<p class="date" style="float:right;">조회수 ${event.eventRdcnt }</p>
						    </div>
						</a>
					</li>
					
					</c:forEach>
					
				</ul>
			</div>
		</div>
	</section>

    <!-- Footer Section Begin -->
    <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainFooter.jsp"/> 
    <!-- Footer Section End -->

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