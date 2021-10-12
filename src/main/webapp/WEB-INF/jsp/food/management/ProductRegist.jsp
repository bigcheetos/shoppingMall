
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>

<html>
<style>
.ag-header-cell-label {
   justify-content: center;
}
.bg-lightgray {
	background: #f4f4f4;
	width:16.7%;
}
.set_goods_info{
	padding-bottom: 5px;
    margin-bottom: 5px;
    border-bottom: 1px solid #ccc;
}
.blue a:hover {
	color: #ee5a00;
    text-decoration: underline;
}
.blue a:focus {
	color: #ee5a00;
    text-decoration: underline;
}
.set_goods_info a:hover {
    color: #ee5a00;
    text-decoration: underline;
}
.set_goods_info a:focus {
	text-decoration: solid;
    outline: groove;
    color: black;
}
.set_goods_info_column {
    padding-bottom: 5px;
    margin-bottom: 5px;
    border-bottom: 1px solid #ccc;
    width: 30%;
    float: left;
}
.set_goods_info_column a:hover {
    color: #ee5a00;
    text-decoration: underline;
}
.set_goods_info_column a:focus {
	text-decoration: solid;
    outline: groove;
    color: black;
}
.set_goods_info_category {
    display: block;
    float: left;
    width: 18%;
}
.list-group-item {
    display: table;
    float: left;
    width: 50%;
    padding-top: 3px;
    margin-bottom: 3px;
    border-top: 1px solid #ddd;
}
.clear {
	clear: both;
}
/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
</style>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>제품 등록</title>

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
	
<section class="product_regist">
	
	<div class="container">
