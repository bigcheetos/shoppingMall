package egovframework.let.cop.product.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.product.service.StockVO;

@Repository("StockDAO") 
public class StockDAO extends EgovComAbstractDAO {
	/**
     * 모든 재고를 조회한다.
     *
     * @param 
     * @return List<StockVO>
     * @throws Exception
     */
	public List<StockVO> selectStockListAll() throws Exception {
		return selectList("StockDAO.selectStockListAll");
	}
	
	/**
     * 재고Id의 최고값의 다음값를 조회한다.
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
	public void insertStock(StockVO stock) throws Exception {
		insert("StockDAO.insertStock", stock);
	}
	
	/**
     * 재고을 수정한다.
     *
     * @param StockVO
     * @return 
     * @throws Exception
     */
	public void updateStock(StockVO stock) throws Exception {
		update("StockDAO.updateStock", stock);
	}
	
	/**
     * 재고을 삭제한다.
     *
     * @param StockVO
     * @return 
     * @throws Exception
     */
	public void deleteStock(StockVO stock) throws Exception {
		delete("StockDAO.deleteStock", stock);
	}
}
