package egovframework.let.cop.management.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultVO;

@Controller @SessionAttributes(types = ComDefaultVO.class)
public class EgovManagementController {

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
    @RequestMapping("/cmm/main/management/product.do")
    public String viewProduct(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/Product";
    }
    
    /**
     * 관리 > 재고
     */
    @RequestMapping("/cmm/main/management/stock.do")
    public String viewStock(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/Stock";
    }
    
    /**
     * 관리 > 재고
     */
    @RequestMapping("/cmm/main/management/stock_io.do")
    public String viewStockIo(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/StockIo";
    }
    
    /**
     * 관리 > 카테고리
     */
    @RequestMapping("/cmm/main/management/product_category.do")
    public String viewProductCategory(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/ProductCategory";
    }
    
    /**
     * 관리 > 유형
     */
    @RequestMapping("/cmm/main/management/product_type.do")
    public String viewProductType(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	return "food/management/ProductType";
    }
}
