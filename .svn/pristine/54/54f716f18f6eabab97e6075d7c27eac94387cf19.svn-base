package kr.or.ddit.cfms.head.commons.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.commons.service.IHeadMainService;
import kr.or.ddit.cfms.head.commons.vo.DashListVO;
import kr.or.ddit.cfms.head.commons.vo.DashVO;
import kr.or.ddit.cfms.head.commons.vo.RankGoodsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CustomerorderVO;
import kr.or.ddit.cfms.head.reqvacation.controller.HeadReqVacationController;

/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 19      작성자명       최초작성
 * 2021. 6. 22      진예은          dash보드 순서 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/main")
public class HeadMainController {
	
	@Inject
	private IHeadMainService service;
	
	private final static Logger logger = LoggerFactory.getLogger(HeadMainController.class);

	@RequestMapping()
	public String systemMain(
			HttpSession session,
			Model model
			){
		/** 파라미터 조회 */
		String headCode = (String)session.getAttribute("code");
		
		int totalFranchiseCnt = service.retriveTotalFranchiseCnt(headCode);
		List<DashVO> dashList = service.selectDashOrd();
		model.addAttribute("dashList", dashList);
		model.addAttribute("totalFranchiseCnt", totalFranchiseCnt);
		
		return "head/main";
	}
	
	@RequestMapping("/B0003")
	public String B0003(
			HttpSession session,
			Model model
			){
		
		/** 파라미터 조회 */
		String headCode = (String)session.getAttribute("code");
		
		/** 결과자료 객체 생성 */
		Map<String, Object> dailyGraph = new HashMap<>();
		
		/** 서비스 데이터 구성 */
		Map<String, String> params = new HashMap<>();
		params.put("headCode", headCode);
		
		/** 서비스 요청 */
		List<CustomerorderVO> totalSaleByFran = service.retriveDaySaleList(params);
		
		/** 결과전송*/
		dailyGraph.put("totalSaleByFran", totalSaleByFran);
		
		model.addAttribute("dailyGraph", dailyGraph);
		
		return "head/dash/B0003";
	}
	
	@RequestMapping("/B0004")
	public String B0004(
			HttpSession session,
			Model model
			){
		/** 파라미터 조회 */
		String headCode = (String)session.getAttribute("code");
		
		/** 결과자료 객체 생성 */
		
		/** 서비스 데이터 구성 */
		
		/** 서비스 요청 */
		List<RankGoodsVO> rankGoods = service.retriveRankGoodsList(headCode);
		
		/** 결과전송*/
		
		model.addAttribute("rankGoods", rankGoods);
		
		return "head/dash/B0004";
	}
	
	@RequestMapping("/B0005")
	public String B0005(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			HttpSession session,
			@ModelAttribute("board") BoardVO board,
			Model model
			){
		PagingVO<BoardVO> pagingVO = BoardListForAjax(currentPage,session,board);
		model.addAttribute("pagingVO", pagingVO);
		
		return "head/dash/B0005";
	}
	

	@RequestMapping(value ="/B0005", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<BoardVO> BoardListForAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			HttpSession session,
			@ModelAttribute("board") BoardVO board
			){
		
		
		PagingVO<BoardVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);

		pagingVO.setHead_code((String) session.getAttribute("code"));
		
		pagingVO.setDetailSearch(board);
		
		int totalRecord = service.selectBoardCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<BoardVO> boardList = service.retrieveBoardList(pagingVO);
		
		pagingVO.setDataList(boardList);
		
		return pagingVO;
	}
	
	@RequestMapping("/B0006")
	public String B0006(
			HttpSession session,
			Model model
			){
		/** 파라미터 조회 */
		String headCode = (String)session.getAttribute("code");
		
		/** 결과자료 객체 생성 */
		
		/** 서비스 데이터 구성 */
		Map<String, String> params = new HashMap<>();
		params.put("headCode", headCode);
		
		/** 서비스 요청 */
		List<FranchiseVO> franlist = service.retriveFranchiseList(params);
		
		logger.info("franlist {}", franlist);
		
		/** 결과전송*/
		model.addAttribute("franlist", franlist);
		
		return "head/dash/B0006";
	}
	
	@RequestMapping("/B0007")
	public String B0007(
			HttpSession session,
			Model model
			){
		return "head/dash/B0007";
	}
	
	@GetMapping("/B0007/getMap")
	@ResponseBody
	public List<FranchiseVO> GetMap(
		HttpSession session
	) {
		String headCode = (String) session.getAttribute("code");
		
		/** 서비스 데이터 구성 */
		Map<String, String> params = new HashMap<>();
		params.put("headCode", headCode);
		
		if(headCode==null) {
			return null;
		}
		List<FranchiseVO> franList = service.retriveFranchiseList(params);
		return franList;
	}
	
	@PostMapping("/changeDash")
	public String changeDash(
			@ModelAttribute("dashListVO") DashListVO dashListVO,
			RedirectAttributes redirect
			) {
		
		String view = null;
		logger.info("=============================================");
		logger.info("===============dashListVO : {}===", dashListVO);
		logger.info("=============================================");
		
		ServiceResult result = service.updateDashOrd(dashListVO);
		view = "redirect:/head/main";
		
		
		return view;
	}
	
	
	
}
