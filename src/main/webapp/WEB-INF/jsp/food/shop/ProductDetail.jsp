
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sample</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    
    <link rel="stylesheet" href="/css/food/common.css" type="text/css">
    
    <link rel="stylesheet" href="/css/food/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/food/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/food/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/style.css" type="text/css"> 
</head>

<body>
    <!-- Header Section Begin -->
    <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainHeader.jsp"/> 
    <!-- Header Section End -->

<section class="product-detail">
   	<div class="left-wrap">
                <div class="img-wrap">
                    <div class="main_img"><img src="" onerror="this.src='/images/gdimg/noimage.gif';" /></div>
                    <div class="sub_img">
                        <ul class="sub_img-bar clfix">
                        <!-- loop// -->
                         <li class="active"><div class="black_bg"></div><img src="" style="width:88px;height:105.73px;" onerror="this.src='/images/gdimg/noimage.gif';" /></li>
                        <!-- //loop -->
                        </ul>
                    </div>
                </div>
                <div class="tag-wrap clfix">
                    <em class="noDrag">태그</em>
                    <span id='tagString' name='tagString'></span>
                </div>
            </div>
            <div class="right-wrap">
                <div class="proc-wrap">
                    <div class="top">
                        <span class="sale"> 90%</span>
                    </div>
                    <div class="tit">
                        <p>[뉴트리디데이] NEW 플러스 멀티비타민 미네랄 60정 x 5개</p>
                        <span>하루를 생기있게 보내는 방법</span>
                    </div>
                    <table class="detail">
                        <colgroup>
                            <col width="147px">
                            <col width="*">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>판매가격</th>
                            <td>
                                14,900원 &nbsp;<span class="oriCost">149,000원</span>
                                
                                <input type="text" id="itemPrice" name="itemPrice" value="14900" style="display:none;" />
                            </td>
                        </tr>
                        <tr>
                            <th>판매단위</th>
                            <td>500mgx60정 , 5개</td>
                        </tr>
                        <tr>
                            <th>상품유형</th>
                            <td>GMP</td>
                        </tr>
                        
                        <tr>
                             <th>원산지</th>
                             <td>상세페이지참조</td>
                        </tr>
                        <tr>
                            <th>배송유형</th>
                            <td>업체직송
                            <div class="badge-alert"><div class="badge-alert-skred" style="width:60px;line-height:150%;">제주도불가</div></div>
                            </td>
                        </tr>                           
                        <tr>
                            <th>주문마감</th>
                            <td>13시까지 주문하면 오늘 발송<span id="deadlineIcon">
                            <img class="deadlineIcon" src="/img/item_detail/btn-wrap_p_ico.png"/></span>
                            </td>
                        </tr>
                        <tr>
                            <th>배송비</th>
                            <td>2,500원 ( 20,000원 이상 구매시 무료 )
                         </td>
                        </tr>
                        <tr>
                            <th>구매수량</th>
                            <td>
                                <div class="count clfix">
                                    <span class="button down_btn" onclick="decreaseCount(document.getElementById('8010000705_CNT'));recalcuratePrice('149000','14900');">-</span>
                                    <input type="text" name="8010000705_CNT" id="8010000705_CNT" size="3" maxlength="3" value="1" class="prod_cnt" option="number" required="required"  onfocus="this.select();" onkeydown="onlyNumber(event);" onblur="if(this.value==0||this.value=='') { this.value='1'; } else { this.value = parseInt(this.value); } recalcuratePrice('149000','14900');" onkeyup="recalcuratePrice('149000','14900');" />
                                    <span class="button up_btn" onclick="increaseCount(document.getElementById('8010000705_CNT'));recalcuratePrice('149000','14900');">+</span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <p class="total">총 상품금액
                            <em class="big"><span id="productPrice">14,900</span>원</em>
                            <input type="text" id="ixproductPrice" value="14900" style="display:none;" />
                            <input type="text" id="ixproductOriginPrice" value="149000" style="display:none;" />
                    </p>
                </div>
                <div class="btn-wrap clfix">
                        <div id="imgInCart"  class="button basket_btn3 button-01" onclick="directCart('8010000705','15','99999')">바로 구매</div>
                        <div id="imgInCart"  class="button basket_btn2 button-01" onclick="putCartMsg('8010000705','15','99999','')">장바구니 담기</div>
                    <div id="repeatedBuyBtn_8010000705" class="button like_btn" alt="자주구매" title="자주 구매하는 상품으로 등록하기" onclick="popUpLoginWin(document.location.href);">자주구매상품</div>
                </div>
            </div>
            <div class="text-wrap clfix bSizing div-middle">
                <div class="left-text-delivery">주문 및<br />배송안내</div>
                <div class="left-text">
                    <p>· 주문취소는 <span class="red">결제완료 상태에서 가능</span>하며, 이후에는 취소하실 수 없습니다.</p>
                    <p>· 공급업체 <span class="red">주문금액이 20,000원 미만인 경우에는 배송비가 부과</span>됩니다.</p>
                </div>
            </div>
    </section>

	<jsp:include page="/WEB-INF/jsp/food/shop/ProductBasicInfo.jsp"/> 
<%-- 	<jsp:include page="/WEB-INF/jsp/food/shop/DeliveryInfo.jsp"/> --%> 

    <!-- Footer Section Begin -->
    <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainFooter.jsp"/> 
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.nice-select.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.slicknav.js"></script>
    <script src="/js/mixitup.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/main.js"></script>
</body>

</html>