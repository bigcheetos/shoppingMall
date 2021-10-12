package egovframework.let.cop.product.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 제품 옵션에 대한 데이터 처리 모델 클래스
 * @author 개발팀 김진영
 * @since 2021.09.16
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.09.16  김진영          최초 생성
 *
 *  </pre>
 */
public class ProductOptionVO implements Serializable{

	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = -2728874773342976790L;
	
	private String optionCode;
	private String stockId;
	private String atchFileId;
	private String optionName;
	private String optionStatus;
	private String optionPrice;
	
	public String getOptionCode() {
		return optionCode;
	}

	public void setOptionCode(String optionCode) {
		this.optionCode = optionCode;
	}

	public String getStockId() {
		return stockId;
	}

	public void setStockId(String stockId) {
		this.stockId = stockId;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public String getOptionStatus() {
		return optionStatus;
	}

	public void setOptionStatus(String optionStatus) {
		this.optionStatus = optionStatus;
	}

	public String getOptionPrice() {
		return optionPrice;
	}

	public void setOptionPrice(String optionPrice) {
		this.optionPrice = optionPrice;
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
