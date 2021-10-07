package foodmall.client.order.web;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import admin.user.com.service.MberManageService;
import admin.user.com.service.MberManageVO;
import admin.user.com.service.UserDefaultVO;
import admin.user.com.service.UserManageVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import foodmall.client.order.service.CartListVO;
import foodmall.client.order.service.ClientOrderService;
import foodmall.client.order.service.OrderDetailVO;
import foodmall.client.order.service.OrderVO;

@Controller
public class ClientOrderController {

	@Resource(name = "clientOrderService")
    private ClientOrderService clientOrderService;
	
	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	/** mberManageService */
	@Resource(name = "mberManageService")
	private MberManageService mberManageService;

	// 장바구니 담기
		@ResponseBody
		@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
		public int addCart(CartListVO cart, HttpSession session) throws Exception {
			
			int result = 0;
			
			MberManageVO member = (MberManageVO)session.getAttribute("member");
			
			if(member != null) {
				cart.setEmailId(member.getEmailId());
				clientOrderService.addCart(cart);
				result = 1;
			}
			
			return result;
		}
	//장바구니 목록
	@RequestMapping("/order/ClientCartView.do")
	public String CartView(HttpSession session, @ModelAttribute("orderVO") OrderVO orderVO, @ModelAttribute("cartListVO") CartListVO cartListVO, Model model)
			throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user != null) {
	    	model.addAttribute("sessionUniqId", user.getEmailId());	    	
	    }
		cartListVO.setEmailId(user.getEmailId());
		Map<String, Object> map = clientOrderService.cartList(cartListVO);
		
		String proPrice = cartListVO.getProPrice();
		if(proPrice == null || proPrice.trim().equals("")){
			proPrice = "0";
		}
				
		  model.addAttribute("cartList", map.get("cartList"));
			return "food/shopingCart";	
	}
	//장바구니 수정
	@RequestMapping("/order/cartUpdate.do")
	public String CartUpdate(@ModelAttribute("cartListVO") CartListVO cartListVO, Model model,  HttpServletRequest request)
			throws Exception {
		System.out.println(cartListVO.getCartStock());
		System.out.println(cartListVO.getCartSeq());
		
		cartListVO.setCartSeq(request.getParameter("cartSeq"));
		cartListVO.setCartStock(request.getParameter("cartChange"));
		String cartSeq = cartListVO.getCartSeq();
		if(cartSeq == null || cartSeq.trim().equals("")){
			cartSeq = "0";
		}
		clientOrderService.cartUpdate(cartListVO);
		System.out.println(cartListVO.getCartStock());
		System.out.println(cartListVO.getCartSeq());
		
		
				
		// model.addAttribute("cartQyt", cartQyt);
			return "food/shopingCart";	
	}
	
	@RequestMapping("/order/ChckOut.do")
	public String CheckOutView(HttpSession session, @ModelAttribute("mberManageVO") MberManageVO mberManageVO, @ModelAttribute("orderVO") OrderVO orderVO, @ModelAttribute("cartListVO") CartListVO cartListVO, Model model)
			throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user != null) {
	    	model.addAttribute("sessionUniqId", user.getEmailId());	    	
	    }
		//회원 기본 정보 불러오기
		mberManageVO.setEmailId(user.getEmailId());
		MberManageVO memberInfo = mberManageService.selectMberInfo(mberManageVO);
		model.addAttribute("memberInfo", memberInfo);
		
		//주문할 상품 정보 불러오기
		orderVO.setEmailId(user.getEmailId());
		List<CartListVO> orderList = new ArrayList<>();
		
		
		
		  model.addAttribute("orderList", orderList);
		  return "food/checkout";  
	
	}
	
	/*// 장바구니 삭제
		@ResponseBody
		@RequestMapping(value = "/shop/deleteCart", method = RequestMethod.POST)
		public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartListVO cart) throws Exception {
			//logger.info("delete cart");
			
			LoginVO member = (LoginVO)session.getAttribute("member");
			String emailId = member.getEmailId();
			
			//String result = 0;
			//String cartSeq = 0;		
			
			// 로그인 여부 구분
			if(member != null) {
				cart.setEmailId(emailId);
				
				for(String i : chArr) {  // 에이젝스에서 받은 chArr의 갯수만큼 반복
					//String cartSeq = toString(i);  // i번째 데이터를 cartNum에 저장
					//cart.setCartSeq(cartSeq);
					clientOrderService.deleteCart(cart);
				}			
				//result = 1;
			}		
			//return result;		
		}*/
	//주문
	@RequestMapping("/order/placeOrder.do")
	 public String order(HttpSession session, @ModelAttribute("orderVO") OrderVO orderVO, OrderDetailVO orderDetailVO,
			 @ModelAttribute("cartListVO") CartListVO cartListVO, Model model) throws Exception {
	 // Logger.info("order");
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user != null) {
	    	model.addAttribute("sessionUniqId", user.getEmailId());	    	
	    }

	  
     /*//주문번호(orderId) 생성을 위한 로직
	  Calendar cal = Calendar.getInstance();
	  int year = cal.get(Calendar.YEAR);
	  String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	  String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
	  String subNum = "";
	  
	  for(int i = 1; i <= 6; i ++) {
	   subNum += (int)(Math.random() * 10);
	  }
	  
	  String orderSeq = ymd + "_" + subNum; //ex) 20200508_373063
	  orderVO.setOrderSeq(orderSeq);*/
	  orderVO.setEmailId(user.getEmailId());
	  
	  clientOrderService.orderInsert(orderVO); 
	  clientOrderService.orderInfoDetails(orderDetailVO); //주문 상세 테이블 insert
	  //clientOrderService.cartAllDelete(user.getEmailId());
	 /* int cartStock = 0;
	  for(String i : chArr){
		  cartStock = Integer.parseInt(i);
		  System.out.println("cart -> CHK orderList : "+cartStock);
		  System.out.println("cart -> orderId orderList : "+orderVO.getOrderSeq());
		  clientOrderService.orderInfoDetails(orderVO.getOrderSeq(),cartStock);
		  clientOrderService.cartDelete(cartListVO.getCartSeq()); //체크되어 들어온 cart번호로 cart table delete
	  }
	  */
	 // model.addAttribute("orderList", orderList);
	  return "food/checkout";  
	 }
	
	/*// 주문 목록
		@RequestMapping(value = "/orderList", method = RequestMethod.GET)
		public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
			logger.info("get order list");
			
			MemberVO member = (MemberVO)session.getAttribute("member");
			String userId = member.getUserId();
			
			order.setUserId(userId);
			
			List<OrderVO> orderList = service.orderList(order);
			
			model.addAttribute("orderList", orderList);
		}
		 
		// 주문 상세 목록
		@RequestMapping(value = "/orderView", method = RequestMethod.GET)
		public void getOrderList(HttpSession session,
								@RequestParam("n") String orderId,
								OrderVO order, Model model) throws Exception {
			logger.info("get order view");
			
			MemberVO member = (MemberVO)session.getAttribute("member");
			String userId = member.getUserId();
			
			order.setUserId(userId);
			order.setOrderId(orderId);
			
			List<OrderListVO> orderView = service.orderView(order);
			
			model.addAttribute("orderView", orderView);
		}
		*/
		
}
