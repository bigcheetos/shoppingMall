<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <div class="header__top__right__auth" style = "padding: 0px 20px 0px 20px;">
                            <a href="/uat/uia/LoginUsr.do"><i class="fa fa-user"></i> Login </a>
                        </div>
                        
                         <div class="header__top__right__auth">
                            <a href="/user/com/userSignup.do"><i class="fas fa-user-plus"></i> sign up</a>
                        </div>
                    </div>
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
                        <li class="active"><a href="/cmm/main/home/intro.do">Home</a>
                        	<ul class="header__menu__dropdown">
                                <li><a href="/cmm/main/home/intro.do">소개</a></li>
                                <li><a href="/cmm/main/home/standard.do">상품기준</a></li>
                                <li><a href="/cmm/main/home/event.do">이벤트/프로모션</a></li>
                            </ul>
                        </li>
                        <li><a href="/cmm/main/shop/discount_shop.do">Shop</a>
                        	 <ul class="header__menu__dropdown">
                                <li><a href="/cmm/main/shop/discount_shop.do">할인관</a></li>
                                <li><a href="">베스트</a></li>
                                <li><a href="">신상품</a></li>
                            </ul>
                        
                        </li>
                        <li><a href="#">My Pages</a>
                            <ul class="header__menu__dropdown">
                                <li><a href="./shoping-cart.html">장바구니</a></li>
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
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                        <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
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