package kr.or.ddit.cfms.admin.headmanage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.admin.headmanage.service.IAdminHeadmanageService;
import kr.or.ddit.cfms.admin.headmanage.vo.PayListVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;

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
 * 2021. 5. 27      진예은         가맹본부 조회
 * 2021. 6. 05      진예은         HEAD_TELNO '-'추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/admin/headmanage")
public class ManageController {
	
	@Inject
	private IAdminHeadmanageService service;
	
	
	@GetMapping
	public String manageList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
			@RequestParam(value="searchWord", required = false) String searchWord,
			@RequestParam(value="startDate", required = false) String startDate,
			@RequestParam(value="endDate", required = false) String endDate,
			Model model
			) {
		
		
		PagingVO<HeadquartersVO> pagingVO  = listForAjax(currentPage, selectorRow, searchWord, startDate, endDate);
		model.addAttribute("pagingVO", pagingVO);
		
		return "/admin/headmanage/headList";
		
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<HeadquartersVO> listForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
		@RequestParam(value="searchWord", required = false) String searchWord,
		@RequestParam(value="startDate", required = false) String startDate,
		@RequestParam(value="endDate", required = false) String endDate
			){
		
		PagingVO<HeadquartersVO> pagingVO = new PagingVO<>(selectorRow, 10);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchWord", searchWord);
		searchMap.put("startDate", startDate);
		searchMap.put("endDate", endDate);
		pagingVO.setSearchMap(searchMap);
		
		int totalRecord = service.retrieveHeadCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<HeadquartersVO> headquarterList = service.retrieveAdHeadmanageList(pagingVO);
		//전화번호 검증
		for(HeadquartersVO headquartersVO : headquarterList) {
			String telno = headquartersVO.getHead_telno();
			String head_srbde = headquartersVO.getHead_srbde();
					
			if(telno != null && telno.length() == 10) {
				
				headquartersVO.setHead_telno(telno.substring(0,3)+"-"+telno.substring(3,6)+"-"+telno.substring(6));
				//headquartersVO.setHead_telno(telno.substring(0,3)+"-"+ telno.substring(3,5)+ "*" + "-"+ "****");
			
			}else if(telno != null && telno.length() == 11) {
				headquartersVO.setHead_telno(telno.substring(0,3)+"-"+telno.substring(3,7)+"-"+telno.substring(7));
				//headquartersVO.setHead_telno(telno.substring(0,3)+"-"+telno.substring(3,5) + "** "+ "-"+ "****");
			}
			
			if(head_srbde.length() == 8) {
				headquartersVO.setHead_srbde(head_srbde.substring(0,4)+"-"+head_srbde.substring(4, 6) + "-" + head_srbde.substring(6, 8));
			
			}else {
				headquartersVO.setHead_srbde(head_srbde.substring(0,4)+"-"+head_srbde.substring(5, 7) + "-" + head_srbde.substring(8, 10));
			}
			
			
		}
		
		
		
		
		pagingVO.setDataList(headquarterList);
		
		return pagingVO;
	}
	
	
	
	
	@GetMapping("/detail")
	public String manageDetail(
			@RequestParam("what") String code,
			Model model
			) {
		
		HeadquartersVO headmanage = service.retrieveHeadOne(code);
		PayListVO pay = service.retrievePay(code);
		
		model.addAttribute("pay", pay);
		model.addAttribute("headmanage", headmanage);

		
		return "/admin/headmanage/headDetail";
	}
}
