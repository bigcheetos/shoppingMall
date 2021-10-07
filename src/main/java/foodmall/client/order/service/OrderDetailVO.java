package foodmall.client.order.service;

public class OrderDetailVO {

	private String orderDetailSeq;
	private String orderSeq;
	private String productSeq;
	private String CartStock;
	public String getOrderDetailSeq() {
		return orderDetailSeq;
	}
	public void setOrderDetailSeq(String orderDetailSeq) {
		this.orderDetailSeq = orderDetailSeq;
	}
	public String getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(String orderSeq) {
		this.orderSeq = orderSeq;
	}
	public String getProductSeq() {
		return productSeq;
	}
	public void setProductSeq(String productSeq) {
		this.productSeq = productSeq;
	}
	public String getCartStock() {
		return CartStock;
	}
	public void setCartStock(String cartStock) {
		CartStock = cartStock;
	}
	
	
}
