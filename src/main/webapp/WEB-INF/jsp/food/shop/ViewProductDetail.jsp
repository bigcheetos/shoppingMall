
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>

<html>
<style>
.product-detail {
	margin-top: 0;
    position: relative;
}
.content-wrap {
    position: relative;
    width: 1050px;
    margin: 0 auto;
}
.flex {
	display: flex;
}
.left-wrap {
    float: left;
    width: 420px;
}
.left-wrap .img-wrap {
    float: left;
    width: 100%;
}
.content-wrap .left-wrap .img-wrap .main_img {
	border: 1px solid #f6f6f6;
    width: 418px;
    height: 502px;
    background: #ffffff;
}
.content-wrap .left-wrap .img-wrap .main_img img {
    width: 100%;
    height: 100%;
}
.content-wrap .left-wrap .img-wrap .sub_img {
	width: 100%;
}
.content-wrap .tag-wrap {
    margin-top: 16px;
    width: 360px;
    float: left;
    color: #999999;
    text-indent: -63px;
    margin-left: 63px;
}
.content-wrap .tag-wrap>em {
    display: inline-block;
    background: #b5aaa4;
    height: 22px;
    line-height: 22px;
    width: 50px;
    border-radius: 10px;
    color: #ffffff;
    text-align: center;
    font-size: 14px;
    margin-right: 10px;
    text-indent: 0;
    margin-left: 0;
}
.content-wrap .right-wrap {
    float: right;
    width: 560px;
}
.content-wrap .right-wrap .detail {
	border-top: 1px solid #cccccc;
	border-bottom: 1px solid #cccccc;
}
.content-wrap .right-wrap .proc-wrap {
	position: relative;
    width: 100%;
}
.content-wrap .right-wrap .proc-wrap .top span:first-child{
	margin-left: 0px;
}
.content-wrap .right-wrap .proc-wrap .top span{
	display: inline-block;
    text-align: center;
    box-sizing: border-box;
    width: 55px;
    height: 20px;
    line-height: 20px;
    margin-left: 1px;
    font-size: 13px;
}
.content-wrap .right-wrap .proc-wrap .top span.sale{
	background: #6c5447;
    color: #ffffff;
}
.content-wrap .right-wrap .proc-wrap .tit p {
	font-size: 30px;
    vertical-align: baseline;
    line-height: 42px;
    margin-bottom: 4px;
    font-weight: 700;
    width: 100%;
    display: inline-block;
}
.content-wrap .right-wrap .proc-wrap .tit span {
	font-size: 15px;
    color: #666666;
    vertical-align: baseline;
    width: 100%;
    display: inline-block;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}
.content-wrap .right-wrap .proc-wrap .total {
    margin-top: 20px;
    vertical-align: baseline;
    line-height: 100%;
    font-size: 20px;
    font-weight: 500;
    text-align: right;
}
.content-wrap .right-wrap .proc-wrap .total em.big{
    font-size: 30px;
    margin-left: 15px;
    font-weight: 700;
}
.basket_btn3 {
    display: inline-block;
    height: 60px;
    line-height: 58px;
    width: 190px;
    float: left;
    text-align: center;
    font-size: 20px;
    background-color: #BD9B6A;
    color: #ffffff;
}
.basket_btn2 {
    display: inline-block;
    height: 60px;
    line-height: 58px;
    width: 190px;
    float: left;
    text-align: center;
    font-size: 20px;
    background: #6c5545;
    border: 1px solid #6c5545;
    color: #ffffff;
}
.like_btn {
	display: inline-block;
    height: 60px;
    line-height: 58px;
    width: 160px;
    box-sizing: border-box;
    float: right;
    text-align: left;
    border: 1px solid #cfcfcf;
    background: no-repeat left 15px center; /* url(/img/item_detail/like_btn_off.png) */
    text-indent: 38px;
    font-size: 20px;
    color: #666666;
    letter-spacing: -1px;
}

.product-detail .text-wrap {
    float: left;
    border: 1px solid #e6e6e6;
    width: 100%;
    height: 94px;
    margin-top: 40px;
    background-color: #fff;
}
.product-detail .text-wrap .left-text-delivery {
    float: left;
    width: 100px;
    border-right: 1px solid #e6e6e6;
    font-size: 14px;
    font-weight: 700;
    text-align: center;
}
.product-detail .text-wrap .left-text {
    float: left;
    box-sizing: border-box;
    width: 505px;
    padding-left: 15px;
}
.product-detail .text-wrap .left-text p{
    font-size: 14px;
    color: #999999;
    line-height: 150%;
    letter-spacing: -0.5px;
}
.red {
    color: #cb0000 !important;
    vertical-align: baseline;
}

