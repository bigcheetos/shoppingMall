<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <title>food</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/css/food/cartlist.css" type="text/css"> 
     <link rel="stylesheet" href="/css/food/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/food/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/food/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/style.css" type="text/css"> 
</head>
<script type="text/javascript">

var price;
var quantity;

function init () {
	price = document.cartList.price.value;
	quantity = document.cartList.quantity.value;
	document.cartList.sum.value = price;
	change();
}

function add () {
	hm = document.cartList.quantity;
	sum = document.cartList.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * price;
}

function del () {
	hm = document.cartList.quantity;
	sum = document.cartList.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * price;
		}
}

function change () {
	hm = document.cartList.quantity;
	sum = document.cartList.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * price;
}  




/* var selectChange = function(value){
	console.log(value);
	$("#changeInput").val(value).submit;
	
	var sum = 0.0;
	var total = 0.0;
    var price = document.getElementById("totalPrice").value;
    console.log(price);
    var amount = (value*price);
    console.log(amount);
    //sum+=amount;
	$("#totalPrice").val(amount).submit;
      
    $(this).find('.shoping__cart__total').text(''+amount);
    //sumTotal();
	
}
var cartSeq = document.cartList.cartSeq.value;
var cartStock = document.cartList.cartStock.value;

function update_amounts(){
	
    var sum = 0.0;
    var total = 0.0;
    $('#myTable > tbody  > tr').each(function() {          
        var qty = document.getElementById("quantity").value;
       //var qty = $(this).find('#quantity').val();
       console.log(qty);
       var price = document.getElementById("price").value;
        //var price = $(this).find('.shoping__cart__price').val();
        console.log(price);
        var amount = (qty*price)
        sum+=amount;
               
        $(this).find('.shoping__cart__total').text(''+amount);
        sumTotal();
    });
    
}

function sumTotal(){
	
		 var totalPrice = 0;		 
		 
		  $('#totalPrice').each(function(){
			  totalPrice += Number($(this).val()); 
			  			  console.log(totalPrice);			  
		  });
		  //$(this).find('#sum_p_price').text(''+totalPrice);
		 // $("#sum_p_price").html(totalPrice + " 원");
		 $("#sum_p_price").val(totalPrice);
} */
		 

</script>
<body onload="init();">
 	<!-- Header Section Begin -->
    <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainHeader.jsp"/> 
    <!-- Header Section End -->
<!-- 금액 총 합계  -->

    


    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="#">Fresh Meat</a></li>
                            <li><a href="#">Vegetables</a></li>
                            <li><a href="#">Fruit & Nut Gifts</a></li>
                            <li><a href="#">Fresh Berries</a></li>
                            <li><a href="#">Ocean Foods</a></li>
                            <li><a href="#">Butter & Eggs</a></li>
                            <li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                            <li><a href="#">Oatmeal</a></li>
                            <li><a href="#">Fresh Bananas</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
        <c:set value="${cartList}" var="cartlist"/>
        
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <form name="cartList" id="cartList" method="post" class="orderform" action="/order/ChckOut.do">  
<%-- 		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
--%>	<input name="cartSeq" type="hidden" value="${searchVO.cartSeq}">
		
		
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table id="myTable">
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:set var="sum" value="0"/>
                            	<c:choose><c:when test="${cartList != null}">                           	
                            	<c:forEach items="${cartList}" var="cartList">                            	
                                <tr>                                	
                                    <td class="shoping__cart__item">
                                    	<img src="${cartList.proImg}" alt="${cartList.proImg}" />
                                        <img src="/images/flowers/thumb-celeb(C07)_60x60.jpg" alt="">
										<img src="/images/flowers/thumb_condol_60x60.jpg" alt="">	
											<h5><a href="/shop/view?n=${cartList.cartSeq}">${cartList.proName}</a>
											</h5>                                   
									</td>
                                    <td class="shoping__cart__price">                                 
                                        <fmt:formatNumber pattern="###,###,###" value="${cartList.proPrice}" />
                                     	<input type="hidden" name="price" id="price" value="${cartList.proPrice}"/> 
                                    </td>
                                    <td class="shoping__cart__quantity">
  <%--                                    	<select id="changeInput" name="qytChange" onchange="selectChange(this.value);">
											<c:forEach var="count" begin="1" end="${cartList.cartStock > 5 ? 5 : cartList.cartStock}">
											<option>${count}</option>
											</c:forEach>
										</select> 
									<button type= "submit" class="primary-btn cart-btn cart-btn-right" id="btnUpdate">수량변경</button>
   									<input type="hidden" name = changeInput value="<c:out value="${count}"/>" >
    								<a href="<c:url value='/order/cartUpdate.do'/>?cartStock=this.value">수량변경</a>
 --%>                                     	
                                     <div class="pro-qty">    
                                     <input type="text" name="quantity" id= "quantity" value="1" size="3" onchange="change();">                                                                          
                                    </div>
                                    </td>
                                    <td class="shoping__cart__total" >
                                        <fmt:formatNumber pattern="###,###,###"
											value="${cartList.proPrice }" />
 										<input type="hidden" name="sum" id="sum" />
                                     </td>
                                    <td class="shoping__cart__item__close" id="delete_${cartList.cartSeq}_btn"
										data-cartSeq="${cartList.cartSeq}">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>                                                                                                                                   
                                </c:forEach>
                                </c:when>
                                <c:otherwise>
                                	<tr><td colspan="5"><h3>장바구니에 내역이 없습니다.</h3></td></tr>                               
                                </c:otherwise></c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <button class="primary-btn cart-btn" onclick="hrefLink()">CONTINUE SHOPPING</button>
                         <script type="text/javascript">
                         link = '/cmm/main/mainPage.do'; 
                         function hrefLink() { location.href = link; } 
                         function replaceLink() { location.replace(link); }


								/* $(".primary-btn cart-btn").click(function() {
									document.location.replace="/cmm/main/mainPage.do";
								}); */
						</script> 

                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                    	<div class="total-table">
                                    
    					<div class="bigtext right-align sumcount"></div>
<%-- 						<c:set var="sum" value="${sum + (cartList.proPrice * cartList.cartStock)}" />
 --%>    					<div class="bigtext right-align box blue summoney" id="sum_p_price">
 							Total: <fmt:formatNumber pattern="###,###,###" value="" /></div>
                        </div>                        
                        
              <c:if test="${not empty cartList}">          
                        <a href="/order/ChckOut.do" class="primary-btn">주문하기</a>
                        <input type="hidden" name="totalPrice" value=""/>
              	<!-- <button type="button" onclick="goOrder()" class="primary-btn">주문하기</button>-->
              		
              </c:if>      
                    </div>
                </div>
            </div>
        </div>
    </section>
    </form>
 
    <!-- Shoping Cart Section End -->
    

       <!-- Js Plugins -->
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.nice-select.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.slicknav.js"></script>
    <script src="/js/mixitup.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/main.js"></script>



 <!-- Footer Section Begin -->
    <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainFooter.jsp"/> 
    <!-- Footer Section End -->
</body>

</html>