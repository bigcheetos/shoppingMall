package egovframework.let.cop.event.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 이벤트에 대한 데이터 처리 모델 클래스
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
public class EventVO implements Serializable {

	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = -4566678108944422910L;
	
	private int eventSeq;
	private int bbsSeq;
	private String eventTitle;
	private String eventContent;
	private String eventStatus;
	private int atchFileSeq;
	private String eventDate;
	private int eventRdcnt;
	private String eventWinner;
	
	public int getEventSeq() { return eventSeq; }
	public void setEventSeq(int eventSeq) { this.eventSeq = eventSeq; }
	public int getBbsSeq() { return bbsSeq; }
	public void setBbsSeq(int bbsSeq) { this.bbsSeq = bbsSeq; }
	public String getEventTitle() { return eventTitle; }
	public void setEventTitle(String eventTitle) { this.eventTitle = eventTitle; }
	public String getEventContent() { return eventContent; }
	public void setEventContent(String eventContent) { this.eventContent = eventContent; }
	public String getEventStatus() { return eventStatus; }
	public void setEventStatus(String eventStatus) { this.eventStatus = eventStatus; }
	public int getAtchFileSeq() { return atchFileSeq; }
	public void setAtchFileSeq(int atchFileSeq) { this.atchFileSeq = atchFileSeq; }
	public String getEventDate() { return eventDate; }
	public void setEventDate(String eventDate) { this.eventDate = eventDate; }
	public int getEventRdcnt() { return eventRdcnt; }
	public void setEventRdcnt(int eventRdcnt) { this.eventRdcnt = eventRdcnt; }
	public String getEventWinner() { return eventWinner; }
	public void setEventWinner(String eventWinner) { this.eventWinner = eventWinner; }
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
