package admin.user.com.service.impl;

import java.util.List;

import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import admin.com.exception.AlreadyExistingEmailException;
import admin.user.com.service.MberManageService;
import admin.user.com.service.MberManageVO;
import admin.user.com.service.UserDefaultVO;


@Service("mberManageService")
public class MberManageServiceImpl extends EgovAbstractServiceImpl implements MberManageService {

	/** userManageDAO */
	@Resource(name="userManageDAO")
	private UserManageDAO userManageDAO;

	/** mberManageDAO */
	@Resource(name="mberManageDAO")
	private MberManageDAO mberManageDAO;
	 
	@Resource(name = "propertiesService")
	 protected EgovPropertyService propertyService;

	/** egovUsrCnfrmIdGnrService */
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;

	/**
	 * 사용자의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	 * @param mberManageVO 일반회원 등록정보
	 * @return result 등록결과
	 * @throws Exception
	 */
	@Override
	public void insertMber(MberManageVO regReq) throws Exception  {
		MberManageVO emailId = mberManageDAO.selectByEmail(regReq.getEmailId());
		if(emailId!=null) {
            throw new AlreadyExistingEmailException(regReq.getEmailId()+" is duplicate email.");
        }
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(regReq.getPassword(), EgovStringUtil.isNullToString(regReq.getEmailId()));
		regReq.setPassword(pass);
		 mberManageDAO.insertMber(regReq);
		
		
	}

	/**
	 * 기 등록된 사용자 중 검색조건에 맞는 일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param uniqId 상세조회대상 일반회원아이디
	 * @return mberManageVO 일반회원상세정보
	 * @throws Exception
	 */
	@Override
	public MberManageVO selectMber(String uniqId) {
		MberManageVO mberManageVO = mberManageDAO.selectMber(uniqId);
		return mberManageVO;
	}

	/**
	 * 기 등록된 회원 중 검색조건에 맞는 회원들의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param userSearchVO 검색조건
	 * @return List<MberManageVO> 일반회원목록정보
	 */
	@Override
	public List<MberManageVO> selectMberList(MberManageVO mberManageVO) {
		return mberManageDAO.selectMberList(mberManageVO);
	}
	
	public MberManageVO selectMemberList(MberManageVO mberManageVO) throws Exception{
		
		return  mberManageDAO.selectMemberList(mberManageVO);
	}

   /* *//**
     * 일반회원 총 갯수를 조회한다.
     * @param userSearchVO 검색조건
     * @return 일반회원총갯수(int)
     *//*
    @Override
	public int selectMberListTotCnt(UserDefaultVO userSearchVO) {
    	return mberManageDAO.selectMberListTotCnt(userSearchVO);
    }

	*//**
	 * 화면에 조회된 일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param mberManageVO 일반회원수정정보
	 * @throws Exception
	 *//*
	@Override
	public void updateMber(MberManageVO mberManageVO) throws Exception {
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(mberManageVO.getPassword(), EgovStringUtil.isNullToString(mberManageVO.getEmailId()));//KISA 보안약점 조치 (2018-10-29, 윤창원)
		mberManageVO.setPassword(pass);
		mberManageDAO.updateMber(mberManageVO);
	}

	*//**
	 * 화면에 조회된 사용자의 정보를 데이터베이스에서 삭제
	 * @param checkedIdForDel 삭제대상 일반회원아이디
	 * @throws Exception
	 *//*
	@Override
	public void deleteMber(String checkedIdForDel)  {
		String [] delId = checkedIdForDel.split(",");
		for (int i=0; i<delId.length ; i++){
			String [] id = delId[i].split(":");
			if (id[0].equals("USR03")){
		        //업무사용자(직원)삭제
				userManageDAO.deleteUser(id[1]);
			}else {
				//일반회원삭제
				mberManageDAO.deleteMber(id[1]);
			}
		}
	}

	*//**
	 * 일반회원 약관확인
	 * @param stplatId 일반회원약관아이디
	 * @return 일반회원약관정보(List)
	 * @throws Exception
	 *//*
	@Override
	public List<?> selectStplat(String stplatId)  {
        return mberManageDAO.selectStplat(stplatId);
	}

	*//**
	 * 일반회원암호수정
	 * @param mberManageVO 일반회원수정정보(비밀번호)
	 * @throws Exception
	 *//*
	@Override
	public void updatePassword(MberManageVO mberManageVO) {
		mberManageDAO.updatePassword(mberManageVO);
	}

	*//**
	 * 일반회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
	 * @param passVO 일반회원암호 조회조건정보
	 * @return mberManageVO 일반회원암호정보
	 * @throws Exception
	 *//*
	@Override
	public MberManageVO selectPassword(MberManageVO passVO) {
		MberManageVO mberManageVO = mberManageDAO.selectPassword(passVO);
		return mberManageVO;
	}
	
	
	*//**
	 * 로그인인증제한 해제 
	 * @param mberManageVO 일반회원정보
	 * @return void
	 * @throws Exception
	 *//*
	@Override
	public void updateLockIncorrect(MberManageVO mberManageVO) throws Exception {
		mberManageDAO.updateLockIncorrect(mberManageVO);
	}*/

}