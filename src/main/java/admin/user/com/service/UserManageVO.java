package admin.user.com.service;


public class UserManageVO extends UserDefaultVO{

	private static final long serialVersionUID = -4255594107023139972L;

	/** 이전비밀번호 - 비밀번호 변경시 사용*/
    private String oldMemPw = "";

    /* 회원번호 */
	private String memSeq;
	/* 회원이름 */
	private String memName;
	/* 이메일아이디 */
	private String emailId;
	/* 비밀번호 */
	private String password;
	/* 이메일인증키 */
	private String emailKdy;
	/* 이메일인증여부 */
	private String emailConfirm;
	/* 이메일인증일 */
	private String emailDate;
	/* 회원등급 */
	private String memLev;
	/* 회원상테 */
	private String memStatus;
	/* 가입일시 */
	private String regDate;
	/* 회원가입구분 */
	private String memGubun;
	/*회원상태구분명*/
	private String memStatusNm;
	/*회원가입구분명*/
	private String memGubunNm;
	

	public String getOldMemPw() {
		return oldMemPw;
	}
	public void setOldMemPw(String oldMemPw) {
		this.oldMemPw = oldMemPw;
	}

	public String getMemSeq() {
		return memSeq;
	}
	public void setMemSeq(String memSeq) {
		this.memSeq = memSeq;
	}
	
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	

	
	public String getEmailKdy() {
		return emailKdy;
	}
	public void setEmailKdy(String emailKdy) {
		this.emailKdy = emailKdy;
	}
	
	public String getEmailConfirm() {
		return emailConfirm;
	}
	public void setEmailConfirm(String emailConfirm) {
		this.emailConfirm = emailConfirm;
	}
	
	public String getEmailDate() {
		return emailDate;
	}
	public void setEmailDate(String emailDate) {
		this.emailDate = emailDate;
	}
	
	public String getMemLev() {
		return memLev;
	}
	public void setMemLev(String memLev) {
		this.memLev = memLev;
	}
	public String getMemStatus() {
		return memStatus;
	}
	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getMemGubun() {
		return memGubun;
	}
	public void setMemGubun(String memGubun) {
		this.memGubun = memGubun;
	}
	public String getMemStatusNm() {
		return memStatusNm;
	}
	public void setMemStatusNm(String memStatusNm) {
		this.memStatusNm = memStatusNm;
	}
	public String getMemGubunNm() {
		return memGubunNm;
	}
	public void setMemGubunNm(String memGubunNm) {
		this.memGubunNm = memGubunNm;
	}
	
	
}