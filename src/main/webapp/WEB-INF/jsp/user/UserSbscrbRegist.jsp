
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
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
  <![endif]-->
  <link rel="stylesheet" type="text/css" href="<c:url value='/'/>css/common.css"/>
<script type="text/javascript" src="<c:url value='/js/jquery.min.js' />" ></script>

<script type="text/javascript">
function fn_egov_init(){
	
	// 첫 입력란에 포커스
	document.getElementById("mberManageVO").memName.focus();

}
function fn_member_regist(){
	mberManageVO.action = "<c:url value='/user/com/userInsertRegist.do'/>";
	mberManageVO.submit();
}
/* function fn_member_regist(){
	var re = /^[a-zA-Z0-9]{4,12}$/ //아이디 패스워드 정규식
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규식
	var id = document.getElementById("id");
    var pw = document.getElementById("pw");
    var email = document.getElementById("email");

    
    if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(!check(re,pw,"패스워드는 8~16자의 영문 대소문자와 숫자, 특수문자 사용")) {
        return false;
    }

    if(mberManageVO.pw.value != mberManageVO.checkpw.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        mberManageVO.checkpw.value = "";
        mberManageVO.checkpw.focus();
        return false;
    }

    if(email.value=="") {
        alert("이메일을 입력해 주세요");
        email.focus();
        return false;
    }

    if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
        return false;
    }

    if(mberManageVO.name.value=="") {
        alert("이름을 입력해 주세요");
        mberManageVO.name.focus();
        return false;
    }
    
    function check(re, what, message) {
        if(re.test(what.value)) {
            return true;
        }
        alert(message);
        what.value = "";
        what.focus();
        //return false;
    }
	
	mberManageVO.action = "<c:url value='user/userInsertRegist.do'/>";
	mberManageVO.submit();	
	 
}*/
</script>
    </head>
    <body>
        <div id="wrap"> 
			<%-- <div class="header"> 
				<div class="top">
					<c:import url="/EgovPageLink.do?link=main/inc/IncHeader" />
				</div> <!--top-->
				<c:import url="/EgovPageLink.do?link=main/inc/IncTopnav" />
			</div> <!--header--> --%>
           	<form:form commandName="mberManageVO" name="mberManageVO" method="post">
           	<input name="memGubun" type="hidden" value="${memGubun}"> 
            <div class="container mt5" style="min-height: 500px"> 
                <h2 class="text-center">회원가입</h2><em class="text-center d-block">올인원 회원가입을 환영합니다.</em>
                <div class="shadow-wrap">
                    회원정보를 입력해주세요.
                    <table class="form-table" id="join-table">
                        <colgroup>
                            <col width="30%">
                            <col width="">
                        </colgroup>
                        <tr>
                            <th><label for="memName">이름</th>
                            <td>
                            <form:input path="memName" class="form-control" type="text" placeholder=""/>
                            <div><form:errors path="memName"/></div> 
                            </td>
                        </tr>
                        <tr>
                            <th><label for="emailId">이메일</th>
                            <td>
                            <form:input path="emailId" class="form-control" type="email"/>
                            <div><form:errors path="emailId"/></div>                        
                            </td>
                        </tr>
                        <tr>
                            <th><label for="password">비밀번호</th>
                            <td>
                            <form:password path="password" class="form-control" placeholder="8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요"/> 
   							<div><form:errors path="password"/></div>                              							
   							</td>
                        </tr>
                        <tr>
                            <th><label for="pwCheck">비밀번호 재확인</th>
                            <td>
                            <form:password path="pwCheck" class="form-control" placeholder="다시한번 입력해 주세요"/> 
                          	<div><form:errors path="pwCheck"/></div>                              							                           
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center"><a href="#LINK" type="submit" onclick="javascript:fn_member_regist(); return false;" class="btn-red"> 회원가입</a></td>
                        </tr>
                    </table>
                </div>
                
            </div> <!--content-->
        </form:form>
        </div><!--wrap-->
        <!--footer Start-->
<%-- 		<div class="footer"><c:import url="/EgovPageLink.do?link=main/inc/IncFooter" /></div>
 --%>		<!--footer End-->

    </body>
</html>
