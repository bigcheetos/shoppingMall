package egovframework.let.cop.shop.service;

import java.util.List;

/**
 * 쇼핑몰 공통 관리를 위한 서비스 인터페이스  클래스
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
 *  
 *  </pre>
 */

public interface EgovShopService {
	/**
	 * 카테고리를 전부 조회 한다.
	 * @return List<CategoryVO>
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<CategoryVO> getCategoryAll() throws Exception;
	
	/**
	 * 할인관을 전부 조회 한다.
	 * @return List<ProductVO>
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<ProductVO> getProductAllOnDiscountShop() throws Exception;
	
	/**
	 * 할인관을 순서에 따라 전부 조회 한다.
	 * @return List<ProductVO>
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<ProductVO> getProductAllOnDiscountShopInOrder(String order) throws Exception;
}
