package egovframework.let.cop.product.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 재고에 대한 데이터 처리 모델 클래스
 * @author 개발팀 김진영
 * @since 2021.08.30
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.08.30  김진영          최초 생성
 *
 *  </pre>
 */
public class StockVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5995473143248166245L;
	
	private String stockId;
	private String stockName;
	private String stockAmt;
	public String getStockId() {
		return stockId;
	}
	public void setStockId(String stockId) {
		this.stockId = stockId;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public String getStockAmt() {
		return stockAmt;
	}
	public void setStockAmt(String stockAmt) {
		this.stockAmt = stockAmt;
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
