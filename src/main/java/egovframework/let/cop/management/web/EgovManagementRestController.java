package egovframework.let.cop.management.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.cop.management.service.EgovManagementService;
import egovframework.let.cop.management.service.ProductCategoryVO;
import egovframework.let.cop.management.service.ProductTypeVO;
import egovframework.let.cop.management.service.ProductVO;
import egovframework.let.cop.management.service.StockIoVO;
import egovframework.let.cop.management.service.StockVO;

@RestController@SessionAttributes(types = ComDefaultVO.class)
public class EgovManagementRestController {
	
	/**
	 * EgovEventService
	 */
	@Resource(name = "EgovManagementService")
	private EgovManagementService managementService;
	
	@Autowired
    private DefaultBeanValidator beanValidator;

    /**
     * XSS 방지 처리.
     *
     * @param data
     * @return
     */
    protected String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }

        String ret = data;

        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }
    /**
     * 제품 조회
     *
     * @param request, model
     * @return List<ProductCategoryVO>
     */
    @RequestMapping("/cmm/main/management/getProductList.do")
    public List<ProductVO> getProductList(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	List<ProductVO> productList = managementService.getProductListAll();
    	
    	return productList;
    }
    
    /**
     * 카테고리 추가/삭제/수정 저장
     *
     * @param paramList, request, model
     * @return List<ProductCategoryVO>
     */
    @RequestMapping("/cmm/main/management/registProduct.do")
    @ResponseBody
    public String registProduct(@RequestBody  List<Map<String, Object>> paramList, HttpServletRequest request, ModelMap model) throws Exception {
    	
    	System.out.println(paramList.toString());
    	
    	for(Map<String, Object> param : paramList) {
    		String rowType = String.valueOf(param.get("rowType"));
    		
    		ProductVO productVO = new ProductVO();
    		productVO.setProductId(String.valueOf(param.get("productId")));
    		productVO.setCategoryId(String.valueOf(param.get("categoryId")));
    		productVO.setTypeId(String.valueOf(param.get("typeId")));
    		productVO.setStockId(String.valueOf(param.get("stockId")));
    		
    		productVO.setProductName(String.valueOf(param.get("productName")));
    		productVO.setProductSummary(String.valueOf(param.get("productSummary")));
    		productVO.setProductPrice(String.valueOf(param.get("productPrice")));
    		productVO.setProductDiscountPrice(String.valueOf(param.get("productDiscountPrice")));
    		productVO.setProductOrigin(String.valueOf(param.get("productOrigin")));
    		productVO.setProductDeliverypay(String.valueOf(param.get("productDeliverypay")));
    		productVO.setProductStatus(String.valueOf(param.get("productStatus")));
    		
    		
    		System.out.println("---------------- type check ----------------");
    		System.out.println("productVO.getProductId()"+productVO.getProductId());
    		
    		// 신규 추가
    		if(rowType.equals("new")) {
    			// DB에서 다음 아이디 가져오기
    			productVO.setProductId(managementService.getProductNextId());
    			managementService.addProduct(productVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				managementService.modifyProduct(productVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				managementService.removeProduct(productVO);
			}
    	}
    	
    	return "success";
    }
    
    
    /**
     * 카테고리 조회
     *
     * @param request, model
     * @return List<ProductCategoryVO>
     */
    @RequestMapping("/cmm/main/management/getProductCategoryList.do")
    public List<ProductCategoryVO> getProductCategoryList(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	List<ProductCategoryVO> productCategoryList = managementService.getCategoryListAll();
    	
    	return productCategoryList;
    }
    
    /**
     * 카테고리 추가/삭제/수정 저장
     *
     * @param paramList, request, model
     * @return List<ProductCategoryVO>
     */
    @RequestMapping("/cmm/main/management/registProductCategory.do")
    @ResponseBody
    public List<ProductCategoryVO> registProductCategory(@RequestBody  List<Map<String, Object>> paramList, HttpServletRequest request, ModelMap model) throws Exception {
    	
    	System.out.println(paramList.toString());
    	
    	for(Map<String, Object> param : paramList) {
    		String rowType = String.valueOf(param.get("rowType"));
    		
    		ProductCategoryVO productCategoryVO = new ProductCategoryVO();
    		productCategoryVO.setCategoryId(String.valueOf(param.get("categoryId")));
    		productCategoryVO.setCategoryName(String.valueOf(param.get("categoryName")));
    		productCategoryVO.setCategoryOrder(String.valueOf(param.get("categoryOrder")));
    		productCategoryVO.setCategoryStatus(String.valueOf(param.get("categoryStatus")));
    		
    		System.out.println("---------------- type check ----------------");
    		System.out.println("productCategoryVO.getCategoryId()"+productCategoryVO.getCategoryId());
    		
    		// 신규 추가
    		if(rowType.equals("new")) {
    			// DB에서 다음 아이디 가져오기
    			productCategoryVO.setCategoryId(managementService.getCategoryNextId());
    			managementService.addCategory(productCategoryVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				managementService.modifyCategory(productCategoryVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				managementService.removeCategory(productCategoryVO);
			}
    	}
    	
    	
    	List<ProductCategoryVO> productCategoryList = managementService.getCategoryListAll();
    	
    	return productCategoryList;
    }
    
    /**
     * 타입 조회
     *
     * @param request, model
     * @return List<ProductTypeVO>
     */
    @RequestMapping("/cmm/main/management/getProductTypeList.do")
    public List<ProductTypeVO> getProductTypeList(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	List<ProductTypeVO> productTypeList = managementService.getTypeListAll();
    	
    	return productTypeList;
    }
    
    /**
     * 타입 추가/삭제/수정 저장
     *
     * @param paramList, request, model
     * @return List<ProductTypeVO>
     */
    @RequestMapping("/cmm/main/management/registProductType.do")
    @ResponseBody
    public List<ProductTypeVO> registProductType(@RequestBody  List<Map<String, Object>> paramList, HttpServletRequest request, ModelMap model) throws Exception {
    	
    	System.out.println(paramList.toString());
    	
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
    			productTypeVO.setTypeId(managementService.getTypeNextId());
    			managementService.addType(productTypeVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				managementService.modifyType(productTypeVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				managementService.removeType(productTypeVO);
			}
    	}
    	
    	
    	List<ProductTypeVO> productTypeList = managementService.getTypeListAll();
    	
    	return productTypeList;
    }
    
    /**
     * 재고 조회
     *
     * @param request, model
     * @return List<StockVO>
     */
    @RequestMapping("/cmm/main/management/getStockList.do")
    public List<StockVO> getStockList(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	List<StockVO> stockList = managementService.getStockListAll();
    	
    	return stockList;
    }
    
    /**
     * 재고 추가/삭제/수정 저장
     *
     * @param paramList, request, model
     * @return List<StockVO>
     */
    @RequestMapping("/cmm/main/management/registStock.do")
    @ResponseBody
    public String registStock(@RequestBody  List<Map<String, Object>> paramList, HttpServletRequest request, ModelMap model) throws Exception {
    	
    	System.out.println(paramList.toString());
    	
    	for(Map<String, Object> param : paramList) {
    		String rowType = String.valueOf(param.get("rowType"));
    		
    		StockVO stockVO = new StockVO();
    		stockVO.setStockId(String.valueOf(param.get("stockId")));
    		stockVO.setStockName(String.valueOf(param.get("stockName")));
    		stockVO.setStockAmt(String.valueOf(param.get("stockAmt")));
    		
    		// 신규 추가
    		if(rowType.equals("new")) {
    			// DB에서 다음 아이디 가져오기
    			stockVO.setStockId(managementService.getStockNextId());
    			managementService.addStock(stockVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				managementService.modifyStock(stockVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				managementService.removeStock(stockVO);
			}
    	}
    	
    	// 재조회
    	//List<StockVO> stockList = managementService.getStockListAll();
    	
    	return "success";
    }    
    
    /**
     * 입출고 조회
     *
     * @param request, model
     * @return List<StockIoVO>
     */
    @RequestMapping("/cmm/main/management/getStockIoListByStockId.do")
    public List<StockIoVO> getStockIoListByStockId(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	String stockId = request.getParameter("stockId");
    	
    	System.out.println("stockId"+stockId);
    	
    	if(stockId.equals("null") 
		|| stockId.equals(null)) {
    		stockId = "";
    	}
    	
    	System.out.println("stockId"+stockId);
    	StockIoVO stockIoVO = new StockIoVO();
    	stockIoVO.setStockId(stockId);
    	List<StockIoVO> stockIoList = managementService.getStockIoListByStockId(stockIoVO);
    	
    	
    	System.out.println("stockIoList"+stockIoList.toString());
    	
    	return stockIoList;
    }
    
    /**
     * 입출고 추가/삭제/수정 저장
     *
     * @param paramList, request, model
     * @return List<StockIoVO>
     */
    @RequestMapping("/cmm/main/management/registStockIo.do")
    @ResponseBody
    public String registStockIo(@RequestBody  List<Map<String, Object>> paramList, HttpServletRequest request, ModelMap model) throws Exception {

    	System.out.println(paramList.toString());
    	
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
    			stockIoVO.setStockIoId(managementService.getStockIoNextId());
    			System.out.println("Insert stockIoVO:" + stockIoVO.toString());
    			
    			managementService.addStockIo(stockIoVO);
    		// 수정
			} else if(rowType.equals("updated")) {
				System.out.println("Update stockIoVO:" + stockIoVO.toString());
				
				managementService.modifyStockIo(stockIoVO);
			// 삭제
			} else if(rowType.equals("removed")) {
				System.out.println("Delete stockIoVO:" + stockIoVO.toString());
				
				managementService.removeStockIo(stockIoVO);
			}
    	}
    	
    	return "success";
    }    
}
