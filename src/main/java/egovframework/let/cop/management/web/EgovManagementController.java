package egovframework.let.cop.management.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.cop.management.service.EgovManagementService;

@Controller @SessionAttributes(types = ComDefaultVO.class)
public class EgovManagementController {

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
     * 관리 > 상품
     */
    @RequestMapping("/cmm/main/management/product_management.do")
    public String viewProductManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	return "food/management/ProductManagement";
    }

    /**
     * 관리 > 상품
     */
    @RequestMapping("/cmm/main/management/product_regist.do")
    public String viewProductRegist(HttpServletRequest request, ModelMap model) throws Exception {
    	return "food/management/ProductRegist";
    }
        
    /**
     * 관리 > 재고
     */
    @RequestMapping("/cmm/main/management/stock_management.do")
    public String viewStockManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/StockManagement";
    }
    
    /**
     * 관리 > 재고
     */
    @RequestMapping("/cmm/main/management/stock_io_management.do")
    public String viewStockIoManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/StockIoManagement";
    }
    
    /**
     * 관리 > 카테고리
     */
    @RequestMapping("/cmm/main/management/product_category_management.do")
    public String viewProductCategoryManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/ProductCategoryManagement";
    }
    
    /**
     * 관리 > 유형
     */
    @RequestMapping("/cmm/main/management/product_type_management.do")
    public String viewProductTypeManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/ProductTypeManagement";
    }
    
    /**
     * 관리 > 첨부파일 관리
     */
    @RequestMapping("/cmm/main/management/atch_file_management.do")
    public String viewAtchFileManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/AtchFileManagement";
    }
    
	/**
     * 관리 > 첨부파일 팝업
     */
    @RequestMapping("/cmm/fms/EgovFileUploadPopup.do")
    public String viewEgovFileUploadPopup(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "cmm/fms/EgovFileUploadPopup";
    }
}
