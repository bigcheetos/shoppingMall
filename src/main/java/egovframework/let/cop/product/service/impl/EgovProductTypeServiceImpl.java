package egovframework.let.cop.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.product.service.EgovProductTypeService;
import egovframework.let.cop.product.service.ProductTypeVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 카테고리 유형을 위한 서비스 구현 클래스
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

@Service("EgovProductTypeService")
public class EgovProductTypeServiceImpl extends EgovAbstractServiceImpl implements EgovProductTypeService{
	@Resource(name = "ProductTypeDAO")
	private ProductTypeDAO productTypeDAO;
	
	/**
     * 모든 타입을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<ProductTypeVO> getTypeListAll() throws Exception {
		// TODO Auto-generated method stub
		return productTypeDAO.selectTypeListAll();
	}

	/**
     * 타입 Id의 다음 값을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public String getTypeNextId() throws Exception {
		// TODO Auto-generated method stub
		return productTypeDAO.selecNextId();
	}
	

	/**
     * 타입을 추가한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #addType(egovframework.let.cop.product.service.ProductTypeVO)
     */
	@Override
	public void addType(ProductTypeVO productTypeVO) throws Exception {
		// TODO Auto-generated method stub
		productTypeDAO.insertType(productTypeVO);
	}
	
	/**
     * 타입을 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyType(egovframework.let.cop.product.service.ProductTypeVO)
     */
	@Override
	public void modifyType(ProductTypeVO productTypeVO) throws Exception {
		// TODO Auto-generated method stub
		productTypeDAO.updateType(productTypeVO);
	}
	
	/**
     * 타입을 삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #removeType(egovframework.let.cop.product.service.ProductTypeVO)
     */
	@Override
	public void removeType(ProductTypeVO productTypeVO) throws Exception {
		// TODO Auto-generated method stub
		productTypeDAO.deleteType(productTypeVO);
	}
}
