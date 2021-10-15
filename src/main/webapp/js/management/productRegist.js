/**
 * 
 */
var productTypeList	= [];	// 타입
var productTypeMap	= {};	// 타입

var productCategoryList = []; 	// 카테고리
var productCategoryMap	= {};	// 카테고리

var productOptionList = [];	// 옵션
//var productOptionMap = [];

var imgFileList = []; 	// 이미지파일
var imgFileIndex = 1;	// 이미지파일 순번

var optionIndex = 1;	// 옵션 순번

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
	
	fn_checkedCategoryList();
}

// 옵션 세팅
var fn_setProductOptionCallback = function() {
	// 옵션 셀렉트 리스트 만들기
	fn_addOptionList();
}

var fn_addOptionList = function() {
	
	var div_product_option = document.querySelector('#div_product_option_'+optionIndex);
	
	if(!div_product_option) {
		div_product_option = document.createElement('div');
		div_product_option.id = "div_product_option_"+optionIndex;
	}
	
	while(div_product_option.hasChildNodes()) {
		div_product_option.removeChild(div_product_option.firstChild);
	}
	
	// 셀렉트박스 시작
	var div_selector = document.createElement("div");
	var select_productOption = document.createElement("select");
	var option_none = document.createElement("option"); // 첫번째 옵션
	let nowIndex = optionIndex;
	
	// 설정
	div_selector.className = 'div-option-selector';
	div_selector.style.width = '20%';
	div_selector.style.float = 'left';
	
	select_productOption.id = "product_option_select_"+optionIndex;
	select_productOption.className = "form-select";
	
	// addEventListner
	select_productOption.addEventListener('change', function(event) {
		fn_changeOptionSelect(this, nowIndex);
	});
	
	option_none.selected = true;
	option_none.innerText = "사용자옵션";
	
	select_productOption.append(option_none);
	
	// 가져온 옵션 설정, 넣기
	for(var productOption of productOptionList) {
		var option_productOption = document.createElement("option");
		option_productOption.innerText = productOption.optionName;
		option_productOption.dataset.optionCode = productOption.optionCode;
		option_productOption.value = productOption.optionPrice;
		select_productOption.appendChild(option_productOption);
	}
	
	
	
	// 
	div_selector.appendChild(select_productOption);
	div_product_option.append(div_selector);
	// 셀렉트박스 끝
	
	// 옵션명 시작
	var div_option_name = document.createElement('div');
	var div_option_name_left = document.createElement('div');
	var div_option_name_right = document.createElement('div');
	var span_option_name = document.createElement('span');
	var input_option_name = document.createElement('input');
	
	div_option_name.className = 'div-option-name';
	div_option_name_left.style.width = '8%';
	div_option_name_left.style.float = 'left';
	span_option_name.innerText = '옵션명';
	div_option_name_right.style.width = '27%';
	div_option_name_right.style.float = 'left';
	input_option_name.type = 'text';
	input_option_name.name = 'product_option_name';
	input_option_name.id = 'product_option_name_'+optionIndex;
	input_option_name.title = '옵션명'
	input_option_name.className = 'form-control';
	input_option_name.value = '';
	
	div_option_name_left.append(span_option_name);
	div_option_name_right.append(input_option_name);
	div_option_name.append(div_option_name_left);
	div_option_name.append(div_option_name_right);
	
	div_product_option.append(div_option_name);
	// 옵션명 끝
	
	// 옵션 코드 시작
	var input_option_code = document.createElement('input');
	
	input_option_code.type = 'hidden';
	input_option_code.name = 'product_option_code';
	input_option_code.id = 'product_option_code_'+optionIndex;
	input_option_code.title = '옵션코드'
	input_option_code.className = 'form-control';
	input_option_code.value = '';
	
	
	div_option_name.append(input_option_code);
	// 옵션 코드 끝
	
	// 옵션금액 시작
	var div_option_price = document.createElement('div');
	var div_option_price_left = document.createElement('div');
	var div_option_price_right = document.createElement('div');
	var span_option_price = document.createElement('span');
	var input_option_price = document.createElement('input');
	
	div_option_price.className = 'div-option-price';
	div_option_price_left.style.width = '10%';
	div_option_price_left.style.float = 'left';
	span_option_price.innerText = '옵션금액';
	div_option_price_right.style.width = '25%';
	div_option_price_right.style.float = 'left';
	input_option_price.type = 'number';
	input_option_price.min = 0;
	input_option_price.max = 990000;
	input_option_price.name = 'product_option_price';
	input_option_price.id = 'product_option_price_'+optionIndex;
	input_option_price.title = '옵션금액'
	input_option_price.className = 'form-control';
	input_option_price.value = 0;
	input_option_price.style.textAlign = 'right';
	
	div_option_price_left.append(span_option_price);
	div_option_price_right.append(input_option_price);
	div_option_price.append(div_option_price_left);
	div_option_price.append(div_option_price_right);
	
	div_product_option.append(div_option_price);
	// 옵션금액 끝
	
	// 버튼부
	var div_button = document.createElement('div');
	var div_button_left = document.createElement('div');
	var btn_plus_button = document.createElement('input');
	var div_button_right = document.createElement('div');
	var btn_minus_button = document.createElement('input');
	
	div_button.className = 'div-option-button';
	div_button_left.style.width = '5%';
	div_button_left.style.float = 'left';
	btn_plus_button.type = 'button';
	btn_plus_button.className = 'btn btn-secondary';
	btn_plus_button.value = '+';
	div_button_right.style.width = '5%';
	div_button_right.style.float = 'left';
	btn_minus_button.type = 'button';
	btn_minus_button.className = 'btn btn-secondary';
	btn_minus_button.value = '-';
	btn_minus_button.style.display = (optionIndex==1)?'none':'';
	
	div_button_left.append(btn_plus_button);
	div_button_right.append(btn_minus_button);
	div_button.append(div_button_left);
	div_button.append(div_button_right);
	
	div_product_option.append(div_button);
	
	// 버튼 이벤트
	btn_plus_button.addEventListener('click', function() {
		fn_addOptionList();
	});
	
	btn_minus_button.addEventListener('click', function() {
		document.querySelector('#div_product_option_'+nowIndex).remove();
	});
	
	// 버튼부 끝
	
	var div_clear = document.createElement('div');
	var hr = document.createElement('hr');
	div_clear.className = 'clear';
	
	div_product_option.append(div_clear);
	div_product_option.append(hr);

	document.querySelector('.div-option-list').append(div_product_option);
	
	optionIndex++;
}

