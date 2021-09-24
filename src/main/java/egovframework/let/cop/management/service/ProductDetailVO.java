package egovframework.let.cop.management.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 제품 상세내용에 대한 데이터 처리 모델 클래스
 * @author 개발팀 김진영
 * @since 2021.09.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.09.10  김진영          최초 생성
 *
 *  </pre>
 */
public class ProductDetailVO implements Serializable{

	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = -6576111090857839864L;
	
	private String productId;
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
	
	private String productCode;
	private String productMaterial;
	private String productSize;
	private String productIntroduction;
	private String productUse;
	private String productDeliveryguide;
	private String productCancelguide;
	private String productNotice;
	private String detailStatus;
	private String detailRegid;
	private String detailUpdid;
	private String detailRegdate;
	private String detailUpddate;
	

	public ProductVO getProductVO() {
		
		ProductVO productVO = new ProductVO();
		
		productVO.setProductId(productId);
		productVO.setStockId(stockId);
		productVO.setProductName(productName);
		productVO.setProductSummary(productSummary);
		productVO.setProductPrice(productPrice);
		productVO.setProductDiscountPrice(productDiscountPrice);
		productVO.setProductOrigin(productOrigin);
		productVO.setProductDeliverypay(productDeliverypay);
		productVO.setProductRdcnt(productRdcnt);
		productVO.setProductBestcnt(productBestcnt);
		
		return productVO;
	}
	
	public void setProductVO(ProductVO productVO) {
		if(productVO != null) {
			this.productId = productVO.getProductId();
			this.stockId = productVO.getStockId();
			this.productName = productVO.getProductName();
			this.productSummary = productVO.getProductSummary();
			this.productPrice = productVO.getProductPrice();
			this.productDiscountPrice = productVO.getProductDiscountPrice();
			this.productOrigin = productVO.getProductOrigin();
			this.productDeliverypay = productVO.getProductDeliverypay();
			this.productRdcnt = productVO.getProductRdcnt();
			this.productBestcnt = productVO.getProductBestcnt();
		}
	}
	
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
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

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductMaterial() {
		return productMaterial;
	}

	public void setProductMaterial(String productMaterial) {
		this.productMaterial = productMaterial;
	}

	public String getProductSize() {
		return productSize;
	}

	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

	public String getProductIntroduction() {
		return productIntroduction;
	}

	public void setProductIntroduction(String productIntroduction) {
		this.productIntroduction = productIntroduction;
	}

	public String getProductUse() {
		return productUse;
	}

	public void setProductUse(String productUse) {
		this.productUse = productUse;
	}

	public String getProductDeliveryguide() {
		return productDeliveryguide;
	}

	public void setProductDeliveryguide(String productDeliveryguide) {
		this.productDeliveryguide = productDeliveryguide;
	}

	public String getProductCancelguide() {
		return productCancelguide;
	}

	public void setProductCancelguide(String productCancelguide) {
		this.productCancelguide = productCancelguide;
	}

	public String getProductNotice() {
		return productNotice;
	}

	public void setProductNotice(String productNotice) {
		this.productNotice = productNotice;
	}

	public String getDetailStatus() {
		return detailStatus;
	}

	public void setDetailStatus(String detailStatus) {
		this.detailStatus = detailStatus;
	}

	public String getDetailRegid() {
		return detailRegid;
	}

	public void setDetailRegid(String detailRegid) {
		this.detailRegid = detailRegid;
	}

	public String getDetailUpdid() {
		return detailUpdid;
	}

	public void setDetailUpdid(String detailUpdid) {
		this.detailUpdid = detailUpdid;
	}

	public String getDetailRegdate() {
		return detailRegdate;
	}

	public void setDetailRegdate(String detailRegdate) {
		this.detailRegdate = detailRegdate;
	}

	public String getDetailUpddate() {
		return detailUpddate;
	}

	public void setDetailUpddate(String detailUpddate) {
		this.detailUpddate = detailUpddate;
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
