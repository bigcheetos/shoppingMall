package egovframework.let.cop.shop.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.shop.service.CategoryVO;

@Repository("CategoryDAO")
public class CategoryDAO extends EgovComAbstractDAO {
	
	/**
     * 카테고리를 모두 조회 한다.
     *
     * @param 
     * @return List<CategoryVO>
     * @throws Exception
     */
	public List<CategoryVO> selectCategoryAll() throws Exception {
		// TODO Auto-generated method stub
		return selectList("selectCategoryAll");
	}
	
	
}
