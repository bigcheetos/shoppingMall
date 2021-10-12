package egovframework.let.cop.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.product.service.EgovProductOptionService;
import egovframework.let.cop.product.service.ProductOptionVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 제품 옵션를 위한 서비스 구현 클래스
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

@Service("EgovProductOptionService")
public class EgovProductOptionServiceImpl extends EgovAbstractServiceImpl implements EgovProductOptionService{
	
	@Resource(name = "ProductOptionDAO")
	private ProductOptionDAO productOptionDAO;
	
	/**
     * 모든 옵션을 조회 한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductOptionService
     */
	@Override
	public List<ProductOptionVO> getOptionListAll() throws Exception {
		// TODO Auto-generated method stub
		return productOptionDAO.selectOptionListAll();
	}
	
	/**
     * 판매 가능한 옵션을 조회 한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductOptionService
     */
	@Override
	public List<ProductOptionVO> getOptionListOnSale() throws Exception {
		return productOptionDAO.selectOptionListOnSale();
	};
	
	/**
     * 옵션 코드로 옵션을 조회한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductOptionService
     */
	@Override
	public ProductOptionVO getOptionByOptionCode(String optionCode) throws Exception {
		return productOptionDAO.selectOptionByOptionCode(optionCode);
	}
	
	/**
     * 옵션 코드값이 존재하는지 조회한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductOptionService
     */
	@Override
	public boolean checkOptionCode(String optionCode) throws Exception {
		// TODO Auto-generated method stub
		return productOptionDAO.countByOptionCode(optionCode)>0;
	}
	
	/**
     * 옵션을 신규 추가한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductOptionService
     * #modifyStock(egovframework.let.cop.management.service.productOptionVO)
     */
	@Override
	public void addOption(ProductOptionVO productOptionVO) throws Exception {
		// TODO Auto-generated method stub
		productOptionDAO.insertOption(productOptionVO);
	}
	
	/**
     * 옵션을 수정한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductOptionService
     * #modifyStock(egovframework.let.cop.management.service.productOptionVO)
     */
	@Override
	public void modifyOption(ProductOptionVO productOptionVO) throws Exception {
		// TODO Auto-generated method stub
		productOptionDAO.updateOption(productOptionVO);
	}
	
	/**
     * 옵션을삭제한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductOptionService
     * #modifyStock(egovframework.let.cop.management.service.productOptionVO)
     */
	@Override
	public void removeOption(ProductOptionVO productOptionVO) throws Exception {
		// TODO Auto-generated method stub
		productOptionDAO.deleteOption(productOptionVO);
	}
}
