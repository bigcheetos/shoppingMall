const productDiscountPrice = document.querySelector('#productDiscountPrice');	// 할인판매가격, 실제판매가격
const productAmount = document.querySelector('#productAmount');		// 구매수량
const productPayment = document.querySelector('#productPayment');	// 총 구매,결제금액
const mainImg = document.querySelector('.main_img img');
const subImgList = document.querySelectorAll('.sub_img img');

const numRegex = /[^0-9]/g;	// 숫자

// 구매수량에 따른 총 결제금액 변동 이벤트
var fn_setProductPayment = function() {
	
	var productAmountValue = gfn_filterInt(productAmount.value);
	
	if(!gfn_filterInt(productAmountValue)) {
		productAmountValue = 1;
		productAmount.value = productAmountValue;
	} else {
		if(productAmountValue < 0) {
			productAmountValue = 1;
			productAmount.value = productAmountValue;	
		} else if(productAmountValue > 999) {
			productAmountValue = 999;
			productAmount.value = productAmountValue;
		}
	}
	
	var optionResultList = document.querySelectorAll('.choose_result strong');
	var optionTotalPaymentAmount = 0;
	
	optionResultList.forEach(el => {
	    optionTotalPaymentAmount += +el.innerText.replace(numRegex,'');
	});
	
	var paymentAmount = +productAmountValue * +productDiscountPrice.value.replace(numRegex,'') + optionTotalPaymentAmount;
	productPayment.textContent = paymentAmount.toLocaleString();
}

// 마우스오버에 따른 메인이미지 변동 이벤트
var fn_setMainImg = function(subImg) {
	mainImg.src = subImg.src;
}

// 옵션 추가 버튼 클릭시 이벤트
var fn_addOption = function() {
	var selectedOptionList = document.querySelector('.selected-option-list');
	var optionData = productOption.options[productOption.selectedIndex].dataset;
	
	// 같은 옵션이 이미 리스트에 있는 지 체크
	var existedOptionList = document.querySelectorAll('.choose_result strong')
	if(existedOptionList.length > 0) {
		for(var existedOption of existedOptionList) {
			if(existedOption.dataset.optionCode == optionData.optionCode) {
				alert('이미 존재하는 옵션입니다.');
				return;
			}
		}
	}
	
	var li_selected_option = document.createElement('li');
	
	var div_choose_option = document.createElement('div');
	var div_choose_amount = document.createElement('div');
	var div_choose_result = document.createElement('div');
	
	var p_choose_option = document.createElement('p');
	var span_choose_option = document.createElement('span');
	
	var input_choose_amount = document.createElement('input');
	
	var strong_choose_result = document.createElement('strong');
	var btn_choose_result = document.createElement('button');
	var span_choose_result = document.createElement('span');
	
	//li_selected_option.id = 'selected_option_' + productOption.selectedIndex;
	
	div_choose_option.className = 'choose_option';
	p_choose_option.className = 'tit';
	span_choose_option.className = 'txt_option';
	span_choose_option.innerText = '옵션 상품 ' + (1*productOption.selectedIndex+1) + '. ' + optionData.optionName;
	
	div_choose_amount.className = 'choose_amount';
	input_choose_amount.type = 'number';
	input_choose_amount.min = 1;
	input_choose_amount.max = 999;
	input_choose_amount.value = 1;
	
	div_choose_result.className = 'choose_result'
	strong_choose_result.dataset.optionName = optionData.optionName;
	strong_choose_result.dataset.optionCode = optionData.optionCode;
	strong_choose_result.dataset.optionPrice = optionData.optionPrice;
	strong_choose_result.innerText = (1*optionData.optionPrice).toLocaleString() + '원';
	
	span_choose_result.innerText = 'X';
	
	// 옵션상품 수량 변화 이벤트
	input_choose_amount.addEventListener('change', function(event){
		// 숫자체크
		if(!gfn_filterInt(input_choose_amount.value)) {
			input_choose_amount.value = 1; 
		} else {
			if(gfn_filterInt(input_choose_amount.value) < 0) {
				input_choose_amount.value = 1;	
			} else if(input_choose_amount.value > 999) {
				input_choose_amount.value = 999;
			}
		}
		strong_choose_result.innerText = (input_choose_amount.value * 1*optionData.optionPrice).toLocaleString() + '원';
		
		// 총 상품금액
		fn_setProductPayment();
	});
	
	// 옵션상품 제거 이벤트
	btn_choose_result.addEventListener('click', function(event) {
		li_selected_option.remove();
		
		// 총 상품금액
		fn_setProductPayment();
	});
	
	div_choose_option.appendChild(p_choose_option);
	p_choose_option.appendChild(span_choose_option);
	
	div_choose_amount.appendChild(input_choose_amount);
	
	div_choose_result.appendChild(strong_choose_result);
	btn_choose_result.appendChild(span_choose_result);
	div_choose_result.appendChild(btn_choose_result);
	
	li_selected_option.appendChild(div_choose_option);
	li_selected_option.appendChild(div_choose_amount);
	li_selected_option.appendChild(div_choose_result);
	
	selectedOptionList.insertBefore(li_selected_option, selectedOptionList.firstChild);
	
	fn_setProductPayment();
}

// after the page has finished loading
document.addEventListener('DOMContentLoaded',
	function() {
		productAmount.addEventListener('change', function(event) {
			fn_setProductPayment();
		});
		
		subImgList.forEach(function(subImg) {
			subImg.addEventListener('mouseenter', function(event) {
				fn_setMainImg(this);
			});
		});
	}
);