
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
                                            <img id="file_prd_image1" src="/user/file/sht/upfile_202109101119597720">
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
								<input type="text" name="prd_name" title="상품명" class="form-control" size="50" value="" required>
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
									<input type="number" min="0" name="prd_price1" title="가격1" class="form-control" style="margin-bottom:4px; text-align:right;" value="0" required>
								</div>
								 <div>
									 &nbsp;원
									 &nbsp;* 명칭은 4~5자가 가장 적절하게 표시됩니다.
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
									<input type="number" min="0" name="prd_dc_rate" title="할인금액" class="form-control" value="0" style="text-align:right;"/>
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
							<input type="text" name="prd_madein" title="원산지" class="form-control" style="width:100%" value="">
							
							<div class="item" style="padding-top:10px;">
							<a href='/images/food/origin_flower_country.pdf' target='_blank'>
								<input type="button" class="btn btn-primary" value="꽃 원산지 표시 안내">
							</a>
								<input type="button" class="btn btn-primary" value="간편 등록" onClick="$('#pop_set_madein_info').dialog({width:800,height:700});">
								<!-- <span class="button small"><a href="http://www.roseweb.co.kr/download/files/origin_flower_country.pdf" target="_blank">꽃 원산지 표시 안내</a></span> -->
								
								<!-- <span class="button small"><button type="button" onclick="$('#pop_set_madein_info').dialog('open');">간편 등록</button></span> -->
								<!--
								<span class="blue pointer" onclick="$('#goods_regist_form [name=prd_madein]').val('국내산');">클릭시 자동으로 "국내산" 입력됩니다.</span>
								-->
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align:center; padding:15px;">
							<!-- <img src="/common/html/admin/images/common/btn_apply.gif" value="등록하기" class="pointer" onclick="validate()" /> -->
							<input type="button" class="btn btn-primary" value="등록하기">
						</td>
					</tr>
					

					<tr>
						<td class="bg-lightgray" style="border-top:1px solid #aaa;">
							상품재료
							<br /><a href="javascript:search_goods_info('compose');"></a>
						</td>
						<td style="border-top:1px solid #aaa;">
							<div class="item">
								<!-- <textarea name="prd_desc_material" cols="50" rows="2" title="상품재료" class="form-control"></textarea> -->
<!-- <link rel="stylesheet" href="/common/html/daumeditor/css/editor.css" type="text/css"  charset="utf-8" /> -->
<!-- 
<script src="/common/html/daumeditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
// <![CDATA[
	/*-------- 글 등록할 때 필요한 함수들 시작 ----------*/
	function saveContent() {
		Editor.save(); /* 이 함수를 호출하여 글을 등록하면 된다. */
	}

	function validForm(editor) {
		/* 본문 내용이 입력되었는지 검사하는 부분 */
		var _validator = new Trex.Validator();
		var _content = editor.getContent();
		if(!_validator.exists(_content)) {
			alert('내용을 입력하세요');
			return false;
		}

		return true;
	}

	function setForm(editor) {
		var _formGen = editor.getForm();
		var _content = editor.getContent();

		_formGen.createField(
			tx.textarea({
				/* 본문 내용을 필드를 생성하여 값을 할당하는 부분 */
				'name': "prd_desc_material",
				'style': { 'display': "none" }
			},
			_content)
		);

		var _attachments = editor.getAttachments();
		for(var i=0,len=_attachments.length;i<len;i++) {
				_formGen.createField(
					tx.input({
						'type': "hidden",
						'name': 'tx_attach_image',
						'value': _attachments[i].data.imageurl /* 예에서는 이미지경로만 받아서 사용 */
					})
				);
		}

		return true;
	}
	/*-------- 글 등록할 때 필요한 함수들 끝 ----------*/
	// ]]>
</script>
 -->
