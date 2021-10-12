package egovframework.let.cop.product.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.product.service.StockIoVO;

@Repository("StockIoDAO") 
public class StockIoDAO extends EgovComAbstractDAO {
	/**
     * 입출고 목록을 조회 한다.
     *
     * @param String stockId
     * @return List<StockIoVO>
     * @throws Exception
     */
	public List<StockIoVO> selectStockIoListByStockId(StockIoVO stockId) throws Exception {
		return selectList("StockIoDAO.selectStockIoListByStockId", stockId);
	}
	
	/**
     * 입고 목록을 조회 한다.
     *
     * @param String stockId
     * @return List<StockIoVO>
     * @throws Exception
     */
	public List<StockIoVO> selectStockInputListByStockId(String stockId) throws Exception {
		return selectList("StockIoDAO.selectStockInputListByStockId", stockId);
	}
	
	/**
     * 출고 목록을 조회 한다.
     *
     * @param String stockId
     * @return List<StockIoVO>
     * @throws Exception
     */
	public List<StockIoVO> selectStockOutputListByStockId(String stockId) throws Exception {
		return selectList("StockIoDAO.selectStockOutputListByStockId", stockId);
	}
	
	/**
     * 재고 최고 Id 다음 Id를 조회한다.
     *
     * @param 
     * @return String
     * @throws Exception
     */
	public String selecNextId() throws Exception {
		// TODO Auto-generated method stub
		return selectOne("StockIoDAO.selectNextStockIoId");
	}
	
	/**
     * 입출고을 추가한다.
     *
     * @param StockIoVO
     * @return 
     * @throws Exception
     */
	public void insertStockIo(StockIoVO stockIo) throws Exception {
		insert("StockIoDAO.insertStockIo", stockIo);
	}
	
	/**
     * 입출고을 수정한다.
     *
     * @param StockIoVO
     * @return 
     * @throws Exception
     */
	public void updateStockIo(StockIoVO stockIo) throws Exception {
		update("StockIoDAO.updateStockIo", stockIo);
	}
	
	/**
     * 입출고을 삭제한다.
     *
     * @param StockIoVO
     * @return 
     * @throws Exception
     */
	public void deleteStockIo(StockIoVO stockIo) throws Exception {
		delete("StockIoDAO.deleteStockIo", stockIo);
	}
}
