package egovframework.let.cop.management.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.management.service.EgovManagementService;
import egovframework.let.cop.management.service.ProductCategoryVO;
import egovframework.let.cop.management.service.ProductDetailVO;
import egovframework.let.cop.management.service.ProductOptionVO;
import egovframework.let.cop.management.service.ProductTypeVO;
import egovframework.let.cop.management.service.ProductVO;
import egovframework.let.cop.management.service.StockIoVO;
import egovframework.let.cop.management.service.StockVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.string.EgovStringUtil;

/**
 * 카테고리 관리를 위한 서비스 구현 클래스
 * @author 개발팀 김진영
 * @since 2021.08.25
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.08.25  김진영          최초 생성
 *
 *  </pre>
 */

@Service("EgovManagementService")
public class EgovManagementServiceImpl extends EgovAbstractServiceImpl implements EgovManagementService {
	
	@Resource(name = "ProductDAO")
	private ProductDAO productDAO;
	
	@Resource(name = "ProductDetailDAO")
	private ProductDetailDAO productDetailDAO;
	
	@Resource(name = "ProductCategoryDAO")
	private ProductCategoryDAO productCategoryDAO;
	
	@Resource(name = "ProductTypeDAO")
	private ProductTypeDAO productTypeDAO;
	
	@Resource(name = "StockDAO")
	private StockDAO stockDAO;
	
	@Resource(name = "StockIoDAO")
	private StockIoDAO stockIoDAO;

	@Resource(name = "ProductOptionDAO")
	private ProductOptionDAO productOptionDAO;
	
