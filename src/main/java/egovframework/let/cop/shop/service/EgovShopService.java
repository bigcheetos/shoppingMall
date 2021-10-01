package egovframework.let.cop.shop.service;

import java.util.List;
import java.util.Map;

/**
 * 물품 판매를 위한 서비스 인터페이스
 * @author 개발팀 김진영
 * @since 2021.09.27
 * @version 1.0
 * @see
 *  
 * <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.09.27  김진영          최초 생성
 *  
 *  
 *  </pre>
 */
public interface EgovShopService {
	/**
	 * 상품목록을 조회 조건에 따라 조회한다.
	 * @return List<Map>
	 * 
	 * @param SearchVO
	 * @exception Exception Exception
	 */
	public List<Map<String, Object>> getProductListOnShopBySearchVO(ShopSearchVO shopSearchVO) throws Exception;
	
	/**
	 * 상품의 상세정보를 조회한다.
	 * @return Map<String, Object>
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public Map<String, Object> getProductDetailByProductId(String productId) throws Exception;
}
