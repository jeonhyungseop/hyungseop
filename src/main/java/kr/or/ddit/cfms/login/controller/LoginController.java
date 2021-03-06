package kr.or.ddit.cfms.login.controller;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.or.ddit.cfms.exception.BadRequestException;
import kr.or.ddit.cfms.login.dao.ILoginDAO;
import kr.or.ddit.cfms.login.service.ILoginService;
import kr.or.ddit.cfms.login.vo.UserVO;


/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일               		 수정자               수정내용
 * ------------    --------    ----------------------
 * 2021. 5. 30         진유리      		최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Inject
	private ILoginDAO dao;
	
	@Inject
	private ILoginService service;
	
	@Inject
	private WebApplicationContext container;
	private ServletContext application;
	
	@PostConstruct
	public void init() {
		application = container.getServletContext();
	}
	
	@GetMapping
	public String loginForm(
		HttpSession session
		, RedirectAttributes redirectAttributes
	) {
		
		String id = (String) session.getAttribute("authId");
		
		String view = "commons/login/login";
		if(id != null) {
			if(session.isNew()) {
				throw new BadRequestException("비정상 세션");
			}
			UserVO user = dao.selectForAuth(id);
			String role = user.getRole();
			if(role.equals("ROLE_ADMIN")) {
				view = "redirect:/admin/main";
			}else if(role.equals("ROLE_HEAD")) {
				view = "redirect:/head/systemprod";
			}else if(role.equals("ROLE_FRAN")) {
				view = "redirect:/fran/main";
			}else if(role.equals("ROLE_EMP")) {
				view = "redirect:/head/main";
			}else if(role.equals("ROLE_HEAD_PROD")) {
				view = "redirect:/head/main";
			}
		}
		
		logger.info("authId :" + id);
		return view;
	}
	
}