	/**
     * 모든 제품을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<ProductVO> getProductListAll() throws Exception {
		// TODO Auto-generated method stub
		return productDAO.selectProductListAll();
	}

	/**
     * 제품 Id의 다음 값을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public String getProductNextId() throws Exception {
		// TODO Auto-generated method stub
		return productDAO.selecNextId();
	}
	
	/**
     * 컨트롤러에서 넘겨받은 제품 리스트를 신규, 수정, 삭제로 분류하여 저장한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #addProduct(egovframework.let.cop.management.service.ProductVO)
     */
	@Override
	public void saveProductList(List<Map<String, Object>> paramList) throws Exception {
		// TODO Auto-generated method stub
		
		for(Map<String, Object> param : paramList) {
    		String rowType = String.valueOf(param.get("rowType"));
    		
    		ProductVO productVO = new ProductVO();
    		productVO.setProductId(String.valueOf(param.get("productId")));
    		productVO.setStockId(String.valueOf(param.get("stockId")));
    		
    		productVO.setProductName(String.valueOf(param.get("productName")));
    		productVO.setProductSummary(String.valueOf(param.get("productSummary")));
    		productVO.setProductPrice(String.valueOf(param.get("productPrice")));
    		productVO.setProductDiscountPrice(String.valueOf(param.get("productDiscountPrice")));
    		productVO.setProductOrigin(String.valueOf(param.get("productOrigin")));
    		productVO.setProductDeliverypay(String.valueOf(param.get("productDeliverypay")));
    		productVO.setProductStatus(String.valueOf(param.get("productStatus")));
    		
    		// 신규 추가
    		if(rowType.equals("new")) {
    			// DB에서 다음 아이디 가져오기
    			productVO.setProductId(getProductNextId());
    			addProduct(productVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				modifyProduct(productVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				removeProduct(productVO);
			}
    	}
	}
	
	/**
     * 제품을 추가한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #addProduct(egovframework.let.cop.management.service.ProductVO)
     */
	@Override
	public void addProduct(ProductVO productVO) throws Exception {
		// TODO Auto-generated method stub
		productDAO.insertProduct(productVO);
	}
	
	/**
     * 제품을 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyProduct(egovframework.let.cop.management.service.ProductVO)
     */
	@Override
	public void modifyProduct(ProductVO productVO) throws Exception {
		// TODO Auto-generated method stub
		productDAO.updateProduct(productVO);
	}
	
	/**
     * 제품을 삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #removeProduct(egovframework.let.cop.management.service.ProductVO)
     */
	@Override
	public void removeProduct(ProductVO productVO) throws Exception {
		// TODO Auto-generated method stub
		productDAO.deleteProduct(productVO);
	}
	
	/**
     * 제품상세을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public ProductDetailVO getProductDetailByProductId(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectProductDetailByProductId(productId);
	}

	@Override
	public boolean checkProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.countByProductCode(productCode)>0;
	}

	@Override
	public void saveProductDetail(List<Map<String, Object>> paramList) throws Exception {
		// TODO Auto-generated method stub
		
		for(Map<String, Object> param : paramList) {
			
			boolean isInsert = false;
			
			if(EgovStringUtil.isEmpty(String.valueOf(param.get("productId")))) {
				isInsert = true;
			}
			
			ProductDetailVO productDetailVO = new ProductDetailVO();
    		/*ProductVO productVO = new ProductVO();*/
    		String productCode = String.valueOf(param.get("productCode"));
    		String productId = getProductNextId();
    		
			productDetailVO.setProductId(productId);
			productDetailVO.setProductCode(productCode);
			productDetailVO.setProductMaterial(String.valueOf(param.get("productMaterial")));
			productDetailVO.setProductSize(String.valueOf(param.get("productSize")));
			productDetailVO.setProductIntroduction(String.valueOf(param.get("productIntroduction")));
			productDetailVO.setProductUse(String.valueOf(param.get("productUse")));
			productDetailVO.setProductDeliveryguide(String.valueOf(param.get("productDeliveryguide")));
			productDetailVO.setProductCancelguide(String.valueOf(param.get("productCancelGuide")));
			productDetailVO.setProductNotice(String.valueOf(param.get("productNotice")));
			
			productDetailVO.setProductId(productId);
			productDetailVO.setProductName(String.valueOf(param.get("productName")));
			productDetailVO.setProductSummary(String.valueOf(param.get("productSummary")));
			productDetailVO.setProductPrice(String.valueOf(param.get("productPrice")));
			productDetailVO.setProductDiscountPrice(String.valueOf(param.get("productDiscountPrice")));
			productDetailVO.setProductDeliverypay(String.valueOf(param.get("productDeliverypay")));
			productDetailVO.setProductOrigin(String.valueOf(param.get("productOrigin")));
			
			
			ProductVO productVO = productDetailVO.getProductVO();
			/*productVO.setProductId(productId);
			productVO.setProductName(String.valueOf(param.get("productName")));
			productVO.setProductSummary(String.valueOf(param.get("productSummary")));
			productVO.setProductPrice(String.valueOf(param.get("productPrice")));
			productVO.setProductDiscountPrice(String.valueOf(param.get("productDiscountPrice")));
			productVO.setProductDeliverypay(String.valueOf(param.get("productDeliverypay")));
			productVO.setProductOrigin(String.valueOf(param.get("productOrigin")));*/
			
			String[] categoryIdList = String.valueOf(param.get("checkedCategoryList")).split(",");
			String[] atchFileIdList = String.valueOf(param.get("atchFileId")).split(",");
			
			if(isInsert) {
				addProduct(productVO);
				addProductDetail(productDetailVO);
			}
			for(String categoryId : categoryIdList) {
				Map<String, String> categoryMap = new HashMap<>();
				categoryMap.put("productCode", productCode);
				categoryMap.put("categoryId", categoryId);
				
				if(isInsert) {
					addProductDetailToProductCategory(categoryMap);
				} else {
					removeProductDetailToProductCategory(categoryMap);
					addProductDetailToProductCategory(categoryMap);
				}
			}
			
			int i = 0;
			for(String atchFileId : atchFileIdList) {
				Map<String, String> atchFileMap = new HashMap<>();
				atchFileMap.put("productCode", productCode);
				atchFileMap.put("atchFileId", atchFileId);
				atchFileMap.put("usePurpose", (i++==0)?"main":"sub");
				
				if(isInsert) {
					addProductDetailToAtchFile(atchFileMap);
				} else {
					removeProductDetailToAtchFile(atchFileMap);
					addProductDetailToAtchFile(atchFileMap);
				}
			}
    	}
	}

