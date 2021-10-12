package egovframework.let.cop.management.service;

import java.util.List;
import java.util.Map;

import egovframework.let.cop.product.service.ProductCategoryVO;
import egovframework.let.cop.product.service.ProductDetailVO;
import egovframework.let.cop.product.service.ProductOptionVO;
import egovframework.let.cop.product.service.ProductTypeVO;
import egovframework.let.cop.product.service.ProductVO;
import egovframework.let.cop.product.service.StockIoVO;
import egovframework.let.cop.product.service.StockVO;

/**
 * 상품 관리를 위한 서비스 인터페이스  클래스
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
 *  
 *  </pre>
 */
public interface EgovManagementService {
	
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
	 * 컨트롤러에서 넘겨받은 제품 리스트를 신규, 수정, 삭제로 분류하여 저장한다.
	 * @return
	 * 
	 * @param List<Map<String, Object>> paramList
	 * @exception Exception Exception
	 */
	public void saveProductList(List<Map<String, Object>> paramList) throws Exception;
	
	/** 제품 상세 시작 **/
	
	/**
	 * 제품 상세에 대하여 조회 한다.
	 * @return ProductDetailVO
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public ProductDetailVO getProductDetailByProductId(String productId) throws Exception;
	
	/**
	 * 제품 상세를 저장한다.
	 * @return
	 * 
	 * @param ProductDetailVO
	 * @exception Exception Exception
	 */
	public void saveProductDetail(List<Map<String, Object>> paramList) throws Exception;
	
	/**
	 * 제품코드로 옵션목록을 조회한다.
	 * @return List
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public List<Map<String, Object>> getOptionListByProductCode(String productCode) throws Exception;
	
	/**
	 * 제품 상세코드가 데이터베이스에 존재하는지 확인한다.
	 * @return boolean
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public boolean checkProductCode(String productCode) throws Exception;
	
	/**
	 * 제품코드로 제품상세정보에 포함된 카테고리를 조회한다.
	 * @return Map<String, Object>
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public List<Map<String, Object>> getCheckedCategoryListByProductCode(String productCode) throws Exception;
	
	/**
	 * 제품크드를 통해 제품 정보에 포함된 이미지파일 목록을 조회한다.
	 * @return Map<String, Object>
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public List<Map<String, Object>> getImgFileListByProductCode(String productCode) throws Exception;
	
	/** 제품 상세 끝 **/
	/** 카테고리 시작 **/
	
	/**
	 * 카테고리에 대하여 내용을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<ProductCategoryVO> getCategoryListAll() throws Exception;
	

	/**
	 * 컨트롤러에서 넘겨받은 카테고리 리스트를 신규, 수정, 삭제로 분류하여 저장한다.
	 * @return String
	 * 
	 * @param List<Map<String, Object>> paramList
	 * @exception Exception Exception
	 */
	public void saveCategoryList(List<Map<String, Object>> paramList) throws Exception;
	
	/** 카테고리 끝 **/
	/** 타입 시작 **/
	
	/**
	 * 타입에 대하여 내용을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<ProductTypeVO> getTypeListAll() throws Exception;
	

	/**
	 * 컨트롤러에서 넘겨받은 유형 리스트를 신규, 수정, 삭제로 분류하여 저장한다.
	 * @return String
	 * 
	 * @param List<Map<String, Object>> paramList
	 * @exception Exception Exception
	 */
	public void saveTypeList(List<Map<String, Object>> paramList) throws Exception;
	
	/** 타입 끝 **/
	/** 재고 시작 **/
	
	/**
	 * 재고에 대하여 내용을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<StockVO> getStockListAll() throws Exception;
	

	/**
	 * 컨트롤러에서 넘겨받은 재고 리스트를 신규, 수정, 삭제로 분류하여 저장한다.
	 * @return String
	 * 
	 * @param List<Map<String, Object>> paramList
	 * @exception Exception Exception
	 */
	public void saveStockList(List<Map<String, Object>> paramList) throws Exception;
	
	/** 재고 끝 **/
	/** 입출고 시작 **/
	
	/**
	 * 입출고 목록을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<StockIoVO> getStockIoListByStockId(StockIoVO stockId) throws Exception;
	
	/**
	 * 컨트롤러에서 넘겨받은 입출고 리스트를 신규, 수정, 삭제로 분류하여 저장한다.
	 * @return String
	 * 
	 * @param List<Map<String, Object>> paramList
	 * @exception Exception Exception
	 */
	public void saveStockIoList(List<Map<String, Object>> paramList) throws Exception;
	
	/** 입출고 끝 **/
	/** 옵션 시작 **/
	
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
	 * 컨트롤러에서 넘겨받은 옵션 리스트를 신규, 수정, 삭제로 분류하여 저장한다.
	 * @return String
	 * 
	 * @param List<Map<String, Object>> paramList
	 * @exception Exception Exception
	 */
	public void saveOptionList(List<Map<String, Object>> paramList) throws Exception;
}