<table class="table" width="790" border="0" cellspacing="0" cellpadding="0" class="s_tbg">
    <tr>
        <td class="bg-lightgray">
            <!-- <img src="/common/html/admin/images/goods/g_title_03.gif" alt="상품등록"> -->
            상품등록
        </td>
    </tr>
    <tr>
        <td style="padding-top:20px; padding-left:20px;">

			<form id="goods_regist_form" name="goods_regist_form" action="/goods/adm_goods_regist" method="post" enctype="multipart/form-data">
			<input type="hidden" name="MAX_FILE_SIZE" value="5242880" />
			<input type="hidden" name="mode" value="regist" />
			<input type="hidden" name="sub_mode" value="" /><!-- 옵션상품 구분을 위한 필드 -->
			<input type="hidden" name="prd_image_type" value="S" />
			<input type="hidden" name="provide_image" value="" />
				<table class="table table-bordered" width="750" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2"  class="b_red b">
							*는 필수 입력사항입니다.</span>
						</td>
					</tr>

					<tr>
						<td class="bg-lightgray">
							상품코드
						</td>
						<td>
							<div style="float:left">
								<input type="text" id="product_code" name="product_code" title="상품코드" class="form-control" size="20" maxlength="20" value="">
								<input type="hidden" id="product_id" name="product_id" value="<%=request.getParameter("productId")%>">
							</div>
							<div>
								&nbsp;
								<button class="btn btn-primary" type="button" onclick="fn_checkExistProductcode()">중복체크</button>
								<span class="blue">미입력시 자동으로 등록됩니다.</span>
							</div>
						</td>
					</tr>

                    <tr>
						<td class="bg-lightgray">
							*카테고리
						</td>
						<td>
						<!-- 카테고리 넣는 곳 -->
							<div id="category_areas">								 
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							*이미지
						</td>
						<td style="padding-right:0;">
							<div id="my_image_file">
								<ul class="list-group prd_img_file" style="display: block; width: 100%;">
									<li class="list-group-item li-product-image" style="height:280px">
                                        <div id="div_product_img_1" class="img_thumb">
                                            <img id="product_img_1" src="/images/food/product/noimage.png" style="width:160px;">
                                            <input type="hidden" id="atch_file_id_1" name="atch_file_id_1" value=''>
                                        </div>
                                        <div class="img_cont">
                                            <div class="blue">대표 이미지(필수)</div>
                                            <div class="file">
                                                <input type="button" class="btn btn-primary btn-img-upload" onclick="fn_btnImgUploadOnClicked(1)" value="파일선택"/>
                                                <input type="button" class="btn btn-primary btn-img-select" onclick="fn_btnImgSelectorOnClicked(1)" value="제공이미지 사용"/>
                                            </div>
                                        </div>
									</li>
                                    <li class="list-group-item" style="height:280px">
                                        <div class="img_thumb" style="width:0;"></div>
                                        <div class="img_cont">
                                            <div class="blue">
                                                * 파일 확장자 : <b>gif, jpg, png, bmp</b> / 파일 용량 : <b>5MB</b><br>
                                                <!-- * 적용하기 후 등록한 상품 <b>이미지 회전</b> 가능 -->
                                            </div>
                                        </div>
                                        <hr>
                                        <input type="button" class="btn btn-secondary" value="+추가 이미지" onclick="fn_addImgList(1)">
									</li>
								</ul>
							</div>
						</td>
					</tr>

					<tr>
						<td class="bg-lightgray">
							*상품명
						</td>
						<td>
							<div class="item">
								<input type="text" name="product_name" id="product_name" title="상품명" class="form-control" size="50" value="" required>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							상품정보
						</td>
						<td>
							<div class="item">
								<input type="text" name="product_summary" id="product_summary" title="상품정보" class="form-control" size="50" value="">
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							*판매 금액<br />
						</td>
						<td>
							<div class="item">
								<div style="float:left">
									<input type="number" min="0" name="product_price" id="product_price" title="가격1" class="form-control" style="margin-bottom:4px; text-align:right;" value="0" required>
								</div>
								 <div>
									 &nbsp;원
								 </div>
								 
								<br/>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray" rowspan="2">
							옵션
						</td>
						<td>
							<div class="item div-option-list" style="padding-bottom:3px; padding-top:2px; ">
								<!-- <div id="div_product_option_1">
									<div class="div-option-selector" style="width:20%; float:left">
										<select name="product_option_select" id="product_option_select_1" class="form-select" onchange="fn_changeOption()">
											<option value="none" selected="selected"}>사용자옵션</option>
										</select>
									</div>
									<div class="div-option-name">
										<div style="width:8%; float:left">
											<span>옵션명</span>
										</div>
										<div style="width:27%; float:left">
											<input type="text" name="product_option_name" id="product_option_name_1" title="옵션명" class="form-control" value="">
										</div>
									</div>
									<div class="div-option-price">
										<div style="width:10%; float:left">
											<span>옵션금액</span>
										</div>
										<div style="width:25%; float:left">
											<input type="number" min="0" name="product_option_price" id="product_option_price_1" title="옵션금액" class="form-control" value="0" style="text-align:right;"/>
										</div>
									</div>
									<div class="div-option-button">
										<div style="width:5%; float:left">
											<input type="button" class="btn btn-secondary" value="+">
										</div>
										<div style="width:5%; float:left">
											<input type="button" class="btn btn-secondary" value="-" style="display: none;">
										</div>
									</div>
								</div>  -->
								<!-- <div class="clear"></div>
								<hr>
								-->
								<!-- 추가 옵션 넣을 곳 -->
							</div>
						</td>
					</tr>
					<tr><td style="padding-bottom:3px; padding-top:2px;">*옵션명은 한글 기준 20자 옵션내용은 한글 기준 50글자 이내로 작성하여 주세요.</td></tr>
					<tr>
						<td class="bg-lightgray">
							할인금액
						</td>
						<td>
							<div class="item">
								<div style="float:left">
									<input type="number" min="0" name="product_discount_price" id="product_discount_price" title="할인금액" class="form-control" value="0" style="text-align:right;"/>
								</div>
								<div>
									&nbsp;원
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							배송비
						</td>
						<td>
							<div class="item">
								<div style="float:left">
									<input type="number" min="0" name="product_deliverypay" id="product_deliverypay" title="배송비" class="form-control" value="0" style="text-align:right;"/>
								</div>
								<div>
									&nbsp;원
								</div>
							</div>
						</td>
					</tr>	
					<tr>
						<td class="bg-lightgray">
							*원산지
						</td>
						<td>
							<input type="text" name="product_origin" id="product_origin" title="원산지" class="form-control" style="width:100%" value="">
							
							<div class="item" style="padding-top:10px;">
							<a href='/images/food/origin_flower_country.pdf' target='_blank'>
								<input type="button" class="btn btn-primary" value="꽃 원산지 표시 안내">
							</a>
								<input type="button" class="btn btn-primary" value="간편 등록" onClick="fn_openOriginForm()">
								<!-- <span class="button small"><a href="http://www.roseweb.co.kr/download/files/origin_flower_country.pdf" target="_blank">꽃 원산지 표시 안내</a></span> -->
								
								<!-- <span class="button small"><button type="button" onclick="$('#pop_set_origin_info').dialog('open');">간편 등록</button></span> -->
								<!--
								<span class="blue pointer" onclick="$('#goods_regist_form [name=product_origin]').val('국내산');">클릭시 자동으로 "국내산" 입력됩니다.</span>
								-->
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align:center; padding:15px;">
							<!-- <img src="/common/html/admin/images/common/btn_apply.gif" value="등록하기" class="pointer" onclick="validate()" /> -->
							<input type="button" class="btn btn-success" value="등록하기" onclick="fn_validate()">
						</td>
					</tr>
					

					<tr>
						<td class="bg-lightgray" style="border-top:1px solid #aaa;">
							상품재료
							<br />
							<input type="button" class="btn btn-info" value="보기" onClick="fn_setGoodsInfoList('material')">
						</td>
						<td style="border-top:1px solid #aaa;">
							<div class="item">
								<textarea id="product_material" name="product_material" cols="50" rows="2" title="상품재료" class="form-control"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							상품사이즈
							<br />
							<input type="button" class="btn btn-info" value="보기" onClick="fn_setGoodsInfoList('size')">
						</td>
						<td>
							<div class="item">
								<textarea name="product_size" id="product_size" cols="50" rows="2" title="상품사이즈" class="form-control"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							상품용도
							<br /><input type="button" class="btn btn-info" value="보기" onClick="fn_setGoodsInfoList('use')">
						</td>
						<td>
							<div class="item">
								<textarea name="product_use" id="product_use" cols="50" rows="2" title="상품용도" class="form-control"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							상품소개
							<br /><input type="button" class="btn btn-info" value="보기" onClick="fn_setGoodsInfoList('introduction')">
						</td>
						<td>
							<div class="item">
								<textarea name="product_introduction" id="product_introduction" cols="50" rows="5" title="상품소개" class="form-control"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							배송안내
						</td>
						<td>
							<div class="item">
								<textarea name="product_deliveryguide" id="product_deliveryguide" cols="50" rows="5" title="배송안내" class="form-control"></textarea>
								<div class="blue">+ 입력하지 않으시면, [<a href="javascript:void(0);" onclick="fn_setGoodsInfoList('deliveryguide'); return false;">배송안내</a>]의 내용이 출력됩니다.</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							주문취소안내
						</td>
						<td>
							<div class="item">
								<textarea name="product_cancelguide" id="product_cancelguide" cols="50" rows="5" title="주문취소안내" class="form-control"></textarea>
								<div class="blue">+ 입력하지 않으시면, [<a href="javascript:void(0);" onclick="fn_setGoodsInfoList('cancelguide'); return false;">주문취소안내</a>]의 내용이 출력됩니다.</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							구매시유의사항
						</td>
						<td>
							<div class="item">
								<textarea name="product_notice" id="product_notice" cols="50" rows="5" title="구매시유의사항" class="form-control"></textarea>
								<div class="blue">+ 입력하지 않으시면, [<a href="javascript:void(0);" onclick="fn_setGoodsInfoList('notice'); return false;">구매시유의사항</a>]의 내용이 출력됩니다.</div>
							</div>
						</td>
					</tr>

					<tr>
						<td colspan="2"  style="text-align:center; padding-top:15px;">
							<!-- <img src="/common/html/admin/images/common/btn_apply.gif" value="등록하기" class="pointer" onclick="validate()" /> -->
							<input type="button" class="btn btn-success" value="등록하기" onclick="fn_validate()">
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
    <tr>
    	<td>
        	<!-- <img src="/common/html/admin/images/common/main_bottom_bg.gif" width="790" height="10" alt="bg" /> -->
		</td>
	</tr>
