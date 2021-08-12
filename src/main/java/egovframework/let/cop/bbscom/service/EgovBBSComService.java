package egovframework.let.cop.bbscom.service;

import java.util.List;

/**
 * 게시판 공통 관리를 위한 서비스 인터페이스  클래스
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

public interface EgovBBSComService {
	
	/**
	 * 조건에 맞는 첨부파일을 조회 한다.
	 * @return List<AtchFileVO>
	 * 
	 * @param atchFileVO
	 * @exception Exception Exception
	 */
	public AtchFileVO getAtchFileByAtchFileVO(AtchFileVO atchFileVO) throws Exception;
	
	/**
	 * 조건에 맞는 태그 목록을 조회 한다.
	 * @return List<TagVO>
	 * 
	 * @param articleVO
	 * @exception Exception Exception
	 */
	public List<TagVO> getTagListByArticleVO(ArticleVO articleVO) throws Exception;
	
	/**
	 * 조건에 맞는 리플 목록을 조회 한다.
	 * @return List<ReplyVO>
	 * 
	 * @param articleVO
	 * @exception Exception Exception
	 */
	public List<ReplyVO> getReplyListByArticleVO(ArticleVO articleVO) throws Exception;
	
	/**
	 * 조건에 맞는 리플수를 조회 한다.
	 * @return List<String>
	 * 
	 * @param articleVO
	 * @exception Exception Exception
	 */
	public String getReplyCountByArticleVO(ArticleVO articleVO) throws Exception;
	
	
	public String getReplyMaxSequence() throws Exception;
	
	/**
	 * 리플을 하나 저장 한다.
	 * @return 
	 * 
	 * @param replyVO
	 * @exception Exception Exception
	 */
	public void saveReplyByReplyVO(ReplyVO replyVO) throws Exception;

}
