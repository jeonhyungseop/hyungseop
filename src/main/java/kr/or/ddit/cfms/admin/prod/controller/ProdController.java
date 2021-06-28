package kr.or.ddit.cfms.admin.prod.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.admin.prod.service.IAdminProdService;
import kr.or.ddit.cfms.admin.prod.vo.AdminProdVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;

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
 * 2021. 5. 25      진예은          상품조회, 상품등록, 상세조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/admin/prod")
public class ProdController {
	
	@Inject
	private IAdminProdService service;
	
	@GetMapping
	public String prodList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="searchWord", required=false) String searchWord,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
			Model model
			) {
		

		PagingVO<AdminProdVO> pagingVO = listForAjax(currentPage, searchWord, selectorRow);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "/admin/prod/prodList";
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<AdminProdVO> listForAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="searchWord", required=false) String searchWord,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
			){
		
		PagingVO<AdminProdVO> pagingVO = new PagingVO<AdminProdVO>(selectorRow, 10);
		
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchWord", searchWord);
		pagingVO.setSearchMap(searchMap);
		
		int totalRecord = service.retrieveProdCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<AdminProdVO> prodList = service.retrieveProd(pagingVO);
		pagingVO.setDataList(prodList);
		
		return  pagingVO;
	}
	
	
	@GetMapping(value="/detail")
	public String prodDetail(
			@RequestParam(value="what", required = true) String code,
			Model model
			) {
		
		AdminProdVO adminprodVO = service.retrieveProdOne(code);
		model.addAttribute("adminprodVO", adminprodVO);
		
		return "/admin/prod/prodView";
		
	}
	
	@GetMapping("/form")
	public String prodForm() {
		
		return "/admin/prod/prodForm";
		
	}
	
	@PostMapping("/form")
	public String insert(
			@ModelAttribute("prod") AdminProdVO adminprodVO
			) {
		
		String view = null;
		
		ServiceResult result = service.createAdminProd(adminprodVO);
		if(ServiceResult.OK.equals(result)) {
			view = "/admin/prod/prodList";
		}else {
			view = "/admin/prod/prodForm";
		}
		
		return view;
		
	}
	
	@RequestMapping(value = "/modify")
	public String updateForm(
			@RequestParam(value="what", required = true) String code,
			Model model
			) {
		
		AdminProdVO adminprodVO = service.retrieveProdOne(code);
		model.addAttribute("prod", adminprodVO);
		
		return "/admin/prod/prodForm";
		
	}
	
	@PutMapping(value = "/modify")
	public String update(
			@ModelAttribute("prod") AdminProdVO adminprodVO
			) {

		String view = null;
		ServiceResult result = service.modifyAdminProd(adminprodVO);
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", result);
		
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/admin/prod";
		}else {
			view = "/admin/prod/prodForm";
		}
		return view;
	}
	
	
	@DeleteMapping(value="/delete")
	public String delete(
			@RequestParam(value="sysCodes[]") String[] sysCodes
			) {
		
		AdminProdVO vo = new AdminProdVO();
		String[] arr = new String[sysCodes.length];

		for(int i = 0; i< sysCodes.length; i++) {
			arr[i] = sysCodes[i];
		}
		
		vo.setSysCodes(arr);
		ServiceResult result = service.removeProd(vo);
		
		String view = null;
		 if(ServiceResult.OK.equals(result)) {
			 view = "redirect:/admin/prod"; 
		 } else {
			 view = "redirect:/admin/prod"; 
		}
		
		return view;
		
	}
	
}
