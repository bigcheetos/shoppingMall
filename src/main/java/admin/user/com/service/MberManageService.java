package admin.user.com.service;

import java.util.List;


public interface MberManageService {
	
	public void insertMber(MberManageVO mberManageVO) throws Exception;

	public MberManageVO selectMemberList(MberManageVO mberManageVO)throws Exception;

	
	public MberManageVO selectMber(String mberId) throws Exception;

	
	public List<MberManageVO> selectMberList(MberManageVO mberManageVO) throws Exception;

    
   /* public int selectMberListTotCnt(UserDefaultVO userSearchVO) throws Exception;

	*//**
	 * 화면에 조회된 일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param mberManageVO 일반회원수정정보
	 * @throws Exception
	 *//*
	public void updateMber(MberManageVO mberManageVO) throws Exception;

	*//**
	 * 화면에 조회된 사용자의 정보를 데이터베이스에서 삭제
	 * @param checkedIdForDel 삭제대상 일반회원아이디
	 * @throws Exception
	 *//*
	public void deleteMber(String checkedIdForDel) throws Exception;

	*//**
	 * 일반회원 약관확인
	 * @param stplatId 일반회원약관아이디
	 * @return 일반회원약관정보(List)
	 * @throws Exception
	 *//*
	public List<?> selectStplat(String stplatId)  throws Exception;

	*//**
	 * 일반회원암호수정
	 * @param mberManageVO 일반회원수정정보(비밀번호)
	 * @throws Exception
	 *//*
	public void updatePassword(MberManageVO mberManageVO) throws Exception;

	*//**
	 * 일반회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
	 * @param passVO 일반회원암호 조회조건정보
	 * @return mberManageVO 일반회원암호정보
	 * @throws Exception
	 *//*
	public MberManageVO selectPassword(MberManageVO passVO) throws Exception;

	*//**
	 * 로그인인증제한 해제 
	 * @param mberManageVO 일반회원정보
	 * @return void
	 * @throws Exception
	 *//*
	public void updateLockIncorrect(MberManageVO mberManageVO) throws Exception;

*/
}