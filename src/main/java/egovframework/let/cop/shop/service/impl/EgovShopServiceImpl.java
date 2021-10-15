package egovframework.let.cop.shop.service.impl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.product.service.EgovProductCategoryService;
import egovframework.let.cop.product.service.EgovProductDetailService;
import egovframework.let.cop.product.service.EgovProductService;
import egovframework.let.cop.product.service.ProductCategoryVO;
import egovframework.let.cop.product.service.ProductDetailVO;
import egovframework.let.cop.product.service.ProductVO;
import egovframework.let.cop.shop.service.EgovShopService;
import egovframework.let.cop.shop.service.ShopSearchVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 상품 판매 관리를 위한 서비스 구현 클래스
 * @author 개발팀 김진영
 * @since 2021.09.28
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.09.28  김진영          최초 생성
 *
 *  </pre>
 */

@Service("EgovShopService")
public class EgovShopServiceImpl extends EgovAbstractServiceImpl implements EgovShopService {
	
	@Resource(name = "EgovProductService")
	private EgovProductService productService;
	
	@Resource(name = "EgovProductDetailService")
	private EgovProductDetailService productDetailService;
	
	@Resource(name = "EgovProductCategoryService")
	private EgovProductCategoryService categoryService;
	
	private static final DecimalFormat DECIMAL_FORMATTER = new DecimalFormat("###,###.##");
	
	protected String formatting(Object o) {
		return DECIMAL_FORMATTER.format(Double.valueOf((String)(o)));
	}
	
	/**
     * 검색조건에 맞는 상품목록을 조회한다.
     *
     * @see egovframework.let.cop.shop.service.EgovShopService
     */
	@Override
	public List<Map<String, Object>> getProductListOnShopBySearchVO(ShopSearchVO shopSearchVO) throws Exception {
		// TODO Auto-generated method stub
		
		List<Map<String, Object>> returnedMapList = new ArrayList<>();
		
		// searchVO로 검색하도록 변경
		List<ProductVO> productList = productService.getProductListBySearchVO(shopSearchVO);
		System.out.println("shopSearchVO.toString"+ shopSearchVO.toString());
		
		for(ProductVO productVO : productList) {
			Map<String, Object> returnedMap = new HashMap<>();
			Map<String, Object> productImgMap = productDetailService.getMainImgByProductId(productVO.getProductId());
			
			String productLink = "/cmm/main/shop/discountShopDetail.do?productId="+productVO.getProductId();
			
			double productDiscountPrice = Integer.parseInt(productVO.getProductDiscountPrice());
			double productPrice = Integer.parseInt(productVO.getProductPrice());
			double productRatio = productDiscountPrice/productPrice;
			
			productVO.setProductDiscountPrice(formatting(productVO.getProductDiscountPrice()));
			productVO.setProductPrice(formatting(productVO.getProductPrice()));
			
			if(productImgMap != null) {
				returnedMap.put("productImg", String.valueOf(productImgMap.get("fileCoursNm")));
			} else {
				returnedMap.put("productImg", "noImage");
			}
			
			returnedMap.put("productVO", productVO);
			returnedMap.put("productRatio", (int)(100 - productRatio*100));
			returnedMap.put("productLink", productLink);
			returnedMapList.add(returnedMap);
		}
		
		return returnedMapList;
	}
	
	/**
     * 상품Id로 상품상세정보를 가져온다.
     *
     * @see egovframework.let.cop.shop.service.EgovShopService
     */
	@Override
	public Map<String, Object> getProductDetailByProductId(String productId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> returnedMap = new HashMap<>();
		
		ProductDetailVO productDetailVO = productDetailService.getProductDetailByProductId(productId);
		List<Map<String, Object>> imgMapList = productDetailService.getImgListByProductId(productId);
		List<Map<String, Object>> optionList = productDetailService.getOptionListByOptionId(productId);
		List<Map<String, Object>> checkedCategoryList = productDetailService.getCheckedCategoryListByProductId(productDetailVO.getProductId());
		
		double productDiscountPrice = Integer.parseInt(productDetailVO.getProductDiscountPrice());
		double productPrice = Integer.parseInt(productDetailVO.getProductPrice());
		double productRatio = productDiscountPrice/productPrice;
		
		productDetailVO.setProductDiscountPrice(formatting(productDetailVO.getProductDiscountPrice()));
		productDetailVO.setProductPrice(formatting(productDetailVO.getProductPrice()));
		
		returnedMap.put("productDetailVO", productDetailVO);
		returnedMap.put("imgMapList", imgMapList);
		returnedMap.put("optionList", optionList);
		returnedMap.put("checkedCategoryList", checkedCategoryList);
		
		returnedMap.put("productRatio", (int)(100 - productRatio*100));
		
		return returnedMap;
	}
	
	/**
     * 모든 카테고리를 가져온다.
     *
     * @see egovframework.let.cop.shop.service.EgovShopService
     */
	@Override
	public List<ProductCategoryVO> getCategoryListAll() throws Exception {
		// TODO Auto-generated method stub
		return categoryService.getCategoryListAll();
	}

}
