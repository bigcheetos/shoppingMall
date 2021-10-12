package egovframework.let.cop.shop.web;

import java.util.List;
import java.util.Map;

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
import egovframework.let.cop.product.service.ProductCategoryVO;
import egovframework.let.cop.shop.service.EgovShopService;
import egovframework.let.cop.shop.service.ShopSearchVO;
import egovframework.rte.fdl.string.EgovStringUtil;

@Controller@SessionAttributes(types = ComDefaultVO.class)
public class EgovShopController {
	

	/**
	 * EgovEventService
	 */
	@Resource(name = "EgovShopService")
	private EgovShopService shopService;
	
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
	
    
    @RequestMapping("/cmm/main/shop/discountShop.do")
    public String viewDiscountShop(HttpServletRequest request, ModelMap model) throws Exception {
    	// 패러미터 받기
    	String searchWord = request.getParameter("searchWord");
    	String priceUnder = request.getParameter("priceUnder");
    	String priceOver = request.getParameter("priceOver");
    	String searchOrder = request.getParameter("order")==null?"discount":request.getParameter("order");
    	String searchConditon = request.getParameter("categoryId");
    	
    	// 검색조건 설정
    	ShopSearchVO shopSearchVO = new ShopSearchVO();
    	
    	if(EgovStringUtil.isNotEmpty(searchWord)) shopSearchVO.setSearchWord(unscript(searchWord));
    	if(EgovStringUtil.isNotEmpty(priceUnder)) shopSearchVO.setPriceUnder(unscript(priceUnder));
    	if(EgovStringUtil.isNotEmpty(priceOver)) shopSearchVO.setPriceOver(unscript(priceOver));
    	if(EgovStringUtil.isNotEmpty(searchConditon)) shopSearchVO.setSearchCondition1(unscript(searchConditon));
    	shopSearchVO.setSearchOrder(unscript(searchOrder));
    	
    	// 데이터 조회
    	List<Map<String, Object>> productList = shopService.getProductListOnShopBySearchVO(shopSearchVO);
    	List<ProductCategoryVO> categoryList = managementService.getCategoryListAll();
    	
    	// 
    	model.addAttribute("searchWord", searchWord);
    	model.addAttribute("categoryList", categoryList);
    	model.addAttribute("order", searchOrder);
    	
    	model.addAttribute("productList", productList);
    	
    	return "food/shop/DiscountShop";
    }
    
    @RequestMapping("/cmm/main/shop/discountShopDetail.do")
    public String viewDiscountShopDetail(HttpServletRequest request, ModelMap model) throws Exception {
    	String productId = request.getParameter("productId");
    	
    	Map<String, Object> productDetailMap = shopService.getProductDetailByProductId(productId);
    	
    	model.addAttribute("productDetailMap", productDetailMap);
    	
    	return "food/shop/ViewProductDetail";
    }
}