.selected-option-list {
    margin-top: 12px;
}
.selected-option-list li {
	position: relative;
    margin-top: 10px;
    padding: 14px 13px 11px;
    background: #f9f9fa;
    border: 1px solid #f2f2f2;
    border-radius: 2px;
    border-bottom: 1px solid #bec1c7;
}
.selected-option-list li .tit {
	margin-bottom: 11px;
    padding: 0 15px 13px 0;
    border-bottom: 1px dotted #e2e2e3;
    font-size: 14px;
    color: #000;
    line-height: 20px;
}
.selected-option-list li .tit .txt_option{
	width: 507px;
    white-space: nowrap;
    text-overflow: ellipsis;
    font-weight: bold;
    color: #233549;
	display: block;
    word-break: break-all;
    font-size: 14px;
    line-height: 20px;
    overflow: hidden;
}
.selected-option-list li .choose_amount {
	position: relative;
    z-index: 10;
    margin-right: 152px;
}
.selected-option-list li .choose_amount span {
	display: block;
    height: 25px;
    position: relative;
}
.selected-option-list li .choose_amount input {
    height: 21px;
    margin-left: 10px;
    border: 1px solid #ececec;
    line-height: 21px;
    color: #233549;
    font-size: 14px;
    text-align: center;
}
.selected-option-list li .choose_result {
	position: relative;
    padding-right: 20px;
}
.selected-option-list li .choose_result strong {
	text-align: right;
    margin-top: -20px;
    padding-bottom: 0;
    display: block;
    font-size: 16px;
    line-height: 18px;
    color: #222;
    font-weight: bold;
}
.selected-option-list li .choose_result button {
    position: absolute;
    width: 26px;
    height: 26px;
    right: -7px;
    top: -3px;
    background-position: -442px -122px;
}
</style>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${productDetailMap.productDetailVO.productName }</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/css/base.css" type="text/css">
    
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
<div class="content-wrap container">
   	<div class="left-wrap">
          <div class="img-wrap">
          	<c:forEach var="imgMap" items="${productDetailMap.imgMapList }" varStatus="status">
          		<c:if test="${imgMap.usePurpose eq 'main' }">
          			<div class="main_img"><img src="${imgMap.fileCoursNm }" onerror="this.src='/images/food/product/noimage.png';" /></div>
          		</c:if>
          	</c:forEach>
          	  <div class="sub_img">
                  <ul class="sub_img-bar flex">
                  <!-- loop// -->
                  <c:forEach var="imgMap" items="${productDetailMap.imgMapList }" varStatus="status">
                  	<li class="active"><div class="black_bg"></div>
          			<img src="${imgMap.fileCoursNm }" style="width:88px;height:105.73px;" onerror="this.src='/images/food/product/noimage.png';" /></li>
          		  </c:forEach>  
                  <!-- //loop -->
                  </ul>
              </div>
          </div>
          <div class="tag-wrap clfix">
              <em class="noDrag">태그</em>
              <!-- <span id='tagString' name='tagString'></span> -->
              <span class='tagString'>
              <c:forEach var="checkedCategory" items="${productDetailMap.checkedCategoryList }" varStatus="status">
              		<a rel='tag' href='/cmm/main/shop/discountShop.do?categoryId=${checkedCategory.categoryId }'>
              			${checkedCategory.categoryName }
              		</a>
              </c:forEach>
              </span>
          </div>
      </div>
      <div class="right-wrap">
          <div class="proc-wrap">
              <div class="top">
                  <span class="sale"> ${productDetailMap.productRatio }%</span>
              </div>
              <div class="tit">
                  <p> ${productDetailMap.productDetailVO.productName }</p>
                  <span>${productDetailMap.productDetailVO.productSummary }</span>
              </div>
              <table class="detail table">
                  <colgroup>
                      <col width="147px">
                      <col width="*">
                  </colgroup>
                  <tbody>
                  <tr>
                      <th>판매가격</th>
                      <td>
                      		${productDetailMap.productDetailVO.productDiscountPrice }원 &nbsp;
                      		<del>${productDetailMap.productDetailVO.productPrice }원</del>
                          <%-- <input type="text" id="itemPrice" name="itemPrice" value="${productDetailMap.productDetailVO.productDiscountPrice }" style="display:none;" /> --%>
                      </td>
                  </tr>
                  <tr>
                       <th>원산지</th>
                       <td>${productDetailMap.productDetailVO.productOrigin }</td>
                  </tr>
                  <tr>
                      <th>배송비</th>
                      <c:choose>
	                      <c:when test="${productDetailMap.productDetailVO.productDeliverypay eq 0}">
	                      	<td>배송비무료</td>
	                      </c:when>
	                      <c:otherwise>
	                      	<td>${productDetailMap.productDetailVO.productDeliverypay }원</td>
	                      </c:otherwise>
                      </c:choose>
                  </tr>
                  <tr>
                      <th>상품코드</th>
                      <td>
                      		${productDetailMap.productDetailVO.productCode }
                      </td>
                  </tr>
                  
                  <tr>
                      <th>구매수량</th>
                      <td>
                          <div class="count clfix">
                          		<input type="hidden" name="productDiscountPrice" id="productDiscountPrice" value="${productDetailMap.productDetailVO.productDiscountPrice }">
                          		<input type="number" name="productAmount" id="productAmount" value=1 min=1 max=999>
                          </div>
                      </td>
                  </tr>
                  <c:if test="${!empty productDetailMap.optionList}">
                      <tr>
	                  	<th>옵션상품</th>
	                  	<td>
	                  		<select id="productOption" class="form-select">
	                  		<c:forEach var="option" items="${productDetailMap.optionList }" varStatus="status">
			              		<option data-option-code="${option.optionCode }" data-option-name ="${option.optionName }" 
			              		data-option-price ="${option.optionPrice }" value="${option.optionPrice }">
			              		${option.optionName } &nbsp;( ${option.optionPrice }원)</option>
			              	</c:forEach>
			              	</select>
			              	&nbsp;
			              	&nbsp;
			              	<input type="button" class="btn btn-secondary" value="+" style="width:36px; height:36px" onClick="fn_addOption()">
	                  	</td>
	                  </tr>
                  </c:if>
                  </tbody>
              </table>
              <div class="total-payment">
              	<p class="total">총 상품금액
              	      <em class="big"><span id="productPayment">${productDetailMap.productDetailVO.productDiscountPrice }</span>원</em>
              	</p>
              	<ul class="selected-option-list">
              		
              		<br>
              	</ul>
              </div>
              
          </div>
          <div class="btn-wrap clfix">
                  <div class="button basket_btn3 button-01" onclick="return false;">바로 구매</div>
                  <div class="button basket_btn2 button-01" onclick="return false;">장바구니 담기</div>
              <!-- <div id="repeatedBuyBtn_8010000705" class="button like_btn" alt="자주구매" title="자주 구매하는 상품으로 등록하기" onclick="popUpLoginWin(document.location.href);">자주구매상품</div> -->
          </div>
      </div>
      <!-- 상품이미지 시작 -->
      <div class="tab-cont tab-01-cont" style="display:block;">
      	<table width="100%" border="0" cellpadding="0" cellspacing="0">
      		<tbody>
      			<c:forEach var="imgMap" items="${productDetailMap.imgMapList }" varStatus="status">
      				<tr>
	      				<td align="left" valign="top">
	      					<br>
	      					<img alt src="${imgMap.fileCoursNm }" style="width: 1048px; height: auto; max-width: 1050px;">
	      				</td>
	      			</tr>
      			</c:forEach>
      		</tbody>
      	</table>
      </div>