<!-- 에디터 컨테이너 시작 -->
<!-- <!-- <div id="tx_trex_container" class="tx-editor-container">
    사이드바
    <div id="tx_sidebar" class="tx-sidebar">
        <div class="tx-sidebar-boundary">
            사이드바 / 첨부
            <ul class="tx-bar tx-bar-left tx-nav-attach">


				
                <li class="tx-list">
                    <div unselectable="on" id="tx_file" class="tx-file tx-btn-trans">
                        <a href="javascript:;" title="파일" class="tx-text">파일</a>
                    </div>
                </li>
				

            </ul>
            사이드바 / 우측영역
            <ul class="tx-bar tx-bar-right tx-nav-opt">
                <li class="tx-list">
                    <div unselectable="on" class="tx-switchtoggle" id="tx_switchertoggle">
                        <a href="javascript:;" title="에디터 타입">에디터</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    툴바 - 기본 시작
    <div id="tx_toolbar_basic" class="tx-toolbar tx-toolbar-basic">
        <div class="tx-toolbar-boundary">
            <ul class="tx-bar tx-bar-left">
                <li class="tx-list">
                    <div id="tx_fontfamily" unselectable="on" class="tx-slt-70bg tx-fontfamily">
                        <a href="javascript:;" title="글꼴">굴림</a>
                    </div>
                    <div id="tx_fontfamily_menu" class="tx-fontfamily-menu tx-menu" unselectable="on">
                    </div>
                </li>
            </ul>
            <ul class="tx-bar tx-bar-left">
                <li class="tx-list">
                    <div unselectable="on" class="tx-slt-42bg tx-fontsize" id="tx_fontsize">
                        <a href="javascript:;" title="글자크기">9pt</a>
                    </div>
                    <div id="tx_fontsize_menu" class="tx-fontsize-menu tx-menu" unselectable="on">
                    </div>
                </li>
            </ul>



            <ul class="tx-bar tx-bar-left tx-group-etc">
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-bg tx-specialchar" id="tx_specialchar">
                        <a href="javascript:;" class="tx-icon" title="특수문자">특수문자</a>
                    </div>
                    <div id="tx_specialchar_menu" class="tx-specialchar-menu tx-menu">
                    </div>
                </li>
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-lbg tx-emoticon" id="tx_emoticon">
                        <a href="javascript:;" class="tx-icon" title="이모티콘">이모티콘</a>
                    </div>
                    <div id="tx_emoticon_menu" class="tx-emoticon-menu tx-menu" unselectable="on">
                    </div>
                </li>
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-bg tx-link" id="tx_link">
                        <a href="javascript:;" class="tx-icon" title="링크 (Ctrl+K)">링크</a>
                    </div>
                    <div id="tx_link_menu" class="tx-link-menu tx-menu">
                    </div>
                </li>

                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-bg tx-table" id="tx_table">
                        <a href="javascript:;" class="tx-icon" title="표만들기">표만들기</a>
                    </div>
                    <div id="tx_table_menu" class="tx-table-menu tx-menu" unselectable="on">
                        <div class="tx-menu-inner">
                            <div class="tx-menu-preview">
                            </div>
                            <div class="tx-menu-rowcol">
                            </div>
                            <div class="tx-menu-deco">
                            </div>
                            <div class="tx-menu-enter">
                            </div>
                        </div>
                    </div>
                </li>
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-rbg tx-horizontalrule" id="tx_horizontalrule">
                        <a href="javascript:;" class="tx-icon" title="구분선">구분선</a>
                    </div>
                    <div id="tx_horizontalrule_menu" class="tx-horizontalrule-menu tx-menu" unselectable="on">
                    </div>
                </li>
            </ul>




            <ul class="tx-bar tx-bar-left tx-group-font">
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-lbg tx-bold" id="tx_bold">
                        <a href="javascript:;" class="tx-icon" title="굵게 (Ctrl+B)">굵게</a>
                    </div>
                </li>
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-bg tx-underline" id="tx_underline">
                        <a href="javascript:;" class="tx-icon" title="밑줄 (Ctrl+U)">밑줄</a>
                    </div>
                </li>
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-bg tx-italic" id="tx_italic">
                        <a href="javascript:;" class="tx-icon" title="기울임 (Ctrl+I)">기울임</a>
                    </div>
                </li>
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-bg tx-strike" id="tx_strike">
                        <a href="javascript:;" class="tx-icon" title="취소선 (Ctrl+D)">취소선</a>
                    </div>
                </li>
                <li class="tx-list">
                    <div unselectable="on" class="tx-slt-tbg tx-forecolor" style="background-color:#5c7fb0;" id="tx_forecolor">
                        <a href="javascript:;" class="tx-icon" title="글자색">글자색</a>
                        <a href="javascript:;" class="tx-arrow" title="글자색 선택">글자색 선택</a>
                    </div>
                    <div id="tx_forecolor_menu" class="tx-menu tx-forecolor-menu tx-colorpallete" unselectable="on">
                    </div>
                </li>
                <li class="tx-list">
                    <div unselectable="on" class="tx-slt-brbg tx-backcolor" style="background-color:#5c7fb0;" id="tx_backcolor">
                        <a href="javascript:;" class="tx-icon" title="글자 배경색">글자 배경색</a>
                        <a href="javascript:;" class="tx-arrow" title="글자 배경색 선택">글자 배경색 선택</a>
                    </div>
                    <div id="tx_backcolor_menu" class="tx-menu tx-backcolor-menu tx-colorpallete" unselectable="on">
                    </div>
                </li>
            </ul>




			
			<ul class="tx-bar tx-bar-left">
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-lrbg tx-fullscreen" id="tx_fullscreen">
                        <a href="javascript:;" class="tx-icon" title="넓게쓰기 (Ctrl+M)">넓게쓰기</a>
                    </div>
                </li>
            </ul>
            <ul class="tx-bar tx-bar-right">
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-nlrbg tx-advanced" id="tx_advanced">
                        <a href="javascript:;" class="tx-icon" title="툴바 더보기">툴바 더보기</a>
                    </div>
                </li>
            </ul>
			
        </div>
    </div>
    툴바 - 기본 끝
	툴바 - 더보기 시작
    <div id="tx_toolbar_advanced" class="tx-toolbar tx-toolbar-advanced">
        <div class="tx-toolbar-boundary">
            <ul class="tx-bar tx-bar-left tx-group-order">
            </ul>

			<ul class="tx-bar tx-bar-left">
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-lbg tx-textbox" id="tx_textbox">
                        <a href="javascript:;" class="tx-icon" title="글상자">글상자</a>
                    </div>
                    <div id="tx_textbox_menu" class="tx-textbox-menu tx-menu">
                    </div>
                </li>
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-bg tx-quote" id="tx_quote">
                        <a href="javascript:;" class="tx-icon" title="인용구 (Ctrl+Q)">인용구</a>
                    </div>
                    <div id="tx_quote_menu" class="tx-quote-menu tx-menu" unselectable="on">
                    </div>
                </li>
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-bg tx-background" id="tx_background">
                        <a href="javascript:;" class="tx-icon" title="배경색">배경색</a>
                    </div>
                    <div id="tx_background_menu" class="tx-menu tx-background-menu tx-colorpallete" unselectable="on">
                    </div>
                </li>
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-rbg tx-dictionary" id="tx_dictionary">
                        <a href="javascript:;" class="tx-icon" title="사전">사전</a>
                    </div>
                </li>
            </ul>
			<ul class="tx-bar tx-bar-left tx-group-undo">
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-lbg tx-undo" id="tx_undo">
                        <a href="javascript:;" class="tx-icon" title="실행취소 (Ctrl+Z)">실행취소</a>
                    </div>
                </li>
                <li class="tx-list">
                    <div unselectable="on" class="tx-btn-rbg tx-redo" id="tx_redo">
                        <a href="javascript:;" class="tx-icon" title="다시실행 (Ctrl+Y)">다시실행</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    툴바 - 더보기 끝

	편집영역 시작
	에디터 Start
    <div id="tx_canvas" class="tx-canvas">
        <div id="tx_loading" class="tx-loading">
            <div>
                <img src="/common/html/daumeditor/images/icon/editor/loading2.png?rv=1.0.1" width="113" height="21" />
            </div>
        </div>
        <div id="tx_canvas_wysiwyg_holder" class="tx-holder" style="display:block;">
            <iframe id="tx_canvas_wysiwyg" name="tx_canvas_wysiwyg" allowtransparency="true" frameborder="0">
            </iframe>
        </div>
        <div class="tx-source-deco">
            <div id="tx_canvas_source_holder" class="tx-holder">
                <textarea id="tx_canvas_source" rows="30" cols="30">
                </textarea>
            </div>
        </div>
        <div id="tx_canvas_text_holder" class="tx-holder">
            <textarea id="tx_canvas_text" rows="30" cols="30">
            </textarea>
        </div>
    </div>
    높이조절 Start
    <div id="tx_resizer" class="tx-resize-bar">
        <div class="tx-resize-bar-bg">
        </div>
        <img id="tx_resize_holder" src="/common/html/daumeditor/images/icon/editor/btn_drag01.gif" width="58" height="12" unselectable="on" alt="" />
    </div>
    편집영역 끝

	첨부박스 시작
	파일첨부박스 Start
    <div id="tx_attach_div" class="tx-attach-div">
        <div id="tx_attach_txt" class="tx-attach-txt">
            파일 첨부
        </div>
        <div id="tx_attach_box" class="tx-attach-box">
            <div class="tx-attach-box-inner">
                <div id="tx_attach_preview" class="tx-attach-preview">
                    <p>
                    </p>
                    <img src="/common/html/daumeditor/images/icon/editor/pn_preview.gif" width="147" height="108" unselectable="on"/>
                </div>
                <div class="tx-attach-main">
                    <div id="tx_upload_progress" class="tx-upload-progress">
                        <div>
                            0%
                        </div>
                        <p>
                            파일을 업로드하는 중입니다.
                        </p>
                    </div>
                    <ul class="tx-attach-top">
                        <li id="tx_attach_delete" class="tx-attach-delete">
                            <a>전체삭제</a>
                        </li>
                        <li id="tx_attach_size" class="tx-attach-size">
                            파일: <span id="tx_attach_up_size" class="tx-attach-size-up"></span>/<span id="tx_attach_max_size"></span>
                        </li>
                        <li id="tx_attach_tools" class="tx-attach-tools">
                        </li>
                    </ul>
                    <ul id="tx_attach_list" class="tx-attach-list">
                    </ul>
                </div>
            </div>
        </div>
    </div>
    첨부박스 끝
