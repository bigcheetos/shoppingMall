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
<script>
$(document).ready(function(){
;
});


 
</script>
    <body>
        <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainHeader.jsp"/> 
    
        <div id="wrap"> 
			<%-- <div class="header"> 
				<div class="top">
					<c:import url="/EgovPageLink.do?link=main/inc/IncHeader" />
				</div> <!--top-->
				<c:import url="/EgovPageLink.do?link=main/inc/IncTopnav" />
			</div> <!--header-->
            --%>
            <div class="container mt5" style="min-height: 500px"> 
                
                <div class="shadow-wrap text-center">
                    <img src="images/ico_success_member.gif">
                    <h2>회원가입이 완료 되었습니다.</h2>
                    <h3 class="grey"><c:out value="${resultList.memName}"/>님의 회원가입을 축하합니다.<br>가입하신 아이디는 <strong class="red"> <c:out value="${resultList.emailId}"/></strong> 입니다.</h3>
                </div>
                <h4><a href="/cmm/main/mainPage.do" class="btn-red mx-auto d-block" style="max-width: 150px">메인으로</a></h4>
                <c:if test="${resultList.memGubun} == 'A'">
                <h4><a href="/cmm/main/adminMain.do" class="btn-red mx-auto d-block" style="max-width: 150px">관리자 페이지로</a></h4>               
                </c:if>
            </div> <!--content-->
        
        </div><!--wrap-->
    <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainFooter.jsp"/> 

    </body>
</html>
