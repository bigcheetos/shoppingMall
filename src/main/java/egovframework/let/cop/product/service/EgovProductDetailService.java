package egovframework.let.cop.product.service;

import java.util.List;
import java.util.Map;

/**
 * 상품 상세 정보를 위한 서비스 인터페이스  클래스
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
public interface EgovProductDetailService {

	/**
	 * 제품 상세에 대하여 조회 한다.
	 * @return ProductDetailVO
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public ProductDetailVO getProductDetailByProductId(String productId) throws Exception;
	
	/**
	 * 제품 상세코드가 데이터베이스에 존재하는지 확인한다.
	 * @return boolean
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public boolean checkProductCode(String productCode) throws Exception;
	
	/**
	 * 제품 상세Id가 데이터베이스에 존재하는지 확인한다.
	 * @return boolean
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public boolean checkProductIdFromProductDetail(String productId) throws Exception;
	
	/**
	 * 제품 상세를 추가한다.
	 * @return
	 * 
	 * @param ProductDetailVO
	 * @exception Exception Exception
	 */
	public void addProductDetail(ProductDetailVO productDetailVO) throws Exception;
	
	/**
	 * 제품 상세를 수정한다.
	 * @return
	 * 
	 * @param ProductDetailVO
	 * @exception Exception Exception
	 */
	public void modifyProductDetail(ProductDetailVO productDetailVO) throws Exception;
	
	/**
	 * 제품 상세를 삭제한다.
	 * @return
	 * 
	 * @param ProductDetailVO
	 * @exception Exception Exception
	 */
	public void removeProductDetail(ProductDetailVO productDetailVO) throws Exception;
	
	/** 이미지 관련 시작 **/
	/**
	 * 제품Id를 제품의 대표 이미지파일을 조회한다.
	 * @return Map<String, Object>
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public Map<String, Object> getMainImgByProductId(String productId) throws Exception;

	/**
	 * 제품Id를 통해 제품 정보에 포함된 이미지파일 목록을 조회한다.
	 * @return Map<String, Object>
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public List<Map<String, Object>> getImgListByProductId(String productId) throws Exception;
	
	/**
	 * 제품크드를 통해 제품 정보에 포함된 이미지파일 목록을 조회한다.
	 * @return Map<String, Object>
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public List<Map<String, Object>> getImgFileListByProductCode(String productCode) throws Exception;
	
	/**
	 * 제품 상세에 연결된 첨부파일을 추가한다.
	 * @return
	 * 
	 * @param Map<String, String> map
	 * @exception Exception Exception
	 */
	public void addProductDetailToAtchFile(Map<String, String> map) throws Exception;
	
	/**
	 * 제품 상세에 연결된 첨부파일을 삭제한다.
	 * @return
	 * 
	 * @param Map<String, String> map
	 * @exception Exception Exception
	 */
	public void removeProductDetailToAtchFile(Map<String, String> map) throws Exception;
	/** 이미지 관련 끝 **/
	/** 카테고리 관련 시작 **/
	/**
	 * 제품Id로 제품상세정보에 포함된 카테고리를 조회한다.
	 * @return Map<String, Object>
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public List<Map<String, Object>> getCheckedCategoryListByProductId(String productId) throws Exception;

	/**
	 * 제품코드로 제품상세정보에 포함된 카테고리를 조회한다.
	 * @return Map<String, Object>
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public List<Map<String, Object>> getCheckedCategoryListByProductCode(String productCode) throws Exception;
	
	/**
	 * 제품 상세에 연결된 카테고리를 추가한다.
	 * @return
	 * 
	 * @param Map<String, String> map
	 * @exception Exception Exception
	 */
	public void addProductDetailToProductCategory(Map<String, String> map) throws Exception;
	
	/**
	 * 제품 상세에 연결된 카테고리를 삭제한다.
	 * @return
	 * 
	 * @param Map<String, String> map
	 * @exception Exception Exception
	 */
	public void removeProductDetailToProductCategory(Map<String, String> map) throws Exception;
	
	/** 카테고리 관련 끝 **/
	
	
	/** 옵션 관련 시작 **/
	/**
	 * 제품코드로 옵션목록을 조회한다.
	 * @return List
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public List<Map<String, Object>> getOptionListByProductCode(String productCode) throws Exception;	
	
	/**
	 * 제품Id로 옵션목록을 조회한다.
	 * @return List
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public List<Map<String, Object>> getOptionListByOptionId(String productId) throws Exception;
	
	/**
	 * 제품 정보에 포함된 옵션을 추가한다.
	 * @return
	 * 
	 * @param Map<String, String> map
	 * @exception Exception Exception
	 */
	public void addProductDetailToProductOption(Map<String, String> map) throws Exception;
	
	/**
	 * 제품 정보에  포함된 옵션을 삭제한다.
	 * @return
	 * 
	 * @param Map<String, String> map
	 * @exception Exception Exception
	 */
	public void removeProductDetailToProductOption(Map<String, String> map) throws Exception;
	
	/** 옵션 관련 끝 **/
}