// 옵션 선택한 경우
var fn_changeOptionSelect = function(_this, nowIndex) {
	var optionName = document.querySelector('#product_option_name_'+nowIndex);
	var optionCode = document.querySelector('#product_option_code_'+nowIndex);
	var optionPrice= document.querySelector('#product_option_price_'+nowIndex);
	
	if(_this.options[_this.selectedIndex].value != '사용자옵션' 
	&& fn_checkDuplicateOption(_this.options[_this.selectedIndex].value)) { 
		alert('중복된 옵션 상품입니다.');
		
		// 초기화
		_this.selectedIndex = 0;
		optionName.value = '';
		optionCode.value = '';
		optionPrice.value = '';
		
		optionName.readOnly = false;
		optionPrice.readOnly = false;
		
		return; 
	};
	
	if(_this.options[_this.selectedIndex].value == '사용자옵션') {
		// 초기화
		optionName.value = '';
		optionCode.value = '';
		optionPrice.value = '';
		
		optionName.readOnly = false;
		optionPrice.readOnly = false;
	} else {
		optionName.value = _this.options[_this.selectedIndex].text;
		optionCode.value = _this.options[_this.selectedIndex].dataset.optionCode;
		optionPrice.value = _this.options[_this.selectedIndex].value;
		
		optionName.readOnly = true;
		optionPrice.readOnly = true;
	}
}

