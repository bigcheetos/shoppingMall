

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<title><spring:message code="main.sitename" text="재능기부장학금" /></title>
		<meta charset="UTF-8">
		<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
		<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/css3-mediaqueries.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="<c:url value='/'/>css/common.css"/>
		<script type="text/javascript" src="<c:url value='/js/jquery.min.js' />" ></script>
	<script type="text/javascript">
	
  /* 	function registTypeD(){
		var member = document.getElementById("member").value = "M"
		console.log(member);
		document.form.action = "<c:url value='user/com/userSbscrbRegist.do'/>";
	  	document.form.submit();	
	}
	
	function registTypeB(){
		var admin = document.getElementById("admin").value = "B"
		console.log(admin);
		document.form.action = "<c:url value='user/com/userSbscrbRegist.do'/>";
	  	document.form.submit();	
	}  */
	 
	</script>
		
    </head>
	<body>
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
		<!--footer Start-->
<%-- 		<div class="footer"><c:import url="/EgovPageLink.do?link=main/inc/IncFooter" /></div>
 --%>		<!--footer End-->
    </body>
</html>
