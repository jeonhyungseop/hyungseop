package kr.or.ddit.cfms.fran.franreturn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fran/franReturn")
public class FranReturnController {
	@GetMapping
	public String franReturnList() {
		return "/fran/return/franReturnList";
		
	}
	
	@GetMapping("/detail")
	public String franReturnDetail() {
		return "/fran/return/franReturnDetail";
		
	}
	
	@GetMapping("/form")
	public String franReturnForm() {
		return "/fran/return/franReturnForm";
		
	}
	
	@PostMapping
	public String insert() {
		return null;
		
	}
	
	@GetMapping("/modify")
	public String updateForm() {
		return "/fran/return/franReturnForm";
		
	}
	
	@PutMapping
	public String update() {
		return null;
		
	}
	
	@DeleteMapping
	public String delete() {
		return null;
		
	}
}