</div> -->
<!-- 에디터 컨테이너 끝 -->
<!-- 
<script type="text/javascript">
	var form_name = "";
	var canvas_height = "80px";
	form_name = (form_name == "") ? document.forms[document.forms.length-1].name : form_name;	// 없으면 맨 마지막 form의 이름으로 설정한다.
	//alert(form_name);

	/*-------- 에디터 로드 시작 ----------*/
	new Editor({
		events: {
			preventUnload: false
		},
		txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
		txPath: '/common/html/daumeditor/', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
		txVersion: '5.4.0', /* 수정필요없음. */
		txService: 'sample', /* 수정필요없음. */
		txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
		initializedId: "", /* 대부분의 경우에 빈문자열 */
		wrapper: "tx_trex_container"+"", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
		form: form_name +"", /* 등록하기 위한 Form 이름 */
		txIconPath: "/common/html/daumeditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
		txDecoPath: "/common/html/daumeditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
		canvas: {
			styles: {
				color: "#000", /* 기본 글자색 */
				fontFamily: "굴림", /* 기본 글자체 */
				fontSize: "10pt", /* 기본 글자크기 */
				backgroundColor: "#fff", /*기본 배경색 */
				lineHeight: "1.5", /*기본 줄간격 */
				padding: "8px" /* 위지윅 영역의 여백 */
			}
		},
		sidebar: {
			attacher: {
				image: {
			  		multiple: true,
		      		multipleuse: true,
		      		checksize: false,
		      		boxonly: false,
		      		wysiwygonly: true,
		      		features: {
						left:250,
						top:65,
						width:450,
						height:200
					},
		      		popPageUrl: "/daumeditor/popup_image"
				},
				file: {
	  				multiple: true,
		      		multipleuse: true,
		      		checksize: true,
		      		boxonly: false,
		      		wysiwygonly: true,
		      		features: {
						left:250,
						top:65,
						width:450,
						height:200
					},
		      		popPageUrl: "/daumeditor/popup_file"
				}
			}
		},
		size: {
			contentWidth: "" /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
		}
	});

	if(canvas_height != "")
	{
		Editor.canvas.setCanvasSize({
	 		height: canvas_height
		});
	}
	/*-------- 에디터 로드 끝 ----------*/

