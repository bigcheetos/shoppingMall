package egovframework.let.cop.shop.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 쇼핑몰 제품에 대한 데이터 처리 모델 클래스
 * @author 개발팀 김진영
 * @since 2021.08.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.08.17  김진영          최초 생성
 *
 *  </pre>
 */
public class ProductVO implements Serializable {

	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = -5294726942622980688L;
	
	private int proSeq;
	private int bbsSeq;
	private String proName;
	private String proSummary;
	private int atchFileSeq;
	private int proPrice;
	private int proDisPrice;
	private int proDisRatio;
	private int proStockamount;
	private String proShop;
	private String proStatus;
	private int proCategorySeq;
	private int proSubCategorySeq;
	private int proRdcnt;
	private int proBestcnt;
	private int memSeq;
	private String proRegdate;
	private String proSaleStartdate;
	private String proSaleEnddate;
	
	public int getProSeq() { return proSeq; }
	public void setProSeq(int proSeq) { this.proSeq = proSeq; }
	public int getBbsSeq() { return bbsSeq; }
	public void setBbsSeq(int bbsSeq) { this.bbsSeq = bbsSeq; }
	public String getProName() { return proName; }
	public void setProName(String proName) { this.proName = proName; }
	public String getProSummary() { return proSummary; }
	public void setProSummary(String proSummary) { this.proSummary = proSummary; }
	public int getAtchFileSeq() { return atchFileSeq; }
	public void setAtchFileSeq(int atchFileSeq) { this.atchFileSeq = atchFileSeq; }
	public int getProPrice() { return proPrice; }
	public void setProPrice(int proPrice) { this.proPrice = proPrice; }
	public int getProDisPrice() { return proDisPrice; }
	public void setProDisPrice(int proDisPrice) { this.proDisPrice = proDisPrice; }
	public int getProDisRatio() { return proDisRatio; }
	public void setProDisRatio(int proDisRatio) { this.proDisRatio = proDisRatio; }
	public int getProStockamount() { return proStockamount; }
	public void setProStockamount(int proStockamount) { this.proStockamount = proStockamount; }
	public String getProShop() { return proShop; }
	public void setProShop(String proShop) { this.proShop = proShop; }
	public String getProStatus() { return proStatus; }
	public void setProStatus(String proStatus) { this.proStatus = proStatus; }
	public int getProCategorySeq() { return proCategorySeq; }
	public void setProCategorySeq(int proCategorySeq) { this.proCategorySeq = proCategorySeq; }
	public int getProSubCategorySeq() { return proSubCategorySeq; }
	public void setProSubCategorySeq(int proSubCategorySeq) { this.proSubCategorySeq = proSubCategorySeq; }
	public int getProRdcnt() { return proRdcnt; }
	public void setProRdcnt(int proRdcnt) { this.proRdcnt = proRdcnt; }
	public int getProBestcnt() { return proBestcnt; }
	public void setProBestcnt(int proBestcnt) { this.proBestcnt = proBestcnt; }
	public int getMemSeq() { return memSeq; }
	public void setMemSeq(int memSeq) { this.memSeq = memSeq; }
	public String getProRegdate() { return proRegdate; }
	public void setProRegdate(String proRegdate) { this.proRegdate = proRegdate; }
	public String getProSaleStartdate() { return proSaleStartdate; }
	public void setProSaleStartdate(String proSaleStartdate) { this.proSaleStartdate = proSaleStartdate; }
	public String getProSaleEnddate() { return proSaleEnddate; }
	public void setProSaleEnddate(String proSaleEnddate) { this.proSaleEnddate = proSaleEnddate; }


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
