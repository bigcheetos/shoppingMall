/*
const PRODUCT_MATERIAL_LIST 	= [];	// 상품재료
const PRODUCT_SIZE_LIST 		= []; 	// 상품사이즈
const PRODUCT_USE_LIST 		  	= [];	// 상품용도
const PRODUCT_INTRODUCTION_LIST = [];	// 상품소개

const PRODUCT_DELIVERYGUIDE = '';	// 배송안내
const PRODUCT_CANCELGUIDE 	= '';	// 주문취소안내
const PRODUCT_NOTICE 		= '';	// 구매시유의사항

const PRODUCT_INTRODUCTION_BASKET = [];	// 꽃바구니
const PRODUCT_INTRODUCTION_BOUQUET = []; // 꽃다발
const PRODUCT_INTRODUCTION_HWREATH = []; // 축하화환
const PRODUCT_INTRODUCTION_DWREATH = []; // 근조화환
const PRODUCT_INTRODUCTION_FOLIAGE = []; // 관엽/화분
const PRODUCT_INTRODUCTION_EORCHID = []; // 동양란
const PRODUCT_INTRODUCTION_WORCHID = []; // 서양란
const PRODUCT_INTRODUCTION_BOX = []; // 꽃상자
*/

const PRODUCT_MATERIAL_LIST 	= 
	['거베라'
	,'계절꽃'
	,'고급도자기분'
	,'고급리본'
	,'고급바구니'
	,'고급포장재'
	,'곱슬버들'
	,'공작소국'
	,'과꽃'
	,'과일'
	,'글라디올라스'
	,'금어초'
	,'나리'
	,'난받침'
	,'난잎'
	,'노란장미'
	,'노무라'
	,'뉴카리'
	,'다알리아'
	,'대국화'
	,'도시루'
	,'리시얀사스'
	,'리아트리스'
	,'마르코폴로'
	,'마리안느'
	,'명자란'
	,'몬스테라'
	,'미니장미'
	,'미디오'
	,'미색장미'
	,'미스티블루'
	,'백합'
	,'베어그라스'
	,'보키지장미'
	,'불로초'
	,'붉은장미'
	,'석죽'
	,'소국'
	,'소철잎'
	,'수선화'
	,'스타게이져'
	,'스타티스'
	,'스토크'
	,'스프링겔리'
	,'쏠리스트'
	,'아스파라것'
	,'아이리스'
	,'안개'
	,'양란'
	,'연보라장미'
	,'와네끼'
	,'와인'
	,'집시꽃'
	,'천일홍'
	,'청지목'
	,'카네이션'
	,'카네이션(스프레이)'
	,'카라'
	,'칼라아이비'
	,'케'
	,'튜울립'
	,'패랭이'
	,'퍼퓨륨'
	,'편백'
	,'핑크장미'
	,'해바라기'
	,'후리지아'
	,'흰장미'];
const PRODUCT_SIZE_LIST 		= 
	['가로= cm, 세로= cm'
	,'가로= m, 세로= m'
	,'폭= cm, 폭= cm'
	,'폭= m, 폭= m']; 	
const PRODUCT_USE_LIST 		  	= 
	['각종기념일'
	,'개업식'
	,'결혼'
	,'결혼기념일'
	,'결혼식부케'
	,'관장식'
	,'기념일'
	,'돌잔치'
	,'로즈데이'
	,'발렌타인데이'
	,'백일'
	,'상가'
	,'생일'
	,'성년의날'
	,'수상'
	,'스승의날'
	,'승진'
	,'신혼여행용'
	,'실내장식'
	,'애도'
	,'야외촬영부케'
	,'약혼'
	,'어린이날'
	,'어버이날'
	,'연주회'
	,'영전'
	,'위령'
	,'이전'
	,'전시회'
	,'조문'
	,'조의'
	,'집들이'
	,'창립'
	,'추도'
	,'추모'
	,'축하용품'
	,'출산'
	,'취임'
	,'크리스마스'
	,'행사장'
	,'화이트데이'
	,'회갑연'];
const PRODUCT_INTRODUCTION_LIST    = 
	['꽃바구니'
	,'꽃다발'
	,'근조화환'
	,'축하화환'
	,'관엽/화분'
	,'동양란'
	,'서양란'
	,'꽃박스'];