</script>
 -->


<textarea id="tx_load_content" cols="80" rows="10" style="display:none;"></textarea>
<!-- 
<script type="text/javascript">
	/*-------- 컨텐츠 불러오기 시작 ----------*/
	function loadContent() {
		var attachments = {};

		/* 저장된 컨텐츠를 불러오기 위한 함수 호출 */
		Editor.modify({
			"attachments": function() { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
				var allattachments = [];
				for(var i in attachments) {
					allattachments = allattachments.concat(attachments[i]);
				}
				return allattachments;
			}(),
			"content": $tx("tx_load_content")
		});
	}
	Editor.modify({
		"content": $tx("tx_load_content")
	});
</script>
 -->
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
								<textarea name="prd_desc_size" cols="50" rows="2" title="상품사이즈" class="form-control"></textarea>
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
								<textarea name="prd_desc_use" cols="50" rows="2" title="상품용도" class="form-control"></textarea>
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
								<textarea name="prd_desc_intro" cols="50" rows="5" title="상품소개" class="form-control"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							배송안내
						</td>
						<td>
							<div class="item">
								<textarea name="prd_notice_delivery" cols="50" rows="5" title="배송안내" class="form-control"></textarea>
								<div class="blue">+ 입력하지 않으시면, [<a href="/homepage/adm_use_info_modify_form" target="_blank">쇼핑몰관리>상점상세정보>이용안내>배송안내</a>]의 내용이 출력됩니다.</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							주문취소안내
						</td>
						<td>
							<div class="item">
								<textarea name="prd_notice_cancel" cols="50" rows="5" title="주문취소안내" class="form-control"></textarea>
								<div class="blue">+ 입력하지 않으시면, [<a href="/homepage/adm_use_info_modify_form" target="_blank">쇼핑몰관리>상점상세정보>이용안내>주문취소안내</a>]의 내용이 출력됩니다.</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-lightgray">
							구매시유의사항
						</td>
						<td>
							<div class="item">
								<textarea name="prd_notice_buy" cols="50" rows="5" title="구매시유의사항" class="form-control"></textarea>
								<div class="blue">+ 입력하지 않으시면, [<a href="/homepage/adm_use_info_modify_form" target="_blank">쇼핑몰관리>상점상세정보>이용안내>구매시유의사항</a>]의 내용이 출력됩니다.</div>
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
<div id="pop_set_madein_info" title="원산지 간편 등록" style="display:none;">
	<form name="set_madein_form" id="set_madein_form">
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
		
		<div style="width:60%; padding:5px 0; float:left;"><input type="checkbox" name="set_material" value="text" >
			<input type="text" name="set_material_text" value="" style="width:90%;" class="form-control" />
		</div>
		<div style="width:20%; padding:5px 0; float:left;"><input type="checkbox" id="set_material_all" onclick="set_checkbox('#set_madein_form','set_material', this.checked, 'text')" >
			<label for="set_material_all">전체</label>
		</div>
	</div>
	
	<div style="clear:both; font-weight:bold; border-bottom:2px solid #ddd; overflow:hidden;margin:0 0 10px 0;padding-bottom:10px;">
		
		<h3>국가 선택</h3>
		
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein0" value="국내산" >
			<label for="set_madein0">국내산</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein1" value="뉴질랜드" >
			<label for="set_madein1">뉴질랜드</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein2" value="대만" >
			<label for="set_madein2">대만</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein3" value="말레이시아" >
			<label for="set_madein3">말레이시아</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein4" value="배트남" >
			<label for="set_madein4">배트남</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein5" value="브라질" >
			<label for="set_madein5">브라질</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein6" value="아프리카" >
			<label for="set_madein6">아프리카</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein7" value="영국" >
			<label for="set_madein7">영국</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein8" value="오스트레일리아" >
			<label for="set_madein8">오스트레일리아</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein9" value="이디오피아" >
			<label for="set_madein9">이디오피아</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein10" value="일본" >
			<label for="set_madein10">일본</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein11" value="중국" >
			<label for="set_madein11">중국</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein12" value="케냐" >
			<label for="set_madein12">케냐</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein13" value="태국" >
			<label for="set_madein13">태국</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein14" value="콜롬비아" >
			<label for="set_madein14">콜롬비아</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein15" value="필리핀" >
			<label for="set_madein15">필리핀</label>
		</div>
		<div style="width:25%; padding:5px 0; float:left;"><input type="radio" name="set_madein" id="set_madein16" value="호주" >
			<label for="set_madein16">호주</label>
		</div>
		
		<div style="width:75%; padding:5px 0; float:left;"><input type="radio" name="set_madein" value="text" >
			<input type="text" name="set_madein_text" value="" style="width:90%;" class="form-control" />
		</div>
	</div>
		
	<div style="clear:both; font-weight:bold; overflow:hidden;margin:0 0 10px 0;padding-bottom:10px;">
		원산지 : <input type="text" name="prd_madein" value="" style="width:90%;" class="form-control" />
	</div>
	
	<div style="text-align:center;">
		<button type="button" class="btn btn-primary" onclick="fn_setOrigin()">추가</button>
		&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary" onclick="fn_resetOrigin();">초기화</button>
	</div>
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
    
    <script src="/js/react/commonFunctions.js?ver=3245"></script>
    <script>
	
	var productTypeList	= [];	// 타입
	var productTypeMap	= {};	// 타입
	
	var productCategoryList = []; 	// 카테고리
	var productCategoryMap	= {};	// 카테고리
	
	var imgFileList = []; 	// 이미지파일
	
	var productCode = document.querySelector('#product_code');
	
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
	
	// 원산지 등록 추가 체크
	var fn_setOrigin = function() {
		// 폼명, 체크박스 경로
		var checkboxList = document.getElementById('set_madein_form').querySelectorAll('[name=set_material_all]');
		var hasChecked = false;
		
		for(var i = 0; i < checkboxList.length; i++) {
			if(checkboxList[i].checked) {
				hasChecked = true;
				break;
			}
		}
		
		if(!hasChecked) {
			alert("체크해야 합니다.");
			return;
		}
	}
	
	//업무버튼
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
	var fn_uploadPopupHandler = function(_this, result) {
		_this.window.close();
		alert("저장이 완료되었습니다!");		
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
	var fn_selectPopupHandler = function(_this, result) {
		_this.window.close();
		alert("저장이 완료되었습니다!");
	}
	
	var fn_getImgFile = function(atchFileId) {
		gfn_commonLoadDataRequest('/cmm/fms/getImgFileList.do?atchFileId='atchFileId, imgFileList, fn_setImg);
	}
	
	var fn_setImg = function() {
		
	}
	
	// setup the grid after the page has finished loading
	document.addEventListener('DOMContentLoaded',
		function() {
			// 타입 불러오기
			gfn_commonLoadDataRequest('/cmm/main/management/getProductTypeList.do', productTypeList, fn_setProductTypeMap);
		}
	);
</script>
</body>
</html>