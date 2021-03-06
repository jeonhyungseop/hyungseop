package kr.or.ddit.cfms.fran.analysis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
@RequestMapping("/fran/analysis")
public class AnalysisController {
	@GetMapping
	public String analysisList() {
		return "/fran/analysis/analysisList";
		
	}
	
	@GetMapping("/detail")
	public String analysisDetail() {
		return "/fran/analysis/analysisDetail";
		
	}
}
