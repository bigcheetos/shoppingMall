package egovframework.let.main.web;

import java.util.HashMap;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.EgovBBSManageService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller@SessionAttributes(types = ComDefaultVO.class)
public class EgovMainController {

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;

	/**
	 * 메인 페이지에서 각 업무 화면으로 연계하는 기능을 제공한다.
	 *
	 * @param request
	 * @param commandMap
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/forwardPage.do")
	public String forwardPageWithMenuNo(HttpServletRequest request, @RequestParam Map<String, Object> commandMap)
	  throws Exception{
		return "sample_menu/intro";
	}

	/**
	 * 템플릿 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/main/mainPage.do")
	public String getMgtMainPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		/* 공지사항 메인 컨텐츠 조회 시작 ---------------------------------
		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(5);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_AAAAAAAAAAAA");

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, "BBSA02");
		model.addAttribute("notiList", map.get("resultList"));

		boardVO.setBbsId("BBSMSTR_BBBBBBBBBBBB");
		map = bbsMngService.selectBoardArticles(boardVO, "BBSA02");
		model.addAttribute("galList", map.get("resultList"));

		공지사항 메인컨텐츠 조회 끝 */ 

		return "food/FoodMain";
	}
	
	/**
	 * 홈 > 소개 조회
	 */
	@RequestMapping(value = "/cmm/main/home/intro.do")
	public String getMgtHomeIntro(HttpServletRequest request, ModelMap model)
	  throws Exception{

		return "food/home/Intro";
	}
	
    /**
     * 홈 > 소개 상품기준
     */
    @RequestMapping(value = "cmm/main/home/standard.do")
    public String getMgtHomeStandard(HttpServletRequest request, ModelMap model)
      throws Exception{
    		
    	// 확인 후 다시
            return "food/FoodMain";
    }
    
    /**
     * 홈 > 소개 이벤트/프로모션
     */
    @RequestMapping(value = "cmm/main/home/event.do")
    public String getMgtHomeEvent(HttpServletRequest request, ModelMap model)
      throws Exception{
    		// EventVO에 담길 내용
    		// DB table eventboard와 연결
    		// 
    		
    		// DB에 찾을 수 있는 것
    		// 이벤트 순번(event_seq)
    		// 이벤트 제목(event_title)
    		// 이미지 주소(event_img)
    		// 이벤트 등록일(event_period)
    		
    		// DB에 찾을 수 없는 것
    		// 이벤트 상태(event_status)
    		// 이벤트 댓글수(event_count)
    		// 이벤트 조회수(event_views)
    		
    		
    		// 이벤트 댓글 테이블 필요(seq, content, id, date)
    		
//			Map<String, EventVO> map = new HashMap<>();
//    		
//    		model.addAttribute("eventList", map);
    		
            return "food/home/Event";
    }
}