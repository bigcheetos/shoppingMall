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
    @RequestMapping("/cmm/main/management/productManagement.do")
    public String viewProductManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/ProductManagement";
    }

    /**
     * 관리 > 상품등록
     */
    @RequestMapping("/cmm/main/management/productRegist.do")
    public String viewProductRegist(HttpServletRequest request, ModelMap model) throws Exception {
    	return "food/management/ProductRegist";
    }
        
    /**
     * 관리 > 재고
     */
    @RequestMapping("/cmm/main/management/stockManagement.do")
    public String viewStockManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/StockManagement";
    }
    
    /**
     * 관리 > 입출고
     */
    @RequestMapping("/cmm/main/management/stockIoManagement.do")
    public String viewStockIoManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/StockIoManagement";
    }
    
    /**
     * 관리 > 카테고리
     */
    @RequestMapping("/cmm/main/management/productCategoryManagement.do")
    public String viewProductCategoryManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/ProductCategoryManagement";
    }
    
    /**
     * 관리 > 유형
     */
    @RequestMapping("/cmm/main/management/productTypeManagement.do")
    public String viewProductTypeManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/ProductTypeManagement";
    }
    
    /**
     * 관리 > 파일
     */
    @RequestMapping("/cmm/main/management/atchFileManagement.do")
    public String viewAtchFileManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/AtchFileManagement";
    }
    
    /**
     * 관리 > 옵션
     */
    @RequestMapping("/cmm/main/management/productOptionManagement.do")
    public String viewProductOptionManagement(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/ProductOptionManagement";
    }
    
	/**
     * 관리 > 상품등록, 파일 > 파일업로드팝업
     */
    @RequestMapping("/cmm/fms/EgovFileUploadPopup.do")
    public String viewEgovFileUploadPopup(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "cmm/fms/EgovFileUploadPopup";
    }
    
    /**
     * 관리 > 상품등록 > 꽃 원산지 표시 안내 팝업
     */
    @RequestMapping("/cmm/main/management/viewOriginFlowerCountry.do")
    public String viewOriginFlowerCountry(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/OriginFlowerContry";
    }
    
    /**
     * 관리 > 상품등록 > 제공이미지팝업
     */
    @RequestMapping("/cmm/main/management/viewImgFilePopup.do")
    public String viewImgFilePopup(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/ImgFilePopup";
    }
}
