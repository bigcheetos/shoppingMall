package egovframework.let.cop.event.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.event.service.EgovEventService;
import egovframework.let.cop.event.service.EventVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 이벤트 관리를 위한 서비스 구현 클래스
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
 *  </pre>
 */

@Service("EgovEventService")
public class EgovEventServiceImpl extends EgovAbstractServiceImpl implements EgovEventService {
	
	@Resource(name = "EventDAO")
	private EventDAO eventDAO;
	
	/**
     * 이벤트 대하여 상세 내용을 조회 한다.
     *
     * @see egovframework.let.cop.event.service.EgovEventService#selectEventDetail(egovframework.let.cop.event.service.EventVO)
     */
	@Override
	public EventVO getEventDetailByEventVO(EventVO eventVO) throws Exception {
		// TODO Auto-generated method stub
		return eventDAO.selectEventDetail(eventVO);
	}

	/**
     * 이벤트 대하여 모든 목록을 조회 한다.
     *
     * @see egovframework.let.cop.event.service.EgovEventService#selectEventList(egovframework.let.cop.event.service.EventVO)
     */
	@Override
	public List<EventVO> getEventAllList() throws Exception {
		// TODO Auto-generated method stub
		return eventDAO.selectEventAllList();
	}

}
