package egovframework.let.cop.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.product.service.EgovStockService;
import egovframework.let.cop.product.service.StockVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 재고를 위한 서비스 구현 클래스
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

@Service("EgovStockService")
public class EgovStockServiceImpl extends EgovAbstractServiceImpl implements EgovStockService{
	
	@Resource(name = "StockDAO")
	private StockDAO stockDAO;
	
	/**
     * 모든 재고를 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockVO> getStockListAll() throws Exception {
		// TODO Auto-generated method stub
		return stockDAO.selectStockListAll();
	}

	/**
     * 재고 Id의 다음 값을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public String getStockNextId() throws Exception {
		// TODO Auto-generated method stub
		return stockDAO.selecNextId();
	}
	
	/**
     * 재고를 추가한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #addStock(egovframework.let.cop.product.service.StockVO)
     */
	@Override
	public void addStock(StockVO stockVO) throws Exception {
		// TODO Auto-generated method stub
		stockDAO.insertStock(stockVO);
	}
	
	/**
     * 재고를 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyStock(egovframework.let.cop.product.service.StockVO)
     */
	@Override
	public void modifyStock(StockVO stockVO) throws Exception {
		// TODO Auto-generated method stub
		stockDAO.updateStock(stockVO);
	}
	
	/**
     * 재고를 삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #removeStock(egovframework.let.cop.product.service.StockVO)
     */
	@Override
	public void removeStock(StockVO stockVO) throws Exception {
		// TODO Auto-generated method stub
		stockDAO.deleteStock(stockVO);
	}
}
