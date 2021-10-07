package egovframework.let.uat.uia.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.uat.uia.service.EgovLoginService;

import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import admin.user.com.service.MberManageVO;


@Controller
public class EgovLoginController {

	/** EgovLoginService */
	@Resource(name = "loginService")
	private EgovLoginService loginService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	/** EgovCmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** TRACE */
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;

	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/LoginUsr.do")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "cmm/uat/uia/LoginUsr";
	}

	/**
	 * 일반 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionLogin.do")
	public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {

		LoginVO resultVO = loginService.actionLogin(loginVO);
		System.out.println(resultVO.getEmailId());

		if (resultVO != null && resultVO.getEmailId() != null && !resultVO.getEmailId().equals("")) {
			request.getSession().setAttribute("LoginVO", resultVO);
			if(resultVO.getMemGubun().equals("M")) {
				resultVO.setMemName(resultVO.getMemName());
				return "forward:/cmm/main/mainPage.do";

			}else if(resultVO.getMemGubun().equals("A")) {
				resultVO.setMemName(resultVO.getMemName());
		    	model.addAttribute("memGubun",resultVO.getEmailId());
				return "forward:/cmm/main/adminMain.do";
			}				
		}else {			
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/uat/uia/LoginUsr";
		}
		return "";
		
	}

	/**
	 * 로그인 후 메인화면으로 들어간다
	 * @param
	 * @return 
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	/*@RequestMapping(value = "/uat/uia/actionMain.do")
	public String actionMain(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model) throws Exception {

		System.out.println(loginVO.getEmailId());
		
		if(loginVO.getMemGubun().equals("M")) {
			loginVO.setMemName(loginVO.getMemName());
			return "forward:/cmm/main/mainPage.do";

		}else if(loginVO.getMemGubun().equals("A")) {
			loginVO.setMemName(loginVO.getMemName());

	    	model.addAttribute("memGubun",loginVO.getEmailId());

			return "forward:/cmm/main/adminMain.do";
		}else {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/uat/uia/LoginUsr";
		}
		
	}*/

	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

		RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);

		return "forward:/cmm/main/mainPage.do";
	}

}