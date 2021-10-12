package egovframework.let.cop.product.service;

import java.util.List;

/**
 * 상품 옵션 위한 서비스 인터페이스  클래스
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
public interface EgovProductOptionService {
	/**
	 * 옵션에 대하여 목록을 조회 한다.
	 * @return List
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<ProductOptionVO> getOptionListAll() throws Exception;
	
	/**
	 * 판매가능한 옵션에 대하여 목록을 조회 한다.
	 * @return List
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<ProductOptionVO> getOptionListOnSale() throws Exception;
	
	/**
	 * 옵션코드로 옵션을 조회 한다.
	 * @return ProductOptionVO 
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public ProductOptionVO getOptionByOptionCode(String optionCode) throws Exception;
	
	/**
	 * 옵션 코드가 데이터베이스에 존재하는지 확인한다.
	 * @return boolean
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public boolean checkOptionCode(String optionCode) throws Exception;
	
	/**
	 * 옵션을 추가한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void addOption(ProductOptionVO productOptionVO) throws Exception;
	
	/**
	 * 옵션을 수정한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void modifyOption(ProductOptionVO productOptionVO) throws Exception;
	
	/**
	 * 옵션을 제거한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void removeOption(ProductOptionVO productOptionVO) throws Exception;
}
