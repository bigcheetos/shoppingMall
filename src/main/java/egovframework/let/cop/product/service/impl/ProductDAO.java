package egovframework.let.cop.product.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.product.service.ProductVO;
import egovframework.let.cop.shop.service.ShopSearchVO;

@Repository("ProductDAO") 
public class ProductDAO extends EgovComAbstractDAO{
	
	/**
     * 제품 목록을 조회 한다.
     *
     * @param 
     * @return List<ProductVO>
     * @throws Exception
     */
	public List<ProductVO> selectProductListAll() throws Exception {
		return selectList("ProductDAO.selectProductListAll");
	}
	
	/**
     * 검색조건에 맞는 제품 목록을 조회 한다.
     *
     * @param 
     * @return List<ProductVO>
     * @throws Exception
     */
	public List<ProductVO> selectProductListBySearchVO(ShopSearchVO shopSearchVO) throws Exception {
		return selectList("ProductDAO.selectProductListBySearchVO", shopSearchVO);
	}
	
	/**
     * 제품Id를 이용해 제품을 조회 한다.
     *
     * @param String
     * @return ProductVO
     * @throws Exception
     */
	public ProductVO selectProductByProductId(String productId) throws Exception {
		return selectOne("ProductDAO.selectProductByProductId", productId);
	}
	
	/**
     * 제품 Id 최고값 다음 Id를 조회한다.
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
     * 제품를 추가한다.
     *
     * @param ProductVO
     * @return 
     * @throws Exception
     */
	public void insertProduct(ProductVO productVO) throws Exception {
		insert("ProductDAO.insertProduct", productVO);
	}
	
	/**
     * 제품를 수정한다.
     *
     * @param ProductVO
     * @return 
     * @throws Exception
     */
	public void updateProduct(ProductVO productVO) throws Exception {
		update("ProductDAO.updateProduct", productVO);
	}
	
	/**
     * 제품를 삭제한다.
     *
     * @param ProductVO
     * @return 
     * @throws Exception
     */
	public void deleteProduct(ProductVO productVO) throws Exception {
		delete("ProductDAO.deleteProduct", productVO);
	}
}
