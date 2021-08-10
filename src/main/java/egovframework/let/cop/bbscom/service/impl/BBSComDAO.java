package egovframework.let.cop.bbscom.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.bbscom.service.ArticleVO;
import egovframework.let.cop.bbscom.service.AtchFileVO;
import egovframework.let.cop.bbscom.service.ReplyVO;
import egovframework.let.cop.bbscom.service.TagVO;

@Repository("BBSComDAO")
public class BBSComDAO extends EgovComAbstractDAO {
	
	/**
     * 첨부파일 목록을 조회 한다.
     *
     * @param atchFileVO
     * @return
     * @throws Exception
     */
	public AtchFileVO selectAtchFileByAtchFileVO(AtchFileVO atchFileVO) throws Exception {
		return selectOne("BBSComDAO.selectAtchFile", atchFileVO);
	}
	
	/**
     * 리플 목록을 조회 한다.
     *
     * @param articleVO
     * @return
     * @throws Exception
     */
	public List<ReplyVO> selectReplyListByArticleVO(ArticleVO articleVO) throws Exception {
		List<ReplyVO> selectReplyList = new ArrayList<>();
		List<?> returnList = selectList("BBSComDAO.selectReplyListByReplyVO", articleVO);
		
		for(Object o : returnList) {
			if(o instanceof ReplyVO) {
				selectReplyList.add((ReplyVO)o);
			}
		}
		
		return selectReplyList;
	}
	
	/**
     * 리플 수를 조회 한다.
     *
     * @param articleVO
     * @return
     * @throws Exception
     */
	public List<String> selectReplyCountListByArticleVO(ArticleVO articleVO) throws Exception {
		return selectList("BBSComDAO.selectReplyCountListByReplyVO", articleVO);
	}
	
	/**
     * 태그 목록을 조회 한다.
     *
     * @param articleVO
     * @return
     * @throws Exception
     */
	public List<TagVO> selectTagListByArticleVO(ArticleVO articleVO) throws Exception {
		List<TagVO> selectTagList = new ArrayList<>();
		List<?> returnList = selectList("BBSComDAO.selectTagListByReplyVO", articleVO);
		
		for(Object o : returnList) {
			if(o instanceof TagVO) {
				selectTagList.add((TagVO)o);
			}
		}
		
		return selectTagList;
	}
}
