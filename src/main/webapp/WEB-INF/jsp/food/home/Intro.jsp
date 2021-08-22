
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>
<style>
	.intro_video_wrap {
    position: relative;
    height: 681px;
	}
	/* .bottom_line {
    position: absolute;
    bottom: 0;
    width: 100%;
    background-color: #f2f1ef;
    height: 270px;
    z-index: 1;
	} */
	.intro_video_wrap .video_wrap .inner {
    position: relative;
    width: 100%;
    height: 100%;
    margin: 0 auto;
    text-align: center;
	}
	.intro_video_wrap .video_wrap .inner #video_thumb {position:absolute;top:0;left:0;margin:0 auto;text-align:center;}
  	.intro_video_wrap .video_wrap .inner #video_thumb:hover {opacity:0;}
  	.intro_video_wrap .video_wrap .inner #video_thumb_hover {position:absolute;top:0;left:0;margin:0 auto;text-align:center;opacity:0;}
  	.intro_video_wrap .video_wrap .inner #video_thumb_hover:hover {opacity:1;}
</style>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Intro</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/css/food/common.css" type="text/css">
    
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
    
    <section class = "intro">
    	<div class="container">
		<p class="title">자연이랑</p>
		<p>자연과 건강 그리고 다음 세대를 위한 미래를 생각합니다</p>
		<section class="intro-section01" style="height:428px;">
	        <div class="background-line"></div>
	        <div class="content-wrap" style="height:378px;">
	            <img alt="" src="/images/food/home/03-Company_intro_01.png" />
	        </div>
	    </section>
	    <section class="intro-section02">
	        <div class="content-wrap">
	            <img alt="" src="/images/food/home/03-Company_intro_02.jpg" />
	        </div>
	    </section>
		
		<div class="intro_video_wrap">
	      <div class="bottom_line"></div>
	        <div class="video_wrap">
	          <div class="inner">
	            <a class="link" href="https://www.youtube.com/embed/AzGTyf3Fc6A?rel=0&showinfo=0&wmode=opaque&enablejsapi=1" onclick="window.open(this.href, 'pop', 'width=1172,height=660,scrollbars=yes');return false;" style="color:#FFFFFF;vertical-align:top;font-size:0;">
	              <img id="video_thumb" src="/images/food/home/00-company_intro_videothumb.jpg" />
	              <img id="video_thumb_hover" src="/images/food/home/00-company_intro_videothumb_hover.jpg" />
	            </a>
	          </div>
	        </div>
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