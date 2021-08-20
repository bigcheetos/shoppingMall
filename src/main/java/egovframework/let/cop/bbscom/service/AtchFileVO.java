package egovframework.let.cop.bbscom.service;

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
public class AtchFileVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 290762572758764603L;
	
	private int atchFileSeq;
	private int bbsSeq;
	private String atchFilePath;
	private String atchFileName;
	private String atchFileType;
	private String atchFileRegDate;
	
	public static class Builder {
		private final int atchFileSeq;
		private final int bbsSeq;
		
		private String atchFilePath;
		private String atchFileName;
		private String atchFileType;
		private String atchFileRegDate;
		
		public Builder(int atchFileSeq, int bbsSeq) {
			this.atchFileSeq = atchFileSeq;
			this.bbsSeq 	 = bbsSeq;
		}
		
		public Builder atchFilePath(String atchFilePath) {
			this.atchFilePath = atchFilePath;
			return this;
		}
		
		public Builder atchFileName(String atchFileName) {
			this.atchFileName = atchFileName;
			return this;
		}
		
		public Builder atchFileType(String atchFileType) {
			this.atchFileType = atchFileType;
			return this;
		}
		
		public Builder atchFileRegDate(String atchFileRegDate) {
			this.atchFileRegDate = atchFileRegDate;
			return this;
		}
		
		public AtchFileVO build() {
			return new AtchFileVO(this);
		}
	}
	
	public AtchFileVO() {
		
	}
	
	private AtchFileVO(Builder builder) {
		atchFileSeq 	= builder.atchFileSeq;
		bbsSeq 			= builder.bbsSeq;
		atchFilePath	= builder.atchFilePath;
		atchFileName	= builder.atchFileName;
		atchFileType	= builder.atchFileType;
		atchFileRegDate = builder.atchFileRegDate;
	}
	
	public int getAtchFileSeq() { return atchFileSeq; }
	public void setAtchFileSeq(int atchFileSeq) { this.atchFileSeq = atchFileSeq; }
	public int getBbsSeq() { return bbsSeq; }
	public void setBbsSeq(int bbsSeq) { this.bbsSeq = bbsSeq; }
	public String getAtchFilePath() { return atchFilePath; }
	public void setAtchFilePath(String atchFilePath) { this.atchFilePath = atchFilePath; }
	public String getAtchFileName() { return atchFileName; }
	public void setAtchFileName(String atchFileName) { this.atchFileName = atchFileName; }
	public String getAtchFileType() { return atchFileType; }
	public void setAtchFileType(String atchFileType) { this.atchFileType = atchFileType; }
	public String getAtchFileRegDate() { return atchFileRegDate; }
	public void setAtchFileRegDate(String atchFileRegDate) { this.atchFileRegDate = atchFileRegDate; }


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
