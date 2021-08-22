package egovframework.let.cop.bbscom.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 게시글 공통에 대한 데이터 처리 모델 클래스
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
public class ArticleVO implements Serializable {
	
	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -8040901218960961125L;
	
	private int bbsSeq;
	private int articleSeq;
	
	public ArticleVO(int bbsSeq, int articleSeq) {
		this.bbsSeq = bbsSeq;
		this.articleSeq = articleSeq;
	}
	
	public int getBbsSeq() { return bbsSeq; }
	public void setBbsSeq(int bbsSeq) { this.bbsSeq = bbsSeq; }
	public int getArticleSeq() { return articleSeq; }
	public void setArticleSeq(int articleSeq) { this.articleSeq = articleSeq; }
	public static long getSerialversionuid() { return serialVersionUID; }
	
	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
