package egovframework.let.cop.bbscom.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;


/**
 * 댓글에 대한 데이터 처리 모델 클래스
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
public class ReplyVO implements Serializable {

	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = -5038331425002671443L;
	
	private int replySeq;
	private int bbsSeq;
	private int articleSeq;
	private String replyContent;
	private int memSeq;
	private String replyDate;
	
	public int getReplySeq() { return replySeq; }
 	public void setReplySeq(int replySeq) { this.replySeq = replySeq; }
	public int getBbsSeq() { return bbsSeq; }
	public void setBbsSeq(int bbsSeq) { this.bbsSeq = bbsSeq; }
	public int getArticleSeq() { return articleSeq; }
	public void setArticleSeq(int articleSeq) { this.articleSeq = articleSeq; }
	public String getReplyContent() { return replyContent; }
	public void setReplyContent(String replyContent) { this.replyContent = replyContent; }
	public int getMemSeq() { return memSeq; }
	public void setMemSeq(int memSeq) { this.memSeq = memSeq; }
	public String getReplyDate() { return replyDate; }
	public void setReplyDate(String replyDate) { this.replyDate = replyDate; }

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
