package egovframework.let.cop.product.service;

import java.util.List;
import java.util.Map;

/**
 * 입출고를 위한 서비스 인터페이스  클래스
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
public interface EgovStockIoService {
	/**
	 * 입출고 목록을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<StockIoVO> getStockIoListByStockId(StockIoVO stockId) throws Exception;
	
	/**
	 * 입고 목록만 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<StockIoVO> getStockInputListByStockId(String stockId) throws Exception;
	
	/**
	 * 출고 목록만 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<StockIoVO> getStockOutputListByStockId(String stockId) throws Exception;

	/**
	 * 입출고의 ID의 최대값 다음을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public String getStockIoNextId() throws Exception;
	
	/**
	 * 입출고를 추가한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void addStockIo(StockIoVO stockIoVO) throws Exception;
	
	/**
	 * 입출고를 수정한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void modifyStockIo(StockIoVO stockIoVO) throws Exception;
	
	/**
	 * 입출고를 제거한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public void removeStockIo(StockIoVO stockIoVO) throws Exception;
	
}
