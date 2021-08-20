package egovframework.let.cop.event.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.event.service.EventVO;

@Repository("EventDAO")
public class EventDAO extends EgovComAbstractDAO {
	
	/**
     * 이벤트 한 건에 대하여 상세 내용을 조회 한다.
     *
     * @param eventVO
     * @return
     * @throws Exception
     */
	public EventVO selectEventDetail(EventVO eventVO) throws Exception {
		return (EventVO)selectOne("EventDAO.selectEventDetail", eventVO);
	}
	
	
	/**
     * 이벤트 목록을 전부 조회 한다.
     *
     * @param
     * @return
     * @throws Exception
     */
	public List<EventVO> selectEventAllList() throws Exception {
		
		List<EventVO> selectEventAllList = new ArrayList<EventVO>();
		List<?> returnList = selectList("EventDAO.selectEventAllList");
		
		for(Object o : returnList) {
			if(o instanceof EventVO) {
				selectEventAllList.add((EventVO)o);
			}
		}
		
		return selectEventAllList;
	}
}
