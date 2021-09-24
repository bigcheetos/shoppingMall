
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
								<ul class="prd_img_file list-group" style="width:100%;">
									<li class="list-group-item">
                                        <div id="prd_image1" class="img_thumb">
                                        <!-- 임시 노이미지  /user/file/sht/upfile_202109101119597720 -->
                                            <img id="product_image_file" src="/user/file/sht/upfile_202109101119597720" style="width:160px; height:160px">
                                            <input type="hidden" id="atch_file_id" name="atch_file_id" value=''>
                                        </div>
                                        <div class="img_cont">
                                            <div class="blue">대표 이미지(필수)</div>
                                            <div class="file">
                                                <!-- <input class ="btn" name="prd_image1" id="prd_image1" type="file" title="상품 이미지"> -->
                                                <input type="button" class="btn btn-secondary" onclick="fn_btnImgUploadOnClicked()" value="파일선택"/>
                                                <input type="button" class="btn btn-secondary" onclick="fn_btnImgSelectorOnClicked()" value="제공이미지 사용"/>
                                            </div>
                                        </div>
									</li>
                                    <li class="list-group-item">
                                        <div class="img_thumb" style="width:0;"></div>
                                        <div class="img_cont">
                                            <div class="blue">
                                                * 파일 확장자 : <b>gif, jpg, png, bmp</b> / 파일 용량 : <b>5MB</b><br>
                                                <!-- * 적용하기 후 등록한 상품 <b>이미지 회전</b> 가능 -->
                                            </div>
                                        </div>
									</li>
									<li class="list-group-item">
                                        <input type="button" class="btn btn-secondary" value="+추가 이미지">
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
							<input type="button" class="btn btn-primary" value="보기" onClick="$('#pop_set_goods_info').dialog({width:800,height:500});">
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
							<br /><a href="javascript:search_goods_info('size');">
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
							<br /><a href="javascript:search_goods_info('use');"></a>
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
							<br /><a href="javascript:search_goods_info('intro');"></a>
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
								<div class="blue">+ 입력하지 않으시면, [<a href="#" target="_blank">배송안내</a>]의 내용이 출력됩니다.</div>
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
								<div class="blue">+ 입력하지 않으시면, [<a href="#" target="_blank">주문취소안내</a>]의 내용이 출력됩니다.</div>
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
								<div class="blue">+ 입력하지 않으시면, [<a href="#" target="_blank">구매시유의사항</a>]의 내용이 출력됩니다.</div>
							</div>
						</td>
					</tr>

					<tr>
						<td colspan="2"  style="text-align:center; padding-top:15px;">
							<!-- <img src="/common/html/admin/images/common/btn_apply.gif" value="등록하기" class="pointer" onclick="validate()" /> -->
							<input type="button" class="btn btn-primary" value="등록하기">
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

