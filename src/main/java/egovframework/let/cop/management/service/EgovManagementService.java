package egovframework.let.cop.management.service;

import java.util.List;
import java.util.Map;

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
	
	/** 제품 시작 **/
	/**
	 * 제품에 대하여 내용을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<ProductVO> getProductListAll() throws Exception;
	
	/**
	 * 제품의 ID 최대값 다음을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public String getProductNextId() throws Exception;
	
	/**
	 * 컨트롤러에서 넘겨받은 제품 리스트를 신규, 수정, 삭제로 분류하여 저장한다.
	 * @return String
	 * 
	 * @param List<Map<String, Object>> paramList
	 * @exception Exception Exception
	 */
	public void saveProductList(List<Map<String, Object>> paramList) throws Exception;
	
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
	 * @param 
	 * @exception Exception Exception
	 */
	public void modifyProduct(ProductVO productVO) throws Exception;
	
	/**
	 * 제품을 제거한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void removeProduct(ProductVO productVO) throws Exception;
	
	
	/** 제품 끝 **/
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
	 * 제품 상세코드가 데이터베이스에 존재하는지 확인한다.
	 * @return boolean
	 * 
	 * @param String
	 * @exception Exception Exception
	 */
	public boolean checkProductCode(String productCode) throws Exception;
	
	/**
	 * 제품 상세를 저장한다.
	 * @return
	 * 
	 * @param ProductDetailVO
	 * @exception Exception Exception
	 */
	public void saveProductDetail(List<Map<String, Object>> paramList) throws Exception;
	
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
	
	/**
	 * 카테고리의 ID 최대값 다음을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public String getCategoryNextId() throws Exception;
	
	/**
	 * 카테고리를 추가한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void addCategory(ProductCategoryVO productCategoryVO) throws Exception;
	
	/**
	 * 카테고리를 수정한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void modifyCategory(ProductCategoryVO productCategoryVO) throws Exception;
	
	/**
	 * 카테고리를 제거한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void removeCategory(ProductCategoryVO productCategoryVO) throws Exception;
	
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
	
	/**
	 * 재고의 ID의 최대값 다음을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public String getStockNextId() throws Exception;
	
	/**
	 * 재고를 추가한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void addStock(StockVO stockVO) throws Exception;
	
	/**
	 * 재고를 수정한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void modifyStock(StockVO stockVO) throws Exception;
	
	/**
	 * 재고를 제거한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void removeStock(StockVO stockVO) throws Exception;
	
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
	 * 입고 목록만 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<StockIoVO> getStockInputListByStockId(String stockId) throws Exception;
	
	/**
	 * 출고 목록만 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<StockIoVO> getStockOutputListByStockId(String stockId) throws Exception;

	/**
	 * 컨트롤러에서 넘겨받은 입출고 리스트를 신규, 수정, 삭제로 분류하여 저장한다.
	 * @return String
	 * 
	 * @param List<Map<String, Object>> paramList
	 * @exception Exception Exception
	 */
	public void saveStockIoList(List<Map<String, Object>> paramList) throws Exception;
	
	/**
	 * 입출고의 ID의 최대값 다음을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public String getStockIoNextId() throws Exception;
	
	/**
	 * 입출고를 추가한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void addStockIo(StockIoVO stockIoVO) throws Exception;
	
	/**
	 * 입출고를 수정한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void modifyStockIo(StockIoVO stockIoVO) throws Exception;
	
	/**
	 * 입출고를 제거한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void removeStockIo(StockIoVO stockIoVO) throws Exception;	
}
