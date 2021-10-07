package egovframework.let.uat.uia.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAO extends EgovComAbstractDAO {

	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO actionLogin(LoginVO vo) throws Exception {
	
		
		return (LoginVO) selectOne("loginDAO.actionLogin", vo);

	}

	/**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO searchId(LoginVO vo) throws Exception {
		return (LoginVO) selectOne("loginDAO.searchId", vo);
	}

	/**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO searchPassword(LoginVO vo) throws Exception {
		return (LoginVO) selectOne("loginDAO.searchPassword", vo);
	}

	/**
	 * 변경된 비밀번호를 저장한다.
	 * @param vo LoginVO
	 * @exception Exception
	 */
	public void updatePassword(LoginVO vo) throws Exception {
		update("loginDAO.updatePassword", vo);
	}
}