<!-- 상품재료 팝업 -->
<div id="pop_set_goods_info" title="상품재료 등록" style="display:none;">
	<form name="set_goods_form" id="set_goods_form">
	<div style="width: auto; min-height: 0px; height: 343px;" class="ui-dialog-content">
	<p style="clear:both; padding:5px 0;margin:5px 0;">* 내용을 클릭하면 추가됩니다.</p>
		<div id="goods_info_list" style="display: block;">
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('거베라'); return false;">거베라</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('계절꽃'); return false;">계절꽃</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('고급도자기분'); return false;">고급도자기분</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('고급리본'); return false;">고급리본</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('고급바구니'); return false;">고급바구니</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('고급포장재'); return false;">고급포장재</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('곱슬버들'); return false;">곱슬버들</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('공작소국'); return false;">공작소국</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('과꽃'); return false;">과꽃</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('과일'); return false;">과일</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('글라디올라스'); return false;">글라디올라스</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('금어초'); return false;">금어초</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('나리'); return false;">나리</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('난받침'); return false;">난받침</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('난잎'); return false;">난잎</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('노란장미'); return false;">노란장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('노무라'); return false;">노무라</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('뉴카리'); return false;">뉴카리</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('다알리아'); return false;">다알리아</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('대국화'); return false;">대국화</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('도시루'); return false;">도시루</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('리시얀사스'); return false;">리시얀사스</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('리아트리스'); return false;">리아트리스</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('마르코폴로'); return false;">마르코폴로</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('마리안느'); return false;">마리안느</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('명자란'); return false;">명자란</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('몬스테라'); return false;">몬스테라</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('미니장미'); return false;">미니장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('미디오'); return false;">미디오</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('미색장미'); return false;">미색장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('미스티블루'); return false;">미스티블루</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('백합'); return false;">백합</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('베어그라스'); return false;">베어그라스</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('보키지장미'); return false;">보키지장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('불로초'); return false;">불로초</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('붉은장미'); return false;">붉은장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('석죽'); return false;">석죽</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('소국'); return false;">소국</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('소철잎'); return false;">소철잎</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('수선화'); return false;">수선화</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('스타게이져'); return false;">스타게이져</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('스타티스'); return false;">스타티스</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('스토크'); return false;">스토크</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('스프링겔리'); return false;">스프링겔리</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('쏠리스트'); return false;">쏠리스트</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('아스파라것'); return false;">아스파라것</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('아이리스'); return false;">아이리스</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('안개'); return false;">안개</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('양란'); return false;">양란</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('연보라장미'); return false;">연보라장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('와네끼'); return false;">와네끼</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('와인'); return false;">와인</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('집시꽃'); return false;">집시꽃</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('천일홍'); return false;">천일홍</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('청지목'); return false;">청지목</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('카네이션'); return false;">카네이션</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('카네이션(스프레이)'); return false;">카네이션(스프레이)</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('카라'); return false;">카라</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('칼라아이비'); return false;">칼라아이비</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('케'); return false;">케</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('튜울립'); return false;">튜울립</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('패랭이'); return false;">패랭이</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('퍼퓨륨'); return false;">퍼퓨륨</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('편백'); return false;">편백</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('핑크장미'); return false;">핑크장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('해바라기'); return false;">해바라기</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('후리지아'); return false;">후리지아</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('흰장미'); return false;">흰장미</a>
			</div>
		</div>
	</div>
	</form>
</div>
<!-- 상품재료 팝업 끝-->

