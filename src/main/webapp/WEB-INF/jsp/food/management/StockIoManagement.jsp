
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>

<html>
<style>
.ag-header-cell-label {
	justify-content: center;
}

.grid-wrapper::after {
	display: block;
	content: '';
	clear: both;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<!--CDN 링크 -->

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>입출고 관리</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">


<link rel="stylesheet" href="/css/food/common.css" type="text/css">\
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
	<jsp:include page="/WEB-INF/jsp/food/sub/FoodMainHeader.jsp" />
	<!-- Header Section End -->

	<section class="stock">
		<div class="container">
			<!-- 테이블 넣을 곳 -->
			<div style="padding: 2px;">
				<div style="float: left">
					<button type="button" class="btn btn-secondary"
						onclick="onBtSelectAll()">전체선택</button>
					<button type="button" class="btn btn-secondary"
						onclick="onBtDeselectAll()">선택취소</button>
					<button type="button" class="btn btn-secondary"
						onclick="onBtUpdateStock()">재고량 업데이트</button>
				</div>
				<div style="float: left">&nbsp; &nbsp;</div>
				<div style="float: left">&nbsp; &nbsp;</div>
				<div style="float: right">
					<button type="button" class="btn btn-primary"
						onclick="onBtSearch()">조회</button>
					<button type="button" class="btn btn-success"
						onclick="onBtAddBottom()">신규</button>
					<button type="button" class="btn btn-warning" onclick="onBtSave()">저장</button>
					<button type="button" class="btn btn-danger" onclick="onBtDelete()">삭제</button>
				</div>

			</div>
			<div id="updateRows"
				style="height: 100px; border: 1px solid #f4f4f4; margin: 5px 0"></div>
			<div class="grid-wrapper">
				<div style="width: 35%; height: 580px; float: left" id="myGrid"
					class="ag-grid-div ag-theme-balham ag-basic"></div>
				<div style="width: 55%; height: 580px; float: right" id="myGrid2"
					class="ag-grid-div ag-theme-balham ag-basic"></div>
			</div>

		</div>
	</section>
	<!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/jsp/food/sub/FoodMainFooter.jsp" />
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

	<!-- AS GRID -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js" integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://unpkg.com/ag-grid/dist/ag-grid.min.js"></script>
	
	<script src="/js/common/agGridUtil.js"></script>
	<script src="/js/common/commonFunctions.js"></script>
	<script src="/js/management/stockIoManagement.js"></script>
</body>

</html>