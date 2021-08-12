package egovframework.let.cop.event.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.cop.bbscom.service.ArticleVO;
import egovframework.let.cop.bbscom.service.EgovBBSComService;
import egovframework.let.cop.bbscom.service.ReplyVO;
import egovframework.let.cop.event.service.EgovEventService;
import egovframework.let.cop.event.service.EventVO;

@RestController@SessionAttributes(types = ComDefaultVO.class)
public class EgovEventRestController {

	
	/**
	 * EgovEventService
	 */
	@Resource(name = "EgovEventService")
	private EgovEventService eventService;
	
	/**
	 * EgovBBSComService
	 */
	@Resource(name = "EgovBBSComService")
	private EgovBBSComService bbsComService;
	
	
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
    
    @RequestMapping("/cmm/main/home/eventDetailGetReplyList.do")
    public List<ReplyVO> getReplyListOnEventDetail(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	EventVO requestedEventVO = new EventVO();
    	requestedEventVO.setEventSeq(Integer.parseInt(request.getParameter("eventSeq")));
    	
    	EventVO event = eventService.getEventDetailByEventVO(requestedEventVO);
    	
    	ArticleVO articleVO = new ArticleVO(event.getBbsSeq(), event.getAtchFileSeq());
    	
    	return bbsComService.getReplyListByArticleVO(articleVO);
    }
    
    @RequestMapping("/cmm/main/home/eventDetailRegisterReply.do")
    public void registerReplyOnEventDetail(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	EventVO requestedEventVO = new EventVO();
    	requestedEventVO.setEventSeq(Integer.parseInt(request.getParameter("eventSeq")));
    	
    	EventVO event = eventService.getEventDetailByEventVO(requestedEventVO);
    	
    	String requestedReplyContent = request.getParameter("replyContent");
    	
    	//memSeq 는 테스트용 임시
    	
    	ReplyVO replyVO = new ReplyVO.Builder(event.getBbsSeq(), event.getEventSeq()).replyContent(requestedReplyContent).memSeq(1).build();
    	
    	bbsComService.saveReplyByReplyVO(replyVO);
    	
    	// return "redirect:/cmm/main/home/event_detail.do?eventSeq="+request.getParameter("eventSeq");
    }
    
}
