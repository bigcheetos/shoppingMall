package egovframework.let.cop.com.service.impl;
import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.com.service.TemplateInf;
import egovframework.let.cop.com.service.TemplateInfVO;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;


@Repository("TemplateManageDAO")
public class TemplateManageDAO extends EgovComAbstractDAO {

    /**
     * 템플릿 정보를 삭제한다.
     *
     * @param tmplatInf
     * @throws Exception
     */
    public void deleteTemplateInf(TemplateInf tmplatInf) throws Exception {
	update("TemplateManageDAO.deleteTemplateInf", tmplatInf);
    }

    /**
     * 템플릿 정보를 등록한다.
     *
     * @param tmplatInf
     * @throws Exception
     */
    public void insertTemplateInf(TemplateInf tmplatInf) throws Exception {
	insert("TemplateManageDAO.insertTemplateInf", tmplatInf);
    }

    /**
     * 템플릿 정보를 수정한다.
     *
     * @param tmplatInf
     * @throws Exception
     */
    public void updateTemplateInf(TemplateInf tmplatInf) throws Exception {
	update("TemplateManageDAO.updateTemplateInf", tmplatInf);
    }

    /**
     * 템플릿에 대한 목록를 조회한다.
     *
     * @param tmplatInfVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<TemplateInfVO> selectTemplateInfs(TemplateInfVO tmplatInfVO) throws Exception {
	return (List<TemplateInfVO>) list("TemplateManageDAO.selectTemplateInfs", tmplatInfVO);
    }

    /**
     * 템플릿에 대한 목록 전체 건수를 조회한다.
     *
     * @param tmplatInfVO
     * @return
     * @throws Exception
     */
    public int selectTemplateInfsCnt(TemplateInfVO tmplatInfVO) throws Exception {
	return (Integer)selectOne("TemplateManageDAO.selectTemplateInfsCnt", tmplatInfVO);
    }

    /**
     * 템플릿에 대한 상세정보를 조회한다.
     *
     * @param tmplatInfVO
     * @return
     * @throws Exception
     */
    public TemplateInfVO selectTemplateInf(TemplateInfVO tmplatInfVO) throws Exception {
	return (TemplateInfVO)selectList("TemplateManageDAO.selectTemplateInf", tmplatInfVO);

    }

    /**
     * 템플릿에 대한 미리보기 정보를 조회한다.
     *
     * @param tmplatInfVO
     * @return
     * @throws Exception
     */
    public TemplateInfVO selectTemplatePreview(TemplateInfVO tmplatInfVO) throws Exception {
	return null;
    }

    /**
     * 템플릿 구분에 따른 목록을 조회한다.
     *
     * @param tmplatInfVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<TemplateInfVO> selectTemplateInfsByCode(TemplateInfVO tmplatInfVO) throws Exception {
	return (List<TemplateInfVO>) list("TemplateManageDAO.selectTemplateInfsByCode", tmplatInfVO);
    }

}
