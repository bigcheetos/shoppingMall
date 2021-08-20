package egovframework.let.cop.shop.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 쇼핑몰 카테고리에 대한 데이터 처리 모델 클래스
 * @author 개발팀 김진영
 * @since 2021.08.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.08.13  김진영          최초 생성
 *
 *  </pre>
 */
public class CategoryVO implements Serializable {

	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = 839638267970323629L;
	
	private int categorySeq;
	private String categoryName;
	private int categoryParentSeq;
	private int categoryOrder;
	
	public int getCategorySeq() { return categorySeq; }
	public void setCategorySeq(int categorySeq) { this.categorySeq = categorySeq; }
	public String getCategoryName() { return categoryName; }
	public void setCategoryName(String categoryName) { this.categoryName = categoryName; }
	public int getCategoryParentSeq() { return categoryParentSeq; }
	public void setCategoryParentSeq(int categoryParentSeq) { this.categoryParentSeq = categoryParentSeq; }
	public int getCategoryOrder() { return categoryOrder; }
	public void setCategoryOrder(int categoryOrder) { this.categoryOrder = categoryOrder; }
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