</table>
</div>


<!-- 원산지 팝업 -->
<div id="pop_set_origin_info" title="원산지 간편 등록" style="display:none;">
	<form name="set_origin_form" id="set_origin_form">
	<div style="clear:both; font-weight:bold; border-bottom:2px solid #ddd; overflow:hidden;margin:5px 0 10px 0;padding-bottom:10px;">
		
		<h3>소재 선택</h3>
		
		<div style="width:20%; padding:5px 0; float:left;"><input type="checkbox" name="set_material" id="set_material0" value="국화" >
			<label for="set_material0">국화</label>
		</div>
		<div style="width:20%; padding:5px 0; float:left;"><input type="checkbox" name="set_material" id="set_material1" value="글라디올러스" >
			<label for="set_material1">글라디올러스</label>
		</div>
		<div style="width:20%; padding:5px 0; float:left;"><input type="checkbox" name="set_material" id="set_material2" value="거베라" >
			<label for="set_material2">거베라</label>
		</div>
		<div style="width:20%; padding:5px 0; float:left;"><input type="checkbox" name="set_material" id="set_material3" value="백합" >
			<label for="set_material3">백합</label>
		</div>
		<div style="width:20%; padding:5px 0; float:left;"><input type="checkbox" name="set_material" id="set_material4" value="아이리스" >
			<label for="set_material4">아이리스</label>
		</div>
		<div style="width:20%; padding:5px 0; float:left;"><input type="checkbox" name="set_material" id="set_material5" value="안개꽃" >
			<label for="set_material5">안개꽃</label>
		</div>
		<div style="width:20%; padding:5px 0; float:left;"><input type="checkbox" name="set_material" id="set_material6" value="장미" >
			<label for="set_material6">장미</label>
		</div>
		<div style="width:20%; padding:5px 0; float:left;"><input type="checkbox" name="set_material" id="set_material7" value="튤립" >
			<label for="set_material7">튤립</label>
		</div>
		<div style="width:20%; padding:5px 0; float:left;"><input type="checkbox" name="set_material" id="set_material8" value="프리지아" >
			<label for="set_material8">프리지아</label>
		</div>
		<div style="width:20%; padding:5px 0; float:left;"><input type="checkbox" name="set_material" id="set_material9" value="카네이션" >
			<label for="set_material9">카네이션</label>
		</div>
		<div style="width:20%; padding:5px 0; float:left;"><input type="checkbox" name="set_material" id="set_material10" value="칼라" >
			<label for="set_material10">칼라</label>
		</div>
		
		<div style="width:60%; padding:5px 0; float:left;">
			<input type="checkbox" name="set_material" value="text" style="float:left;">
			<input type="text" name="set_material_text" value="" style="width:90%;" class="form-control" />
		</div>
		<div style="width:20%; padding:5px 0; float:left;">
			<input type="checkbox" id="set_material_all" onclick="fn_setCheckbox('#set_origin_form','set_material', this.checked, 'text')" >
			<label for="set_material_all">전체</label>
		</div>
	</div>
	
	<div style="clear:both; font-weight:bold; border-bottom:2px solid #ddd; overflow:hidden;margin:0 0 10px 0;padding-bottom:10px;">
		
		<h3>국가 선택</h3>
		
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin0" value="국내산" >
			<label for="set_origin0">국내산</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin1" value="뉴질랜드" >
			<label for="set_origin1">뉴질랜드</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin2" value="대만" >
			<label for="set_origin2">대만</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin3" value="말레이시아" >
			<label for="set_origin3">말레이시아</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin4" value="배트남" >
			<label for="set_origin4">배트남</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin5" value="브라질" >
			<label for="set_origin5">브라질</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin6" value="아프리카" >
			<label for="set_origin6">아프리카</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin7" value="영국" >
			<label for="set_origin7">영국</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin8" value="오스트레일리아" >
			<label for="set_origin8">오스트레일리아</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin9" value="이디오피아" >
			<label for="set_origin9">이디오피아</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin10" value="일본" >
			<label for="set_origin10">일본</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin11" value="중국" >
			<label for="set_origin11">중국</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin12" value="케냐" >
			<label for="set_origin12">케냐</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin13" value="태국" >
			<label for="set_origin13">태국</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin14" value="콜롬비아" >
			<label for="set_origin14">콜롬비아</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin15" value="필리핀" >
			<label for="set_origin15">필리핀</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_origin" id="set_origin16" value="호주" >
			<label for="set_origin16">호주</label>
		</div>
		
		<div style="width:75%; padding:5px 0; float:left;">
			<input type="radio" name="set_origin" value="text" style="float:left;">
			<input type="text" name="set_origin_text" value="" style="width:90%;" class="form-control" />
		</div>
	</div>
		
	<div style="clear:both; font-weight:bold; overflow:hidden;margin:0 0 10px 0;padding-bottom:10px;">
		원산지 : <input type="text" name="product_origin" value="" style="width:90%;" class="form-control" />
	</div>
	
	<div style="text-align:center;">
		<button type="button" class="btn btn-primary" onclick="fn_setOrigin()">추가</button>
		&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary" onclick="fn_resetOrigin();">초기화</button>
		&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary" onclick="fn_applyOrigin();">적용</button>
		&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary" onclick="$('#pop_set_origin_info').dialog('close')">닫기</button>
	</div>
	</form>
</div>
<!-- 원산지 팝업 끝 -->

<!-- 상품정보 팝업 -->
<div id="pop_set_goods_info" title="상품재료 등록" style="display:none;">
	<form name="set_goods_form" id="set_goods_form">
	<div id="pop_goods_info" style="width: auto; min-height: 0px; height: 343px;" class="ui-dialog-content">
	<p style="clear:both; padding:5px 0;margin:5px 0;">* 내용을 클릭하면 추가됩니다.</p>
		<div id="goods_info_list" style="display: block;">
			<!-- 내부는 동적으로 생성 -->
		</div>
	</div>
	</form>
</div>
<!-- 상품정보 팝업 끝-->

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
    <script src="/js/management/productRegist.js"></script>
</body>
</html>