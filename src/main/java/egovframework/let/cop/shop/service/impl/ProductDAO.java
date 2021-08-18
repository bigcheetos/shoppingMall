package egovframework.let.cop.shop.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.shop.service.ProductVO;

@Repository("ProductDAO")
public class ProductDAO extends EgovComAbstractDAO {
	/**
     * 할인관를 모두 조회 한다.
     *
     * @param 
     * @return List<ProductVO>
     * @throws Exception
     */
	public List<ProductVO> selectProductAllWhereDiscountShop() throws Exception {
		return selectList("selectProductAllWhereDiscountShop");
	}
	
	/**
     * 할인관를 할인율 순서에 따라 모두 조회 한다.
     *
     * @param 
     * @return List<ProductVO>
     * @throws Exception
     */
	public List<ProductVO> selectProductAllWhereDiscountShopOrderByDiscountRatio() throws Exception {
		return selectList("selectProductAllWhereDiscountShopOrderByDiscountRatio");
	}
	
	/**
     * 할인관를 추천수 순서에 따라 모두 조회 한다.
     *
     * @param 
     * @return List<ProductVO>
     * @throws Exception
     */
	public List<ProductVO> selectProductAllWhereDiscountShopOrderByBestcnt() throws Exception {
		// TODO Auto-generated method stub
		return selectList("selectProductAllWhereDiscountShopOrderByBestcnt");
	}

	/**
     * 할인관를 등록일 순서에 따라 모두 조회 한다.
     *
     * @param 
     * @return List<ProductVO>
     * @throws Exception
     */
	public List<ProductVO> selectProductAllWhereDiscountShopOrderByRegdate() {
		// TODO Auto-generated method stub
		return selectList("selectProductAllWhereDiscountShopOrderByRegdate");
	}
	
	/**
     * 할인관를 이름 순서에 따라 모두 조회 한다.
     *
     * @param 
     * @return List<ProductVO>
     * @throws Exception
     */
	public List<ProductVO> selectProductAllWhereDiscountShopOrderByName() {
		// TODO Auto-generated method stub
		return selectList("selectProductAllWhereDiscountShopOrderByName");
	}
	
	/**
     * 할인관를 높은 가격 순서에 따라 모두 조회 한다.
     *
     * @param 
     * @return List<ProductVO>
     * @throws Exception
     */
	public List<ProductVO> selectProductAllWhereDiscountShopOrderByHigherPrice() {
		// TODO Auto-generated method stub
		return selectList("selectProductAllWhereDiscountShopOrderByHigherPrice");
	}
	
	/**
     * 할인관를 낮은 가격 순서에 따라 모두 조회 한다.
     *
     * @param 
     * @return List<ProductVO>
     * @throws Exception
     */
	public List<ProductVO> selectProductAllWhereDiscountShopOrderByLowerPrice() {
		// TODO Auto-generated method stub
		return selectList("selectProductAllWhereDiscountShopOrderByLowerPrice");
	}
}
