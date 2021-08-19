
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>

<script type="text/javascript">
    function fn_main_headPageMove(menuNo, url){
	    document.selectOne.menuNo.value=menuNo;
	    document.selectOne.link.value=url;
	    document.selectOne.action = "<c:url value='/EgovPageLink.do'/>";
	    //alert(document.selectOne.action);
	    document.selectOne.submit();
    }
    function fn_main_headPageAction(menuNo, url){
        document.selectOne.menuNo.value=menuNo;
        document.selectOne.link.value="";
        document.selectOne.action = "<c:url value='/' />"+url;
        document.selectOne.method = "post";
        //alert(document.selectOne.action);
        document.selectOne.submit();
    }
</script>

<!-- topmenu start -->
<form name="selectOne" action="#LINK">
<input name="menuNo" type="hidden" />
<input name="link" type="hidden" />
</form>

<ul>
	<li><a href="#LINK" onclick="javascript:fn_main_headPageMove('11','main/sample_menu/EgovAboutSite')" >사이트관리</a></li>
    <li><a href="#LINK" onclick="javascript:fn_main_headPageMove('21','main/sample_menu/EgovProductInfo')" >회원관리</a></li>
    <li><a href="#LINK" onclick="javascript:fn_main_headPageMove('31','main/sample_menu/EgovDownload')" >상품관리</a></li>
    <li><a href="#LINK" onclick="javascript:fn_main_headPageAction('42','cop/smt/sim/EgovIndvdlSchdulManageWeekList.do')" >주문관리</a></li>
    <%
       LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO"); 
       if(loginVO != null){ 
    %>
    <li><a href="#LINK" onclick="javascript:fn_main_headPageAction('51','cop/smt/sim/EgovIndvdlSchdulManageMonthList.do')" >사이트관리(관리자)</a></li>
    <%
       }
    %>
</ul>

<!-- //topmenu end -->