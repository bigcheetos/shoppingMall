package egovframework.let.cop.management.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.let.cop.management.service.EgovManagementService;
import egovframework.let.cop.management.service.ProductCategoryVO;
import egovframework.let.cop.management.service.ProductTypeVO;
import egovframework.let.cop.management.service.ProductVO;
import egovframework.let.cop.management.service.StockIoVO;
import egovframework.let.cop.management.service.StockVO;
import egovframework.let.utl.fcc.service.EgovStringUtil;

@RestController@SessionAttributes(types = ComDefaultVO.class)
public class EgovManagementRestController {
	
	/**
	 * EgovEventService
	 */
	@Resource(name = "EgovManagementService")
	private EgovManagementService managementService;
	
	@Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;
	
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
    	String message = "";
    	
    	if(paramList != null) {
    		try {
    			managementService.saveProductList(paramList);
    			message = "success";
    		} catch(Exception e) {
    			e.printStackTrace();
    			message = "fail";
    		}
    	}
    	
    	return message;
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
    public String registProductCategory(@RequestBody  List<Map<String, Object>> paramList, HttpServletRequest request, ModelMap model) throws Exception {
    	
    	String message = "";
    	
    	if(paramList != null) {
    		try {
    			managementService.saveCategoryList(paramList);
    			message = "success";
    		} catch(Exception e) {
    			e.printStackTrace();
    			message = "fail";
    		}
    	}
    	
    	
    	return message;
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
    public String registProductType(@RequestBody  List<Map<String, Object>> paramList, HttpServletRequest request, ModelMap model) throws Exception {
    	
    	String message = "";
    	
    	if(paramList != null) {
    		try {
    			managementService.saveTypeList(paramList);
    			message = "success";
    		} catch(Exception e) {
    			e.printStackTrace();
    			message = "fail";
    		}
    	}
    	
    	
    	return message;
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
    	
    	String message = "";
    	
    	if(paramList != null) {
    		try {
    			managementService.saveStockList(paramList);
    			message = "success";
    		} catch(Exception e) {
    			e.printStackTrace();
    			message = "fail";
    		}
    	}
    	
    	return message;
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
    	
    	if(EgovStringUtil.isEmpty(stockId)) {
    		stockId = "";
    	}
    	
    	StockIoVO stockIoVO = new StockIoVO();
    	stockIoVO.setStockId(stockId);
    	List<StockIoVO> stockIoList = managementService.getStockIoListByStockId(stockIoVO);
    	
    	
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

    	String message = "";
    	
    	if(paramList != null) {
    		try {
    			managementService.saveStockIoList(paramList);
    			message = "success";
    		} catch(Exception e) {
    			e.printStackTrace();
    			message = "fail";
    		}
    	}
    	
    	return message;
    }    
    
    /**
     * 첨부파일 목록 조회
     *
     * @param request, model
     * @return List<FileVO>
     */
    @RequestMapping("/cmm/main/management/getAtchFileListByAtchFileId.do")
    public List<FileVO> getAtchFileListByAtchFileId(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	String atchFileId = request.getParameter("atchFileId");
    	
    	FileVO fileVO = new FileVO();
    	
    	if(EgovStringUtil.isEmpty(atchFileId)) {
    		atchFileId = "";
    	}
    	
    	fileVO.setAtchFileId(atchFileId);
    	
    	List<FileVO> result = fileService.selectFileInfs(fileVO);
    	
    	return result;
    }
}
