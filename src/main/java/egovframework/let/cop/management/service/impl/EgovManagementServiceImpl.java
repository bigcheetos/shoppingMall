package egovframework.let.cop.management.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.let.cop.management.service.EgovManagementService;
import egovframework.let.cop.product.service.EgovProductCategoryService;
import egovframework.let.cop.product.service.EgovProductDetailService;
import egovframework.let.cop.product.service.EgovProductOptionService;
import egovframework.let.cop.product.service.EgovProductService;
import egovframework.let.cop.product.service.EgovProductTypeService;
import egovframework.let.cop.product.service.EgovStockIoService;
import egovframework.let.cop.product.service.EgovStockService;
import egovframework.let.cop.product.service.ProductCategoryVO;
import egovframework.let.cop.product.service.ProductDetailVO;
import egovframework.let.cop.product.service.ProductOptionVO;
import egovframework.let.cop.product.service.ProductTypeVO;
import egovframework.let.cop.product.service.ProductVO;
import egovframework.let.cop.product.service.StockIoVO;
import egovframework.let.cop.product.service.StockVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.string.EgovStringUtil;

/**
 * 상품 관리를 위한 서비스 구현 클래스
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
	
	@Resource(name = "EgovProductService")
	private EgovProductService productService;
	
	@Resource(name = "EgovProductDetailService")
	private EgovProductDetailService productDetailService;
	
	@Resource(name = "EgovProductOptionService")
	private EgovProductOptionService optionService;
	
	@Resource(name = "EgovProductCategoryService")
	private EgovProductCategoryService categoryService;
	
	@Resource(name = "EgovProductTypeService")
	private EgovProductTypeService typeService;
	
	@Resource(name = "EgovStockService")
	private EgovStockService stockService;
	
	@Resource(name = "EgovStockIoService")
	private EgovStockIoService stockIoService;
	
	private static final ObjectMapper objectMapper = new ObjectMapper();
	
	/**	상품 시작	**/
	
	/**
     * 모든 상품을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<ProductVO> getProductListAll() throws Exception {
		// TODO Auto-generated method stub
		return productService.getProductListAll();
	}

	/**
     * 상품Id로 상품을 하나 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public ProductVO getProductByProductId(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productService.getProductByProductId(productId);
	}
	
	/**
     * 상품을 저장한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #addProduct(egovframework.let.cop.product.service.ProductVO)
     */
	@Override
	public void saveProductList(List<Map<String, Object>> paramList) throws Exception {
		// TODO Auto-generated method stub
		
		for(Map<String, Object> param : paramList) {
			String paramedStockId = String.valueOf(param.get("stockId")); 
			
			if(EgovStringUtil.isNull(paramedStockId)||paramedStockId=="null") {
				paramedStockId = "0";
			}
			
    		String rowType = String.valueOf(param.get("rowType"));
    		
    		ProductVO productVO = new ProductVO();
    		productVO.setProductId(String.valueOf(param.get("productId")));
    		productVO.setStockId(paramedStockId);
    		
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
    			productVO.setProductId(productService.getProductNextId());
    			productService.addProduct(productVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				productService.modifyProduct(productVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				String productId = productVO.getProductId();
				if(productDetailService.checkProductIdFromProductDetail(productId)) {
					ProductDetailVO productDetailVO = getProductDetailByProductId(productId);
					String productCode = productDetailVO.getProductCode();
					HashMap<String, String> productDetailMap = new HashMap<>();
					
					productDetailMap.put("productCode", productCode);
					
					productDetailService.removeProductDetail(productDetailVO);
					productDetailService.removeProductDetailToAtchFile(productDetailMap);
					productDetailService.removeProductDetailToProductCategory(productDetailMap);
				}
				
				productService.removeProduct(productVO);
			}
    	}
	}
	
	/**	상품 끝	**/
	/**	상품 상세정보 시작	**/
	
	/**
     * 상품상세을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public ProductDetailVO getProductDetailByProductId(String productId) throws Exception {
		// TODO Auto-generated method stub
		
		return productDetailService.getProductDetailByProductId(productId);
	}
	
	/**
     * 상품상세를 저장한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public void saveProductDetail(List<Map<String, Object>> paramList) throws Exception {
		// TODO Auto-generated method stub
		
		for(Map<String, Object> param : paramList) {
			
			String paramedProductId = String.valueOf(param.get("productId"));
			String paramedProductCode = String.valueOf(param.get("productCode"));
			String parmedOptionList = String.valueOf(param.get("optionList"));
			
			boolean hasParamedProductId = !EgovStringUtil.isEmpty(paramedProductId);
			boolean hasParamedProductCode = !EgovStringUtil.isEmpty(paramedProductCode);
			
			String productId = hasParamedProductId?paramedProductId:productService.getProductNextId();	// 패러미터 받은게 없으면 DB의 상품ID 최고값 + 1
    		String productCode = hasParamedProductCode?paramedProductCode:productId;	// 패러미터 받은게 없으면 상품ID값과 동일하게
    		
    		ProductDetailVO productDetailVO = new ProductDetailVO();
			ProductVO productVO = new ProductVO();
			
    		int productCategoryIndex = 0;
    		int atchFileIndex = 0;
    		int optionIndex = 0;
    		
    		productDetailVO.setProductId(productId);
			productDetailVO.setProductCode(productCode);
			productDetailVO.setProductMaterial(String.valueOf(param.get("productMaterial")));
			productDetailVO.setProductSize(String.valueOf(param.get("productSize")));
			productDetailVO.setProductIntroduction(String.valueOf(param.get("productIntroduction")));
			productDetailVO.setProductUse(String.valueOf(param.get("productUse")));
			productDetailVO.setProductDeliveryguide(String.valueOf(param.get("productDeliveryguide")));
			productDetailVO.setProductCancelguide(String.valueOf(param.get("productCancelguide")));
			productDetailVO.setProductNotice(String.valueOf(param.get("productNotice")));
			
			productDetailVO.setProductId(productId);
			productDetailVO.setProductName(String.valueOf(param.get("productName")));
			productDetailVO.setProductSummary(String.valueOf(param.get("productSummary")));
			productDetailVO.setProductPrice(String.valueOf(param.get("productPrice")));
			productDetailVO.setProductDiscountPrice(String.valueOf(param.get("productDiscountPrice")));
			productDetailVO.setProductDeliverypay(String.valueOf(param.get("productDeliverypay")));
			productDetailVO.setProductOrigin(String.valueOf(param.get("productOrigin")));
			
			String[] categoryIdList = String.valueOf(param.get("checkedCategoryList")).split(",");
			String[] atchFileIdList = String.valueOf(param.get("atchFileList")).split(",");
			List<ProductOptionVO> optionList = new ArrayList<>();
			if(!EgovStringUtil.isEmpty(parmedOptionList)) {
				optionList = Arrays.asList(objectMapper.readValue(parmedOptionList, ProductOptionVO[].class));
			}
			
			// 패러미터로 받은 상품ID가 있는지 체크 -> 상품에 신규/수정 데이터 넣기
			if(!hasParamedProductId) {
				productVO = productDetailVO.getProductVO();
				productVO.setProductStatus("작성중");
				
				productService.addProduct(productVO);
			} else {
				productVO = productService.getProductByProductId(productId);
				
				productVO.setProductName(productDetailVO.getProductName());
				productVO.setProductSummary(productDetailVO.getProductSummary());
				productVO.setProductPrice(productDetailVO.getProductPrice());
				productVO.setProductDiscountPrice(productDetailVO.getProductDiscountPrice());
				productVO.setProductDeliverypay(productDetailVO.getProductDeliverypay());
				productVO.setProductOrigin(productDetailVO.getProductOrigin());
				
				productService.modifyProduct(productVO);
			}
			
			// 패러미터로 받은 상품코드가 상품상세 테이블에 있는지 체크 -> 상품상세에 신규/수정 데이터 넣기
			if(!productDetailService.checkProductIdFromProductDetail(productId)) {
				productDetailService.addProductDetail(productDetailVO);
			} else {
				productDetailService.modifyProductDetail(productDetailVO);
			}
			
			// 카테고리 연결 테이블에 데이터 넣기
			for(String categoryId : categoryIdList) {
				Map<String, String> categoryMap = new HashMap<>();
				categoryMap.put("productCode", productCode);
				categoryMap.put("categoryId", categoryId);
				
				if(productCategoryIndex==0) productDetailService.removeProductDetailToProductCategory(categoryMap);
				productDetailService.addProductDetailToProductCategory(categoryMap);
				
				productCategoryIndex++;
			}
			
			// 첨부파일 연결 테이블에 데이터 넣기
			for(String atchFileId : atchFileIdList) {
				Map<String, String> atchFileMap = new HashMap<>();
				atchFileMap.put("productCode", productCode);
				atchFileMap.put("atchFileId", atchFileId);
				atchFileMap.put("usePurpose", (atchFileIndex==0)?"main":"sub");
				
				if(atchFileIndex==0) productDetailService.removeProductDetailToAtchFile(atchFileMap);
				productDetailService.addProductDetailToAtchFile(atchFileMap);
				
				atchFileIndex++;
			}
			
			if(optionList.size() != 0) {
				for(ProductOptionVO option : optionList) {
					Map<String, String> optionMap = new HashMap<>();
					if(!EgovStringUtil.isEmpty(option.getOptionCode())) {
						optionMap.put("productCode", productCode);
						optionMap.put("optionCode", option.getOptionCode());
					} else {
						optionMap.put("productCode", productCode);
						optionMap.put("optionCode", "string_string_name_"+option.getOptionName()+"string_string_price_"+option.getOptionPrice());
					}
					
					if(optionIndex==0) productDetailService.removeProductDetailToProductOption(optionMap);
					productDetailService.addProductDetailToProductOption(optionMap);
					optionIndex++;
				}
			}
    	}
	}
	
	/**
     * 상품코드로 옵션목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<Map<String, Object>> getOptionListByProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailService.getOptionListByProductCode(productCode);
	}
	/**
     * 넘겨받은 상품코드로 일치하는 상품코드가 DB에 있는지 확인한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public boolean checkProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailService.checkProductCode(productCode);
	}
	/**
     * 상품코드로 체크된 카테고리 목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<Map<String, Object>> getCheckedCategoryListByProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailService.getCheckedCategoryListByProductCode(productCode);
	}
	/**
     * 상품코드로 이미지파일 목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<Map<String, Object>> getImgFileListByProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailService.getImgFileListByProductCode(productCode);
	}
	
	/**	상품 상세정보 끝	**/
	/**	카테고리 시작	**/
	
	/**
     * 모든 카테고리을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<ProductCategoryVO> getCategoryListAll() throws Exception {
		// TODO Auto-generated method stub
		return categoryService.getCategoryListAll();
	}
	
	/**
     * 카테고리를 저장한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
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
    			productCategoryVO.setCategoryId(categoryService.getCategoryNextId());
    			categoryService.addCategory(productCategoryVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				categoryService.modifyCategory(productCategoryVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				categoryService.removeCategory(productCategoryVO);
			}
		}
	}
	
	/**	카테고리 끝	**/
	/**	타입 시작	**/
	
	/**
     * 모든 유형을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<ProductTypeVO> getTypeListAll() throws Exception {
		// TODO Auto-generated method stub
		return typeService.getTypeListAll();
	}

	/**
     * 유형을 저장한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
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
    			productTypeVO.setTypeId(typeService.getTypeNextId());
    			typeService.addType(productTypeVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				typeService.modifyType(productTypeVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				typeService.removeType(productTypeVO);
			}
    	}
	}
	
	/**	타입 끝	**/
	/**	재고 시작	**/
	
	/**
     * 모든 재고를 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockVO> getStockListAll() throws Exception {
		// TODO Auto-generated method stub
		return stockService.getStockListAll();
	}

	/**
     * 재고를 저장한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
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
    			stockVO.setStockId(stockService.getStockNextId());
    			stockService.addStock(stockVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				stockService.modifyStock(stockVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				stockService.removeStock(stockVO);
			}
    	}
	}
	
	/**	재고 끝	**/
	/**	입출고 시작	**/
	
	/**
     * 재고Id로 입출고 목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockIoVO> getStockIoListByStockId(StockIoVO stockId) throws Exception {
		// TODO Auto-generated method stub
		return stockIoService.getStockIoListByStockId(stockId);
	}
	
	/**
     * 입출고를 저장한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
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
    			stockIoVO.setStockIoId(stockIoService.getStockIoNextId());
    			System.out.println("Insert stockIoVO:" + stockIoVO.toString());
    			
    			stockIoService.addStockIo(stockIoVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				System.out.println("Update stockIoVO:" + stockIoVO.toString());
				
				stockIoService.modifyStockIo(stockIoVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				System.out.println("Delete stockIoVO:" + stockIoVO.toString());
				
				stockIoService.removeStockIo(stockIoVO);
			}
    	}
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
		return optionService.getOptionListAll();
	}
	
	/**
     * 판매 가능한 옵션목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<ProductOptionVO> getOptionListOnSale() throws Exception {
		return optionService.getOptionListOnSale();
	};
	
	/**
     * 옵션을 저장한다.
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
    			optionService.addOption(optionVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				optionService.modifyOption(optionVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				optionService.removeOption(optionVO);
			}
    	}
	}
	/** 옵션 끝 **/
}
