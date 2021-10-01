
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>

<html>
<style>
.sub-top {
    position: relative;
    width: 1050px;
    margin: 0 auto;
	float: left;
}
.item-order-wrap {
    width: 100%;
    text-align: right;
    margin-bottom: 10px;
}
.item-order-type-select {
    display: inline-block;
    width: 100px;
    margin-right: 5px;
}
.product {
    float: left;
    width: 248px;
    margin-right: 16px;
    margin-bottom: 40px;
    border: 1px solid #f4f4f4;
    height: 420px;
    overflow: hidden;
	position: relative;
}
.product .img-wrap {
    position: relative;
    width: 248px;
    height: 298px;
    overflow: hidden;
    border-bottom: 1px solid #f4f4f4;
    box-sizing: border-box;
}
.product .img-wrap .tips {
    position: absolute;
    top: 0;
    right: 0;
    width: 55px;
    z-index: 1;
}
.product .img-wrap .tips .sale {
    padding: 4px 0 4px;
    border: 1px solid #cd7f7f;
    font-size: 15px;
    font-weight: 600;
    color: #ffffff;
    background: #cd7f7f;
	float: right;
    height: 30px;
    width: 60px;
    text-align: center;
    vertical-align: middle;
}
.product .img-wrap .img_hover {
    background: rgba(0,0,0,0.3);
    position: absolute;
    z-index: 1;
    width: 100%;
    height: 100%;
}

.product .text-wrap .name {
    line-height: 22px;
    font-size: 17px;
    color: #333333;
    letter-spacing: -1px;
    margin-bottom: 5px;
    width: 100%;
    height: 44px;
    display: inline-block;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: pre-line;
    word-break: break-all;
}
.product .text-wrap .explain {
    line-height: 21px;
    height: 21px;
    font-size: 15px;
    color: #999999;
    letter-spacing: -1px;
    margin-bottom: 5px;
    width: 100%;
    display: inline-block;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}
.product .text-wrap .cost {
    line-height: 100%;
    font-size: 17px;
    color: #333333;
}
.product .text-wrap .cost strong {
	font-family: 'Font Awesome 5 Free';
}
.product .text-wrap .cost .sale {
    line-height: 100%;
    vertical-align: baseline;
    font-size: 15px;
    color: #808080;
    text-decoration: line-through;
    margin-left: 8px;
}
.blank50 {
	height: 50px;
}
</style>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>할인관</title>

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
<section class = "discount-shop">
   	<div class="container item_list">
   		<div class="sub-top">
	        <img src="/images/food/shop/sub-saleTop.jpg" width="100%"/>
	        <div class="blank50"></div>
	        <div class="item-order-wrap">
	        <!-- 검색조건 넣는 곳 -->
	        	<div class="item-order-type-select input-group mb-3">
	        		<div class="input-group-prepend">
						<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</button>
					    <div class="dropdown-menu">
					      <a class="dropdown-item" href="#">Action</a>
					      <a class="dropdown-item" href="#">Another action</a>
					      <a class="dropdown-item" href="#">Something else here</a>
					      <div role="separator" class="dropdown-divider"></div>
					      <a class="dropdown-item" href="#">Separated link</a>
					    </div>
					</div>
	        		<input type="text" class="form-control" id="search-word" name="search-word" value="${searchWord }" placeholder="검색할 단어를 입력해 주세요." onkeyup="fn_enterInSearch()">
	        		<div class="input-group-append">
	        			&nbsp;
	        			&nbsp;
	        			&nbsp;
	        			&nbsp;
						<select id="product-order" name="product-order" onchange="fn_changeOrder()">
							<option value="discount" ${order == 'discount' ? 'selected="selected"' : ''}>할인율순</option>
							<option value="popular" ${order == 'popular' ? 'selected="selected"' : ''}>인기순</option>
							<option value="new" ${order == 'new' ? 'selected="selected"' : ''}>신상품순</option>
							<option value="name" ${order == 'name' ? 'selected="selected"' : ''}>상품명순</option>
							<option value="lower-price" ${order == 'lower-price' ? 'selected="selected"' : ''}>낮은가격순</option>
							<option value="higher-price" ${order == 'higher-price' ? 'selected="selected"' : ''}>높은가격순</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="clear-line"></div>
		<div class="news-wrap">
			<div class="blank50"></div>
			
			<ul class="prod_list_tbl clfix">
			<c:forEach var="product" items="${productList }" varStatus="status">
				
				<li class="product" style="padding-top: 0; padding-bottom: 0;">
				    <a href="${product.productLink }">
				        <div class="img-wrap">
							<img class="img_hover" alt="상품 이미지" style="width:248px;height:298px;" src="${product.productImg }" onerror="this.src='/images/food/product/noimage.png'"/>
							<div class="tips">
						        <span class="sale">${product.productRatio }%</span>
						    </div>  
						</div>
						<div class="text-wrap">
							<p class="name">${product.productVO.productName}</p>
							<p class="explain">${product.productVO.productSummary }</p>
							<p class="cost">
								<strong>${product.productVO.productDiscountPrice }</strong>원 
								<span class="sale">${product.productVO.productPrice }원</span>
							</p>
					    </div>
					</a>
				</li>
				
			</c:forEach>
			
			
			</ul>
		</div>
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
    <script>
    
    const productOrder = document.getElementById("product-order");
    const searchWord = document.getElementById("search-word");
    
    // 검색란에 엔터키 입력
    var fn_enterInSearch = function() {
    	// 엔터키 입력시
    	if(window.event.keyCode == 13) {
    		fn_search("enterInSearch");
    	}
    }
    
    // 정렬순 변경
    var fn_changeOrder = function() {
		fn_search("changeOrder");
    }
    
    // 검색
    var fn_search = function(event) {
    	// 검색란에 엔터키 쳤을 때
    	if(event=="enterInSearch") {
    		location.href="/cmm/main/shop/discountShop.do?searchWord="+searchWord.value+"&&order="+productOrder.options[productOrder.selectedIndex].value;
   		// 정렬순 변경 시
    	} else if(event=="changeOrder") {
    		// 현재 패러미터
    		var currentParameter = window.location.href.includes("?")?window.location.href.split("?")[1]:'';
        	
        	if(currentParameter.length>0) {
        		if(currentParameter.includes("order=")) {
        			var newParameter = '';
        			var checkIndex = 0;
        			for(var parameter of currentParameter.split("&&")) {
    					if(!parameter.includes("order=")) {
    						newParameter += parameter + "&&"
    						checkIndex++;
    					}	
        			}
        			
        			if(checkIndex==0) {
        				newParameter = "order="+productOrder.options[productOrder.selectedIndex].value;
        			} else {
        				newParameter += "order="+productOrder.options[productOrder.selectedIndex].value;
        			}
        			
        			location.href="/cmm/main/shop/discountShop.do?"+newParameter;
        		} else {
        			location.href="/cmm/main/shop/discountShop.do?"+currentParameter+"&&order="+productOrder.options[productOrder.selectedIndex].value;
        		}	
        	} else {
        		location.href="/cmm/main/shop/discountShop.do?order="+productOrder.options[productOrder.selectedIndex].value;	
        	}	
    	}
    }
    
    </script>
</body>

</html>