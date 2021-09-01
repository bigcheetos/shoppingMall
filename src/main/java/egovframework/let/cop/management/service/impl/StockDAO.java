package egovframework.let.cop.management.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.management.service.StockVO;

@Repository("StockDAO") 
public class StockDAO extends EgovComAbstractDAO {
	/**
     * 재고 목록을 조회 한다.
     *
     * @param 
     * @return List<StockVO>
     * @throws Exception
     */
	public List<StockVO> selectStockListAll() throws Exception {
		return selectList("StockDAO.selectStockListAll");
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
		return selectOne("StockDAO.selectNextStockId");
	}
	
	/**
     * 재고을 추가한다.
     *
     * @param StockVO
     * @return 
     * @throws Exception
     */
	public void insertStock(StockVO type) throws Exception {
		insert("StockDAO.insertStock", type);
	}
	
	/**
     * 재고을 수정한다.
     *
     * @param StockVO
     * @return 
     * @throws Exception
     */
	public void updateStock(StockVO type) throws Exception {
		update("StockDAO.updateStock", type);
	}
	
	/**
     * 재고을 삭제한다.
     *
     * @param StockVO
     * @return 
     * @throws Exception
     */
	public void deleteStock(StockVO type) throws Exception {
		delete("StockDAO.deleteStock", type);
	}
}