var fn_checkDuplicateOption = function(selectedValue) {
	var checkCount = 0;
	
	document.querySelectorAll('.div-option-list select').forEach(function(el) {
		if(el.options[el.selectedIndex].value == selectedValue) checkCount++;
	});
	
	return checkCount!=1;
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
		case '축하화환' :
			goodsIntroductionInfoList = gfn_getIntroductionHwreath();
			break;
		case '근조화환' :
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
	var span2 = document.createElement("span");
	var input_button_delete = document.createElement("input");
	
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
	div_blue.innerText = "상세 이미지("+(+imgFileIndex-1)+")";
	div_file.className = "file";
	input_button_upload.type = "button";
	input_button_upload.className = "btn btn-primary btn-img-upload";
	input_button_upload.value = "파일선택";
	span.innerText = " ";
	input_button_select.type = "button";
	input_button_select.className = "btn btn-primary btn-img-select";
	input_button_select.value = "제공이미지 사용";
	span2.innerText = " ";
	input_button_delete.type = "button";
	input_button_delete.className = "btn btn-secondary"
	input_button_delete.value = "X";
	
	div_product_img.appendChild(img);
	div_product_img.appendChild(input_hidden);
	
	div_file.appendChild(input_button_upload);
	div_file.appendChild(span);
	div_file.appendChild(input_button_select);
	div_file.appendChild(span2);
	div_file.appendChild(input_button_delete);
	
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
	
	input_button_delete.addEventListener('click', function() {
		li.remove();
	});
}



