<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <title>food</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/css/food/cartlist.css" type="text/css"> 
     <link rel="stylesheet" href="/css/food/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/food/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/food/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/style.css" type="text/css"> 
</head>
	<body>
	    <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainHeader.jsp"/> 
	
		<div id="wrap"> 
			<%-- <div class="header"> 
				<div class="top">
					<c:import url="/EgovPageLink.do?link=main/inc/IncHeader" />
				</div> <!--top-->
				<c:import url="/EgovPageLink.do?link=main/inc/IncTopnav" />
			</div><!--header--> --%>
           <form name="form" method="post">
			<div class="container mt5"> 
				<h2 class="text-center"><spring:message code="user.subscribe" text="회원가입" /></h2>
				<em class="text-center d-block"><spring:message code="user.subscribe.text03" text="회원 유형을 선택해주세요." /></em>
				<table>
				</table>
				<div class="member-type-select">
					<ul>
						<li>
							<div class="member-type-select-wrap">
								<img src="<c:url value='/images/ico_select_benefit.gif' />"/>
								<em class="d-block"><spring:message code="user.subscribe.text01" text="올인원 멤버" /></em>
								<h3><spring:message code="user.subscribe.userType1" text="일반 회원" /></h3>
<%-- 								<a href="<c:url value='/user/userSbscrbRegist.do'/>"  class="btn-red mx-auto d-block" ><spring:message code="user.subscribe" text="회원가입" /></a>
 --%>							<a href="/user/com/userSbscrbRegist.do?memGubun=M" id="member"class="btn-red mx-auto d-block" style="max-width: 150px"><spring:message code="user.subscribe" text="회원가입" /></a>								
							</div>
						</li>
						<li>
							<div class="member-type-select-wrap"> 
								<h3><spring:message code="user.subscribe.userType2" text="기업 회원" /></h3>
<%-- 								<a href="<c:url value='/user/userSbscrbRegist.do'/>" class="btn-red mx-auto d-block" style="max-width: 150px"><spring:message code="user.subscribe" text="회원가입" /></a>
 --%>
 								<a href="/user/com/userSbscrbRegist.do?memGubun=A" id="admin" class="btn-red mx-auto d-block" style="max-width: 150px"><spring:message code="user.subscribe" text="회원가입" /></a>
 															
 </div>
						</li>
					</ul>
                </div>
            </div> <!--content-->
        </form>
        </div><!--wrap-->

       <!-- Js Plugins -->
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.nice-select.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.slicknav.js"></script>
    <script src="/js/mixitup.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/main.js"></script>



 <!-- Footer Section Begin -->
    <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainFooter.jsp"/> 
    <!-- Footer Section End -->
    </body>
</html>
