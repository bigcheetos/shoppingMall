package foodmall.client.order.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import foodmall.client.order.service.CartListVO;
import foodmall.client.order.service.OrderDetailVO;
import foodmall.client.order.service.OrderVO;

@Repository("clientOrderDAO")
public class ClientOrderDAO extends EgovComAbstractDAO{
	
	  public void insertOrder(OrderVO orderVO) throws Exception{
	        insert("OrderDAO.orderInsert", orderVO);    	
	    }
	  
	  public void orderInfoDetails(OrderDetailVO orderDetailVO) throws Exception{
		  	insert("OrderDAO.orderDetailInsert",orderDetailVO );
	  }
	  public void addCart(CartListVO cartListVO)throws Exception{
		  	insert("ProductDAO.addCart");
	  }
	// 카트 리스트
	public List<?> cartList(CartListVO cartListVO) throws Exception {
		return selectList("ProductDAO.cartList", cartListVO);
	}

		// 카트 삭제
		public void deleteCart(CartListVO cartListVO) throws Exception {
			delete("ProductDAO.deleteCart", cartListVO);
		}

		public void cartUpdate(CartListVO cartListVO) {
			update("ProductDAO.updateCart", cartListVO);
			
		}
		
		/*// 주문 정보
		@Override
		public void orderInfo(OrderVO order) throws Exception {
			sql.insert(namespace + ".orderInfo", order);
		}
		
		// 주문 상세 정보
		@Override
		public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
			sql.insert(namespace + ".orderInfo_Details", orderDetail);
		}

		// 카트 비우기
		@Override
		public void cartAllDelete(String userId) throws Exception {
			sql.delete(namespace + ".cartAllDelete", userId);
		}

		// 주문 목록
		@Override
		public List<OrderVO> orderList(OrderVO order) throws Exception {
			return sql.selectList(namespace + ".orderList", order);
		}

		// 특정 주문 목록
		@Override
		public List<OrderListVO> orderView(OrderVO order) throws Exception {
			return sql.selectList(namespace + ".orderView", order);
		}*/

}
