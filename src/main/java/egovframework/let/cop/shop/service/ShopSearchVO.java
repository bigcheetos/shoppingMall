package egovframework.let.cop.shop.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 제품 상세내용에 대한 데이터 처리 모델 클래스
 * @author 개발팀 김진영
 * @since 2021.09.29
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.09.29  김진영          최초 생성
 *
 *  </pre>
 */
public class ShopSearchVO implements Serializable{

	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = 1580778361152203143L;
	
	private String searchWord;
	private String searchCondition1;
	private String searchCondition2;
	private String searchCondition3;
	private String priceOver;
	private String priceUnder;
	private String searchUnit;
	private String searchOrder;
	
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchCondition1() {
		return searchCondition1;
	}
	public void setSearchCondition1(String searchCondition1) {
		this.searchCondition1 = searchCondition1;
	}
	public String getSearchCondition2() {
		return searchCondition2;
	}
	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
	}
	public String getSearchCondition3() {
		return searchCondition3;
	}
	public void setSearchCondition3(String searchCondition3) {
		this.searchCondition3 = searchCondition3;
	}
	public String getPriceOver() {
		return priceOver;
	}
	public void setPriceOver(String priceOver) {
		this.priceOver = priceOver;
	}
	public String getPriceUnder() {
		return priceUnder;
	}
	public void setPriceUnder(String priceUnder) {
		this.priceUnder = priceUnder;
	}
	public String getSearchUnit() {
		return searchUnit;
	}
	public void setSearchUnit(String searchUnit) {
		this.searchUnit = searchUnit;
	}
	public String getSearchOrder() {
		return searchOrder;
	}
	public void setSearchOrder(String searchOrder) {
		this.searchOrder = searchOrder;
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
