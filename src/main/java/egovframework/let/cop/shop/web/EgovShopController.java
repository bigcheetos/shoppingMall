package egovframework.let.cop.shop.web;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.cop.bbscom.service.AtchFileVO;
import egovframework.let.cop.bbscom.service.EgovBBSComService;
import egovframework.let.cop.shop.service.EgovShopService;
import egovframework.let.cop.shop.service.ProductDetailVO;
import egovframework.let.cop.shop.service.ProductVO;

@Controller@SessionAttributes(types = ComDefaultVO.class)
public class EgovShopController {
	
	/**
	 * EgovShopService
	 */
	@Resource(name = "EgovShopService")
	private EgovShopService shopService;
	
	/**
	 * EgovBBSComService
	 */
	@Resource(name = "EgovBBSComService")
	private EgovBBSComService bbsComService;

	@Autowired
    private DefaultBeanValidator beanValidator;
	
	private static final DecimalFormat DECIMAL_FORMATTER = new DecimalFormat("###,###.##");
	
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
    
    @RequestMapping("/cmm/main/shop/discount_shop.do")
    public String viewDiscountShop(HttpServletRequest request, ModelMap model) throws Exception {
    	String order = request.getParameter("order");
    	
    	if(order == null) {
    		order = "discount";
    	}
    	
    	//List<ProductVO> productList = shopService.getProductAllOnDiscountShop();
    	List<ProductVO> productList = shopService.getProductAllOnDiscountShopInOrder(order);
    	
    	ArrayList<String> proDisPriceList = new ArrayList<>();
    	ArrayList<String> proPriceList = new ArrayList<>();
    	ArrayList<String> linkList = new ArrayList<>();
    	
    	ArrayList<String> imgPathList = new ArrayList<>();
    	
    	for(ProductVO product : productList) {
    		AtchFileVO atchFileVO = bbsComService.getAtchFileByAtchFileVO(new AtchFileVO.Builder(product.getAtchFileSeq(), product.getBbsSeq()).build());
    		imgPathList.add(atchFileVO.getAtchFilePath() + "." + atchFileVO.getAtchFileType());
    		
    		if(shopService.getProductDetailByProSeq(product.getProSeq()) == null) {
    			linkList.add("#");
    		} else {
    			linkList.add("/cmm/main/shop/discount_shop_detail.do?proSeq="+product.getProSeq());
    		}
    		
    		proDisPriceList.add(DECIMAL_FORMATTER.format(product.getProDisPrice()));
    		proPriceList.add(DECIMAL_FORMATTER.format(product.getProPrice()));
    	}
    	
    	
    	model.addAttribute("linkList", linkList);
    	model.addAttribute("imgPathList", imgPathList);
    	model.addAttribute("order", order);
    	model.addAttribute("proDisPriceList", proDisPriceList);
    	model.addAttribute("proPriceList", proPriceList);
    	model.addAttribute("productList", productList);
    	
    	return "food/shop/DiscountShop";
    }
    
    @RequestMapping("/cmm/main/shop/discount_shop_detail.do")
    public String viewDiscountShopDetail(HttpServletRequest request, ModelMap model) throws Exception {
    	int proSeq = Integer.parseInt(request.getParameter("proSeq"));
    	ProductDetailVO productDetailVO = shopService.getProductDetailByProSeq(proSeq);
    	
    	List<AtchFileVO> thumbnailAtchFileList = bbsComService.getThumbnailListByProductDetailSeq(productDetailVO.getProDetailSeq());
    	List<AtchFileVO> contetnAtchFileList = bbsComService.getContentsListByProductDetailSeq(productDetailVO.getProDetailSeq());
    	
    	model.addAttribute("thumbnailAtchFileList", thumbnailAtchFileList);
    	model.addAttribute("contetnAtchFileList", contetnAtchFileList);
    	model.addAttribute("productDetailVO", productDetailVO);
    	
    	return "food/shop/ProductDetail";
    }
}
