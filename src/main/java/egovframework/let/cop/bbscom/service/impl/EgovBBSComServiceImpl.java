package egovframework.let.cop.bbscom.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.bbscom.service.ArticleVO;
import egovframework.let.cop.bbscom.service.AtchFileVO;
import egovframework.let.cop.bbscom.service.EgovBBSComService;
import egovframework.let.cop.bbscom.service.ReplyVO;
import egovframework.let.cop.bbscom.service.TagVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("EgovBBSComService")
public class EgovBBSComServiceImpl extends EgovAbstractServiceImpl implements EgovBBSComService {
	
	@Resource(name = "BBSComDAO")
	private BBSComDAO bbsComDAO;
	
	/**
     * 첨부파일에 대하여 조건에 맞는 목록을 조회 한다.
     *
     * @see egovframework.let.cop.bbscom.service.EgovBBSComService#getAtchFileListByAtchFileVO(egovframework.let.cop.bbscom.service.AtchFileVO)
     */
	@Override
	public AtchFileVO getAtchFileByAtchFileVO(AtchFileVO atchFileVO) throws Exception {
		// TODO Auto-generated method stub
		return bbsComDAO.selectAtchFileByAtchFileVO(atchFileVO);
	}
	
	/**
     * 태그에 대하여 조건에 맞는 목록을 조회 한다.
     *
     * @see egovframework.let.cop.bbscom.service.EgovBBSComService#getTagListByArticleVO(egovframework.let.cop.bbscom.service.TagVO)
     */
	@Override
	public List<TagVO> getTagListByArticleVO(ArticleVO articleVO) throws Exception {
		// TODO Auto-generated method stub
		return bbsComDAO.selectTagListByArticleVO(articleVO);
	}
	
	/**
     * 댓글에 대하여 조건에 맞는 목록을 조회 한다.
     *
     * @see egovframework.let.cop.bbscom.service.EgovBBSComService#getReplyListByArticleVO(egovframework.let.cop.bbscom.service.ReplyVO)
     */
	@Override
	public List<ReplyVO> getReplyListByArticleVO(ArticleVO articleVO) throws Exception {
		// TODO Auto-generated method stub
		return bbsComDAO.selectReplyListByArticleVO(articleVO);
	}
	
	/**
     * 댓글 수를 조회 한다.
     *
     * @see egovframework.let.cop.bbscom.service.EgovBBSComService
     */
	@Override
	public String getReplyCountByArticleVO(ArticleVO articleVO) throws Exception {
		// TODO Auto-generated method stub
		return bbsComDAO.selectReplyCountByArticleVO(articleVO);
	}
	
	/**
     * 댓글 테이블의 시퀀스를 조회 한다.
     *
     * @see egovframework.let.cop.bbscom.service.EgovBBSComService#getReplyListByArticleVO(egovframework.let.cop.bbscom.service.ReplyVO)
     */
	@Override
	public String getReplyMaxSequence() throws Exception {
		// TODO Auto-generated method stub
		
		return bbsComDAO.selectReplyMaxSequence();
	}
	
	/**
     * 댓글을 저장 한다.
     *
     * @see egovframework.let.cop.bbscom.service.EgovBBSComService#getReplyListByArticleVO(egovframework.let.cop.bbscom.service.ReplyVO)
     */
	@Override
	public void saveReplyByReplyVO(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		
		int nextReplySeq = Integer.parseInt(getReplyMaxSequence()) + 1;
		
		replyVO.setReplySeq(nextReplySeq);
		
		bbsComDAO.insertReplyByReplyVO(replyVO);
	}

}
