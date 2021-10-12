package egovframework.let.cop.product.service;

import java.util.List;

/**
 * 상품 유형을 위한 서비스 인터페이스  클래스
 * @author 개발팀 김진영
 * @since 2021.10.12
 * @version 1.0
 * @see
 *  
 * <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.10.12  김진영          최초 생성
 *  
 *  
 *  </pre>
 */
public interface EgovProductTypeService {

	/**
	 * 타입에 대하여 내용을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<ProductTypeVO> getTypeListAll() throws Exception;
	
	/**
	 * 타입의 ID 최대값 다음을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public String getTypeNextId() throws Exception;
	
	/**
	 * 타입을 추가한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void addType(ProductTypeVO productTypeVO) throws Exception;
	
	/**
	 * 타입을 수정한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void modifyType(ProductTypeVO productTypeVO) throws Exception;
	
	/**
	 * 타입을 제거한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void removeType(ProductTypeVO productTypeVO) throws Exception;
	
}
