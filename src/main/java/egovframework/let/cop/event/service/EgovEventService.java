package egovframework.let.cop.event.service;

import java.util.List;

/**
 * 이벤트 관리를 위한 서비스 인터페이스  클래스
 * @author 개발팀 김진영
 * @since 2021.08.09
 * @version 1.0
 * @see
 *  
 * <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.08.09  김진영          최초 생성
 *  
 *  
 *  </pre>
 */


public interface EgovEventService {
	
	/**
	 * 이벤트 대하여 상세 내용을 조회 한다.
	 * @return
	 * 
	 * @param eventVO
	 * @exception Exception Exception
	 */
	public EventVO getEventDetailByEventVO(EventVO eventVO) throws Exception;
			  

	/**
	 * 조건에 맞는 게시물 목록을 조회 한다.
	 * @return
	 * 
	 * @param 
	 * @exception Exception Exception
	 */
	public List<EventVO> getEventAllList() throws Exception;
}
