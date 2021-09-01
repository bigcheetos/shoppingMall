package egovframework.let.cop.management.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 제품 카테고리에 대한 데이터 처리 모델 클래스
 * @author 개발팀 김진영
 * @since 2021.08.24
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.08.24  김진영          최초 생성
 *
 *  </pre>
 */

public class ProductCategoryVO implements Serializable {

	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = 784406012834453764L;
	
	private String categoryId;
	private String categoryName;
	private String categoryOrder;
	private String categoryStatus;
	
	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryOrder() {
		return categoryOrder;
	}

	public void setCategoryOrder(String categoryOrder) {
		this.categoryOrder = categoryOrder;
	}

	public String getCategoryStatus() {
		return categoryStatus;
	}

	public void setCategoryStatus(String categoryStatus) {
		this.categoryStatus = categoryStatus;
	}

	public static long getSerialversionuid() { return serialVersionUID; }
	
	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
