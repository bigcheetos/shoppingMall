package egovframework.let.cop.management.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 제품에 대한 데이터 처리 모델 클래스
 * @author 개발팀 김진영
 * @since 2021.09.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.09.01  김진영          최초 생성
 *
 *  </pre>
 */

public class ProductVO implements Serializable {

	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = 6828071680939789548L;
	
	private String productId;
	private String categoryId;
	private String typeId;
	private String stockId;
	private String productName;
	private String productSummary;
	private String productPrice;
	private String productDiscountPrice;
	private String productOrigin;
	private String productDeliverypay;
	private String productStatus;
	private String productRdcnt;
	private String productBestcnt;
	private String productRegid;
	private String productUpdid;
	private String productRegdate;
	private String productUpddate;
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getStockId() {
		return stockId;
	}
	public void setStockId(String stockId) {
		this.stockId = stockId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductSummary() {
		return productSummary;
	}
	public void setProductSummary(String productSummary) {
		this.productSummary = productSummary;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductDiscountPrice() {
		return productDiscountPrice;
	}
	public void setProductDiscountPrice(String productDiscountPrice) {
		this.productDiscountPrice = productDiscountPrice;
	}
	public String getProductOrigin() {
		return productOrigin;
	}
	public void setProductOrigin(String productOrigin) {
		this.productOrigin = productOrigin;
	}
	public String getProductDeliverypay() {
		return productDeliverypay;
	}
	public void setProductDeliverypay(String productDeliverypay) {
		this.productDeliverypay = productDeliverypay;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	public String getProductRdcnt() {
		return productRdcnt;
	}
	public void setProductRdcnt(String productRdcnt) {
		this.productRdcnt = productRdcnt;
	}
	public String getProductBestcnt() {
		return productBestcnt;
	}
	public void setProductBestcnt(String productBestcnt) {
		this.productBestcnt = productBestcnt;
	}
	public String getProductRegid() {
		return productRegid;
	}
	public void setProductRegid(String productRegid) {
		this.productRegid = productRegid;
	}
	public String getProductUpdid() {
		return productUpdid;
	}
	public void setProductUpdid(String productUpdid) {
		this.productUpdid = productUpdid;
	}
	public String getProductRegdate() {
		return productRegdate;
	}
	public void setProductRegdate(String productRegdate) {
		this.productRegdate = productRegdate;
	}
	public String getProductUpddate() {
		return productUpddate;
	}
	public void setProductUpddate(String productUpddate) {
		this.productUpddate = productUpddate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
