<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<%
String menuNo = ((String)session.getAttribute("menuNo")!=null)?(String)session.getAttribute("menuNo"):"11";
%>

<div id="nav">	
	<div class="top"></div>             
	<div class="nav_style">
	<ul>
	    <% if (menuNo.indexOf("1")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageMove('11','main/sample_menu/EgovAboutSite')">사이트관리</a>
			<ul>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('11','main/sample_menu/EgovAboutSite')">공지사항</a></li>	
				<li class="dept02"><a href="javascript:fn_main_headPageMove('12','main/sample_menu/EgovHistory')">질문게시판</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('13','main/sample_menu/EgovOrganization')">이벤트/프로모션</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('14','main/sample_menu/EgovLocation')">대시보드</a></li>
			</ul> 
		</li>
		<% } %>
		<% if (menuNo.indexOf("2")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageMove('21','main/sample_menu/EgovProductInfo')">회원관리</a>
			<ul>	
				<li class="dept02"><a href="javascript:fn_main_headPageMove('21','main/sample_menu/EgovProductInfo')">일반회원관리</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('22','main/sample_menu/EgovServiceInfo')">공급사관리</a></li>
			</ul> 
		</li>
		<% } %>
        <% if (menuNo.indexOf("3")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageMove('31','main/sample_menu/EgovDownload')">상품관리</a>
			<ul>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('31','main/sample_menu/EgovDownload')">상품등록/수정</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('32','main/sample_menu/EgovQA')">재고관리</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('33','main/sample_menu/EgovService')"></a></li>
			</ul>
		</li>
		<% } %>
        <% if (menuNo.indexOf("4")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageAction('41','cop/smt/sim/EgovIndvdlSchdulManageDailyList.do')">주문관리</a>
			<ul>
			    <li class="dept02"><a href="javascript:fn_main_headPageAction('41','cop/smt/sim/EgovIndvdlSchdulManageDailyList.do')">주문관리</a></li>	
				<li class="dept02"><a href="javascript:fn_main_headPageAction('42','cop/smt/sim/EgovIndvdlSchdulManageWeekList.do')">배송관리</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('43','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA')">반품/교환</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('44','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB')">정산관리</a></li>
			</ul> 
		</li>
		<% } %>
        <% if (menuNo.indexOf("5")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageAction('51','cop/smt/sim/EgovIndvdlSchdulManageMonthList.do')">사이트관리</a>
			<ul>	
				<li class="dept02"><a href="javascript:fn_main_headPageAction('51','cop/smt/sim/EgovIndvdlSchdulManageMonthList.do')">일정관리</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('52','cop/com/selectTemplateInfs.do')">게시판템플릿관리</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('53','cop/bbs/SelectBBSMasterInfs.do')">게시판생성관리</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('54','cop/com/selectBBSUseInfs.do')">게시판사용관리</a></li> 
				<li class="dept02"><a href="javascript:fn_main_headPageAction('55','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA')">공지사항관리</a></li>
                <li class="dept02"><a href="javascript:fn_main_headPageAction('56','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB')">사이트갤러리관리</a></li>
			</ul> 
		</li>
		<% } %>
	</ul>
	</div>
	<div class="bottom"></div>		
</div>
<!-- //메뉴 끝 -->	
