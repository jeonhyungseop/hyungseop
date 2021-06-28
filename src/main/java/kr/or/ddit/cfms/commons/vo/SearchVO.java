package kr.or.ddit.cfms.commons.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 이진수
 * @since 2021. 5. 21
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 21      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@AllArgsConstructor
public class SearchVO implements Serializable{
	private Integer page;
	private Integer screenSize;
	private String searchType;
	private String searchWord;
	private String minDate;
	private String maxDate;
	private String searchCategory;
	private Integer minSuply;
	private Integer maxSuply;
	private Integer minBase;
	private Integer maxBase;
	
	
	public SearchVO() {
		super();
		this.page = 1;
		this.screenSize = 10;
	}
	
	public void setPage(Integer page) {
		if(page == null ||  page == 0 ) {
			this.page = 1;
		}else {
			this.page = page;
		}
	}
	public void setScreenSize(Integer screenSize) {
		if(screenSize == null ||  screenSize == 0 ) {
			this.screenSize = 10;
		}else {
			this.screenSize = screenSize;
		}
	}
	
}
