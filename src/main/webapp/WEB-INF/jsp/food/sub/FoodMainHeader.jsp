<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
    
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                            <li>Free Shipping for all Order of $99</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__language">
<!--                                 <img src="/images/food/language.png" alt="">
 -->                                <div>Korean</div>
                            <span class="arrow_carrot-down"></span>
                            <ul>
                                <li><a href="#">Korean</a></li>
                                <li><a href="#">English</a></li>
                            </ul>
                        </div>
                        <%
						       LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO"); 
						       if(loginVO == null){ 
						    	%>
                            <div class="header__top__right__auth" style = "padding: 0px 20px 0px 20px;">
                                <a href="<c:url value='/uat/uia/LoginUsr.do'/>"><i class="fa fa-user"></i> Login </a>
                            </div>
                            
                             <div class="header__top__right__auth">
                                <a href="<c:url value='/user/com/userSignup.do'/>"><i class="fas fa-user-plus"></i> sign up</a>
                            </div>
                            
                            <% }else { %>
						    <c:set var="loginName" value="<%= loginVO.getMemName()%>"/>
						    <div id="header_loginname">
						        <a href="#LINK" ><c:out value="${loginName}"/> 님</a>
						    </div>
						    
						     <ul class="login_bg_area">
						        <li class="righttop_bgleft">&nbsp;</li>
						        <li class="righttop_bgmiddle"><a href="<c:url value='/uat/uia/actionLogout.do'/>">로그아웃</a></li>
						    </ul>
						       
                         
                         
					<%-- 	    <%
						       if(loginVO.getMemName() == "관리자"){ 
						    	%>
 						    <div class="header_loginconnection"> 관리자로 로그인하셨습니다.</div>
 						    <div><a href="#LINK" ><i class="fas fa-user-cog"></i></a></div>
 						     <% } %> 
                          --%>
                         
                        </div>
                        <% } %> 
                    </div>
                </div>
            </div>
        </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="/cmm/main/mainPage.do"><img src="/images/food/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="/cmm/main/mainPage.do">Home</a>
                        	<ul class="header__menu__dropdown">
                                <li><a href="/cmm/main/home/intro.do">소개</a></li>
                                <li><a href="/cmm/main/home/standard.do">상품기준</a></li>
                                <li><a href="/cmm/main/home/event.do">이벤트/프로모션</a></li>
                            </ul>
                        </li>
                        <li><a href="./shop-grid.html">Shop</a>
                        	 <ul class="header__menu__dropdown">
                                <li><a href="./shoping-grid.html">할인관</a></li>
                                <li><a href="">베스트</a></li>
                                <li><a href="">신상품</a></li>
                            </ul>
                        
                        </li>
                        <li><a href="#">My Pages</a>
                            <ul class="header__menu__dropdown">
                                <li><a href="/order/ClientCartView.do">장바구니</a></li>
                                <li><a href="./checkout.html">주문/배송</a></li>
                                <li><a href="">내가 쓴글</a></li>
                                <li><a href="">회원 정보 수정</a></li>
                            </ul>
                        </li>
                        <li><a href="./blog.html">Blog</a></li>
                        <li><a href="./contact.html">Contact</a>
                        	<ul class="header__menu__dropdown">
                                <li><a href="">FAQ</a></li>
                                <li><a href="">1:1 문의</a></li>
                                <li><a href="">오시는 길</a></li>
                            </ul>
                        </li>
                        <!-- <li><a href="/cmm/main/management/productManagement.do">Management</a>
                        	<ul class="header__menu__dropdown">
                                <li><a href="/cmm/main/management/productManagement.do">상품</a></li>
                                <li><a href="/cmm/main/management/productRegist.do">상품등록</a></li>
                                <li><a href="/cmm/main/management/stockManagement.do">재고</a></li>
                                <li><a href="/cmm/main/management/stockIoManagement.do">입출고</a></li>
                                <li><a href="/cmm/main/management/productOptionManagement.do">옵션</a></li>
                                <li><a href="/cmm/main/management/productCategoryManagement.do">카테고리</a></li>
                                <li><a href="/cmm/main/management/productTypeManagement.do">유형</a></li>
                                <li><a href="/cmm/main/management/atchFileManagement.do">파일</a></li>
                            </ul>
                        </li> -->
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                        <li><a href="/order/ClientCartView.do" id="member"class="btn-red mx-auto d-block" style="max-width: 150px"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                    </ul>
                    <div class="header__cart__price">item: <span>$150.00</span></div>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>