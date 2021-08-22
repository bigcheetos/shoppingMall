package egovframework.let.cop.bbscom.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 태그에 대한 데이터 처리 모델 클래스
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
public class TagVO implements Serializable {
	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = 5253497463013470698L;
	
	private int tagSeq;
	private String tagName;
	
	public int getTagSeq() { return tagSeq; }
	public void setTagSeq(int tagSeq) { this.tagSeq = tagSeq; }
	public String getTagName() { return tagName; }
	public void setTagName(String tagName) { this.tagName = tagName; }
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
