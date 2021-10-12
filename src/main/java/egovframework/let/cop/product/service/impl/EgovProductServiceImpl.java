package egovframework.let.cop.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.product.service.EgovProductService;
import egovframework.let.cop.product.service.ProductVO;
import egovframework.let.cop.shop.service.ShopSearchVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 제품를 위한 서비스 구현 클래스
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

@Service("EgovProductService")
public class EgovProductServiceImpl extends EgovAbstractServiceImpl implements EgovProductService{
	
	@Resource(name = "ProductDAO")
	private ProductDAO productDAO;
	
	/**
     * 모든 제품을 조회 한다.
     *
     * @see egovframework.let.cop.product.service.impl.EgovProductService
     */
	@Override
	public List<ProductVO> getProductListAll() throws Exception {
		// TODO Auto-generated method stub
		return productDAO.selectProductListAll();
	}

	/**
     * 제품Id로 제품을 하나 조회한다.
     *
     * @see egovframework.let.cop.product.service.impl.EgovProductService
     */
	@Override
	public ProductVO getProductByProductId(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.selectProductByProductId(productId);
	}
	
	/**
     * 제품 Id의 다음 값을 조회 한다.
     *
     * @see egovframework.let.cop.product.service.impl.EgovProductService
     */
	@Override
	public String getProductNextId() throws Exception {
		// TODO Auto-generated method stub
		return productDAO.selecNextId();
	}
	
	/**
     * 제품을 추가한다.
     *
     * @see egovframework.let.cop.product.service.impl.EgovProductService
     * #addProduct(egovframework.let.cop.product.service.ProductVO)
     */
	@Override
	public void addProduct(ProductVO productVO) throws Exception {
		// TODO Auto-generated method stub
		productDAO.insertProduct(productVO);
	}
	
	/**
     * 제품을 수정한다.
     *
     * @see egovframework.let.cop.product.service.impl.EgovProductService
     * #modifyProduct(egovframework.let.cop.product.service.ProductVO)
     */
	@Override
	public void modifyProduct(ProductVO productVO) throws Exception {
		// TODO Auto-generated method stub
		productDAO.updateProduct(productVO);
	}
	
	/**
     * 제품을 삭제한다.
     *
     * @see egovframework.let.cop.product.service.impl.EgovProductService
     * #removeProduct(egovframework.let.cop.product.service.ProductVO)
     */
	@Override
	public void removeProduct(ProductVO productVO) throws Exception {
		// TODO Auto-generated method stub
		productDAO.deleteProduct(productVO);
	}
	
	/**
     * 검색조건에 맞는 제품목록을 가져온다.
     *      
     * @see egovframework.let.cop.product.service.impl.EgovProductService
     */
	@Override
	public List<ProductVO> getProductListBySearchVO(ShopSearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.selectProductListBySearchVO(searchVO);
	}
}