const PRODUCT_DELIVERYGUIDE = "<strong><span style='FONT-SIZE:11pt'>[배송이 가능한 시간 ]</span></strong><br>"
+"<strong>평   일</strong> : 오전 8:30~오후 7:00<br>"
+"<strong>토요일</strong> : 오전 8:30~오후 6:00<br>"
+"<strong>일요일</strong> : 예약주문만 가능합니다.<br>"
+"<br>"
+"<strong><span style='FONT-SIZE:11pt'>[배송지역]</span></strong><br>"
+"- 국내는 <strong>전 지역 3시간 안에 배송 가능</strong>합니다.<br>"
+"- 외딴섬 지역은 상담후 배송 <br>"
+"- 해외는 3~7일전 접수<br>"
+"<br>"
+"<strong><span style='FONT-SIZE:11pt'>[특정 기념일 배송 유의사항]</span></strong><br>"
+"- <strong><font color='#ff0000'>발렌타인데이, 화이트데이, 어버이날, 스승의날</font></strong> 등 <strong><font color='#ff0000'>특정 기념일</font></strong>에는 주문 폭주로 인해<br>"
+	"상품 제작 및 배송에 어려움이 있으므로 고객님이 원하시는 시간을 정확히 맞추기가 어렵습니다.<br>"
+"	특정 기념일의 상품 배송은 사전 예약 고객에 한하여 이루어지며 배송완료 후 이루어지는 <br>"
+"	해피콜 서비스가 지연될 수 있습니다.<br>";
const PRODUCT_CANCELGUIDE 	= "주문 취소를 원하실 경우에는 전화 ☎ ##-####-####으로 전화주시면 바로 처리됩니다.<br>"
	+"단, <font color='#ff0000'>희망배송시간 3시간전까지 주문 취소할수 있습니다.</font><br>"
	+"교환 및 환불은 24시간 이내에 100% 가능합니다.<br>"
	+"(단, 분명한 제품에 대한 하자발생시에 가능하며,<br>"
	+"환불은 요청한 일로부터 48시간 안에 주문자 계좌로 입금처리 해드립니다.)<br>";
const PRODUCT_NOTICE 		= "<strong><font color='#ff0000'>★ 실제상품과 사진은 계절 및 지역에 따라 다소 차이가 있을 수 있습니다. ★ </font></strong><br>"
+"- 전국 2~3시간 이내에 배송이 가능합니다.<br>"
+"<br>"
+"   (※ 단 도서지역은 당일 이내 배송가능 )<br>"
+"<br>"
+"<strong><span style='FONT-SIZE:11pt'>[상품 유의사항]</span></strong><br>"
+"- 계절에 따라 상품 구성 소재가 달라지거나 상품의 가격에 차이가 있을 수 있습니다.<br>"
+"- 상품에 따라 실제 배송되는 상품과 상품이미지에 차이가 있을 수 있습니다.<br>";	

// 상품소개

const PRODUCT_INTRODUCTION_BASKET = 
	['소중한 사람에게 당신의 마음을 표현하세요'
	,'편안한 매력을 가진 수국 꽃바구니입니다. 분홍색 수국의 꽃말은 소녀의 꿈이라 합니다.'];

const PRODUCT_INTRODUCTION_BOUQUET = [];
const PRODUCT_INTRODUCTION_HWREATH = [];
const PRODUCT_INTRODUCTION_DWREATH = [];
const PRODUCT_INTRODUCTION_FOLIAGE = [];
const PRODUCT_INTRODUCTION_EORCHID = [];
const PRODUCT_INTRODUCTION_WORCHID = [];
const PRODUCT_INTRODUCTION_BOX = [];

var gfn_getMaterialList = function () {
	return PRODUCT_MATERIAL_LIST;
}

var gfn_getSizeList = function () {
	return PRODUCT_SIZE_LIST;
}

var gfn_getUseList = function () {
	return PRODUCT_USE_LIST;
}

var gfn_getIntroductionList = function () {
	return PRODUCT_INTRODUCTION_LIST;
}

var gfn_getDeliveryguide = function() {
	return PRODUCT_DELIVERYGUIDE;
}

var gfn_getCancelguide = function() {
	return PRODUCT_CANCELGUIDE;
}

var gfn_getNotice = function() {
	return PRODUCT_NOTICE;
}

var gfn_getIntroductionBasket = function() {
	return PRODUCT_INTRODUCTION_BASKET;
}

var gfn_getIntroductionBouquet = function() {
	return PRODUCT_INTRODUCTION_BOUQUET;
}

var gfn_getIntroductionHwreath = function() {
	return PRODUCT_INTRODUCTION_HWREATH;
}

var gfn_getIntroductionDwreath = function() {
	return PRODUCT_INTRODUCTION_DWREATH;
}

var gfn_getIntroductionFoliage = function() {
	return PRODUCT_INTRODUCTION_FOLIAGE;
}

var gfn_getIntroductionEorchid = function() {
	return PRODUCT_INTRODUCTION_EORCHID;
}

var gfn_getIntroductionWorchid = function() {
	return PRODUCT_INTRODUCTION_WORCHID;
}

var gfn_getIntroductionBox = function() {
	return PRODUCT_INTRODUCTION_BOX;
}