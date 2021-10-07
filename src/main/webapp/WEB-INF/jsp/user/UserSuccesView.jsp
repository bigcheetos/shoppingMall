
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <title>올인원</title>
        <meta charset="UTF-8">
       <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
  <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
  <![endif]-->
  <link rel="stylesheet" type="text/css" href="<c:url value='/'/>css/common.css"/>
<script type="text/javascript" src="<c:url value='/js/jquery.min.js' />" ></script>
<script>
$(document).ready(function(){
;
});


 
</script>
    </head>
    <body>
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
		<!--footer Start-->
<%-- 		<div class="footer"><c:import url="/EgovPageLink.do?link=main/inc/IncFooter" /></div>
 --%>		<!--footer End-->
    </body>
</html>
