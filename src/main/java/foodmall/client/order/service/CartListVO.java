package foodmall.client.order.service;

public class CartListVO {
	
	private String cartSeq;
	private String emailId;
	private String proSeq;
	private String cartStock;
	private String addDated;
	private String proName;
	private String proPrice;
	private String proImg;
	public String getCartSeq() {
		return cartSeq;
	}
	public void setCartSeq(String cartSeq) {
		this.cartSeq = cartSeq;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getProSeq() {
		return proSeq;
	}
	public void setProSeq(String proSeq) {
		this.proSeq = proSeq;
	}
	public String getCartStock() {
		return cartStock;
	}
	public void setCartStock(String cartStock) {
		this.cartStock = cartStock;
	}
	public String getAddDated() {
		return addDated;
	}
	public void setAddDated(String addDated) {
		this.addDated = addDated;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProPrice() {
		return proPrice;
	}
	public void setProPrice(String proPrice) {
		this.proPrice = proPrice;
	}
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}

}