// 이미지 업로드 버튼
var fn_btnImgUploadOnClicked = function(imgFileIndex) {
	var url = '/cmm/fms/EgovFileUploadPopup.do?imgFile=true';
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

// 이미지 불러오기
var fn_getImgFile = function(atchFileId) {
	imgFileList = [];
	// 호출할 url, 서버에서 받아온 이미지 데이터 담을 곳, callback함수
	gfn_commonLoadDataRequest('/cmm/fms/getImgFileList.do?atchFileId='+atchFileId, imgFileList, fn_setImg);
}

// 이미지 세팅
var fn_setImg = function() {
	document.querySelector("#product_img_"+findIdIndex).src = '';
	document.querySelector("#product_img_"+findIdIndex).src = imgFileList[0].fileStreCours + imgFileList[0].streFileNm;
	document.querySelector("#atch_file_id_"+findIdIndex).value = imgFileList[0].atchFileId;
	
	// 초기화
	findIdIndex = 0;
}

// 원산지 간편등록 체크박스 전체 on/off
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
	var atchFileList 		= document.querySelectorAll('.prd_img_file input[type=hidden]');
	var optionNameList 		= document.querySelectorAll('.div-option-name input[name=product_option_name]');
	var optionCodeList 		= document.querySelectorAll('.div-option-name input[name=product_option_code]');
	var optionPriceList 	= document.querySelectorAll('.div-option-price input[name=product_option_price]');
	
	var filteredProductPrice  = gfn_filterInt(productPrice.value);
	var filteredDiscountPrice = gfn_filterInt(productDiscountPrice.value);
	var filteredDeliverypay   = gfn_filterInt(productDeliverypay.value);
	
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
	
	for(var i in optionPriceList) {
		var nowPrice = optionPriceList[i].value=="0"?"":optionPriceList[i].value;
		if(nowPrice && !optionNameList[i].value) {
			alert('옵션명을 입력하세요.');
			return;
		}
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
	var optionStr = '';
	
	checkedCategoryList.forEach(function(el) {
		categoryStr += el.id.replace('category_','') + ',';
	})
	atchFileList.forEach(function(el) {
		if(el.value) atchFileStr += el.value + ',';
	})
	
	if(optionNameList[0].value) {
		optionStr = '[';
		for(var i in optionNameList) {
			if(optionNameList[i].value) {
				optionStr += '{\"optionName\": \"' +  optionNameList[i].value 
						+ '\", \"optionCode\": \"' + optionCodeList[i].value 
						+ '\", \"optionPrice\": \"' + optionPriceList[i].value 
						+ '\"},';	
			} 
		}
		optionStr = optionStr.slice(0, -1); 
		optionStr += ']';	
	}
	
	var updateFormData = [{
		productId : productId.value,
		productCode : productCode.value,
		
		checkedCategoryList : categoryStr,
		atchFileList : atchFileStr,
		optionList : optionStr,
		
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
var fn_checkedCategoryList = function(checkedCategoryList) {
	
	if(checkedCategoryList) fn_setCheckedCategoryList.list = checkedCategoryList;
	
	// 카테고리 목록이 동적으로 생성되고, 서버에서 받아온 값이 있으면
	if(fn_setCheckedCategoryList.list && document.querySelectorAll('div#category_areas input[name=category_names]')) {
		// 불러온 카테고리 체크
		fn_setCheckedCategoryList();
	}
}

var fn_setCheckedCategoryList = function() {
	for(var checkedCategory of fn_setCheckedCategoryList.list) {
		var categoryId = document.querySelector('#category_'+checkedCategory.categoryId);
		categoryId.checked = true;
	}
}

// 불러온 이미지 세팅
var fn_setImgFileSrc = function(imgFileList) {
	var setImgIndex = 1;
	for(var imgFile of imgFileList) {
		// 이미지가 더 있을 경우 이미지 리스트 동적 생성
		if(setImgIndex!=1) {fn_addImgList(setImgIndex);}
		document.querySelector("#product_img_"+setImgIndex).src = imgFile.fileCoursNm;
		document.querySelector("#atch_file_id_"+setImgIndex).value = imgFile.atchFileId;
		setImgIndex++;
	}
}

var fn_setOptionList = function(optionList) {
	var setOptionIndex = 1;
	for(var option of optionList) {
		if(setOptionIndex!=1) {fn_addOptionList();}
		
		var select_productOption = document.querySelector("#product_option_select_"+setOptionIndex);
		
		document.querySelector('#product_option_name_'+setOptionIndex).value = option.optionName;
		document.querySelector('#product_option_price_'+setOptionIndex).value = option.optionPrice;
		
		for(var i = 0; i < select_productOption.length; i++) {
			if(select_productOption.options[i].dataset.optionCode == option.optionCode) {
				select_productOption.options[i].selected = true
				document.querySelector('#product_option_code_'+setOptionIndex).value = option.optionCode;
				document.querySelector('#product_option_name_'+setOptionIndex).readOnly = true;
				document.querySelector('#product_option_price_'+setOptionIndex).readOnly = true;
				break;
			}
		}
		
		setOptionIndex++;
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
		// url, 콜백 function
		fn_loadDataRequest('/cmm/main/management/getProductDetailToProductCategory.do?productCode='+data.productCode, fn_checkedCategoryList);
		fn_loadDataRequest('/cmm/main/management/getProductDetailToAtchFile.do?productCode='+data.productCode, fn_setImgFileSrc);
		fn_loadDataRequest('/cmm/main/management/getProductDetailToProductOption.do?productCode='+data.productCode, fn_setOptionList);
	}
	
}

// setup the grid after the page has finished loading
document.addEventListener('DOMContentLoaded',
	function() {
		// 타입 불러오기
		gfn_commonLoadDataRequest('/cmm/main/management/getProductTypeList.do', productTypeList, fn_setProductTypeMap);
		// 옵션 상품 불러오기
		gfn_commonLoadDataRequest('/cmm/main/management/getProductOptionList.do', productOptionList, fn_setProductOptionCallback);
		
		if(productId.value != 'null') {
			fn_loadDataRequest('/cmm/main/management/getProductDetail.do?productId='+productId.value, fn_setDataForm);
		} else {
			productId.value = ''
		}
	}
);