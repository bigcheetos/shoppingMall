
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
</head>
<div id="skipNav" class="invisible">
    <dl>
        <dt>콘텐츠 바로가기</dt>
        <dd><a href="#main_container">컨텐츠 바로가기</a></dd>
        <dd><a href="#topnavi">메인메뉴 바로가기</a></dd>
    </dl>
</div>

<div id="logoarea">
    <h1><a href="<c:url value='/cmm/main/mainPage.do' />"><img src="<c:url value='/images/header/bidtLogo.png' />" alt="템플릿 샘플 홈페이지" height="30" /></a></h1>
</div>

<div id="project_title"><span class="maintitle">올인원 </span><strong>관리자 페이지 </strong>
</div>

<div class="header_login">
   <div> <a href="/cmm/main/mainPage.do" ><i class="fas fa-home"></i></a></div>
    <%
       LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO"); 
       if(loginVO == null){ 
    %>
    
    <div id="header_loginname">
        <a href="#" ></a>
    </div>
    <div class="header_loginconnection"></div>
    <ul class="login_bg_area">
        <li class="righttop_bgleft">&nbsp;</li>
        <li class="righttop_bgmiddle"><a href="<c:url value='/uat/uia/LoginUsr.do'/>">로그인</a></li>
        <li class="righttop_bgright">&nbsp;</li>
    </ul>     
    
    <% }else{ %>
    <c:set var="loginName" value="<%= loginVO.getMemName()%>"/>
    <div id="header_loginname">
        <a href="#LINK" onclick="alert('개인정보 확인 등의 링크 제공'); return false;"><c:out value="${loginName}"/> 님</a>
    </div>
   <c:if test="">
   
   </c:if>
    <ul class="login_bg_area">
        <li class="righttop_bgleft">&nbsp;</li>
        <li class="righttop_bgmiddle"><a href="<c:url value='/uat/uia/actionLogout.do'/>">로그아웃</a></li>
        <li class="righttop_bgright">&nbsp;</li>
    </ul>
    <% } %>    
</div>
</html>