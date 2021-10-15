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