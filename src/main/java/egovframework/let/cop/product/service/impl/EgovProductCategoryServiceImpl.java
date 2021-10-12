package egovframework.let.cop.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.product.service.EgovProductCategoryService;
import egovframework.let.cop.product.service.ProductCategoryVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 카테고리를 위한 서비스 구현 클래스
 * @author 개발팀 김진영
 * @since 2021.10.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.10.12  김진영          최초 생성
 *
 *  </pre>
 */

@Service("EgovProductCategoryService")
public class EgovProductCategoryServiceImpl extends EgovAbstractServiceImpl implements EgovProductCategoryService{
	
	@Resource(name = "ProductCategoryDAO")
	private ProductCategoryDAO productCategoryDAO;
	
	/**
     * 모든 카테고리를 조회 한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductCategoryService
     */
	@Override
	public List<ProductCategoryVO> getCategoryListAll() throws Exception {
		// TODO Auto-generated method stub
		return productCategoryDAO.selectCategoryListAll();
	}

	/**
     * 카테고리 Id의 다음 값을 조회 한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductCategoryService
     */
	@Override
	public String getCategoryNextId() throws Exception {
		// TODO Auto-generated method stub
		return productCategoryDAO.selecNextId();
	}
	
	/**
     * 카테고리를 추가한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductCategoryService
     * #addCategory(egovframework.let.cop.product.service.ProductCategoryVO)
     */
	@Override
	public void addCategory(ProductCategoryVO productCategoryVO) throws Exception {
		// TODO Auto-generated method stub
		productCategoryDAO.insertCategory(productCategoryVO);
	}
	
	/**
     * 카테고리를 수정한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductCategoryService
     * #modifyCategory(egovframework.let.cop.product.service.ProductCategoryVO)
     */
	@Override
	public void modifyCategory(ProductCategoryVO productCategoryVO) throws Exception {
		// TODO Auto-generated method stub
		productCategoryDAO.updateCategory(productCategoryVO);
	}
	
	/**
     * 카테고리를 삭제한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductCategoryService
     * #removeCategory(egovframework.let.cop.product.service.ProductCategoryVO)
     */
	@Override
	public void removeCategory(ProductCategoryVO productCategoryVO) throws Exception {
		// TODO Auto-generated method stub
		productCategoryDAO.deleteCategory(productCategoryVO);
	}
}
