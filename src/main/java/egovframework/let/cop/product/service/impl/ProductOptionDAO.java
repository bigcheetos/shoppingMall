package egovframework.let.cop.product.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.product.service.ProductOptionVO;

@Repository("ProductOptionDAO") 
public class ProductOptionDAO extends EgovComAbstractDAO{
	
	/**
     * 모든 옵션을 조회한다.
     *
     * @param 
     * @return List<ProductOptionVO>
     * @throws Exception
     */
	public List<ProductOptionVO> selectOptionListAll() throws Exception {
		return selectList("ProductOptionDAO.selectOptionListAll");
	}
	
	/**
     * 판매 가능한 옵션 목록을 조회한다.
     *
     * @param 
     * @return List<ProductOptionVO>
     * @throws Exception
     */
	public List<ProductOptionVO> selectOptionListOnSale() throws Exception {
		return selectList("ProductOptionDAO.selectOptionListOnSale");
	}
	
	/**
     * 옵션코드를 통해 옵션을 조회한다.
     *
     * @param String
     * @return ProductOptionVO
     * @throws Exception
     */
	public ProductOptionVO selectOptionByOptionCode(String optionCode) throws Exception {
		return selectOne("ProductOptionDAO.selectOptionByOptionCode", optionCode);
	}
	
	/**
     * 옵션코드와 일치하는 수를 조회한다.
     *
     * @param String
     * @return int
     * @throws Exception
     */
	public int countByOptionCode(String optionCode) throws Exception {
		// TODO Auto-generated method stub
		return selectOne("ProductOptionDAO.selectCountByOptionCode");
	}
	
	/**
     * 옵션을 추가한다.
     *
     * @param ProductOptionVO
     * @return 
     * @throws Exception
     */
	public void insertOption(ProductOptionVO productOptionVO) throws Exception {
		insert("ProductOptionDAO.insertOption", productOptionVO);
	}
	
	/**
     * 옵션을 추가한다.
     *
     * @param ProductOptionVO
     * @return 
     * @throws Exception
     */
	public void updateOption(ProductOptionVO productOptionVO) throws Exception {
		update("ProductOptionDAO.updateOption", productOptionVO);
	}
	
	/**
     * 옵션을 삭제한다.
     *
     * @param ProductOptionVO
     * @return 
     * @throws Exception
     */
	public void deleteOption(ProductOptionVO productOptionVO) throws Exception {
		delete("ProductOptionDAO.deleteOption", productOptionVO);
	}
}
