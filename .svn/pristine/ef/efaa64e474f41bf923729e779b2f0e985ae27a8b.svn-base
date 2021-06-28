package kr.or.ddit.cfms.admin.commons.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.cfms.admin.commons.service.IAdminMainService;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commons.vo.DashListVO;
import kr.or.ddit.cfms.head.commons.vo.DashVO;

@Controller
@RequestMapping("/admin/main")
public class SystemMainController {

private static final Logger logger = LoggerFactory.getLogger(SystemMainController.class);
	
	@Inject
	private IAdminMainService service;

	@RequestMapping()
	public String systemMain(
			Model model
			){
		List<DashVO> dashList = service.selectAdminDashOrd();
		model.addAttribute("dashList", dashList);
		
		return "admin/main_system";
	}
	
	@RequestMapping("/A0001")
	public String A0001(
			Model model
			){
		
		return "admin/dash/A0001";
	}
	
	@RequestMapping("/A0002")
	public String A0002(
			Model model
			){
		
		return "admin/dash/A0002";
	}
	
	@RequestMapping("/A0003")
	public String A0003(
			Model model
			){
		
		return "admin/dash/A0003";
	}
	
	@RequestMapping("/A0004")
	public String A0004(
			Model model
			){
		
		return "admin/dash/A0004";
	}
	
	@RequestMapping("/A0005")
	public String A0005(
			Model model
			){
		
		return "admin/dash/A0005";
	}
	
	
	@PostMapping("/changeAdminDash")
	public String changeDash(
			@ModelAttribute("dashListVO") DashListVO dashListVO,
			RedirectAttributes redirect
			) {
		
		String view = null;
		
		ServiceResult result = service.updateAdminDashOrd(dashListVO);
		view = "redirect:/admin/main";
		
		
		return view;
	}
	
	
}
