
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<title>표준프레임워크 경량환경 홈페이지 템플릿</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	
<!-- 전체 레이어 시작 -->

<div id="wrap">
	<!-- header 시작 -->
	<div id="header_mainsize">
	    <c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" />
	</div>
	<div id="topnavi">
	    <c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" />
	</div>		
	<!-- //header 끝 -->
	<!-- 좌측메뉴 시작 -->
		<div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" /></div>
		<!-- //좌측메뉴 끝 -->
	<!-- container 시작 -->
	<div id="main_container">			
		<!-- code layer -->
		<div class="rightmain_wrap">			
			<div class="board_wrap">
				<!-- 공지사항 시작 -->
				<div class="notice_area">
					<h3 class="notice_title"><img src="<c:url value='/images/index/img_subtitle01.gif' />" alt="공지사항" /></h3>
					<a href="#LINK" onclick="javascript:fn_main_headPageAction('43','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA'); return false;" class="more"><img src="<c:url value='/images/index/btn_more.gif' />" alt="more" /></a>
					<ul>
    					<c:forEach var="result" items="${notiList}" varStatus="status">
        					<li>
                                <div class="notice_lefttext">
        					        <a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA'/>" onclick="javascript:fn_main_headPageAction('43','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA'); return false;">
            					        <c:if test="${result.replyLc!=0}">
                                            <c:forEach begin="0" end="${result.replyLc}" step="1">&nbsp;</c:forEach>
                                            <img src="<c:url value='/images/reply_arrow.gif'/>" alt="reply arrow"/>
                                        </c:if>
                                        <c:choose>
                                            <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
                                                <c:out value="${result.nttSj}" />
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="${result.nttSj}" />
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
        					    </div>
        					    <div class="notice_righttext"><c:out value="${result.frstRegisterPnttm}"/></div>
        					</li>
    					</c:forEach>
                        <c:if test="${fn:length(result) == 0}">
                            <li>등록된 공지사항이 없습니다.</li>
                        </c:if>
                    </ul>
    				<!-- //공지사항 끝 -->
    				<!-- 갤러리 시작 -->
    				<div class="notice_area">
    					<h3 class="notice_title"><img src="<c:url value='/images/index/img_subtitle02.gif' />" alt="갤러리" /></h3> 
    					<a href="#LINK" onclick="javascript:fn_main_headPageAction('43','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB'); return false;" class="more"><img src="<c:url value='/images/index/btn_more.gif' />" alt="more" /></a>
    					<ul>
    						<c:forEach var="result" items="${galList}" varStatus="status">
                                <li>
                                    <div class="notice_lefttext">
                                        <a href="#LINK" onclick="javascript:fn_main_headPageAction('43','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB'); return false;">
                                            <c:if test="${result.replyLc!=0}">
                                                <c:forEach begin="0" end="${result.replyLc}" step="1">&nbsp;</c:forEach>
                                                <img src="<c:url value='/images/reply_arrow.gif'/>" alt="reply arrow"/>
                                            </c:if>
                                            <c:choose>
                                                <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
                                                    <c:out value="${result.nttSj}" />
                                                </c:when>
                                                <c:otherwise>
                                                    <c:out value="${result.nttSj}" />
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                    </div>
                                    <div class="notice_righttext"><c:out value="${result.frstRegisterPnttm}"/></div>
                                </li>
                            </c:forEach>
                        <c:if test="${fn:length(result) == 0}">
                            <li></li>
                        </c:if>
    					</ul>
    				</div>
				</div>
				<!--  //갤러리 끝 -->			
				<div class="info_divwrap"> 
					<div class="righttop_banner"> 
						<ul>
							<li><a href="#LINK" onclick="javascript:fn_main_headPageMove('21','main/sample_menu/EgovProductInfo'); return false;"> <img src="<c:url value='/images/index/product.jpg' />" alt="상품관리" title="상품관리"/> </a></li>
							<li><a href="#LINK" onclick="javascript:fn_main_headPageMove('22','main/sample_menu/EgovServiceInfo'); return false;"><img src="<c:url value='/images/index/members.png' />" alt="회원관리" title="회원관리"/></a></li>
						</ul>
					</div>
					<div class="middle_banner" style="">
						<ul>
							<li class="li_btm"><a href="#LINK" onclick="javascript:fn_main_headPageMove('31','main/sample_menu/EgovDownload'); return false;"><img src="<c:url value='/images/index/img_download.gif' />" alt="자료실:다양한자료를 다운로드 받으실 수 있습니다." /></a></li>
							<li><a href="#LINK" onclick="javascript:fn_main_headPageMove('14','main/sample_menu/EgovLocation'); return false;"><img src="<c:url value='/images/index/img_location.gif' />" alt="주문배송관리"  /></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 하단 서비스 영역  -->
			<div id="main_btm_area">
				<ul>
					<li><a href="#LINK" onclick="javascript:fn_main_headPageMove('33','main/sample_menu/EgovService'); return false;">
					    <img src="<c:url value='/images/index/img_service_btm.gif' />" alt="서비스 신청" title="샘플화면으로 이동합니다.(서비스 신청)"/></a>
					</li>
					<li><div class="mainbtm_text1">올인원 홈페이지의 다양한 서비스를 신청 하실 수 있습니다.</div></li>  
					<li><div class="mainbtm_vline"><img src="<c:url value='/images/index/img_vline.gif' />" alt="" /></div></li> 
					<li><div class="img_div01">
					    <a href="#LINK" onclick="javascript:fn_main_headPageAction('42','cop/smt/sim/EgovIndvdlSchdulManageWeekList.do'); return false;"><img src="<c:url value='/images/index/img_schedule.gif' />" alt="일정 현황" /></a></div>
					</li>
					<li><div class="mainbtm_text2"> 전체적인 일정현황을 조회하실 수 있습니다.</div></li>   
				</ul>
			</div>
		</div>
		<!-- //code layer -->		
	</div>
	<!-- footer 시작 -->
<%-- 	
 --%>	<!-- //footer 끝 -->
<!-- //전체 레이어 끝 -->
</div>
</body>
</html>