<div id="pop_set_goods_info" title="상품정보 등록" style="display:none;">
	<form name="set_goods_form" id="set_goods_form">
	<div style="width: auto; min-height: 0px; height: 343px;" class="ui-dialog-content">
	<p style="clear:both; padding:5px 0;margin:5px 0;">* 내용을 클릭하면 추가됩니다.</p>
	<!-- 상품사이즈 팝업 -->
		<div id="goods_info_list" style="display: block;">
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('거베라'); return false;">거베라</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('계절꽃'); return false;">계절꽃</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('고급도자기분'); return false;">고급도자기분</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('고급리본'); return false;">고급리본</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('고급바구니'); return false;">고급바구니</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('고급포장재'); return false;">고급포장재</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('곱슬버들'); return false;">곱슬버들</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('공작소국'); return false;">공작소국</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('과꽃'); return false;">과꽃</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('과일'); return false;">과일</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('글라디올라스'); return false;">글라디올라스</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('금어초'); return false;">금어초</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('나리'); return false;">나리</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('난받침'); return false;">난받침</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('난잎'); return false;">난잎</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('노란장미'); return false;">노란장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('노무라'); return false;">노무라</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('뉴카리'); return false;">뉴카리</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('다알리아'); return false;">다알리아</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('대국화'); return false;">대국화</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('도시루'); return false;">도시루</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('리시얀사스'); return false;">리시얀사스</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('리아트리스'); return false;">리아트리스</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('마르코폴로'); return false;">마르코폴로</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('마리안느'); return false;">마리안느</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('명자란'); return false;">명자란</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('몬스테라'); return false;">몬스테라</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('미니장미'); return false;">미니장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('미디오'); return false;">미디오</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('미색장미'); return false;">미색장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('미스티블루'); return false;">미스티블루</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('백합'); return false;">백합</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('베어그라스'); return false;">베어그라스</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('보키지장미'); return false;">보키지장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('불로초'); return false;">불로초</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('붉은장미'); return false;">붉은장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('석죽'); return false;">석죽</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('소국'); return false;">소국</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('소철잎'); return false;">소철잎</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('수선화'); return false;">수선화</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('스타게이져'); return false;">스타게이져</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('스타티스'); return false;">스타티스</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('스토크'); return false;">스토크</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('스프링겔리'); return false;">스프링겔리</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('쏠리스트'); return false;">쏠리스트</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('아스파라것'); return false;">아스파라것</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('아이리스'); return false;">아이리스</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('안개'); return false;">안개</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('양란'); return false;">양란</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('연보라장미'); return false;">연보라장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('와네끼'); return false;">와네끼</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('와인'); return false;">와인</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('집시꽃'); return false;">집시꽃</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('천일홍'); return false;">천일홍</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('청지목'); return false;">청지목</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('카네이션'); return false;">카네이션</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('카네이션(스프레이)'); return false;">카네이션(스프레이)</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('카라'); return false;">카라</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('칼라아이비'); return false;">칼라아이비</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('케'); return false;">케</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('튜울립'); return false;">튜울립</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('패랭이'); return false;">패랭이</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('퍼퓨륨'); return false;">퍼퓨륨</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('편백'); return false;">편백</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('핑크장미'); return false;">핑크장미</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('해바라기'); return false;">해바라기</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('후리지아'); return false;">후리지아</a>
			</div>
			<div class="set_goods_info_column">
				<a href="javascript:void(0);"
					onclick="fn_setGoodsInfo('흰장미'); return false;">흰장미</a>
			</div>
		</div>
	</div>
	<!-- 상품사이즈 팝업 -->
	</form>
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
    
    <script src="/js/react/commonFunctions.js?ver=1145"></script>
    <script>
	
	var productTypeList	= [];	// 타입
	var productTypeMap	= {};	// 타입
	
	var productCategoryList = []; 	// 카테고리
	var productCategoryMap	= {};	// 카테고리
	
	var imgFileList = []; 	// 이미지파일
	
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
	
	// 상품재료 등록
	var fn_setGoodsInfo = function(goods) {
		var productMaterial = document.querySelector('#product_material');
		
		if(productMaterial.value.length == 0) {
			productMaterial.value = goods;	
		} else {
			productMaterial.value += ", " + goods;	
		}
	}
	
	// 이미지 업로드 버튼
	var fn_btnImgUploadOnClicked = function() {
		var url = '/cmm/fms/EgovFileUploadPopup.do';
		var winWidth = 700;
		var winHeight = 300;
		var popupOption = "width="+winWidth+",height="+winHeight;
		
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
	var fn_btnImgSelectorOnClicked = function() {
		var url = '/cmm/main/management/viewImgFilePopup.do';
		var winWidth = 700;
		var winHeight = 600;
		var popupOption = "width="+winWidth+",height="+winHeight;
		
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
		gfn_commonLoadDataRequest('/cmm/fms/getImgFileList.do?atchFileId='+atchFileId, imgFileList, fn_setImg);
	}
	
	var fn_setImg = function() {
		document.querySelector("#product_image_file").src = '';
		document.querySelector("#product_image_file").src = imgFileList[0].fileStreCours + imgFileList[0].streFileNm;
		document.querySelector("#atch_file_id").value = imgFileList[0].atchFileId;
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
		var atchFileId = document.querySelector('#atch_file_id');	// 여러개 받도록 수정해야 함
		
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
		
		if(atchFileId.value.length < 1) {
			alert('첫번째 상품 이미지는 필수입니다.')
			return;
		}
		
		if(productPrice.value.length < 1) {
			alert('판매금액을 입력하세요.');
			return;
		}
		
		if(!filteredProductPrice
		|| filteredProductPrice <= 0
		|| filteredProductPrice >= 9999900) {
			alert('가격은 0~9,999,900까지의 숫자만 입력 가능합니다.');
			return;
		}
		
		if(!filteredDiscountPrice
		|| filteredDiscountPrice <= 0
		|| filteredDiscountPrice >= 9999900) {
			alert('할인가는 0~9,999,900까지의 숫자만 입력 가능합니다.');
			return;
		}
		
		if(!filteredDeliverypay
		|| filteredDeliverypay <= 0
		|| filteredDeliverypay >= 9999900) {
			alert('할인가는 0~9,999,900까지의 숫자만 입력 가능합니다.');
			return;
		}
		
		if(productOrigin.value.length < 1) {
			alert('원산지 정보는 필수 입력 항목입니다.');
			return;
		}
		
		// 서버에 넘길 데이터 세팅
		var categoryStr = '';
		
		checkedCategoryList.forEach(function(el) {
			categoryStr += el.id.replace('category_','') + ',';
		})
		
		var updateFormData = [{
			productId : productId.value,
			productCode : productCode.value,
			
			checkedCategoryList : categoryStr,
			atchFileId : atchFileId.value,
			
			productName : productName.value,
			productSummary : productSummary.value,
			productPrice : productPrice.value,
			productDiscountPrice : productDiscountPrice.value,
			productDeliverypay : productDeliverypay.value,
			productOrigin : productOrigin.value,
			
			productMaterail : productMaterial.value,
			productSize : productSize.value,
			productIntroduction : productIntroduction.value,
			productUse : productUse.value,
			productDeliveryguide : productDeliveryguide.value,
			productCancelguide : productCancelguide.value,
			productNotice : productNotice.value
		}]
		
		fn_uploadFormDataRequest(updateFormData);
	}
	
	var fn_uploadFormDataRequest = function(data) {
		// 폼 데이터 업로드 요청
		gfn_uploadData(data, '/cmm/main/management/registProductDetail.do')
		.then(function (datums) {
			console.log(datums);
		})
		.catch(function (err) {
			console.error(err.statusText);
		});
	}
	
	// 상품코드 값 가져오기
	var fn_loadDataRequest = function(requestedProductId) {
		gfn_loadData('', '/cmm/main/management/getProductDetail.do?productId='+requestedProductId)
		.then(function (datums) {
			fn_setDataForm(datums);
		})
		.catch(function (err) {
			console.error(err.statusText);
		});
	}
	
	var fn_setDataForm = function(data) {
		productCode.value = data.productCode;
		productId.value = data.product_id;
		productName.value = data.product_name;
		productSummary.value = data.product_summary;
		productPrice.value = data.product_price;
		productDiscountPrice.value = data.product_discount_price;
		productDeliverypay.value = data.product_deliverypay;
		productOrigin.value = data.product_origin;
		
		productMaterial.value = data.product_material;
		productSize.value = data.product_size;
		productIntroduction.value = data.product_introduction;
		productUse.value = data.product_use;
		productDeliveryguide.value = data.product_deliveryguide;
		productCancelguide.value = data.product_cancelguide;
		productNotice.value = data.product_notice;
	}
	
	// setup the grid after the page has finished loading
	document.addEventListener('DOMContentLoaded',
		function() {
			// 타입 불러오기
			gfn_commonLoadDataRequest('/cmm/main/management/getProductTypeList.do', productTypeList, fn_setProductTypeMap);
			
			if(productId.value != 'null') {
				fn_loadDataRequest();
			} else {
				productId.value = ''
			}
		}
	);
</script>
</body>
</html>