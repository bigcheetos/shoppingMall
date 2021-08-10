package egovframework.let.cop.event.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.cop.bbscom.service.ArticleVO;
import egovframework.let.cop.bbscom.service.AtchFileVO;
import egovframework.let.cop.bbscom.service.EgovBBSComService;
import egovframework.let.cop.bbscom.service.ReplyVO;
import egovframework.let.cop.bbscom.service.TagVO;
import egovframework.let.cop.event.service.EgovEventService;
import egovframework.let.cop.event.service.EventVO;

@Controller@SessionAttributes(types = ComDefaultVO.class)
public class EgovEventController {
	
	
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
    
    @RequestMapping("/cmm/main/home/event.do")
    public String selectEventArticles(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	List<EventVO> eventList = eventService.getEventAllList();
    	ArrayList<String> imgPathList = new ArrayList<>();
    	ArrayList<String> linkList = new ArrayList<>();
    	ArrayList<String> statusBadgeList = new ArrayList<>();
    	
    	for(EventVO event : eventList) {
    		AtchFileVO atchFileVO = bbsComService.getAtchFileByAtchFileVO(new AtchFileVO.Builder(event.getAtchFileSeq(),event.getBbsSeq()).build());
    		imgPathList.add(atchFileVO.getAtchFilePath() + "." + atchFileVO.getAtchFileType());
    		
    		// event content test데이터가 없기 때문에 임시용
    		linkList.add(event.getEventContent().length()>8?"/cmm/main/home/event_detail.do?eventSeq="+event.getEventSeq():"#");
    		
    		statusBadgeList.add(event.getEventStatus().equals("Y")?"background-color: #BD9B6A; color: #ffffff;"
    				:"background-color: #ffffff; color: #666666;");
    		
    		event.setEventDate(event.getEventDate().replace("-", ".").split(" ")[0]);
    		event.setEventStatus(event.getEventStatus().equals("Y")?"진행중":"종료됨");
    	}
    	
    	model.addAttribute("eventList",eventList);
    	model.addAttribute("linkList", linkList);
    	model.addAttribute("imgPathList", imgPathList);
    	model.addAttribute("statusBadgeList", statusBadgeList);
    	
		return "food/home/Event";
    }
    
    @RequestMapping("/cmm/main/home/event_detail.do")
    public String selectEventDetail(HttpServletRequest request, ModelMap model) throws Exception {
    	
    	EventVO requestedEventVO = new EventVO();
    	requestedEventVO.setEventSeq(Integer.parseInt(request.getParameter("eventSeq")));
    	
    	EventVO event = eventService.getEventDetailByEventVO(requestedEventVO);
    	
    	event.setEventDate(event.getEventDate().replace("-", ".").split(" ")[0]);
    	
    	ArticleVO articleVO = new ArticleVO(event.getBbsSeq(), event.getAtchFileSeq());
    	List<TagVO> tagList = bbsComService.getTagListByArticleVO(articleVO);
    	List<ReplyVO> replyList = bbsComService.getReplyListByArticleVO(articleVO);
    	ArrayList<String> imgPathList = new ArrayList<>();
    	ArrayList<String> linkList = new ArrayList<>();
    	
    	for(String imgContext : event.getEventContent().replaceAll("\\(|\\)","").split("\\+")) {
    		String[] contextArray = imgContext.replaceAll("(||)","").split(",");
    		AtchFileVO atchFileVO = bbsComService.getAtchFileByAtchFileVO(new AtchFileVO.Builder(Integer.parseInt(contextArray[0]),Integer.parseInt(contextArray[1])).build());
    		imgPathList.add(atchFileVO.getAtchFilePath()+"."+atchFileVO.getAtchFileType());
    		linkList.add(contextArray[2].equals("''")?"#":contextArray[2]);
    	}
    	
    	model.addAttribute("tagList", tagList);
    	model.addAttribute("replyList", replyList);
    	model.addAttribute("event", event);
    	model.addAttribute("imgPathList", imgPathList);
    	model.addAttribute("linkList",linkList);
    	
		return "food/home/EventDetail";
    }
}
