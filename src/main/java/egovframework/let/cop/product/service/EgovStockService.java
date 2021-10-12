package egovframework.let.cop.product.service;

import java.util.List;

/**
 * 재고를 위한 서비스 인터페이스  클래스
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
 *  
 *  </pre>
 */
public interface EgovStockService {

	/**
	 * 재고에 대하여 내용을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<StockVO> getStockListAll() throws Exception;
	
	/**
	 * 재고의 ID의 최대값 다음을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public String getStockNextId() throws Exception;
	
	/**
	 * 재고를 추가한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void addStock(StockVO stockVO) throws Exception;
	
	/**
	 * 재고를 수정한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void modifyStock(StockVO stockVO) throws Exception;
	
	/**
	 * 재고를 제거한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void removeStock(StockVO stockVO) throws Exception;
	
}
