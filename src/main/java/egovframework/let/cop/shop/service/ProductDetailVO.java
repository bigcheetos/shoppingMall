package egovframework.let.cop.shop.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 제품 상세에 대한 데이터 처리 모델 클래스
 * @author 개발팀 김진영
 * @since 2021.08.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.08.20  김진영          최초 생성
 *
 *  </pre>
 */
public class ProductDetailVO implements Serializable {
	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = 174788991006379323L;
	private ProductVO productVO;
	private int proDetailSeq;
	private int proSeq;
	private int bbsSeq;
	private String proDetailUnit;
	private String proDetailOrigin;
	private String proDetailHandlingtype;
	private String proDetailDeliverytype;
	private String proDetailEndtime;
	private int proDetailDeliverypay;
	private int proDetailDeliverypayFree;
	
	
	
	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	public int getProDetailSeq() {
		return proDetailSeq;
	}

	public void setProDetailSeq(int proDetailSeq) {
		this.proDetailSeq = proDetailSeq;
	}

	public int getProSeq() {
		return proSeq;
	}

	public void setProSeq(int proSeq) {
		this.proSeq = proSeq;
	}

	public int getBbsSeq() {
		return bbsSeq;
	}

	public void setBbsSeq(int bbsSeq) {
		this.bbsSeq = bbsSeq;
	}

	public String getProDetailUnit() {
		return proDetailUnit;
	}

	public void setProDetailUnit(String proDetailUnit) {
		this.proDetailUnit = proDetailUnit;
	}

	public String getProDetailOrigin() {
		return proDetailOrigin;
	}

	public void setProDetailOrigin(String proDetailOrigin) {
		this.proDetailOrigin = proDetailOrigin;
	}

	public String getProDetailHandlingtype() {
		return proDetailHandlingtype;
	}

	public void setProDetailHandlingtype(String proDetailHandlingtype) {
		this.proDetailHandlingtype = proDetailHandlingtype;
	}

	public String getProDetailDeliverytype() {
		return proDetailDeliverytype;
	}

	public void setProDetailDeliverytype(String proDetailDeliverytype) {
		this.proDetailDeliverytype = proDetailDeliverytype;
	}

	public String getProDetailEndtime() {
		return proDetailEndtime;
	}

	public void setProDetailEndtime(String proDetailEndtime) {
		this.proDetailEndtime = proDetailEndtime;
	}

	public int getProDetailDeliverypay() {
		return proDetailDeliverypay;
	}

	public void setProDetailDeliverypay(int proDetailDeliverypay) {
		this.proDetailDeliverypay = proDetailDeliverypay;
	}

	public int getProDetailDeliverypayFree() {
		return proDetailDeliverypayFree;
	}

	public void setProDetailDeliverypayFree(int proDetailDeliverypayFree) {
		this.proDetailDeliverypayFree = proDetailDeliverypayFree;
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
