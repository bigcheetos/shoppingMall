package egovframework.let.cop.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.product.service.EgovStockIoService;
import egovframework.let.cop.product.service.StockIoVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 입출고를 위한 서비스 구현 클래스
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

@Service("EgovStockIoService")
public class EgovStockIoServiceImpl extends EgovAbstractServiceImpl implements EgovStockIoService{
	
	@Resource(name = "StockIoDAO")
	private StockIoDAO stockIoDAO;
	
	/**
     * 재고Id를 통해 입출고 목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockIoVO> getStockIoListByStockId(StockIoVO stockId) throws Exception {
		// TODO Auto-generated method stub
		return stockIoDAO.selectStockIoListByStockId(stockId);
	}

	/**
     * 재고Id를 통해 입고 목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockIoVO> getStockInputListByStockId(String stockId) throws Exception {
		// TODO Auto-generated method stub
		return stockIoDAO.selectStockInputListByStockId(stockId);
	}
	
	/**
     * 재고Id를 통해 출고 목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockIoVO> getStockOutputListByStockId(String stockId) throws Exception {
		// TODO Auto-generated method stub
		return stockIoDAO.selectStockOutputListByStockId(stockId);
	}
	
	/**
     * 입출고 Id의 다음 값을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public String getStockIoNextId() throws Exception {
		// TODO Auto-generated method stub
		return stockIoDAO.selecNextId();
	}
	
	/**
     * 입출고를 추가한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyStock(egovframework.let.cop.product.service.StockIoVO)
     */
	@Override
	public void addStockIo(StockIoVO stockIoVO) throws Exception {
		// TODO Auto-generated method stub
		stockIoDAO.insertStockIo(stockIoVO);
	}
	
	/**
     * 입출고를 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyStock(egovframework.let.cop.product.service.StockIoVO)
     */
	@Override
	public void modifyStockIo(StockIoVO stockIoVO) throws Exception {
		// TODO Auto-generated method stub
		stockIoDAO.updateStockIo(stockIoVO);
	}
	
	/**
     * 입출고를 삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #removeStock(egovframework.let.cop.product.service.StockIoVO)
     */
	@Override
	public void removeStockIo(StockIoVO stockIoVO) throws Exception {
		// TODO Auto-generated method stub
		stockIoDAO.deleteStockIo(stockIoVO);
	}
}
