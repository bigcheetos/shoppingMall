package egovframework.com.cmm.web;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;

/**
 * 파일 업로드 다운로드를 위한 컨트롤러 클래스
 * 
 * @author 개발팀 김진영
 * @since 2021.09.06
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2021.9.06  김진영          최초 생성
 *
 * 
 *      </pre>
 */
@RestController@SessionAttributes(types = ComDefaultVO.class)
public class FileUploadDownloadController {

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	@Autowired
    private DefaultBeanValidator beanValidator;

    /**
     * XSS 방지 처리.
     *
     * @param data
     * @return
     */
    protected String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }

        String ret = data;

        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }
    /**
     * 파일 업로드
     *
     * @param paramList, request, model
     * @return String
     */
    @RequestMapping(value = "/cmm/fms/fileUpload.do")
	public String uploadSingleFile(final MultipartHttpServletRequest multiRequest, 
			HttpServletRequest request, ModelMap model) throws Exception {
	/*public String uploadSingleFile(HttpServletRequest request, ModelMap model) throws Exception {
    */	
		String storePath = request.getParameter("savePath");
		List<FileVO> result = null;
		String atchFileId = "";
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		System.out.println(multiRequest.toString());
		
		if (!files.isEmpty()) {
			
			int maxId = fileMngService.getMaxFileId();
			
			// 파일 객체, 구분 값, 파일 순번, 파일ID, 저장경로
			try {
				result = fileUtil.parseFileInf(files, "upfile_", 0, String.valueOf(maxId), storePath);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			// 파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
			atchFileId = fileMngService.insertFileInfs(result);
		}
		
		return atchFileId;
	}
    
    /**
     * 파일 삭제
     *
     * @param paramList, request, model
     * @return String
     */
    @RequestMapping("/cmm/fms/fileListRemove.do")
    @ResponseBody
    public String removeSingleFile(@RequestBody  List<Map<String, Object>> paramList, HttpServletRequest request, ModelMap model) throws Exception {

    	System.out.println(paramList.toString());
    	String message = "";
    	
    	// 권한처리
/*    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

    	if (isAuthenticated) {
    	    
    	}*/
    	
    	
    	List<FileVO> fvoList = new ArrayList<FileVO>();
    	
    	for(Map<String, Object> param : paramList) {
    		FileVO fvo = new FileVO();
    		fvo.setAtchFileId(String.valueOf(param.get("atchFileId")));
    		fvo.setFileSn(String.valueOf(param.get("fileSn")));
    		
    		fvoList.add(fvo);
    	}
    	
    	if(paramList != null) {
    		try {
    			fileMngService.deleteFileInfs(fvoList);
    			message = "success";
    		} catch(Exception e) {
    			e.printStackTrace();
    			message = "fail";
    		}
    	}
    	
    	return message;
    }   
}