	@Override
	public void addProductDetail(ProductDetailVO productDetailVO) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.insertProductDetail(productDetailVO);
	}

	@Override
	public void modifyProductDetail(ProductDetailVO productDetailVO) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.updateProductDetail(productDetailVO);
	}

	@Override
	public void removeProductDetail(ProductDetailVO productDetailVO) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.deleteProductDetail(productDetailVO);
	}
	

	@Override
	public void addProductDetailToAtchFile(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.insertProductDetailToAtchFile(map);
	}

	@Override
	public void removeProductDetailToAtchFile(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.deleteProductDetailToAtchFile(map);
	}

	@Override
	public void addProductDetailToProductCategory(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.insertProductDetailToProductCategory(map);
	}

	@Override
	public void removeProductDetailToProductCategory(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.deleteProductDetailToProductCategory(map);
	}
	
	/**
     * 모든 카테고리를 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<ProductCategoryVO> getCategoryListAll() throws Exception {
		// TODO Auto-generated method stub
		return productCategoryDAO.selectCategoryListAll();
	}

	/**
     * 카테고리 Id의 다음 값을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public String getCategoryNextId() throws Exception {
		// TODO Auto-generated method stub
		return productCategoryDAO.selecNextId();
	}
	
	/**
     * 컨트롤러에서 넘겨받은 카테고리 리스트를 신규, 수정, 삭제로 분류한다.
     *
     * 
     */
	@Override
	public void saveCategoryList(List<Map<String, Object>> paramList) throws Exception {
		// TODO Auto-generated method stub
		for(Map<String, Object> param : paramList) {
    		String rowType = String.valueOf(param.get("rowType"));
    		
    		ProductCategoryVO productCategoryVO = new ProductCategoryVO();
    		productCategoryVO.setCategoryId(String.valueOf(param.get("categoryId")));
    		productCategoryVO.setTypeId(String.valueOf(param.get("typeId")));
    		productCategoryVO.setCategoryName(String.valueOf(param.get("categoryName")));
    		productCategoryVO.setCategoryOrder(String.valueOf(param.get("categoryOrder")));
    		productCategoryVO.setCategoryStatus(String.valueOf(param.get("categoryStatus")));
    		
    		// 신규 추가
    		if(rowType.equals("new")) {
    			// DB에서 다음 아이디 가져오기
    			productCategoryVO.setCategoryId(getCategoryNextId());
    			addCategory(productCategoryVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				modifyCategory(productCategoryVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				removeCategory(productCategoryVO);
			}
		}
	}
	
	/**
     * 카테고리를 추가한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #addCategory(egovframework.let.cop.management.service.ProductCategoryVO)
     */
	@Override
	public void addCategory(ProductCategoryVO productCategoryVO) throws Exception {
		// TODO Auto-generated method stub
		productCategoryDAO.insertCategory(productCategoryVO);
	}
	
	/**
     * 카테고리를 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyCategory(egovframework.let.cop.management.service.ProductCategoryVO)
     */
	@Override
	public void modifyCategory(ProductCategoryVO productCategoryVO) throws Exception {
		// TODO Auto-generated method stub
		productCategoryDAO.updateCategory(productCategoryVO);
	}
	
	/**
     * 카테고리를 삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #removeCategory(egovframework.let.cop.management.service.ProductCategoryVO)
     */
	@Override
	public void removeCategory(ProductCategoryVO productCategoryVO) throws Exception {
		// TODO Auto-generated method stub
		productCategoryDAO.deleteCategory(productCategoryVO);
	}
	
	/**
     * 모든 타입을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<ProductTypeVO> getTypeListAll() throws Exception {
		// TODO Auto-generated method stub
		return productTypeDAO.selectTypeListAll();
	}

	/**
     * 타입 Id의 다음 값을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public String getTypeNextId() throws Exception {
		// TODO Auto-generated method stub
		return productTypeDAO.selecNextId();
	}
	

	/**
     * 컨트롤러에서 넘겨받은 유형 리스트를 신규, 수정, 삭제로 분류한다.
     *
     * 
     */
	@Override
	public void saveTypeList(List<Map<String, Object>> paramList) throws Exception {
		// TODO Auto-generated method stub
		for(Map<String, Object> param : paramList) {
    		String rowType = String.valueOf(param.get("rowType"));
    		
    		ProductTypeVO productTypeVO = new ProductTypeVO();
    		productTypeVO.setTypeId(String.valueOf(param.get("typeId")));
    		productTypeVO.setTypeName(String.valueOf(param.get("typeName")));
    		productTypeVO.setTypeOrder(String.valueOf(param.get("typeOrder")));
    		productTypeVO.setTypeStatus(String.valueOf(param.get("typeStatus")));
    		
    		// 신규 추가
    		if(rowType.equals("new")) {
    			// DB에서 다음 아이디 가져오기
    			productTypeVO.setTypeId(getTypeNextId());
    			addType(productTypeVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				modifyType(productTypeVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				removeType(productTypeVO);
			}
    	}
	}
	
	/**
     * 타입을 추가한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #addType(egovframework.let.cop.management.service.ProductTypeVO)
     */
	@Override
	public void addType(ProductTypeVO productTypeVO) throws Exception {
		// TODO Auto-generated method stub
		productTypeDAO.insertType(productTypeVO);
	}
	
	/**
     * 타입을 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyType(egovframework.let.cop.management.service.ProductTypeVO)
     */
	@Override
	public void modifyType(ProductTypeVO productTypeVO) throws Exception {
		// TODO Auto-generated method stub
		productTypeDAO.updateType(productTypeVO);
	}
	
	/**
     * 타입을 삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #removeType(egovframework.let.cop.management.service.ProductTypeVO)
     */
	@Override
	public void removeType(ProductTypeVO productTypeVO) throws Exception {
		// TODO Auto-generated method stub
		productTypeDAO.deleteType(productTypeVO);
	}


	/**
     * 모든 재고를 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockVO> getStockListAll() throws Exception {
		// TODO Auto-generated method stub
		return stockDAO.selectStockListAll();
	}

	/**
     * 재고 Id의 다음 값을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public String getStockNextId() throws Exception {
		// TODO Auto-generated method stub
		return stockDAO.selecNextId();
	}
	
	/**
     * 컨트롤러에서 넘겨받은 재고 리스트를 신규, 수정, 삭제로 분류한다.
     *
     * 
     */
	@Override
	public void saveStockList(List<Map<String, Object>> paramList) throws Exception {
		// TODO Auto-generated method stub
		for(Map<String, Object> param : paramList) {
    		String rowType = String.valueOf(param.get("rowType"));
    		
    		StockVO stockVO = new StockVO();
    		stockVO.setStockId(String.valueOf(param.get("stockId")));
    		stockVO.setStockName(String.valueOf(param.get("stockName")));
    		stockVO.setStockAmt(String.valueOf(param.get("stockAmt")));
    		
    		// 신규 추가
    		if(rowType.equals("new")) {
    			// DB에서 다음 아이디 가져오기
    			stockVO.setStockId(getStockNextId());
    			addStock(stockVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				modifyStock(stockVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				removeStock(stockVO);
			}
    	}
	}
	
	/**
     * 컨트롤러에서 넘겨받은 입출고 리스트를 신규, 수정, 삭제로 분류한다.
     *
     * 
     */
	@Override
	public void saveStockIoList(List<Map<String, Object>> paramList) throws Exception {
		// TODO Auto-generated method stub
		for(Map<String, Object> param : paramList) {
    		String rowType = String.valueOf(param.get("rowType"));
    		
    		StockIoVO stockIoVO = new StockIoVO();
    		stockIoVO.setStockIoId(String.valueOf(param.get("stockIoId")));
    		stockIoVO.setStockId(String.valueOf(param.get("stockId")));
    		stockIoVO.setStockIoAmt(String.valueOf(param.get("stockIoAmt")));
    		stockIoVO.setStockIoType(String.valueOf(param.get("stockIoType")));
    		stockIoVO.setStockIoDate(String.valueOf(param.get("stockIoDate")).replace("T", " "));
    		
    		// 신규 추가
    		if(rowType.equals("new")) {
    			// DB에서 다음 아이디 가져오기
    			stockIoVO.setStockIoId(getStockIoNextId());
    			System.out.println("Insert stockIoVO:" + stockIoVO.toString());
    			
    			addStockIo(stockIoVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				System.out.println("Update stockIoVO:" + stockIoVO.toString());
				
				modifyStockIo(stockIoVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				System.out.println("Delete stockIoVO:" + stockIoVO.toString());
				
				removeStockIo(stockIoVO);
			}
    	}
	}
	
	/**
     * 재고를 추가한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #addStock(egovframework.let.cop.management.service.StockVO)
     */
	@Override
	public void addStock(StockVO stockVO) throws Exception {
		// TODO Auto-generated method stub
		stockDAO.insertStock(stockVO);
	}
	
	/**
     * 재고를 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyStock(egovframework.let.cop.management.service.StockVO)
     */
	@Override
	public void modifyStock(StockVO stockVO) throws Exception {
		// TODO Auto-generated method stub
		stockDAO.updateStock(stockVO);
	}
	
	/**
     * 재고를 삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #removeStock(egovframework.let.cop.management.service.StockVO)
     */
	@Override
	public void removeStock(StockVO stockVO) throws Exception {
		// TODO Auto-generated method stub
		stockDAO.deleteStock(stockVO);
	}
	
	
	/**
     * 재고에 대한 입출고 목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockIoVO> getStockIoListByStockId(StockIoVO stockId) throws Exception {
		// TODO Auto-generated method stub
		return stockIoDAO.selectStockIoListByStockId(stockId);
	}

	/**
     * 재고에 대한 입고 목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockIoVO> getStockInputListByStockId(String stockId) throws Exception {
		// TODO Auto-generated method stub
		return stockIoDAO.selectStockInputListByStockId(stockId);
	}
	
	/**
     * 재고에 대한 입고 목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockIoVO> getStockOutputListByStockId(String stockId) throws Exception {
		// TODO Auto-generated method stub
		return stockIoDAO.selectStockOutputListByStockId(stockId);
	}
	
	/**
     * 입출고 Id의 다음 값을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public String getStockIoNextId() throws Exception {
		// TODO Auto-generated method stub
		return stockIoDAO.selecNextId();
	}
	
	/**
     * 입출고를 신규 추가한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyStock(egovframework.let.cop.management.service.StockIoVO)
     */
	@Override
	public void addStockIo(StockIoVO stockIoVO) throws Exception {
		// TODO Auto-generated method stub
		stockIoDAO.insertStockIo(stockIoVO);
	}
	
	/**
     * 입출고를 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyStock(egovframework.let.cop.management.service.StockIoVO)
     */
	@Override
	public void modifyStockIo(StockIoVO stockIoVO) throws Exception {
		// TODO Auto-generated method stub
		stockIoDAO.updateStockIo(stockIoVO);
	}
	
	/**
     * 입출고를 삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #removeStock(egovframework.let.cop.management.service.StockIoVO)
     */
	@Override
	public void removeStockIo(StockIoVO stockIoVO) throws Exception {
		// TODO Auto-generated method stub
		stockIoDAO.deleteStockIo(stockIoVO);
	}

	/** 입출고 끝 **/
	/** 옵션 시작 **/
	
	/**
     * 모든 옵션을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<ProductOptionVO> getOptionListAll() throws Exception {
		// TODO Auto-generated method stub
		return productOptionDAO.selectOptionListAll();
	}
	
	/**
     * 컨트롤러에서 넘겨받은 옵션 목록을 신규, 수정, 삭제로 분류한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public void saveOptionList(List<Map<String, Object>> paramList) throws Exception {
		// TODO Auto-generated method stub
		for(Map<String, Object> param : paramList) {
    		String rowType = String.valueOf(param.get("rowType"));
    		
    		ProductOptionVO optionVO = new ProductOptionVO();
    		optionVO.setOptionCode(String.valueOf(param.get("optionCode")));
    		optionVO.setStockId(String.valueOf(param.get("stockId")));
    		optionVO.setAtchFileId(String.valueOf(param.get("atchFileId")));
    		optionVO.setOptionName(String.valueOf(param.get("optionName")));
    		optionVO.setOptionStatus(String.valueOf(param.get("optionStatus")));
    		optionVO.setOptionPrice(String.valueOf(param.get("optionPrice")));
    		
    		// 신규 추가
    		if(rowType.equals("new")) {
    			// DB에서 다음 아이디 가져오기
    			addOption(optionVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				modifyOption(optionVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				removeOption(optionVO);
			}
    	}
	}
	
	/**
     * 옵션 코드값이 존재하는지 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public boolean checkOptionCode(String optionCode) throws Exception {
		// TODO Auto-generated method stub
		return productOptionDAO.countByOptionCode(optionCode)>0;
	}
	
	/**
     * 옵션을 신규 추가한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyStock(egovframework.let.cop.management.service.productOptionVO)
     */
	@Override
	public void addOption(ProductOptionVO productOptionVO) throws Exception {
		// TODO Auto-generated method stub
		productOptionDAO.insertOption(productOptionVO);
	}
	
	/**
     * 옵션을 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyStock(egovframework.let.cop.management.service.productOptionVO)
     */
	@Override
	public void modifyOption(ProductOptionVO productOptionVO) throws Exception {
		// TODO Auto-generated method stub
		productOptionDAO.updateOption(productOptionVO);
	}
	
	/**
     * 옵션을삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyStock(egovframework.let.cop.management.service.productOptionVO)
     */
	@Override
	public void removeOption(ProductOptionVO productOptionVO) throws Exception {
		// TODO Auto-generated method stub
		productOptionDAO.deleteOption(productOptionVO);
	}
}
