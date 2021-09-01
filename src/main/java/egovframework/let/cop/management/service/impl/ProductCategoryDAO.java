package egovframework.let.cop.management.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.management.service.ProductCategoryVO;

@Repository("ProductCategoryDAO") 
public class ProductCategoryDAO extends EgovComAbstractDAO {
	
	/**
     * 카테고리 목록을 조회 한다.
     *
     * @param 
     * @return List<ProductCategoryVO>
     * @throws Exception
     */
	public List<ProductCategoryVO> selectCategoryListAll() throws Exception {
		return selectList("ProductCategoryDAO.selectCategoryListAll");
	}
	
	/**
     * 카테고리 최고값 다음 Id를 조회한다.
     *
     * @param 
     * @return String
     * @throws Exception
     */
	public String selecNextId() throws Exception {
		// TODO Auto-generated method stub
		return selectOne("ProductCategoryDAO.selectNextCategoryId");
	}
	
	/**
     * 카테고리를 추가한다.
     *
     * @param ProductCategoryVO
     * @return 
     * @throws Exception
     */
	public void insertCategory(ProductCategoryVO category) throws Exception {
		insert("ProductCategoryDAO.insertCategory", category);
	}
	
	/**
     * 카테고리를 수정한다.
     *
     * @param ProductCategoryVO
     * @return 
     * @throws Exception
     */
	public void updateCategory(ProductCategoryVO category) throws Exception {
		update("ProductCategoryDAO.updateCategory", category);
	}
	
	/**
     * 카테고리를 삭제한다.
     *
     * @param ProductCategoryVO
     * @return 
     * @throws Exception
     */
	public void deleteCategory(ProductCategoryVO category) throws Exception {
		delete("ProductCategoryDAO.deleteCategory", category);
	}
}