<!--       <div class="text-wrap clfix bSizing div-middle">
          <div class="left-text-delivery">주문 및<br />배송안내</div>
          <div class="left-text">
              <p>· 주문취소는 <span class="red">결제완료 상태에서 가능</span>하며, 이후에는 취소하실 수 없습니다.</p>
              <p>· 공급업체 <span class="red">주문금액이 20,000원 미만인 경우에는 배송비가 부과</span>됩니다.</p>
          </div>
      </div> -->
     
 <!-- 기본상품정보 제공 시작-->
                        
<table id="productInfoTable" class="contentsDetail_tbl table">
    <colgroup>
        <col width="240px">
        <col width="*">
    </colgroup>
    <tbody>
        <tr id="pipnTr0">
            <th id="pipnTh0">상품소개</th>
            <td>${productDetailMap.productDetailVO.productIntroduction }</td>
        </tr>
        <tr id="pipnTr1">
            <th id="pipnTh1">상품용도</th>
            <td>${productDetailMap.productDetailVO.productUse }</td>
        </tr>
        <tr id="pipnTr2">
            <th id="pipnTh2">주문시유의사항</th>
            <td>${productDetailMap.productDetailVO.productNotice }</td>
        </tr>
        <tr id="pipnTr3">
            <th id="pipnTh3">배송안내</th>
            <td>${productDetailMap.productDetailVO.productDeliveryguide }</td>
        </tr>
        <tr id="pipnTr4">
            <th id="pipnTh4">주문취소안내</th>
            <td>${productDetailMap.productDetailVO.productCancelguide }</td>
        </tr>
    </tbody>
</table>
 <!-- 기본상품정보 정보 -->
</div>
</section>


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
    <script src="/js/common/commonFunctions.js"></script>
    <script src="/js/shop/viewProductDetail.js"></script>
</body>
</html>