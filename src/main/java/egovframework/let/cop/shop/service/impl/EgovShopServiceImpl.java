package egovframework.let.cop.shop.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.shop.service.CategoryVO;
import egovframework.let.cop.shop.service.EgovShopService;
import egovframework.let.cop.shop.service.ProductDetailVO;
import egovframework.let.cop.shop.service.ProductVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("EgovShopService")
public class EgovShopServiceImpl extends EgovAbstractServiceImpl implements EgovShopService{
	
	@Resource(name = "CategoryDAO")
	private CategoryDAO categoryDAO;
	
	@Resource(name = "ProductDAO")
	private ProductDAO productDAO;
	
	@Resource(name = "ProductDetailDAO")
	private ProductDetailDAO productDetailDAO;
	/**
     * 카테고리에 대하여 모든 목록을 조회 한다.
     *
     * @see egovframework.let.cop.shop.service.EgovShopService
     */
	@Override
	public List<CategoryVO> getCategoryAll() throws Exception {
		// TODO Auto-generated method stub
		return categoryDAO.selectCategoryAll();
	}

	/**
     * 할인관에 대하여 모든 목록을 조회 한다.
     *
     * @see egovframework.let.cop.shop.service.EgovShopService
     */
	@Override
	public List<ProductVO> getProductAllOnDiscountShop() throws Exception {
		// TODO Auto-generated method stub
		return productDAO.selectProductAllWhereDiscountShop();
	}
	
	/**
     * 할인관에 대하여 순서에 따라 모든 목록을 조회 한다.
     *
     * @see egovframework.let.cop.shop.service.EgovShopService
     */
	@Override
	public List<ProductVO> getProductAllOnDiscountShopInOrder(String order) throws Exception {
		// TODO Auto-generated method stub
		
		List<ProductVO> productList = new ArrayList<ProductVO>();
		
		switch(order) {
			case "discount":
				productList = productDAO.selectProductAllWhereDiscountShopOrderByDiscountRatio();
				break;
			case "popular":
				productList = productDAO.selectProductAllWhereDiscountShopOrderByBestcnt();
				break;
			case "new":
				productList = productDAO.selectProductAllWhereDiscountShopOrderByRegdate();
				break;
			case "name":
				productList = productDAO.selectProductAllWhereDiscountShopOrderByName();
				break;
			case "higher-price":
				productList = productDAO.selectProductAllWhereDiscountShopOrderByHigherPrice();
				break;
			default:
				productList = productDAO.selectProductAllWhereDiscountShopOrderByLowerPrice();
				break;
		}
		
		
		return productList;
	}

	@Override
	public ProductDetailVO getProductDetailByProSeq(int proSeq) throws Exception {
		// TODO Auto-generated method stub
		
		ProductVO productVO = productDAO.selectProductByProSeq(proSeq);
		ProductDetailVO productDetailVO = productDetailDAO.selectProductDetailByProSeq(proSeq);
		
		if(productDetailVO == null) {
			return null;
		}
		
		productDetailVO.setProductVO(productVO);
		
		return productDetailVO;
	}

}
