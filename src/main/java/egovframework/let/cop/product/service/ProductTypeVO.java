package egovframework.let.cop.product.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 제품 타입에 대한 데이터 처리 모델 클래스
 * @author 개발팀 김진영
 * @since 2021.08.27
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.08.27  김진영          최초 생성
 *
 *  </pre>
 */
public class ProductTypeVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1996440361705947511L;
	
	private String typeId;
	private String typeName;
	private String typeOrder;
	private String typeStatus;
	
	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getTypeOrder() {
		return typeOrder;
	}

	public void setTypeOrder(String typeOrder) {
		this.typeOrder = typeOrder;
	}

	public String getTypeStatus() {
		return typeStatus;
	}

	public void setTypeStatus(String typeStatus) {
		this.typeStatus = typeStatus;
	}

	public static long getSerialversionuid() { return serialVersionUID; }
	

	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
