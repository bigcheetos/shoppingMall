package egovframework.let.cop.product.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.product.service.ProductVO;
import egovframework.let.cop.shop.service.ShopSearchVO;

@Repository("ProductDAO") 
public class ProductDAO extends EgovComAbstractDAO{
	
	/**
     * 상품 목록을 조회한다.
     *
     * @param 
     * @return List<ProductVO>
     * @throws Exception
     */
	public List<ProductVO> selectProductListAll() throws Exception {
		return selectList("ProductDAO.selectProductListAll");
	}
	
	/**
     * 검색조건에 맞는 상품 목록을 조회한다.
     *
     * @param 
     * @return List<ProductVO>
     * @throws Exception
     */
	public List<ProductVO> selectProductListBySearchVO(ShopSearchVO shopSearchVO) throws Exception {
		return selectList("ProductDAO.selectProductListBySearchVO", shopSearchVO);
	}
	
	/**
     * 상품Id를 통해 상품을 조회한다.
     *
     * @param String
     * @return ProductVO
     * @throws Exception
     */
	public ProductVO selectProductByProductId(String productId) throws Exception {
		return selectOne("ProductDAO.selectProductByProductId", productId);
	}
	
	/**
     * DB에 존재하는 상품Id의 최고값+1을 조회한다.
     *
     * @param 
     * @return String
     * @throws Exception
     */
	public String selecNextId() throws Exception {
		// TODO Auto-generated method stub
		return selectOne("ProductDAO.selectNextProductId");
	}
	
	/**
     * 상품을 추가한다.
     *
     * @param ProductVO
     * @return 
     * @throws Exception
     */
	public void insertProduct(ProductVO productVO) throws Exception {
		insert("ProductDAO.insertProduct", productVO);
	}
	
	/**
     * 상품을 수정한다.
     *
     * @param ProductVO
     * @return 
     * @throws Exception
     */
	public void updateProduct(ProductVO productVO) throws Exception {
		update("ProductDAO.updateProduct", productVO);
	}
	
	/**
     * 상품을 삭제한다.
     *
     * @param ProductVO
     * @return 
     * @throws Exception
     */
	public void deleteProduct(ProductVO productVO) throws Exception {
		delete("ProductDAO.deleteProduct", productVO);
	}
}
