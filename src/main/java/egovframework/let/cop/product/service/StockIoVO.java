package egovframework.let.cop.product.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 입/출고에 대한 데이터 처리 모델 클래스
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
public class StockIoVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6141147240756496731L;
	
	private String stockIoId;
	private String stockId;
	private String stockIoAmt;
	private String stockIoType;
	private String stockIoDate;
	
	public String getStockIoId() {
		return stockIoId;
	}
	public void setStockIoId(String stockIoId) {
		this.stockIoId = stockIoId;
	}
	public String getStockId() {
		return stockId;
	}
	public void setStockId(String stockId) {
		this.stockId = stockId;
	}
	public String getStockIoAmt() {
		return stockIoAmt;
	}
	public void setStockIoAmt(String stockIoAmt) {
		this.stockIoAmt = stockIoAmt;
	}
	public String getStockIoType() {
		return stockIoType;
	}
	public void setStockIoType(String stockIoType) {
		this.stockIoType = stockIoType;
	}
	public String getStockIoDate() {
		return stockIoDate;
	}
	public void setStockIoDate(String stockIoDate) {
		this.stockIoDate = stockIoDate;
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
