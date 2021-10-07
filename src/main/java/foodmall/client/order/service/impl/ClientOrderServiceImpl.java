package foodmall.client.order.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import admin.com.exception.AlreadyExistingEmailException;
import admin.user.com.service.MberManageVO;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import foodmall.client.order.service.CartListVO;
import foodmall.client.order.service.ClientOrderService;
import foodmall.client.order.service.OrderDetailVO;
import foodmall.client.order.service.OrderVO;

@Service("clientOrderService")
public class ClientOrderServiceImpl extends EgovAbstractServiceImpl implements ClientOrderService{
	
	@Resource(name="clientOrderDAO")
	private ClientOrderDAO clientOrderDAO;

	@Override
	public void orderInsert(OrderVO orderVO) throws Exception{
		clientOrderDAO.insertOrder(orderVO);
		
	}

	@Override
	public void orderInfoDetails(OrderDetailVO orderDetailVO) throws Exception {
		clientOrderDAO.orderInfoDetails(orderDetailVO);
		
	}

	@Override
	public void addCart(CartListVO cartlistVO) throws Exception {
		clientOrderDAO.addCart(cartlistVO);		
	}

	@Override
	public Map<String, Object> cartList(CartListVO cartListVO) throws Exception {
		
		List<?> list = clientOrderDAO.cartList(cartListVO);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("cartList", list);
		return map;
	}
	
	@Override
	public void cartUpdate(CartListVO cartListVO) throws Exception {
		  clientOrderDAO.cartUpdate(cartListVO);
	}

	@Override
	public void deleteCart(CartListVO cartlistVO) throws Exception {
		clientOrderDAO.deleteCart(cartlistVO);	
		
	}

	@Override
	public void cartAllDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}
/*
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}*/
	 
	
}
