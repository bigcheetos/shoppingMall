package egovframework.let.cop.product.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.product.service.ProductTypeVO;

@Repository("ProductTypeDAO") 
public class ProductTypeDAO extends EgovComAbstractDAO {
	/**
     * 타입 목록을 조회 한다.
     *
     * @param 
     * @return List<ProductTypeVO>
     * @throws Exception
     */
	public List<ProductTypeVO> selectTypeListAll() throws Exception {
		return selectList("ProductTypeDAO.selectTypeListAll");
	}
	
	/**
     * 타입  최고값 다음 Id를 조회한다.
     *
     * @param 
     * @return String
     * @throws Exception
     */
	public String selecNextId() throws Exception {
		// TODO Auto-generated method stub
		return selectOne("ProductTypeDAO.selectNextTypeId");
	}
	
	/**
     * 타입을 추가한다.
     *
     * @param ProductTypeVO
     * @return 
     * @throws Exception
     */
	public void insertType(ProductTypeVO type) throws Exception {
		insert("ProductTypeDAO.insertType", type);
	}
	
	/**
     * 타입을 수정한다.
     *
     * @param ProductTypeVO
     * @return 
     * @throws Exception
     */
	public void updateType(ProductTypeVO type) throws Exception {
		update("ProductTypeDAO.updateType", type);
	}
	
	/**
     * 타입을 삭제한다.
     *
     * @param ProductTypeVO
     * @return 
     * @throws Exception
     */
	public void deleteType(ProductTypeVO type) throws Exception {
		delete("ProductTypeDAO.deleteType", type);
	}
}
