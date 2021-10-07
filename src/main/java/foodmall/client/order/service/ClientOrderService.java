package foodmall.client.order.service;

import java.util.List;
import java.util.Map;

public interface ClientOrderService {
	
	public void orderInsert(OrderVO orderVO) throws Exception;
	public void orderInfoDetails(OrderDetailVO orderDetailVO)throws Exception;
	public void addCart(CartListVO cartlistVO) throws Exception;
	public Map<String, Object>  cartList(CartListVO cartlistVO) throws Exception;
	public void deleteCart(CartListVO cartlistVO) throws Exception;
	// 주문 정보
	//public void orderInfo(OrderVO order) throws Exception;
		
	// 주문 상세 정보
	//public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

	// 카트 비우기
	public void cartAllDelete(String emailId) throws Exception;
	public void cartUpdate(CartListVO cartListVO) throws Exception;
	
	// 주문 목록
	//public List<OrderVO> orderList(OrderVO order) throws Exception;

	// 특정 주문 목록
	//public List<OrderListVO> orderView(OrderVO order) throws Exception;
}
