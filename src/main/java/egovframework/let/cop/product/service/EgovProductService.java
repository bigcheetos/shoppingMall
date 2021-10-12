package egovframework.let.cop.product.service;

import java.util.List;

import egovframework.let.cop.shop.service.ShopSearchVO;

/**
 * 상품 서비스 인터페이스  클래스
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
public interface EgovProductService {

	/**
	 * 제품목록을 조회 한다.
	 * @return List
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<ProductVO> getProductListAll() throws Exception;
	
	/**
	 * 제품Id를 이용하여 제품을 하나 조회 한다.
	 * @return ProductVO
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public ProductVO getProductByProductId(String productId) throws Exception;
	
	/**
	 * 제품의 ID 최대값 다음을 조회 한다.
	 * @return String
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public String getProductNextId() throws Exception;
	
	/**
	 * 제품을 추가한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void addProduct(ProductVO productVO) throws Exception;
	
	/**
	 * 제품을 수정한다.
	 * @return
	 * 
	 * @param ProductVO
	 * @exception Exception Exception
	 */
	public void modifyProduct(ProductVO productVO) throws Exception;
	
	/**
	 * 제품을 제거한다.
	 * @return
	 * 
	 * @param ProductVO
	 * @exception Exception Exception
	 */
	public void removeProduct(ProductVO productVO) throws Exception;
	
	/**
	 * 검색조건에 맞는 제품목록을 가져온다.
	 * @return List
	 * 
	 * @param ShopSearchVO
	 * @exception Exception Exception
	 */
	public List<ProductVO> getProductListBySearchVO(ShopSearchVO searchVO) throws Exception;
}
