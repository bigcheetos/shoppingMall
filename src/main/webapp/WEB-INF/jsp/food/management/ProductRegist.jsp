
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
                                                <input type="button" class="btn btn-secondary btn-img-upload" onclick="fn_btnImgUploadOnClicked(1)" value="파일선택"/>
                                                <input type="button" class="btn btn-secondary btn-img-select" onclick="fn_btnImgSelectorOnClicked(1)" value="제공이미지 사용"/>
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
                                    <!-- <li>
                                        <div id="prd_image2" class="img_thumb">
                                            <img id="file_prd_image2" src="/user/file/sht/upfile_202109101119597720">
                                        </div>
                                        <div class="img_cont">
                                            <div class="blue">상세 이미지(1)</div>
                                            <div class="file">
                                                <input name="prd_image2" id="prd_image2" type="file" title="상품 이미지">
                                            </div>
                                        </div>
									</li>
                                    <li>
                                        <div id="prd_image3" class="img_thumb">
                                            <img id="file_prd_image3" src="/user/file/sht/upfile_202109101119597720">
                                        </div>
                                        <div class="img_cont">
                                            <div class="blue">상세 이미지(2)</div>
                                            <div class="file">
                                                <input name="prd_image3" id="prd_image3" type="file" title="상품 이미지">
                                            </div>
                                        </div>
									</li>
                                    <li>
                                        <div id="prd_image4" class="img_thumb">
                                            <img id="file_prd_image4" src="/user/file/sht/upfile_202109101119597720">
                                        </div>
                                        <div class="img_cont">
                                            <div class="blue">상세 이미지(3)</div>
                                            <div class="file">
                                                <input name="prd_image4" id="prd_image4" type="file" title="상품 이미지">
                                            </div>
                                        </div>
									</li>
                                    <li>
                                        <div id="prd_image5" class="img_thumb">
                                            <img id="file_prd_image5" src="/user/file/sht/upfile_202109101119597720">
                                        </div>
                                        <div class="img_cont">
                                            <div class="blue">상세 이미지(4)</div>
                                            <div class="file">
                                                <input name="prd_image5" id="prd_image5" type="file" title="상품 이미지">
                                            </div>
                                        </div>
									</li>
                                    <li>
                                        <div id="prd_image6" class="img_thumb">
                                            <img id="file_prd_image6" src="/user/file/sht/upfile_202109101119597720">
                                        </div>
                                        <div class="img_cont">
                                            <div class="blue">상세 이미지(5)</div>
                                            <div class="file">
                                                <input name="prd_image6" id="prd_image6" type="file" title="상품 이미지">
                                            </div>
                                        </div>
									</li>
                                    <li>
                                        <div id="prd_image7" class="img_thumb">
                                            <img id="file_prd_image7" src="/user/file/sht/upfile_202109101119597720">
                                        </div>
                                        <div class="img_cont">
                                            <div class="blue">상세 이미지(6)</div>
                                            <div class="file">
                                                <input name="prd_image7" id="prd_image7" type="file" title="상품 이미지">
                                            </div>
                                        </div>
									</li>
                                    <li>
                                        <div id="prd_image8" class="img_thumb">
                                            <img id="file_prd_image8" src="/user/file/sht/upfile_202109101119597720">
                                        </div>
                                        <div class="img_cont">
                                            <div class="blue">상세 이미지(7)</div>
                                            <div class="file">
                                                <input name="prd_image8" id="prd_image8" type="file" title="상품 이미지">
                                            </div>
                                        </div>
									</li>
                                    <li>
                                        <div id="prd_image9" class="img_thumb">
                                            <img id="file_prd_image9" src="/user/file/sht/upfile_202109101119597720">
                                        </div>
                                        <div class="img_cont">
                                            <div class="blue">상세 이미지(8)</div>
                                            <div class="file">
                                                <input name="prd_image9" id="prd_image9" type="file" title="상품 이미지">
                                            </div>
                                        </div>
									</li>
                                    <li>
                                        <div id="prd_image10" class="img_thumb">
                                            <img id="file_prd_image10" src="/user/file/sht/upfile_202109101119597720">
                                        </div>
                                        <div class="img_cont">
                                            <div class="blue">상세 이미지(9)</div>
                                            <div class="file">
                                                <input name="prd_image10" id="prd_image10" type="file" title="상품 이미지">
                                            </div>
                                        </div>
									</li>
                                    <li>
                                        <div id="prd_image11" class="img_thumb">
                                            <img id="file_prd_image11" src="/user/file/sht/upfile_202109101119597720">
                                        </div>
                                        <div class="img_cont">
                                            <div class="blue">상세 이미지(10)</div>
                                            <div class="file">
                                                <input name="prd_image11" id="prd_image11" type="file" title="상품 이미지">
                                            </div>
                                        </div>
									</li> -->
								</ul>
							</div>
                            
                            <div id="provide_image_file" style="display:none">
								<ul class="prd_img_file" style="width:100%;">
									<li>
                                        <div class="img_thumb">
                                            <img id="provide_image_preview">
                                        </div>
                                        <div class="img_cont">
                                            <div>
                                                제공 이미지를  사용합니다.
                                                <!-- <img src="/common/html/admin/images/order/btn_cancle.gif" align="absmiddle" class="pointer" onclick="cancel_provide_image();"> -->
                                            </div>
                                        </div>
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
									 <!-- &nbsp;* 명칭은 4~5자가 가장 적절하게 표시됩니다. -->
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
							<div class="item" style="padding-bottom:3px; padding-top:2px; ">
								<div>
									<div style="width:20%; float:left">
										&nbsp;&nbsp;옵션명&nbsp;
									</div>
									<div style="width:79%; float:left">
										<input type="text" name="ps_title[]" title="사용자옵션명" class="form-control" value="">
									</div>
								</div>
								<div>
									<div style="width:20%; float:left">
										&nbsp;&nbsp;옵션내용&nbsp;
									</div>
									<div style="width:79%; float:left">
									 	<input type="text" name="ps_contents[]" title="사용자옵션" class="form-control"  value="">
									</div>
								</div>
								<div>
									<input type="button" class="btn btn-secondary" value="+추가 옵션">
								</div>
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
							<input type="button" class="btn btn-primary" value="등록하기" onclick="fn_validate()">
						</td>
					</tr>
					

					<tr>
						<td class="bg-lightgray" style="border-top:1px solid #aaa;">
							상품재료
							<br />
							<input type="button" class="btn btn-primary" value="보기" onClick="fn_setGoodsInfoList('material')">
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
							<input type="button" class="btn btn-primary" value="보기" onClick="fn_setGoodsInfoList('size')">
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
							<br /><input type="button" class="btn btn-primary" value="보기" onClick="fn_setGoodsInfoList('use')">
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
							<br /><input type="button" class="btn btn-primary" value="보기" onClick="fn_setGoodsInfoList('introduction')">
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
							<input type="button" class="btn btn-primary" value="등록하기" onclick="fn_validate()">
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
    
    <script src="/js/react/commonFunctions.js?ver=133245"></script>
    <script src="/js/common/productInformation.js?ver=12"></script>
    <script>
	
	var productTypeList	= [];	// 타입
	var productTypeMap	= {};	// 타입
	
	var productCategoryList = []; 	// 카테고리
	var productCategoryMap	= {};	// 카테고리
	
	var imgFileList = []; 	// 이미지파일
	var imgFileIndex = 1;	// 이미지파일 순번
	
	var findIdIndex = 0;	// 이미지파일 버튼 인덱스
	
	const div_goodsInfoList = document.querySelector('#goods_info_list');	// 상품 정보 팝업 
	
	// 폼 데이터 겟,셋 관련
	const productCode = document.querySelector('#product_code');
	const productId = document.querySelector('#product_id');
	const productName = document.querySelector('#product_name');
	const productSummary = document.querySelector('#product_summary');
	const productPrice = document.querySelector('#product_price');
	const productDiscountPrice = document.querySelector('#product_discount_price');
	const productDeliverypay = document.querySelector('#product_deliverypay');
	const productOrigin = document.querySelector('#product_origin');
	
	const productMaterial = document.querySelector('#product_material');
	const productSize = document.querySelector('#product_size');
	const productIntroduction = document.querySelector('#product_introduction');
	const productUse = document.querySelector('#product_use');
	const productDeliveryguide = document.querySelector('#product_deliveryguide');
	const productCancelguide = document.querySelector('#product_cancelguide');
	const productNotice = document.querySelector('#product_notice');
	
	
	// 타입세팅
	var fn_setProductTypeMap = function() {
		for(var productType of productTypeList) {
			productTypeMap[productType.typeId] = productType.typeName;
		}
		
		// 카테고리 불러오기
		gfn_commonLoadDataRequest('/cmm/main/management/getProductCategoryList.do', productCategoryList, fn_setProductCategoryMap);
	}
	
	// 카테고리 세팅
	var fn_setProductCategoryMap = function() {
		for(var productCategory of productCategoryList) {
			productCategoryMap[productCategory.categoryId] = productCategory.categoryName;
		}
		
		// 카테고리 체크박스 리스트 만들기
		fn_createCategoryCheckBoxList();
	}
	
	var fn_createCategoryCheckBoxList = function() {
		
		for(var productType of productTypeList) {
			
			var com_divType = document.createElement("div");
			com_divType.style.margin = "5px 0px 0px";
			
			var com_strong = document.createElement("strong");
			com_strong.innerText = productType.typeName;
			
			com_divType.appendChild(com_strong)
			com_divType.appendChild(document.createElement("br"))
			
			var index = 0;
			
			for(var productCategory of productCategoryList) {
				if(productType.typeId == productCategory.typeId) {
					
					var com_divCategory = document.createElement("div");
					com_divCategory.style.width = "25%";
					com_divCategory.style.float = "left";
					
					var com_input = document.createElement("input");
					com_input.type = "checkbox";
					com_input.name = "category_names";
					com_input.value = productCategory.categoryName;
					com_input.id = "category_" + productCategory.categoryId; 
					
					var com_label = document.createElement("label");
					com_label.htmlFor = "category_" + productCategory.categoryId;
					com_label.innerText = productCategory.categoryName;
					
					com_divCategory.appendChild(com_input);
					com_divCategory.appendChild(com_label);
					
					com_divType.appendChild(com_divCategory);
					
					index++;
					
					if(index%4==0) {
						com_divType.appendChild(document.createElement("br"))
					}
				}
			}
			var com_endDiv = document.createElement("div");
			com_endDiv.style.clear = "both";
			com_endDiv.style.margin = "0px 0px 5px 0px"
			
			com_divType.appendChild(com_endDiv);
			
			document.querySelector("#category_areas").appendChild(com_divType);
		}
	}
	
	//상품코드 중복체크
	var fn_checkExistProductcode = function() {
		var productCodeVal = productCode.value;
		var checkPattern = /[^0-9a-zA-Z,_-]/;
		//값 있는지 체크...
		if(productCodeVal < 4
		||productCodeVal > 20
		||checkPattern.test(productCodeVal)) {
			alert("영문과 숫자(일부특수문자:-,_)로 조합된 4-20자리 문자로 입력해 주십시오.");
			return
		}
		
		fn_checkProductCodeRequest(productCodeVal);
	}
	
	// 
	var fn_checkProductCodeRequest = function(productCodeVal) {
		gfn_loadData('/cmm/main/management/checkExistProductCode.do?productCode='+productCodeVal)
		.then(function (datums) {
			if(datums.returnValue == "true") {
				alert("["+productCode.value+"]는 이미 사용중인 코드입니다.");
			} else if (datums.returnValue == "false"){
				alert("["+productCode.value+"]는 사용가능한 코드입니다.");
				
			} else {
				alert("영문과 숫자(일부특수문자:-,_)로 조합된 4-20자리 문자로 입력해 주십시오.");
			}
		})
		.catch(function (err) {
			alert("영문과 숫자(일부특수문자:-,_)로 조합된 4-20자리 문자로 입력해 주십시오.");
			console.error(err.statusText);
		});
	}
	
	// 원산지 등록
	
	// 간편 등록 버튼
	var fn_openOriginForm = function() {
		var registFormText = document.querySelector('form#goods_regist_form input[name=product_origin]');
		var madeinFormText = document.querySelector('form#set_origin_form input[name=product_origin]');
		
		$('#pop_set_origin_info').dialog({width:800,height:700});
		fn_resetOrigin();
		
		madeinFormText.value = registFormText.value; 
		
	}
	
	// 간편 등록 추가버튼
	var fn_setOrigin = function() {
		var materialCheckedList = document.querySelectorAll('form#set_origin_form input[name=set_material]:checked');
		var originChecked 		= document.querySelector('form#set_origin_form input[name=set_origin]:checked');
		var productOrigin		= document.querySelector('form#set_origin_form input[name=product_origin]');
		var returnFunction		= false;
		
		var inputStr = '';
		
		if(materialCheckedList.length < 1) {
			alert('소재를 선택하세요.');
			return;
		}
		
		if(originChecked < 1) {
			alert('원산지를 선택하세요.');
			return;
		}
		
		materialCheckedList.forEach(function(el) {
			if(el.id == '') {
				if(el.nextElementSibling.value == '') {
					alert('소재를 입력하세요.');
					returnFunction = true;
					return;
				} else {
					inputStr += ', ' + el.nextElementSibling.value;
				}
			} else {
				inputStr += ', ' + el.nextElementSibling.textContent;	
			}
		})
		
		if(returnFunction) return;
		
		if(originChecked.id == '') {
			if(originChecked.nextElementSibling.value == '') {
				alert('원산지를 입력하세요.');
				returnFunction = true;
				return;
			} else {
				inputStr += ' : ' + originChecked.nextElementSibling.value;
			}
		} else {
			inputStr += ' : ' + originChecked.nextElementSibling.textContent;
		}
		
		if(returnFunction) return;
		
		if(productOrigin.value.length > 0) {
			productOrigin.value = productOrigin.value + inputStr;
		} else {
			productOrigin.value = inputStr.substring(1);
		}
	}
	
	// 간편 등록 초기화버튼
	var fn_resetOrigin = function() {
		var checkedList 	= document.querySelectorAll('form#set_origin_form input:checked');
		var materialText	= document.querySelector('form#set_origin_form input[name=set_material_text]');
		var madeinText		= document.querySelector('form#set_origin_form input[name=set_origin_text]');
		var productOrigin	= document.querySelector('form#set_origin_form input[name=product_origin]');
		
		checkedList.forEach(function(el) {
			el.checked = false;
		})
		materialText.value  = '';
		madeinText.value 	= '';
		productOrigin.value = '';
	}
	
	// 간편 등록 적용버튼
	var fn_applyOrigin = function() {
		var registFormText = document.querySelector('form#goods_regist_form input[name=product_origin]');
		var madeinFormText = document.querySelector('form#set_origin_form input[name=product_origin]');
		
		registFormText.value = madeinFormText.value; 
		
		$('#pop_set_origin_info').dialog('close');
		
		alert('원산지의 정보가 적용되었습니다.'
		+ '\n' + '상품정보를 저장해야 수정한 내용이 반영됩니다.');
	}
	
	// 상품정보 팝업 내용 생성
	var fn_setGoodsInfoList = function(goods) {
		// div_goodsInfoList: 동적으로 생성한 컴포넌트의 부모 팝업 div
		var goodsInfoList = [];
		var goodsText = '';
		var textareaId = '';
		
		// 상품재료
		switch(goods) {
			// 상품재료
			case 'material': 
				goodsInfoList = gfn_getMaterialList();
				textareaId = 'product_material';
				break;
			// 상품사이즈
			case 'size' :
				goodsInfoList = gfn_getSizeList();
				textareaId = 'product_size';
				break;
			// 상품용도
			case 'use' :
				goodsInfoList = gfn_getUseList();
				textareaId = 'product_use';
				break;
			// 상품소개
			case 'introduction' :
				goodsInfoList = gfn_getIntroductionList();
				textareaId = 'product_introduction';
				break;
			// 배송안내
			case 'deliveryguide' :
				goodsText = gfn_getDeliveryguide();
				textareaId = 'product_deliveryguide';
				break;
			// 주문취소안내
			case 'cancelguide' :
				goodsText = gfn_getCancelguide();
				textareaId = 'product_cancelguide';
				break;
			// 구매시유의사항
			case 'notice' :
				goodsText = gfn_getNotice();
				textareaId = 'product_notice';
				break;
			default :
				return;
		}
		
		// 기존 데이터 지우기
		while(div_goodsInfoList.hasChildNodes()) {
			div_goodsInfoList.removeChild(div_goodsInfoList.firstChild);
		}
		// 데이터 생성
		if(goods=="material" || goods=="size" || goods=="use") {
			for(let goodsInfo of goodsInfoList) {
				var div_goodsInfo = document.createElement("div");
				var a_goodsInfo = document.createElement("a");
				
				div_goodsInfo.className = "set_goods_info_column";
				a_goodsInfo.href = "javascript:void(0)";
				a_goodsInfo.innerText = goodsInfo;
				
				a_goodsInfo.addEventListener('click', function() {
					fn_setGoodsInfo(textareaId, goodsInfo);
				});
				
				div_goodsInfo.appendChild(a_goodsInfo);
				div_goodsInfoList.appendChild(div_goodsInfo);
			}
		} else if(goods=="introduction") {
			for(let goodsInfo of goodsInfoList) {
				var label_goodsInfo = document.createElement("label");
				var input_goodsInfo = document.createElement("input");
				
				label_goodsInfo.className = "set_goods_info_category";
				label_goodsInfo.innerText = goodsInfo;
				input_goodsInfo.type = "radio";
				input_goodsInfo.name = "set_goods_info_category";
				
				label_goodsInfo.addEventListener('click', function() {
					fn_setGoodsIntroductionInfo(textareaId, goodsInfo);
				});
				
				label_goodsInfo.prepend(input_goodsInfo);
				div_goodsInfoList.appendChild(label_goodsInfo);	
			}
		} else {
			var a_goodsInfo = document.createElement("a");
			var p_goodsInfo = document.createElement("p");
			
			a_goodsInfo.href = "javascript:void(0)";
			
			p_goodsInfo.innerHTML = goodsText;
			
			a_goodsInfo.appendChild(p_goodsInfo);
			div_goodsInfoList.appendChild(a_goodsInfo);
			
			a_goodsInfo.addEventListener('click', function() {
				fn_setGoodsText(textareaId, goodsText);
			});
		}
		
		$('#pop_set_goods_info').dialog({width:800,height:500});
	}
	
	// 상품정보 팝업 내용 클릭시
	var fn_setGoodsInfo = function(paramedTextareaId, goods) {
		var textareaId = document.querySelector('#'+paramedTextareaId);
		
		if(textareaId.value.length == 0) {
			textareaId.value = goods;	
		} else {
			textareaId.value += ", " + goods;	
		}
	}
	
	// 배송안내 팝업에서 상품카테고리 클릭시  
	var fn_setGoodsIntroductionInfo = function(paramedTextareaId, goods) {
		var goodsIntroductionInfoList = [];
		var div_goodsIntroductionInfoList = document.querySelector('#goods_introduction_info_list');
		var div_clear = div_goodsInfoList.querySelector('.clear');
		
		switch(goods) {
			case '꽃바구니' :
				goodsIntroductionInfoList = gfn_getIntroductionBasket();
				break;
			case '꽃다발' :
				goodsIntroductionInfoList = gfn_getIntroductionBouquet();
				break;
			case '축하화한' :
				goodsIntroductionInfoList = gfn_getIntroductionHwreath();
				break;
			case '근조화한' :
				goodsIntroductionInfoList = gfn_getIntroductionDwreath();
				break;
			case '관엽/화분' :
				goodsIntroductionInfoList = gfn_getIntroductionFoliage();
				break;
			case '동양란' :
				goodsIntroductionInfoList = gfn_getIntroductionEorchid();
				break;
			case '서양란' :
				goodsIntroductionInfoList = gfn_getIntroductionWorchid();
				break;
			case '꽃상자' :
				goodsIntroductionInfoList = gfn_getIntroductionBox();
				break;
			default :
				return;
		}
		
		
		// 없으면
		if(!div_goodsIntroductionInfoList) {
			div_goodsIntroductionInfoList = document.createElement('div');
			div_goodsIntroductionInfoList.id = 'goods_introduction_info_list';
		}
		if(!div_clear) {
			div_clear = document.createElement('div');
			div_clear.className = 'clear';
		}
		
		while(div_goodsIntroductionInfoList.hasChildNodes()) {
			div_goodsIntroductionInfoList.removeChild(div_goodsIntroductionInfoList.firstChild);
		}
		
		for(let goodsIntroduction of goodsIntroductionInfoList) {
			var div_goodsIntroduction = document.createElement("div");
			var a_goodsIntroduction = document.createElement("a");
			
			div_goodsIntroduction.className = "set_goods_info";
			a_goodsIntroduction.href = "javascript:void(0)";
			a_goodsIntroduction.innerText = goodsIntroduction;
			
			a_goodsIntroduction.addEventListener('click', function() {
				fn_setGoodsInfo(paramedTextareaId, goodsIntroduction);
			});
			
			div_goodsIntroduction.appendChild(a_goodsIntroduction);
			div_goodsIntroductionInfoList.appendChild(div_goodsIntroduction);
		}
		
		div_goodsInfoList.appendChild(div_clear);
		div_goodsInfoList.appendChild(div_goodsIntroductionInfoList);
	}
	
	var fn_setGoodsText = function(paramedTextareaId, goodsText) {
		var textareaId = document.querySelector('#'+paramedTextareaId);
		textareaId.value = goodsText;
	}
	
	// 추가이미지 동적으로 생성
	var fn_addImgList = function() {
		
		if(imgFileIndex>=10) return;
		
		imgFileIndex++;
		
		var li = document.createElement("li");
		var div_product_img = document.createElement("div");
		var img = document.createElement("img");
		var input_hidden = document.createElement("input");
		var div_img_cont = document.createElement("div");
		var div_blue = document.createElement("div");
		var div_file = document.createElement("div");
		var input_button_upload = document.createElement("input");
		var span = document.createElement("span");
		var input_button_select = document.createElement("input");
		
		li.className = "list-group-item li-product-image";
		div_product_img.id = "div_product_img_"+imgFileIndex;
		div_product_img.className = "img_thumb";
		img.id = "product_img_"+imgFileIndex;
		img.src = "/images/food/product/noimage.png";
		img.style.width = "160px";
		img.style.height = "160px";
		input_hidden.type = "hidden";
		input_hidden.id = "atch_file_id_"+imgFileIndex;
		input_hidden.name = "atch_file_id_"+imgFileIndex;
		input_hidden.value = "";
		div_img_cont.className = "img_cont";
		div_blue.className = "blue";
		div_blue.innerText = "상세 이미지("+imgFileIndex+")";
		div_file.className = "file";
		input_button_upload.type = "button";
		input_button_upload.className = "btn btn-secondary btn-img-upload";
		input_button_upload.value = "파일선택";
		span.innerText = " ";
		input_button_select.type = "button";
		input_button_select.className = "btn btn-secondary btn-img-select";
		input_button_select.value = "제공이미지 사용";
		
		div_product_img.appendChild(img);
		div_product_img.appendChild(input_hidden);
		
		div_file.appendChild(input_button_upload);
		div_file.appendChild(span);
		div_file.appendChild(input_button_select);
		
		div_img_cont.appendChild(div_blue);
		div_img_cont.appendChild(div_file);
		
		li.appendChild(div_product_img);
		li.appendChild(div_img_cont);
		
		// 생성된 li 컴포넌트 이미지 ul에 붙이기
		document.querySelector(".li-product-image").parentNode.appendChild(li);
		
		// button addEvent
		var currentIndex = imgFileIndex;
		
		input_button_upload.addEventListener('click', function() {
			fn_btnImgUploadOnClicked(currentIndex);
		});
		
		input_button_select.addEventListener('click', function() {
			fn_btnImgSelectorOnClicked(currentIndex);
		});
	}
	
	
	
	// 이미지 업로드 버튼
	var fn_btnImgUploadOnClicked = function(imgFileIndex) {
		var url = '/cmm/fms/EgovFileUploadPopup.do';
		var winWidth = 700;
		var winHeight = 300;
		var popupOption = "width="+winWidth+",height="+winHeight;
		findIdIndex = imgFileIndex;
		
		if(window.showModalDialog == undefined){  
			window.showModalDialog = function(url,mixedVar,features){  
		    	window.hasOpenWindow = true;  
            	if(mixedVar) var mixedVar = mixedVar;  
            	if(features) var features = features.replace(/(dialog)|(px)/ig,"").replace(/;/g,',').replace(/\:/g,"=");  
                window.myNewWindow = window.open(url,"_blank",features);  
	        }
		}
		
		window.showModalDialog(url, "", popupOption);
		
	}
	
	// 팝업결과 리턴
	var fn_egovFileUploadPopupHandler = function(_this, result) {
		_this.window.close();
		alert("저장이 완료되었습니다!");
		fn_getImgFile(result);
	}
	
	//제공이미지 팝업 클릭
	var fn_btnImgSelectorOnClicked = function(imgFileIndex) {
		var url = '/cmm/main/management/viewImgFilePopup.do';
		var winWidth = 700;
		var winHeight = 600;
		var popupOption = "width="+winWidth+",height="+winHeight;
		findIdIndex = imgFileIndex;
		
		if(window.showModalDialog == undefined){  
			window.showModalDialog = function(url,mixedVar,features){  
		    	window.hasOpenWindow = true;  
            	if(mixedVar) var mixedVar = mixedVar;  
            	if(features) var features = features.replace(/(dialog)|(px)/ig,"").replace(/;/g,',').replace(/\:/g,"=");  
                window.myNewWindow = window.open(url,"_blank",features);  
	        }
		}
		
		window.showModalDialog(url, "", popupOption);
		
	}
	
	// 팝업결과 리턴
	var fn_imgFilePopupHandler = function(_this, result) {
		_this.window.close();
		fn_getImgFile(result.atchFileId);
	}
	
	var fn_getImgFile = function(atchFileId) {
		imgFileList = [];
		// 호출할 url, 서버에서 받아온 이미지 데이터 담을 곳, callback함수
		gfn_commonLoadDataRequest('/cmm/fms/getImgFileList.do?atchFileId='+atchFileId, imgFileList, fn_setImg);
	}
	
	var fn_setImg = function() {
		document.querySelector("#product_img_"+findIdIndex).src = '';
		document.querySelector("#product_img_"+findIdIndex).src = imgFileList[0].fileStreCours + imgFileList[0].streFileNm;
		document.querySelector("#atch_file_id_"+findIdIndex).value = imgFileList[0].atchFileId;
		
		// 초기화
		findIdIndex = 0;
	}
	
	// 체크박스 세팅
	// fn_set_checkbox('#set_origin_form','set_material', this.checked, 'text') 
	var fn_setCheckbox = function(formName, checkboxName, thisChecked, exclusions) {
		var checkboxList = document.querySelectorAll("form"+formName+" input[name="+checkboxName+"]");
		
		for(checkbox of checkboxList) {
			if(checkbox.value != exclusions) {
				checkbox.checked = thisChecked;
			}
		}
	}
	
	// 필수체크
	var fn_validate = function() {
		var checkedCategoryList = document.querySelectorAll('div#category_areas input[name=category_names]:checked');
		var atchFileList 		= document.querySelector('.prd_img_file').querySelectorAll('input[type=hidden]');
		
		var filteredProductPrice = gfn_filterInt(productPrice.value);
		var filteredDiscountPrice = gfn_filterInt(productDiscountPrice.value);
		var filteredDeliverypay = gfn_filterInt(productDeliverypay.value);
		
		if(checkedCategoryList.length < 1) {
			alert('카테고리를 선택하세요.');
			return;
		}
		
		if(productName.value.length < 1) {
			alert('상품명을 입력해 주십시오.');
			return;
		}
		
		if(atchFileList[0].value.length < 1) {
			alert('첫번째 상품 이미지는 필수입니다.')
			return;
		}
		
		if(productPrice.value.length < 1) {
			alert('판매금액을 입력하세요.');
			return;
		}
		
		if(isNaN(gfn_filterInt(filteredProductPrice))
		|| filteredProductPrice < 0
		|| filteredProductPrice > 9999900) {
			alert('가격은 0~9,999,900까지의 숫자만 입력 가능합니다.');
			return;
		}
		
		if(isNaN(gfn_filterInt(filteredDiscountPrice))
		|| filteredDiscountPrice < 0
		|| filteredDiscountPrice > 9999900) {
			alert('할인가는 0~9,999,900까지의 숫자만 입력 가능합니다.');
			return;
		}
		
		if(isNaN(gfn_filterInt(filteredDeliverypay))
		|| filteredDeliverypay < 0
		|| filteredDeliverypay > 9999900) {
			alert('배송비는 0~9,999,900까지의 숫자만 입력 가능합니다.');
			return;
		}
		
		if(productOrigin.value.length < 1) {
			alert('원산지 정보는 필수 입력 항목입니다.');
			return;
		}
		
		// 서버에 넘길 데이터 세팅
		var categoryStr = '';
		var atchFileStr = '';
		
		checkedCategoryList.forEach(function(el) {
			categoryStr += el.id.replace('category_','') + ',';
		})
		atchFileList.forEach(function(el) {
			if(el.value) atchFileStr += el.value + ',';
		})
		
		var updateFormData = [{
			productId : productId.value,
			productCode : productCode.value,
			
			checkedCategoryList : categoryStr,
			atchFileList : atchFileStr,
			
			productName : productName.value,
			productSummary : productSummary.value,
			productPrice : productPrice.value,
			productDiscountPrice : productDiscountPrice.value,
			productDeliverypay : productDeliverypay.value,
			productOrigin : productOrigin.value,
			
			productMaterial 	 : productMaterial.value,
			productSize 		 : productSize.value,
			productIntroduction  : productIntroduction.value,
			productUse 			 : productUse.value,
			productDeliveryguide : gfn_isEmpty(productDeliveryguide.value)?gfn_getDeliveryguide():productDeliveryguide.value,
			productCancelguide 	 : gfn_isEmpty(productCancelguide.value)?gfn_getCancelguide():productCancelguide.value,
			productNotice 		 : gfn_isEmpty(productNotice.value)?gfn_getNotice():productNotice.value
		}]
		
		fn_uploadFormDataRequest(updateFormData);
	}
	
	var fn_uploadFormDataRequest = function(data) {
		// 폼 데이터 업로드 요청
		gfn_uploadData(data, '/cmm/main/management/registProductDetail.do')
		.then(function (datums) {
			console.log(datums);
			// 제품 관리로 이동
			if(!alert("저장이 완료되었습니다.")) location.href="/cmm/main/management/productManagement.do";
		})
		.catch(function (err) {
			console.error(err.statusText);
		});
	}
	
	// 값 가져오기
	var fn_loadDataRequest = function(url, callbackFunc) {
		gfn_loadData(url)
		.then(function (datums) {
			callbackFunc(datums);
		})
		.catch(function (err) {
			console.error(err.statusText);
		});
	}
	
	// 카테고리 체크
	var fn_setCheckedCategoryList = function(checkedCategoryList) {
		for(var checkedCategory of checkedCategoryList) {
			var categoryId = document.querySelector('#category_'+checkedCategory.CATEGORY_ID);
			categoryId.checked = true;
		}
	}
	
	// 불러온 이미지 세팅
	var fn_setImgFileSrc = function(imgFileList) {
		var setImgIndex = 1;
		for(var imgFile of imgFileList) {
			// 이미지가 더 있을 경우 이미지 리스트 동적 생성
			if(setImgIndex!=1) {fn_addImgList(setImgIndex);}
			document.querySelector("#product_img_"+setImgIndex).src = imgFile.FILE_COURS_NM;
			document.querySelector("#atch_file_id_"+setImgIndex).value = imgFile.ATCH_FILE_ID;
			setImgIndex++;
		}
	}
	
	// 데이터 값 세팅
	var fn_setDataForm = function(data) {
		productCode.value 			= gfn_isEmpty(data.productCode)?"":data.productCode;
		productCode.readOnly		= gfn_isEmpty(data.productCode)?false:true;
		productId.value 			= gfn_isEmpty(data.productId)?"":data.productId;
		productName.value 			= gfn_isEmpty(data.productName)?"":data.productName;
		productSummary.value		= gfn_isEmpty(data.productSummary)?"":data.productSummary;
		productPrice.value  		= gfn_isEmpty(data.productPrice)?"":data.productPrice;
		productDiscountPrice.value 	= gfn_isEmpty(data.productDiscountPrice)?"":data.productDiscountPrice;
		productDeliverypay.value 	= gfn_isEmpty(data.productDeliverypay)?"":data.productDeliverypay;
		productOrigin.value 		= gfn_isEmpty(data.productOrigin)?"":data.productOrigin;
		
		productMaterial.value 		= gfn_isEmpty(data.productMaterial)?"":data.productMaterial;
		productSize.value 			= gfn_isEmpty(data.productSize)?"":data.productSize;
		productIntroduction.value 	= gfn_isEmpty(data.productIntroduction)?"":data.productIntroduction;
		productUse.value 			= gfn_isEmpty(data.productUse)?"":data.productUse;
		productDeliveryguide.value  = gfn_isEmpty(data.productDeliveryguide)?"":data.productDeliveryguide;
		productCancelguide.value 	= gfn_isEmpty(data.productCancelguide)?"":data.productCancelguide;
		productNotice.value 		= gfn_isEmpty(data.productNotice)?"":data.productNotice;
		
		if(!gfn_isEmpty(data.productCode)) {
			fn_loadDataRequest('/cmm/main/management/getProductDetailToProductCategory.do?productCode='+data.productCode, fn_setCheckedCategoryList);
			fn_loadDataRequest('/cmm/main/management/getProductDetailToAtchFile.do?productCode='+data.productCode, fn_setImgFileSrc);	
		}
		
	}
	
	// setup the grid after the page has finished loading
	document.addEventListener('DOMContentLoaded',
		function() {
			// 타입 불러오기
			gfn_commonLoadDataRequest('/cmm/main/management/getProductTypeList.do', productTypeList, fn_setProductTypeMap);
			
			if(productId.value != 'null') {
				fn_loadDataRequest('/cmm/main/management/getProductDetail.do?productId='+productId.value, fn_setDataForm);
			} else {
				productId.value = ''
			}
		}
	);
</script>
</body>
</html>