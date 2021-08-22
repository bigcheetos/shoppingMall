package egovframework.let.cop.shop.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.shop.service.ProductDetailVO;

@Repository("ProductDetailDAO")
public class ProductDetailDAO extends EgovComAbstractDAO {
	
	/**
     * 이벤트 한 건에 대하여 상세 내용을 조회 한다.
     *
     * @param eventVO
     * @return
     * @throws Exception
     */
	public ProductDetailVO selectProductDetailByProSeq(int proSeq) throws Exception {
		return (ProductDetailVO)selectOne("ProductDetailDAO.selectProductDetailByProSeq", proSeq);
	}
}
